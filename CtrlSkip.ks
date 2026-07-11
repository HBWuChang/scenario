; 二重読み込みを防止
[return cond="typeof(global.CtrlSkip_obj) != 'undefined'"]

; Ctrlキーでメッセージをスキップするプラグイン


[iscript]

class CtrlSkip {
	var window;
	var checkProceedingKey_org;	// オリジナルのcheckProceedingKeyを保存
	var skipKeyPressing_org;	// オリジナルのskipKeyPressingを保存

	// コンストラクタ
	function CtrlSkip(w)
	{
		window = w;
		checkProceedingKey_org = window.checkProceedingKey;
		skipKeyPressing_org    = window.skipKeyPressing;

		// (KAG)Window の checkProceedingKey を乗っ取り、Ctrlをトラップ
		window.checkProceedingKey = function (key, shift)
		{
			// キューを無視し、今のキーを見るためgetKeyState()する
			if (key == VK_CONTROL && getKeyState(VK_CONTROL)) {
				// スゴい悩んだが、RETURN/SPACEと合わせるため、
				// 以下は MainWindow.tjs のコピーにした。
				// でもこれだとスキップまで少し待つんだよなー…
				if((shift & ssRepeat) && clickSkipEnabled) {
					// キーリピート中
					if(skipMode != 4 && skipKeyRepressed)
						skipToStop2();
				} else {
					// まだキーリピートしていなかった
					skipKeyRepressed = true;
					onPrimaryClickByKey();
				}
				return true;
			}
			// オリジナルを呼ぶ
			CtrlSkip_obj.checkProceedingKey_org(key, shift);
		} incontextof(window);

		// (KAG)Window の skipKeyPressing を乗っ取り、Ctrlをトラップ
		window.skipKeyPressing = function ()
		{
			return (getKeyState(VK_CONTROL) ||
				CtrlSkip_obj.skipKeyPressing_org());
		} incontextof(window);
	}

	// デストラクタ
	function finalize()
	{
		window.checkProceedingKey = checkProceedingKey_org;
		window.skipKeyPressing    = skipKeyPressing_org;
	}
}

global.CtrlSkip_obj = new CtrlSkip(kag);

[endscript]


[return]
