@if exp="typeof(global.big_snow2_object) == 'undefined'"
@iscript

/*
	雪をふらせるプラグイン
*/

class Bigsnow2Grain
{
	// 雪粒のクラス

	var fore; // 表画面の雪粒オブジェクト
	var back; // 裏画面の雪粒オブジェクト
	var xvelo; // 横速度
	var yvelo; // 縦速度
	var xaccel; // 横加速
	var l, t; // 横位置と縦位置
	var ownwer; // このオブジェクトを所有する Bigsnow2Plugin オブジェクト
	var spawned = false; // 雪粒が出現しているか
	var window; // ウィンドウオブジェクトへの参照

	function Bigsnow2Grain(window, n, owner)
	{
		// Bigsnow2Grain コンストラクタ
		this.owner = owner;
		this.window = window;

		fore = new Layer(window, window.fore.base);
		back = new Layer(window, window.back.base);

		fore.absolute = 1002500-1; // 重ね合わせ順序はメッセージ履歴よりも奥
		back.absolute = fore.absolute;

		fore.hitType = htMask;
		fore.hitThreshold = 256; // マウスメッセージは全域透過
		back.hitType = htMask;
		back.hitThreshold = 256;

		fore.loadImages("big_snow2_" + n); // 画像を読み込む
		back.assignImages(fore);
		fore.setSizeToImageSize(); // レイヤのサイズを画像のサイズと同じに
		back.setSizeToImageSize();
		xvelo = 0; // 横方向速度
		yvelo = n*0.6 + 1.9 + Math.random() * 0.1; // 縦方向速度
		xaccel = Math.random(); // 初期加速度
		fore.type = ltPsExclusion    ;
		back.type = ltPsExclusion    ;
		fore.opacity = 250       ;
		back.opacity = 250       ;
	}

	function finalize()
	{
		invalidate fore;
		invalidate back;
	}

	function spawn()
	{
		// 出現
		l = Math.random() * window.primaryLayer.width - 100; // 横初期位置
		t = -fore.height; // 縦初期位置
		spawned = true;
		fore.setPos(l, t);
		back.setPos(l, t); // 裏画面の位置も同じに
		fore.visible = owner.foreVisible;
		back.visible = owner.backVisible;
	}

	function resetVisibleState()
	{
		// 表示・非表示の状態を再設定する
		if(spawned)
		{
			fore.visible = owner.foreVisible;
			back.visible = owner.backVisible;
		}
		else
		{
			fore.visible = false;
			back.visible = false;
		}
	}

	function move()
	{
		// 雪粒を動かす
		if(!spawned)
		{
			// 出現していないので出現する機会をうかがう
			if(Math.random() < 0.002) spawn();
		}
		else
		{
			l += xvelo;
			t += yvelo;
			xvelo += xaccel;
			xaccel += (Math.random() - 0.5) * 0.3;
			if(xvelo>=4.5) xvelo=4.5;
			if(xvelo<=-4.5) xvelo=-4.5;
			if(xaccel>=3.2) xaccel=3.2;
			if(xaccel<=-3.2) xaccel=-3.2;
			if(t >= window.primaryLayer.height)
			{
				t = -fore.height;
				l = Math.random() * window.primaryLayer.width;
			}
			fore.setPos(l, t);
			back.setPos(l, t); // 裏画面の位置も同じに
		}
	}

	function exchangeForeBack()
	{
		// 表と裏の管理情報を交換する
		var tmp = fore;
		fore = back;
		back = tmp;
	}
}

class Bigsnow2Plugin extends KAGPlugin
{
	// 雪を振らすプラグインクラス

	var big_snow2s = []; // 雪粒
	var timer; // タイマ
	var window; // ウィンドウへの参照
	var foreVisible = true; // 表画面が表示状態かどうか
	var backVisible = true; // 裏画面が表示状態かどうか

	function Bigsnow2Plugin(window)
	{
		super.KAGPlugin();
		this.window = window;
	}

