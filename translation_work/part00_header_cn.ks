[wait time=200]\
[loadplugin module=wuvorbis.dll]\
[loadplugin module=krmovie.dll]\
[loadplugin module=krflash.dll]\
[call storage=autoInsertLabel.ks]\
[call storage=CtrlSkip.ks]\
;
[call storage=Plugin_rain.ks]\
[call storage=Plugin_black_rain.ks]\
[call storage=Plugin_snow.ks]\
[call storage=Plugin_big_snow.ks]\
[call storage=Plugin_big_snow2.ks]\
[call storage=Plugin_big_snow3.ks]\
[call storage=Plugin_big_snow4.ks]\
[call storage=Plugin_big_snow5.ks]\
;
*マクロ
[call storage=gvolume.ks]\
[gvolmenu name="ＢＧＭ(&B)" control="bgm"]\
;
[macro name=plc]\
[p]\
[label]\
[cm]\
[stopse buf=1]\
[stopse buf=2]\
[endmacro]\
;
[macro name=macro_メッセージウィンドウ消去＿ゆっくり]\
[layopt layer=message0 page=fore opacity=200 ]\
[wait time=30]\
[layopt layer=message0 page=fore opacity=150 ]\
[wait time=30]\
[layopt layer=message0 page=fore opacity=100 ]\
[wait time=30]\
[layopt layer=message0 page=fore opacity=50 ]\
[wait time=30]\
[layopt layer=message0 page=fore opacity=0 ]\
[wait time=30]\
[endmacro]\
;
[macro name=macro_メッセージウィンドウ表示＿ゆっくり]\
[layopt layer=message0 page=fore opacity=50 ]\
[wait time=30]\
[layopt layer=message0 page=fore opacity=100 ]\
[wait time=30]\
[layopt layer=message0 page=fore opacity=150 ]\
[wait time=30]\
[layopt layer=message0 page=fore opacity=200 ]\
[wait time=30]\
[layopt layer=message0 page=fore opacity=255 ]\
[wait time=30]\
[endmacro]\
;
[macro name=macro_背景演出]\
[stoptrans]\
[macro_メッセージウィンドウ消去＿ゆっくり]\
[image	layer=0    page=back storage=%fdata  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[wait time=400]\
[macro_メッセージウィンドウ表示＿ゆっくり]\
[endmacro]\
;
[macro name=macro_背景演出_start]\
[wait time=1000]\
[stoptrans]\
[image	layer=0    page=back storage=%fdata  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[wait time=400]\
[macro_メッセージウィンドウ表示＿ゆっくり]\
[endmacro]\
;
[macro name=macro_scene_start]\
[position layer=message0 left=0 top=0 width=800 height=600 marginl=70 margint=55 marginr=70 marginb=55 frame="ＩＦ_02メッセージウィンドウ_01下地ノベル_14"]\
[layopt	layer=message0 	page=fore visible=true opacity=0   index=1003000]\
[layopt	layer=0 		page=fore visible=true opacity=255 index=1002000]\
[history enabled=true output=true]\
[rclick  enabled=true]\
[current layer=message0] [cm]\
;[deffont size=20 bold=false shadow=false edge=false color=0x403224]\
[deffont size=20 bold=false shadow=false edge=false color=0xffffff]\
[cm]\
[endmacro]\
;
[macro name=macro_scene_end]\
[stoptrans]\
[macro_メッセージウィンドウ消去＿ゆっくり]\
[wait time=1000]\
[image	layer=0    page=back storage="基本＿黒"  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
;[macro_ＢＧＭ０：なし]\
[wait time=2500]\
;[macro_メッセージウィンドウ表示＿ゆっくり]\
[endmacro]\
;
[macro name=macro_暗転]\
[stoptrans]\
[macro_メッセージウィンドウ消去＿ゆっくり]\
[image	layer=0    page=back storage="基本＿黒"  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[wait time=1000]\
[image	layer=0    page=back storage=%fdata  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[macro_メッセージウィンドウ表示＿ゆっくり]\
[endmacro]\
;
[macro name=macro_暗転＿白]\
[stoptrans]\
[macro_メッセージウィンドウ消去＿ゆっくり]\
[image	layer=0    page=back storage="基本＿白"  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[wait time=1000]\
[image	layer=0    page=back storage=%fdata  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[macro_メッセージウィンドウ表示＿ゆっくり]\
[endmacro]\
;
;
*マクロ　サウンド
[macro name=macro_ＢＧＭ１：夢幻夜に満ちる意志]\
[if exp="f.ＢＧＭフラグ != 1"]\
[playbgm storage="1.夢幻夜161210_2loop_gmfix"]\
[eval exp="f.ＢＧＭフラグ = 1"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ２：神を越えゆけ]\
[if exp="f.ＢＧＭフラグ != 2"]\
[playbgm storage="2.神を超え行け_2loop_gmfix2"]\
[eval exp="f.ＢＧＭフラグ = 2"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ３：絶対零度の矛盾概念]\
[if exp="f.ＢＧＭフラグ != 3"]\
[playbgm storage="3.絶対零度_2loop_mgfix2"]\
[eval exp="f.ＢＧＭフラグ = 3"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ４：腐敗と寂寥の泥人形達]\
[if exp="f.ＢＧＭフラグ != 4"]\
[playbgm storage="4.腐敗_2loop_stfix2"]\
[eval exp="f.ＢＧＭフラグ = 4"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ５：死と屈従の大聖堂]\
[if exp="f.ＢＧＭフラグ != 5"]\
[playbgm storage="5.大聖堂_stfix2"]\
[eval exp="f.ＢＧＭフラグ = 5"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ６：永劫の神の憎悪]\
[if exp="f.ＢＧＭフラグ != 6"]\
[playbgm storage="6.永劫_stfix"]\
[eval exp="f.ＢＧＭフラグ = 6"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ７：最期の愛と無]\
[if exp="f.ＢＧＭフラグ != 7"]\
[playbgm storage="7.最後_2loop_gmfix2"]\
[eval exp="f.ＢＧＭフラグ = 7"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ８：絶望の大宇宙へ]\
[if exp="f.ＢＧＭフラグ != 8"]\
[playbgm storage="8.絶望_2loop_stfix2"]\
[eval exp="f.ＢＧＭフラグ = 8"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ９：全人類虐殺の神光]\
[if exp="f.ＢＧＭフラグ != 9"]\
[playbgm storage="9.暗黒_2loop_gmfix2"]\
[eval exp="f.ＢＧＭフラグ = 9"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ１０：ゆくひとのプレーローマ]\
[if exp="f.ＢＧＭフラグ != 10"]\
[playbgm storage="10.行く人_2loop_stfix"]\
[eval exp="f.ＢＧＭフラグ = 10"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＢＧＭ０：なし]\
[if exp="f.ＢＧＭフラグ != 100"]\
[playbgm storage="voice_00no"]\
[eval exp="f.ＢＧＭフラグ = 100"]\
[endif]\
[endmacro]\
;
[macro name=macro_ＳＥ再生＿幻想の開放]\
[seopt  buf=0 volume=70]\
[playse buf=0 storage="ＳＥ＿幻想の開放" loop=false]\
[endmacro]\
;
[macro name=macro_ＳＥ再生＿生命力集中]\
[seopt  buf=0 volume=85]\
[playse buf=0 storage="ＳＥ＿生命力集中" loop=false]\
[endmacro]\
;
[macro name=macro_ＳＥ再生＿蹴る]\
[seopt  buf=0 volume=65]\
[playse buf=0 storage="ＳＥ＿蹴る" loop=false]\
[quake time=150 hmax=20 vmax=20]\
[wq]\
[endmacro]\
;
[macro name=macro_ＳＥ再生＿切り裂く]\
[seopt  buf=0 volume=65]\
[playse buf=0 storage="ＳＥ＿切り裂く" loop=false]\
[quake time=200 hmax=30 vmax=30]\
[wq]\
[endmacro]\
;
[macro name=macro_フラッシュ揺れ]\
[layopt	layer=1 		page=fore visible=true opacity=255 index=1004000]\
[layopt	layer=message0 	page=fore visible=true opacity=255 index=1003000]\
[layopt	layer=0 		page=fore visible=true opacity=255 index=1002000]\
[image	layer=1    page=fore storage="基本＿白"  	top=0 left=0]\
[wait time=30]\
[image	layer=1    page=fore storage="絵なし800×600"  	top=0 left=0]\
[wait time=30]\
[image	layer=1    page=fore storage="基本＿白"  	top=0 left=0]\
[wait time=30]\
[image	layer=1    page=fore storage="絵なし800×600"  	top=0 left=0]\
[quake time=200 hmax=40 vmax=40]\
[wq]\
[endmacro]\
;
*start|开始
[startanchor]\
[rclick enabled=false]\
[bgmopt volume=90]
[deffont size=20 bold=false shadow=false edge=false color=0x403224]\
*タイトル画面|标题画面
[macro_ＢＧＭ０：なし]\
[macro_ＢＧＭ１０：ゆくひとのプレーローマ]\
[current layer=message1] [er]\
[current layer=message0] [er]\
[position layer=message0 frame="" opacity=0 ]\
[position layer=message1 frame="" opacity=0 ]\
[layopt	layer=0 page=fore visible=true opacity=255]\
[image 	layer=0 page=fore storage="背景１"]\
[nowait]\
[history output=false enabled=false]\
[locate x=40 y=240]\
[link  target=*最初から]从头开始[endlink]\
[locate x=40 y=280]\
[link  target=*終了する]退出游戏[endlink]\
;[locate x=40 y=200]\
;[link  target=*音楽画面]聆听音乐[endlink]\
;[locate x=40 y=320]\
;[link  target=*目次画面]从目录开始[endlink]\
[history output=true enabled=true]\
[endnowait]\
[s]\
*目次画面
[macro_ＢＧＭ１０：ゆくひとのプレーローマ]\
[er]\
[image 	layer=0 page=fore storage="背景２"]\
[position layer=message0 left=16]\
[position layer=message1 left=370]\
;[position layer=message0 marginl=35 margint=30 marginr=20 marginb=30]\
;[position layer=message1 marginl=35 margint=30 marginr=20 marginb=30]\
[position layer=message0 frame="" opacity=0 ]\
[position layer=message1 frame="" opacity=0 ]\
[current  layer=message0] [er] [current layer=message1] [er]\
[layopt layer=message0 page=fore opacity=255 visible=true]\
[layopt layer=message1 page=fore opacity=255 visible=true]\
[history output=false enabled=false]\
[current layer=message0]\
▼目录
[font size=18]\
[locate x=0 y=28]\
[link  target=*†楽園から]自乐园起[endlink]
[link  target=*†序章]序章 自充满界的流出[endlink]
[link  target=*†１章]第１章 宇宙诞生与生命创造[endlink]
[link  target=*†２章]第２章 诺斯替主义的诞生[endlink]
[link  target=*†３章]第３章 世界的乐园思想[endlink]
[link  target=*†４章]第４章 世界大战与希特勒[endlink]
[link  target=*†５章]第５章 现代·神秘组织篇[endlink]
[link  target=*†６章]第６章 现代·政治家篇[endlink]
[link  target=*†思想書目次]诺斯替思想书目录[endlink]
[link  target=*†思想書１章]诺斯替思想书第１章[endlink]
[link  target=*†思想書２章]诺斯替思想书第２章[endlink]
[link  target=*†アーミア１]阿美亚的世界１[endlink]
[link  target=*†老人と魔法]老人与魔法的童话[endlink]
[link  target=*†アーミア２]阿美亚的世界２[endlink]
[link  target=*†人間には限界]人类有其极限[endlink]
[link  target=*†全ての望み]若所有愿望皆已实现[endlink]
[link  target=*†アーミア３]阿美亚的世界３[endlink]
[link  target=*†神の糾弾１]对神的控诉１[endlink]
[link  target=*†神の糾弾２]对神的控诉２[endlink]
[link  target=*†神の糾弾３]对神的控诉３[endlink]
[link  target=*†人類滅亡]人类灭亡[endlink]
[link  target=*†７章]第７章 近未来·公元２１００年[endlink]
[link  target=*†８章]第８章 未来·公元２５００年～[endlink]
[current layer=message1]\
[font size=18]\
[locate x=0 y=28]\
[link  target=*†９章]第９章 乐园的概念·宇宙中的战斗[endlink]
[link  target=*†用語１]诺斯替用语[endlink]
[link  target=*†用語２]行者用语１[endlink]
[link  target=*†用語３]行者用语２[endlink]
[link  target=*†ゆくひとの楽園]何为行者的乐园[endlink]
[link  target=*†タロット１]塔罗牌１[endlink]
[link  target=*†ヴィル物語]维利尼绍莱的故事[endlink]
[link  target=*†ヴィル精神]维利尼绍莱的精神宇宙１[endlink]
[link  target=*†ゆくひと達]关于行者们[endlink]
[link  target=*†信仰する者達]信仰神的人们[endlink]
[link  target=*†デーミウルゴス]造物主[endlink]
[link  target=*†ヴィル精神２]维利尼绍莱的精神宇宙２[endlink]
[link  target=*†タロット２]塔罗牌２[endlink]
[link  target=*†１０章]第１０章 无限构造宇宙的超越[endlink]
[link  target=*†３０アイオーンの力]３０永世体之力[endlink]
[link  target=*†終章]终章 充满界与完全存在[endlink]
[link  target=*†タロット３]塔罗牌３[endlink]
[link  target=*†彼女]她仍在沉睡[endlink]
[link  target=*†幻想世界]幻想世界[endlink]
[link  target=*†帰還]归还[endlink]
[link  target=*†造物主との対話]与造物主的对话[endlink]
[link  target=*†プレーローマ]行者的充满界[endlink]
[link  target=*†スタッフ]制作人员[endlink]
[link  target=*†[endlink]\
[link  target=*†[endlink]\
[link  target=*†[endlink]\
[link  target=*†[endlink]\
[link  target=*†[endlink]\
[link  target=*†[endlink]\
[font size=20]\
[locate x=280 y=480]\
[link  target=*タイトル画面]返回[endlink]\
[current layer=message0]\
[history output=true enabled=true]\
[endnowait]\
[s]\
*音楽画面
[macro_ＢＧＭ０：なし]\
*音楽画面戻り
[er]\
[image 	layer=0 page=fore storage="背景２"]\
[nowait]\
[history output=false enabled=false]\
[locate x=200 y=80]\
[link  target=*ＢＧＭ１]１：充满梦幻之夜的意志[endlink]\
[locate x=200 y=110]\
[link  target=*ＢＧＭ２]２：超越神明[endlink]\
[locate x=200 y=140]\
[link  target=*ＢＧＭ３]３：绝对零度的矛盾概念[endlink]\
[locate x=200 y=170]\
[link  target=*ＢＧＭ４]４：腐败与寂寥的泥人偶们[endlink]\
[locate x=200 y=200]\
[link  target=*ＢＧＭ５]５：死亡与屈从的大圣堂[endlink]\
[locate x=200 y=230]\
[link  target=*ＢＧＭ６]６：永劫之神的憎恶[endlink]\
[locate x=200 y=260]\
[link  target=*ＢＧＭ７]７：最终的爱与无[endlink]\
[locate x=200 y=290]\
[link  target=*ＢＧＭ８]８：前往绝望的大宇宙[endlink]\
[locate x=200 y=320]\
[link  target=*ＢＧＭ９]９：全人类虐杀的神光[endlink]\
[locate x=200 y=350]\
[link  target=*ＢＧＭ１０]１０：行者的充满界[endlink]\
[locate x=200 y=400]\
[link  target=*タイトル画面]返回[endlink]\
[history output=true enabled=true]\
[endnowait]\
[s]\
*ＢＧＭ０
[macro_ＢＧＭ０：なし]\
[jump target=*音楽画面戻り]\
*ＢＧＭ１
[macro_ＢＧＭ１：夢幻夜に満ちる意志]\
[jump target=*音楽画面戻り]\
*ＢＧＭ２
[macro_ＢＧＭ２：神を越えゆけ]\
[jump target=*音楽画面戻り]\
*ＢＧＭ３
[macro_ＢＧＭ３：絶対零度の矛盾概念]\
[jump target=*音楽画面戻り]\
*ＢＧＭ４
[macro_ＢＧＭ４：腐敗と寂寥の泥人形達]\
[jump target=*音楽画面戻り]\
*ＢＧＭ５
[macro_ＢＧＭ５：死と屈従の大聖堂]\
[jump target=*音楽画面戻り]\
*ＢＧＭ６
[macro_ＢＧＭ６：永劫の神の憎悪]\
[jump target=*音楽画面戻り]\
*ＢＧＭ７
[macro_ＢＧＭ７：最期の愛と無]\
[jump target=*音楽画面戻り]\
*ＢＧＭ８
[macro_ＢＧＭ８：絶望の大宇宙へ]\
[jump target=*音楽画面戻り]\
*ＢＧＭ９
[macro_ＢＧＭ９：全人類虐殺の神光]\
[jump target=*音楽画面戻り]\
*ＢＧＭ１０
[macro_ＢＧＭ１０：ゆくひとのプレーローマ]\
[jump target=*音楽画面戻り]\
*終了する
[close]\
[jump target=*タイトル画面]\
*最初から
[macro_scene_end]\
;[image 	layer=0 page=fore storage="背景２"]\
[cm]\
