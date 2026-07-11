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
*ƒ}ƒNƒ
[call storage=gvolume.ks]\
[gvolmenu name="‚a‚f‚l(&B)" control="bgm"]\
;
[macro name=plc]\
[p]\
[label]\
[cm]\
[stopse buf=1]\
[stopse buf=2]\
[endmacro]\
;
[macro name=macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒEÁ‹Q‚ä‚Á‚­‚è]\
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
[macro name=macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒE•\¦Q‚ä‚Á‚­‚è]\
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
[macro name=macro_”wŒi‰‰o]\
[stoptrans]\
[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒEÁ‹Q‚ä‚Á‚­‚è]\
[image	layer=0    page=back storage=%fdata  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[wait time=400]\
[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒE•\¦Q‚ä‚Á‚­‚è]\
[endmacro]\
;
[macro name=macro_”wŒi‰‰o_start]\
[wait time=1000]\
[stoptrans]\
[image	layer=0    page=back storage=%fdata  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[wait time=400]\
[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒE•\¦Q‚ä‚Á‚­‚è]\
[endmacro]\
;
[macro name=macro_scene_start]\
[position layer=message0 left=0 top=0 width=800 height=600 marginl=70 margint=55 marginr=70 marginb=55 frame="‚h‚e_02ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒE_01‰º’nƒmƒxƒ‹_14"]\
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
[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒEÁ‹Q‚ä‚Á‚­‚è]\
[wait time=1000]\
[image	layer=0    page=back storage="Šî–{Q•"  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
;[macro_‚a‚f‚l‚OF‚È‚µ]\
[wait time=2500]\
;[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒE•\¦Q‚ä‚Á‚­‚è]\
[endmacro]\
;
[macro name=macro_ˆÃ“]]\
[stoptrans]\
[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒEÁ‹Q‚ä‚Á‚­‚è]\
[image	layer=0    page=back storage="Šî–{Q•"  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[wait time=1000]\
[image	layer=0    page=back storage=%fdata  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒE•\¦Q‚ä‚Á‚­‚è]\
[endmacro]\
;
[macro name=macro_ˆÃ“]Q”’]\
[stoptrans]\
[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒEÁ‹Q‚ä‚Á‚­‚è]\
[image	layer=0    page=back storage="Šî–{Q”’"  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[wait time=1000]\
[image	layer=0    page=back storage=%fdata  	top=0 left=0]\
[trans	layer=0    time=1200 rule="trans_black" vague=600 children=false]\
[wt]\
[macro_ƒƒbƒZ[ƒWƒEƒBƒ“ƒhƒE•\¦Q‚ä‚Á‚­‚è]\
[endmacro]\
;
;
*ƒ}ƒNƒ@ƒTƒEƒ“ƒh
[macro name=macro_‚a‚f‚l‚PF–²Œ¶–é‚É–‚¿‚éˆÓu]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 1"]\
[playbgm storage="1.–²Œ¶–é161210_2loop_gmfix"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 1"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚QF_‚ğ‰z‚¦‚ä‚¯]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 2"]\
[playbgm storage="2._‚ğ’´‚¦s‚¯_2loop_gmfix2"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 2"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚RFâ‘Î—ë“x‚Ì–µ‚ŠT”O]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 3"]\
[playbgm storage="3.â‘Î—ë“x_2loop_mgfix2"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 3"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚SF•…”s‚Æâ›Œ‚Ì“DlŒ`’B]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 4"]\
[playbgm storage="4.•…”s_2loop_stfix2"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 4"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚TF€‚Æ‹ü]‚Ì‘å¹“°]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 5"]\
[playbgm storage="5.‘å¹“°_stfix2"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 5"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚UF‰i…‚Ì_‚Ì‘ˆ«]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 6"]\
[playbgm storage="6.‰i…_stfix"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 6"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚VFÅŠú‚Ìˆ¤‚Æ–³]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 7"]\
[playbgm storage="7.ÅŒã_2loop_gmfix2"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 7"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚WFâ–]‚Ì‘å‰F’ˆ‚Ö]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 8"]\
[playbgm storage="8.â–]_2loop_stfix2"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 8"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚XF‘Sl—Ş‹sE‚Ì_Œõ]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 9"]\
[playbgm storage="9.ˆÃ•_2loop_gmfix2"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 9"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚P‚OF‚ä‚­‚Ğ‚Æ‚ÌƒvƒŒ[ƒ[ƒ}]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 10"]\
[playbgm storage="10.s‚­l_2loop_stfix"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 10"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚a‚f‚l‚OF‚È‚µ]\
[if exp="f.‚a‚f‚lƒtƒ‰ƒO != 100"]\
[playbgm storage="voice_00no"]\
[eval exp="f.‚a‚f‚lƒtƒ‰ƒO = 100"]\
[endif]\
[endmacro]\
;
[macro name=macro_‚r‚dÄ¶QŒ¶‘z‚ÌŠJ•ú]\
[seopt  buf=0 volume=70]\
[playse buf=0 storage="‚r‚dQŒ¶‘z‚ÌŠJ•ú" loop=false]\
[endmacro]\
;
[macro name=macro_‚r‚dÄ¶Q¶–½—ÍW’†]\
[seopt  buf=0 volume=85]\
[playse buf=0 storage="‚r‚dQ¶–½—ÍW’†" loop=false]\
[endmacro]\
;
[macro name=macro_‚r‚dÄ¶QR‚é]\
[seopt  buf=0 volume=65]\
[playse buf=0 storage="‚r‚dQR‚é" loop=false]\
[quake time=150 hmax=20 vmax=20]\
[wq]\
[endmacro]\
;
[macro name=macro_‚r‚dÄ¶QØ‚è—ô‚­]\
[seopt  buf=0 volume=65]\
[playse buf=0 storage="‚r‚dQØ‚è—ô‚­" loop=false]\
[quake time=200 hmax=30 vmax=30]\
[wq]\
[endmacro]\
;
[macro name=macro_ƒtƒ‰ƒbƒVƒ…—h‚ê]\
[layopt	layer=1 		page=fore visible=true opacity=255 index=1004000]\
[layopt	layer=message0 	page=fore visible=true opacity=255 index=1003000]\
[layopt	layer=0 		page=fore visible=true opacity=255 index=1002000]\
[image	layer=1    page=fore storage="Šî–{Q”’"  	top=0 left=0]\
[wait time=30]\
[image	layer=1    page=fore storage="ŠG‚È‚µ800~600"  	top=0 left=0]\
[wait time=30]\
[image	layer=1    page=fore storage="Šî–{Q”’"  	top=0 left=0]\
[wait time=30]\
[image	layer=1    page=fore storage="ŠG‚È‚µ800~600"  	top=0 left=0]\
[quake time=200 hmax=40 vmax=40]\
[wq]\
[endmacro]\
;
*start|ƒXƒ^[ƒg
[startanchor]\
[rclick enabled=false]\
[bgmopt volume=90]
[deffont size=20 bold=false shadow=false edge=false color=0x403224]\
*ƒ^ƒCƒgƒ‹‰æ–Ê|ƒ^ƒCƒgƒ‹‰æ–Ê
[macro_‚a‚f‚l‚OF‚È‚µ]\
[macro_‚a‚f‚l‚P‚OF‚ä‚­‚Ğ‚Æ‚ÌƒvƒŒ[ƒ[ƒ}]\
[current layer=message1] [er]\
[current layer=message0] [er]\
[position layer=message0 frame="" opacity=0 ]\
[position layer=message1 frame="" opacity=0 ]\
[layopt	layer=0 page=fore visible=true opacity=255]\
[image 	layer=0 page=fore storage="”wŒi‚P"]\
[nowait]\
[history output=false enabled=false]\
[locate x=40 y=240]\
[link  target=*Å‰‚©‚ç]Å‰‚©‚çn‚ß‚é[endlink]\
[locate x=40 y=280]\
[link  target=*I—¹‚·‚é]I—¹‚·‚é[endlink]\
;[locate x=40 y=200]\
;[link  target=*‰¹Šy‰æ–Ê]‰¹Šy‚ğ•·‚­[endlink]\
;[locate x=40 y=320]\
;[link  target=*–ÚŸ‰æ–Ê]–ÚŸ‚©‚çn‚ß‚é[endlink]\
[history output=true enabled=true]\
[endnowait]\
[s]\
*–ÚŸ‰æ–Ê
[macro_‚a‚f‚l‚P‚OF‚ä‚­‚Ğ‚Æ‚ÌƒvƒŒ[ƒ[ƒ}]\
[er]\
[image 	layer=0 page=fore storage="”wŒi‚Q"]\
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
¥–ÚŸ
[font size=18]\
[locate x=0 y=28]\
[link  target=*õŠy‰€‚©‚ç]Šy‰€‚©‚ç[endlink]
[link  target=*õ˜Í]˜Í ƒvƒŒ[ƒ[ƒ}‚©‚ç‚Ì—¬o[endlink]
[link  target=*õ‚PÍ]‚PÍ ‰F’ˆ’a¶‚Æ¶–½‘n‘¢[endlink]
[link  target=*õ‚QÍ]‚QÍ ƒOƒm[ƒVƒXå‹`‚Ì’a¶[endlink]
[link  target=*õ‚RÍ]‚RÍ ¢ŠE‚ÌŠy‰€v‘z[endlink]
[link  target=*õ‚SÍ]‚SÍ ¢ŠE‘åí‚Æƒqƒgƒ‰[[endlink]
[link  target=*õ‚TÍ]‚TÍ Œ»‘ãA“ä‚Ì‘gD•Ò[endlink]
[link  target=*õ‚UÍ]‚UÍ Œ»‘ãA­¡‰Æ•Ò[endlink]
[link  target=*õv‘z‘–ÚŸ]ƒOƒm[ƒVƒX‚Ìv‘z‘–ÚŸ[endlink]
[link  target=*õv‘z‘‚PÍ]ƒOƒm[ƒVƒX‚Ìv‘z‘‚PÍ[endlink]
[link  target=*õv‘z‘‚QÍ]ƒOƒm[ƒVƒX‚Ìv‘z‘‚QÍ[endlink]
[link  target=*õƒA[ƒ~ƒA‚P]ƒA[ƒ~ƒA‚Ì¢ŠE‚P[endlink]
[link  target=*õ˜Vl‚Æ–‚–@]˜Vl‚Æ–‚–@‚ÌŒä‰¾˜b[endlink]
[link  target=*õƒA[ƒ~ƒA‚Q]ƒA[ƒ~ƒA‚Ì¢ŠE‚Q[endlink]
[link  target=*õlŠÔ‚É‚ÍŒÀŠE]lŠÔ‚É‚ÍŒÀŠE‚ª‚ ‚é[endlink]
[link  target=*õ‘S‚Ä‚Ì–]‚İ]‘S‚Ä‚Ì–]‚İ‚ğŠ‚¦‚½‚È‚ç[endlink]
[link  target=*õƒA[ƒ~ƒA‚R]ƒA[ƒ~ƒA‚Ì¢ŠE‚R[endlink]
[link  target=*õ_‚Ì‹Š’e‚P]_‚Ì‹Š’e‚P[endlink]
[link  target=*õ_‚Ì‹Š’e‚Q]_‚Ì‹Š’e‚Q[endlink]
[link  target=*õ_‚Ì‹Š’e‚R]_‚Ì‹Š’e‚R[endlink]
[link  target=*õl—Ş–Å–S]l—Ş–Å–S[endlink]
[link  target=*õ‚VÍ]‚VÍ ¬–¢—ˆA¼—ï‚Q‚P‚O‚O”N[endlink]
[link  target=*õ‚WÍ]‚WÍ –¢—ˆA¼—ï‚Q‚T‚O‚O”N`[endlink]
[current layer=message1]\
[font size=18]\
[locate x=0 y=28]\
[link  target=*õ‚XÍ]‚XÍ Šy‰€‚ÌŠT”OA‰F’ˆ‚Å‚Ìí‚¢[endlink]
[link  target=*õ—pŒê‚P]ƒOƒm[ƒVƒX—pŒê[endlink]
[link  target=*õ—pŒê‚Q]‚ä‚­‚Ğ‚Æ—pŒê‚P[endlink]
[link  target=*õ—pŒê‚R]‚ä‚­‚Ğ‚Æ—pŒê‚Q[endlink]
[link  target=*õ‚ä‚­‚Ğ‚Æ‚ÌŠy‰€]‚ä‚­‚Ğ‚Æ‚ÌŠy‰€‚Æ‚Í[endlink]
[link  target=*õƒ^ƒƒbƒg‚P]ƒ^ƒƒbƒg‚P[endlink]
[link  target=*õƒ”ƒBƒ‹•¨Œê]ƒ”ƒBƒŠƒjƒVƒƒƒEƒŒƒC‚Ì•¨Œê[endlink]
[link  target=*õƒ”ƒBƒ‹¸_]ƒ”ƒBƒŠƒjƒVƒƒƒEƒŒƒC‚Ì¸_‰F’ˆ‚P[endlink]
[link  target=*õ‚ä‚­‚Ğ‚Æ’B]‚ä‚­‚Ğ‚Æ’B‚É‚Â‚¢‚Ä[endlink]
[link  target=*õM‹Â‚·‚éÒ’B]_‚ğM‹Â‚·‚éÒ’B[endlink]
[link  target=*õƒf[ƒ~ƒEƒ‹ƒSƒX]ƒf[ƒ~ƒEƒ‹ƒSƒX[endlink]
[link  target=*õƒ”ƒBƒ‹¸_‚Q]ƒ”ƒBƒŠƒjƒVƒƒƒEƒŒƒC‚Ì¸_‰F’ˆ‚Q[endlink]
[link  target=*õƒ^ƒƒbƒg‚Q]ƒ^ƒƒbƒg‚Q[endlink]
[link  target=*õ‚P‚OÍ]‚P‚OÍ –³ŒÀ\‘¢‰F’ˆ‚Ì’´‰z[endlink]
[link  target=*õ‚R‚OƒAƒCƒI[ƒ“‚Ì—Í]‚R‚OƒAƒCƒI[ƒ“‚Ì—Í[endlink]
[link  target=*õIÍ]IÍ ƒvƒŒ[ƒ[ƒ}‚ÆŠ®‘S‘¶İ[endlink]
[link  target=*õƒ^ƒƒbƒg‚R]ƒ^ƒƒbƒg‚R[endlink]
[link  target=*õ”Ş—]”Ş—‚Í‚Ü‚¾–°‚Á‚Ä‚¢‚é[endlink]
[link  target=*õŒ¶‘z¢ŠE]Œ¶‘z¢ŠE[endlink]
[link  target=*õ‹AŠÒ]‹AŠÒ[endlink]
[link  target=*õ‘¢•¨å‚Æ‚Ì‘Î˜b]‘¢•¨å‚Æ‚Ì‘Î˜b[endlink]
[link  target=*õƒvƒŒ[ƒ[ƒ}]‚ä‚­‚Ğ‚Æ‚ÌƒvƒŒ[ƒ[ƒ}[endlink]
[link  target=*õƒXƒ^ƒbƒt]ƒXƒ^ƒbƒt[endlink]
[link  target=*õ[endlink]\
[link  target=*õ[endlink]\
[link  target=*õ[endlink]\
[link  target=*õ[endlink]\
[link  target=*õ[endlink]\
[link  target=*õ[endlink]\
[font size=20]\
[locate x=280 y=480]\
[link  target=*ƒ^ƒCƒgƒ‹‰æ–Ê]–ß‚é[endlink]\
[current layer=message0]\
[history output=true enabled=true]\
[endnowait]\
[s]\
*‰¹Šy‰æ–Ê
[macro_‚a‚f‚l‚OF‚È‚µ]\
*‰¹Šy‰æ–Ê–ß‚è
[er]\
[image 	layer=0 page=fore storage="”wŒi‚Q"]\
[nowait]\
[history output=false enabled=false]\
[locate x=200 y=80]\
[link  target=*‚a‚f‚l‚P]‚PF–²Œ¶–é‚É–‚¿‚éˆÓu[endlink]\
[locate x=200 y=110]\
[link  target=*‚a‚f‚l‚Q]‚QF_‚ğ‰z‚¦‚ä‚¯[endlink]\
[locate x=200 y=140]\
[link  target=*‚a‚f‚l‚R]‚RFâ‘Î—ë“x‚Ì–µ‚ŠT”O[endlink]\
[locate x=200 y=170]\
[link  target=*‚a‚f‚l‚S]‚SF•…”s‚Æâ›Œ‚Ì“DlŒ`’B[endlink]\
[locate x=200 y=200]\
[link  target=*‚a‚f‚l‚T]‚TF€‚Æ‹ü]‚Ì‘å¹“°[endlink]\
[locate x=200 y=230]\
[link  target=*‚a‚f‚l‚U]‚UF‰i…‚Ì_‚Ì‘ˆ«[endlink]\
[locate x=200 y=260]\
[link  target=*‚a‚f‚l‚V]‚VFÅŠú‚Ìˆ¤‚Æ–³[endlink]\
[locate x=200 y=290]\
[link  target=*‚a‚f‚l‚W]‚WFâ–]‚Ì‘å‰F’ˆ‚Ö[endlink]\
[locate x=200 y=320]\
[link  target=*‚a‚f‚l‚X]‚XF‘Sl—Ş‹sE‚Ì_Œõ[endlink]\
[locate x=200 y=350]\
[link  target=*‚a‚f‚l‚P‚O]‚P‚OF‚ä‚­‚Ğ‚Æ‚ÌƒvƒŒ[ƒ[ƒ}[endlink]\
[locate x=200 y=400]\
[link  target=*ƒ^ƒCƒgƒ‹‰æ–Ê]–ß‚é[endlink]\
[history output=true enabled=true]\
[endnowait]\
[s]\
*‚a‚f‚l‚O
[macro_‚a‚f‚l‚OF‚È‚µ]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚P
[macro_‚a‚f‚l‚PF–²Œ¶–é‚É–‚¿‚éˆÓu]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚Q
[macro_‚a‚f‚l‚QF_‚ğ‰z‚¦‚ä‚¯]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚R
[macro_‚a‚f‚l‚RFâ‘Î—ë“x‚Ì–µ‚ŠT”O]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚S
[macro_‚a‚f‚l‚SF•…”s‚Æâ›Œ‚Ì“DlŒ`’B]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚T
[macro_‚a‚f‚l‚TF€‚Æ‹ü]‚Ì‘å¹“°]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚U
[macro_‚a‚f‚l‚UF‰i…‚Ì_‚Ì‘ˆ«]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚V
[macro_‚a‚f‚l‚VFÅŠú‚Ìˆ¤‚Æ–³]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚W
[macro_‚a‚f‚l‚WFâ–]‚Ì‘å‰F’ˆ‚Ö]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚X
[macro_‚a‚f‚l‚XF‘Sl—Ş‹sE‚Ì_Œõ]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*‚a‚f‚l‚P‚O
[macro_‚a‚f‚l‚P‚OF‚ä‚­‚Ğ‚Æ‚ÌƒvƒŒ[ƒ[ƒ}]\
[jump target=*‰¹Šy‰æ–Ê–ß‚è]\
*I—¹‚·‚é
[close]\
[jump target=*ƒ^ƒCƒgƒ‹‰æ–Ê]\
*Å‰‚©‚ç
[macro_scene_end]\
;[image 	layer=0 page=fore storage="”wŒi‚Q"]\
[cm]\