	function finalize()
	{
		// finalize メソッド
		// このクラスの管理するすべてのオブジェクトを明示的に破棄
		for(var i = 0; i < big_snow2s.count; i++)
			invalidate big_snow2s[i];
		invalidate big_snow2s;

		invalidate timer if timer !== void;

		super.finalize(...);
	}

	function init(num, options)
	{
		// num 個の雪粒を出現させる
		if(timer !== void) return; // すでに雪粒はでている

		// 雪粒を作成
		for(var i = 0; i < num; i++)
		{
			var n = intrandom(0, 4); // 雪粒の大きさ ( ランダム )
			big_snow2s[i] = new Bigsnow2Grain(window, n, this);
		}
		big_snow2s[0].spawn(); // 最初の雪粒だけは最初から表示

		// タイマーを作成
		timer = new Timer(onTimer, '');
		timer.interval = 40;
		timer.enabled = true;

		foreVisible = true;
		backVisible = true;
		setOptions(options); // オプションを設定
	}

	function uninit()
	{
		// 雪粒を消す
		if(timer === void) return; // 雪粒はでていない

		for(var i = 0; i < big_snow2s.count; i++)
			invalidate big_snow2s[i];
		big_snow2s.count = 0;

		invalidate timer;
		timer = void;
	}

	function setOptions(elm)
	{
		// オプションを設定する
		foreVisible = +elm.forevisible if elm.forevisible !== void;
		backVisible = +elm.backvisible if elm.backvisible !== void;
		resetVisibleState();
	}

	function onTimer()
	{
		// タイマーの周期ごとに呼ばれる
		var big_snow2count = big_snow2s.count;
		for(var i = 0; i < big_snow2count; i++)
			big_snow2s[i].move(); // move メソッドを呼び出す
	}

	function resetVisibleState()
	{
		// すべての雪粒の 表示・非表示の状態を再設定する
		var big_snow2count = big_snow2s.count;
		for(var i = 0; i < big_snow2count; i++)
			big_snow2s[i].resetVisibleState(); // resetVisibleState メソッドを呼び出す
	}

	function onStore(f, elm)
	{
		// 栞を保存するとき
		var dic = f.big_snow2s = %[];
		dic.init = timer !== void;
		dic.foreVisible = foreVisible;
		dic.backVisible = backVisible;
		dic.big_snow2Count = big_snow2s.count;
	}

	function onRestore(f, clear, elm)
	{
		// 栞を読み出すとき
		var dic = f.big_snow2s;
		if(dic === void || !+dic.init)
		{
			// 雪はでていない
			uninit();
		}
		else if(dic !== void && +dic.init)
		{
			// 雪はでていた
			init(dic.big_snow2Count, %[ forevisible : dic.foreVisible, backvisible : dic.backVisible ] );
		}
	}

	function onStableStateChanged(stable)
	{
	}

	function onMessageHiddenStateChanged(hidden)
	{
	}

	function onCopyLayer(toback)
	{
		// レイヤの表←→裏情報のコピー
		// このプラグインではコピーすべき情報は表示・非表示の情報だけ
		if(toback)
		{
			// 表→裏
			backVisible = foreVisible;
		}
		else
		{
			// 裏→表
			foreVisible = backVisible;
		}
		resetVisibleState();
	}

	function onExchangeForeBack()
	{
		// 裏と表の管理情報を交換
		var big_snow2count = big_snow2s.count;
		for(var i = 0; i < big_snow2count; i++)
			big_snow2s[i].exchangeForeBack(); // move メソッドを呼び出す
	}
}

kag.addPlugin(global.big_snow2_object = new Bigsnow2Plugin(kag));
	// プラグインオブジェクトを作成し、登録する

@endscript
@endif
; マクロ登録
@macro name="big_snow2init"
@eval exp="big_snow2_object.init(12, mp)"
@endmacro
@macro name="big_snow2uninit"
@eval exp="big_snow2_object.uninit()"
@endmacro
@macro name="big_snow2opt"
@eval exp="big_snow2_object.setOptions(mp)"
@endmacro
@return
