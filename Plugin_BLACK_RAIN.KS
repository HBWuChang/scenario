@if exp="typeof(global.blackrain_object) == 'undefined'"
@iscript

/*
	雨をふらせるプラグイン
*/

class BlackRainGrain
{
	// 雨粒のクラス

	var fore; // 表画面の雨粒オブジェクト
	var back; // 裏画面の雨粒オブジェクト
	var xvelo; // 横速度
	var yvelo; // 縦速度
	var l, t; // 横位置と縦位置
	var ownwer; // このオブジェクトを所有する BlackRainPlugin オブジェクト
	var spawned = false; // 雨粒が出現しているか
	var window; // ウィンドウオブジェクトへの参照

	function BlackRainGrain(window, n, owner)
	{
		// BlackRainGrain コンストラクタ
		this.owner = owner;
		this.window = window;

		fore = new Layer(window, window.fore.base);
		back = new Layer(window, window.back.base);

		fore.absolute = 2000000-1; // 重ね合わせ順序はメッセージ履歴よりも奥
		back.absolute = fore.absolute;

		fore.hitType = htMask;
		fore.hitThreshold = 256; // マウスメッセージは全域透過
		back.hitType = htMask;
		back.hitThreshold = 256;

		fore.loadImages("black_rain_0" + "_" + intrandom(0, 3)); // 画像を読み込む
		back.assignImages(fore);
		var h = int(fore.imageHeight * (1.0 - n * 0.1));
		fore.setSizeToImageSize(); // レイヤのサイズを画像のサイズと同じに
		back.setSizeToImageSize();
		fore.height = h;
		fore.imageTop = -(fore.imageHeight - h);
		back.height = h;
		back.imageTop = -(fore.imageHeight - h);
		var opa = 255 - n * 20;
		fore.opacity = opa;
		back.opacity = opa;
		xvelo = 0; //Math.random() - 0.5; // 横方向速度
		yvelo = (5 - n) * 30 + 75 + Math.random() * 15; // 縦方向速度
		fore.face = ltMultiplicative;
		back.face = ltMultiplicative;
	}

	function finalize()
	{
		invalidate fore;
		invalidate back;
	}

	function spawn()
	{
		// 出現
		l = Math.random() * window.primaryLayer.width; // 横初期位置
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
		// 雨粒を動かす
		if(!spawned)
		{
			// 出現していないので出現する機会をうかがう
			if(Math.random() < 0.002) spawn();
		}
		else
		{
			l += xvelo;
			t += yvelo;
			if(t >= window.primaryLayer.height)
			{
				t = -int(fore.height * Math.random());
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

class BlackRainPlugin extends KAGPlugin
{
	// 雨を振らすプラグインクラス

	var black_rains = []; // 雨粒
	var timer; // タイマ
	var window; // ウィンドウへの参照
	var foreVisible = true; // 表画面が表示状態かどうか
	var backVisible = true; // 裏画面が表示状態かどうか

	function BlackRainPlugin(window)
	{
		super.KAGPlugin();
		this.window = window;
	}

	function finalize()
	{
		// finalize メソッド
		// このクラスの管理するすべてのオブジェクトを明示的に破棄
		for(var i = 0; i < black_rains.count; i++)
			invalidate black_rains[i];
		invalidate black_rains;

		invalidate timer if timer !== void;

		super.finalize(...);
	}

	function init(num, options)
	{
		// num 個の雨粒を出現させる
		if(timer !== void) return; // すでに雨粒はでている

		// 雨粒を作成
		for(var i = 0; i < num; i++)
		{
			var n = intrandom(0, 5); // 雨粒の大きさ ( ランダム )
			black_rains[i] = new BlackRainGrain(window, n, this);
		}
		black_rains[0].spawn(); // 最初の雨粒だけは最初から表示

		// タイマーを作成
		timer = new Timer(onTimer, '');
		timer.interval = 8;
		timer.enabled = true;

		foreVisible = true;
		backVisible = true;
		setOptions(options); // オプションを設定
	}

	function uninit()
	{
		// 雨粒を消す
		if(timer === void) return; // 雨粒はでていない

		for(var i = 0; i < black_rains.count; i++)
			invalidate black_rains[i];
		black_rains.count = 0;

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
		var black_raincount = black_rains.count;
		for(var i = 0; i < black_raincount; i++)
			black_rains[i].move(); // move メソッドを呼び出す
	}

	function resetVisibleState()
	{
		// すべての雨粒の 表示・非表示の状態を再設定する
		var black_raincount = black_rains.count;
		for(var i = 0; i < black_raincount; i++)
			black_rains[i].resetVisibleState(); // resetVisibleState メソッドを呼び出す
	}

	function onStore(f, elm)
	{
		// 栞を保存するとき
		var dic = f.black_rains = %[];
		dic.init = timer !== void;
		dic.foreVisible = foreVisible;
		dic.backVisible = backVisible;
		dic.black_rainCount = black_rains.count;
	}

	function onRestore(f, clear, elm)
	{
		// 栞を読み出すとき
		var dic = f.black_rains;
		if(dic === void || !+dic.init)
		{
			// 雨はでていない
			uninit();
		}
		else if(dic !== void && +dic.init)
		{
			// 雨はでていた
			init(dic.black_rainCount, %[ forevisible : dic.foreVisible, backvisible : dic.backVisible ] );
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
		var black_raincount = black_rains.count;
		for(var i = 0; i < black_raincount; i++)
			black_rains[i].exchangeForeBack(); // move メソッドを呼び出す
	}
}

kag.addPlugin(global.black_rain_object = new BlackRainPlugin(kag));
	// プラグインオブジェクトを作成し、登録する

@endscript
@endif
; マクロ登録
@macro name="black_raininit"
@eval exp="black_rain_object.init(117, mp)"
@endmacro
@macro name="black_rainuninit"
@eval exp="black_rain_object.uninit()"
@endmacro
@macro name="black_rainopt"
@eval exp="black_rain_object.setOptions(mp)"
@endmacro
@return
