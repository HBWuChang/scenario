@if exp="typeof(global.snowsymbol_object) == 'undefined'"
@iscript

/*
	雪をふらせるプラグイン
*/

class BigSnowGrain
{
	// 雪粒のクラス

	var fore; // 表画面の雪粒オブジェクト
	var back; // 裏画面の雪粒オブジェクト
	var xvelo; // 横速度
	var yvelo; // 縦速度
	var xaccel; // 横加速
	var l, t; // 横位置と縦位置
//	var kaiten;//追加　回転の値
	var ownwer; // このオブジェクトを所有する BigSnowPlugin オブジェクト
	var spawned = false; // 雪粒が出現しているか
	var window; // ウィンドウオブジェクトへの参照

	function BigSnowGrain(window, n, owner)
	{
		// BigSnowGrain コンストラクタ
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

		fore.loadImages("snow_symbol_" + n); // 画像を読み込む
		back.assignImages(fore);
		fore.setSizeToImageSize(); // レイヤのサイズを画像のサイズと同じに
		back.setSizeToImageSize();
		xvelo = (Math.random() * 5)-2; // 横方向速度
//		xvelo = 0; // 横方向速度
		yvelo = n*0.6 + 1.1 + Math.random() * 0.2; // 縦方向速度
//		xaccel = Math.random(); // 初期加速度
//		kaiten = 0;
		fore.type = ltPsOverlay    ;
		back.type = ltPsOverlay   ;
		fore.opacity = 130       ;
		back.opacity = 130       ;
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
//		fore.affineCopy(ownwer.snowsymbols, l, t, 200, 200,
//				true,
//				a*cosz, -a*sinz, a*sinz, a*cosz,
//				-a*W/2*( cosz+sinz)+w/2,
//				-a*W/2*(-sinz+cosz)+w/2, 
//				stNearest, true);
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
//			xvelo += xaccel;
//			xaccel += (Math.random() - 0.5) * 0.3;
//			if(xvelo>=1.5) xvelo=1.5;
//			if(xvelo<=-1.5) xvelo=-1.5;
//			if(xaccel>=0.2) xaccel=0.2;
//			if(xaccel<=-0.2) xaccel=-0.2;
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

class BigSnowPlugin extends KAGPlugin
{
	// 雪を振らすプラグインクラス

	var snowsymbols = []; // 雪粒
	var timer; // タイマ
	var window; // ウィンドウへの参照
	var foreVisible = true; // 表画面が表示状態かどうか
	var backVisible = true; // 裏画面が表示状態かどうか

	function BigSnowPlugin(window)
	{
		super.KAGPlugin();
		this.window = window;
	}

	function finalize()
	{
		// finalize メソッド
		// このクラスの管理するすべてのオブジェクトを明示的に破棄
		for(var i = 0; i < snowsymbols.count; i++)
			invalidate snowsymbols[i];
		invalidate snowsymbols;

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
			snowsymbols[i] = new BigSnowGrain(window, n, this);
		}
		snowsymbols[0].spawn(); // 最初の雪粒だけは最初から表示

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

		for(var i = 0; i < snowsymbols.count; i++)
			invalidate snowsymbols[i];
		snowsymbols.count = 0;

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
		var snowsymbolcount = snowsymbols.count;
		for(var i = 0; i < snowsymbolcount; i++)
			snowsymbols[i].move(); // move メソッドを呼び出す
/*			snowsymbols.affineCopy(snowsymbols, l, t, 200, 200,
					true,
					a*cosz, -a*sinz, a*sinz, a*cosz,
					-a*W/2*( cosz+sinz)+w/2,
					-a*W/2*(-sinz+cosz)+w/2, 
					stNearest, true);*/
	}

	function resetVisibleState()
	{
		// すべての雪粒の 表示・非表示の状態を再設定する
		var snowsymbolcount = snowsymbols.count;
		for(var i = 0; i < snowsymbolcount; i++)
			snowsymbols[i].resetVisibleState(); // resetVisibleState メソッドを呼び出す
	}

	function onStore(f, elm)
	{
		// 栞を保存するとき
		var dic = f.snowsymbols = %[];
		dic.init = timer !== void;
		dic.foreVisible = foreVisible;
		dic.backVisible = backVisible;
		dic.snowsymbolCount = snowsymbols.count;
	}

	function onRestore(f, clear, elm)
	{
		// 栞を読み出すとき
		var dic = f.big_snows;
		if(dic === void || !+dic.init)
		{
			// 雪はでていない
			uninit();
		}
		else if(dic !== void && +dic.init)
		{
			// 雪はでていた
			init(dic.snowsymbolCount, %[ forevisible : dic.foreVisible, backvisible : dic.backVisible ] );
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
		var snowsymbolcount = snowsymbols.count;
		for(var i = 0; i < snowsymbolcount; i++)
			snowsymbols[i].exchangeForeBack(); // move メソッドを呼び出す
	}
}

kag.addPlugin(global.snowsymbol_object = new BigSnowPlugin(kag));
	// プラグインオブジェクトを作成し、登録する

@endscript
@endif
; マクロ登録
@macro name="snowsymbolinit"
@eval exp="snowsymbol_object.init(6, mp)"
@endmacro
@macro name="snowsymboluninit"
@eval exp="snowsymbol_object.uninit()"
@endmacro
@macro name="snowsymbolopt"
@eval exp="snowsymbol_object.setOptions(mp)"
@endmacro
@return
