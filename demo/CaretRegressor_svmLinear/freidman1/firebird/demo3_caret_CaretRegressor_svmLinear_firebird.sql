-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmLinear
-- Dataset : freidman1
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 0.5629846484809589) / 0.2600015884118536 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 0.4560644242337592) / 0.2896884193099619 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.4711381748147476) / 0.3128833495879441 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 0.5339680200945178) / 0.2844030958277151 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - 0.478093626237387) / 0.2879458120111227 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - 0.5682849224172328) / 0.2995521696075025 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - 0.4791437471428049) / 0.2752572650336402 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - 0.4594152477223208) / 0.2890235713417702 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - 0.4901106996809652) / 0.2808092486405501 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - 0.5378806933707535) / 0.297685615548656 AS "Feature_9" 
FROM freidman1 AS "ADS"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6, "Values".sv_7 AS sv_7, "Values".sv_8 AS sv_8, "Values".sv_9 AS sv_9 
FROM (SELECT 0 AS sv_idx, 1.0 AS dual_coeff, 0.5036096414356775 AS sv_0, -1.3182656867433569 AS sv_1, 1.4841279499842501 AS sv_2, -0.2457416496638658 AS sv_3, -0.21624057701729868 AS sv_4, -1.2645872704972132 AS sv_5, -1.377583570465376 AS sv_6, -1.0768041740384664 AS sv_7, 1.0573977789633546 AS sv_8, -0.2468729277272791 AS sv_9 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, 1.0 AS dual_coeff, 1.4366975310563883 AS sv_0, -0.4493163080599806 AS sv_1, 1.2938438403878127 AS sv_2, 0.9190175900334256 AS sv_3, 1.623754622164323 AS sv_4, 0.4686459293962287 AS sv_5, 1.0172720885363609 AS sv_6, 1.1661084096199215 AS sv_7, -0.3429372990118109 AS sv_8, -0.02600307537886847 AS sv_9 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, -1.0 AS dual_coeff, -0.7746675854237467 AS sv_0, 0.4726311272015297 AS sv_1, -0.3668612870260569 AS sv_2, -0.9359520018116227 AS sv_3, -1.0676485114169671 AS sv_4, -1.8560294697047783 AS sv_5, -0.512676976666447 AS sv_6, -1.105501870900948 AS sv_7, 0.19828144031404038 AS sv_8, -0.11061982965376313 AS sv_9 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, -1.0 AS dual_coeff, -1.0087949800345386 AS sv_0, 0.9125472687387126 AS sv_1, 0.3572127001141302 AS sv_2, 0.3821398494095057 AS sv_3, 1.5313904420982378 AS sv_4, 0.3213109414262274 AS sv_5, 0.7453664594315254 AS sv_6, -0.18642545752235481 AS sv_7, -1.6741795691539199 AS sv_8, -1.3929839095047272 AS sv_9 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, -1.0 AS dual_coeff, 1.126269986371264 AS sv_0, 1.4232488016193412 AS sv_1, -0.471270752163667 AS sv_2, 1.435767683791736 AS sv_3, -1.5551677522887173 AS sv_4, -0.6970232963217106 AS sv_5, -0.3575031396507709 AS sv_6, -0.07185762564598279 AS sv_7, -1.2009073225271047 AS sv_8, -1.7947077109194853 AS sv_9 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, -1.0 AS dual_coeff, 0.5705937623353455 AS sv_0, 1.2826219105762264 AS sv_1, 0.7208390490279238 AS sv_2, 0.13128233214304527 AS sv_3, 0.606402825405201 AS sv_4, -0.5031726830014054 AS sv_5, -0.05603411054889496 AS sv_6, 1.5374529738270797 AS sv_7, 1.5109038698143105 AS sv_8, 1.0980922700299456 AS sv_9 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, 0.8612007481585022 AS dual_coeff, 0.3377755259897057 AS sv_0, 1.2725450332174992 AS sv_1, -1.0470289543840228 AS sv_2, 1.5703931196897845 AS sv_3, -1.640191274041735 AS sv_4, -1.0563882860685092 AS sv_5, 0.1532765355292874 AS sv_6, 0.044583235505026575 AS sv_7, 0.9063687044618544 AS sv_8, 1.2990908370798075 AS sv_9 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, 1.0 AS dual_coeff, -0.6098475792304183 AS sv_0, -0.6754079801455 AS sv_1, -1.382225758927901 AS sv_2, -0.619403910974753 AS sv_3, -0.9741648436324905 AS sv_4, -1.5976356305108452 AS sv_5, -0.1072096501869364 AS sv_6, -1.2906292284355467 AS sv_7, -0.8449941508512769 AS sv_8, -0.9877530317417492 AS sv_9 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, -0.5606728250720717 AS dual_coeff, 0.3299025970774021 AS sv_0, -0.6012595077394656 AS sv_1, 0.504918375306666 AS sv_2, -1.1660014928178506 AS sv_3, -1.4717623187501685 AS sv_4, 1.135839684561314 AS sv_5, 0.008343345975681463 AS sv_6, -0.24381148955373244 AS sv_7, -0.6503621247939337 AS sv_8, -1.756126757719801 AS sv_9 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, 1.0 AS dual_coeff, -0.5217880205169946 AS sv_0, 0.485955872720183 AS sv_1, 1.6065772826057525 AS sv_2, -1.2423048455951269 AS sv_3, 0.09762023601854716 AS sv_4, -1.3113258038544175 AS sv_5, -1.361150095491801 AS sv_6, -0.9372150233697976 AS sv_7, 0.9787245892121716 AS sv_8, -1.6131590224248271 AS sv_9 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, 1.0 AS dual_coeff, -0.4700123703669146 AS sv_0, 1.2861287712360863 AS sv_1, -1.4932688704348576 AS sv_2, 0.08141828440348789 AS sv_3, 0.8199031016006125 AS sv_4, 1.2217140231949843 AS sv_5, -0.3396772802346106 AS sv_6, -1.2796531809340823 AS sv_7, 1.4851362651168931 AS sv_8, -0.5882428877124961 AS sv_9 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, 0.05546699849063826 AS dual_coeff, 0.777651440184101 AS sv_0, 0.3972186863530105 AS sv_1, 0.6922195506167069 AS sv_2, 0.3715521673649137 AS sv_3, -1.0352184858318543 AS sv_4, 1.0687756512432502 AS sv_5, 1.4367052959988835 AS sv_6, -0.460297619051082 AS sv_7, -0.6665720009472244 AS sv_8, -0.8773776889758643 AS sv_9 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, -1.0 AS dual_coeff, -2.0938920299834742 AS sv_0, 1.0732699811540705 AS sv_1, 1.4887371733927075 AS sv_2, 0.7719991620027493 AS sv_3, -1.2279607081109931 AS sv_4, 1.3894565905122742 AS sv_5, 0.3507927883434788 AS sv_6, -1.3265746979463087 AS sv_7, 1.0984785208092538 AS sv_8, 0.30038476215914306 AS sv_9 FROM rdb$database UNION ALL SELECT 13 AS sv_idx, -0.4729196621539916 AS dual_coeff, 0.5164615475677795 AS sv_0, 1.6860626954797509 AS sv_1, -1.484887783936487 AS sv_2, 1.2117692341556168 AS sv_3, -1.4320606165819008 AS sv_4, 1.0990763810881725 AS sv_5, -0.4941041986582703 AS sv_6, 0.29342933463187 AS sv_7, 1.6174183040445054 AS sv_8, -1.2990706334348163 AS sv_9 FROM rdb$database UNION ALL SELECT 14 AS sv_idx, -1.0 AS dual_coeff, 0.38995756686435745 AS sv_0, 1.1980960095797497 AS sv_1, -0.4061975122587744 AS sv_2, 0.3505452272888245 AS sv_3, 1.022360065194521 AS sv_4, 1.2411135028859495 AS sv_5, 0.7571171814686402 AS sv_6, 0.5636197941624214 AS sv_7, -1.2640101708274027 AS sv_8, 1.1922369020652677 AS sv_9 FROM rdb$database UNION ALL SELECT 15 AS sv_idx, -0.7629676353453654 AS dual_coeff, 1.0078841166212185 AS sv_0, -0.7506981758791661 AS sv_1, 0.2003831210434318 AS sv_2, -0.545950480369821 AS sv_3, 1.7150044029103115 AS sv_4, 0.6342294385883231 AS sv_5, 1.1344577200283585 AS sv_6, 0.6273213246379119 AS sv_7, 1.0335333401530125 AS sv_8, 0.05782046234897355 AS sv_9 FROM rdb$database UNION ALL SELECT 16 AS sv_idx, -1.0 AS dual_coeff, 0.833863805002791 AS sv_0, -1.5595419063463156 AS sv_1, -0.044028513987021935 AS sv_2, 0.7918401625839987 AS sv_3, 0.3288381179866248 AS sv_4, 1.159496251507363 AS sv_5, -1.1669616935395957 AS sv_6, -1.4205009799363129 AS sv_7, -0.02189175438711449 AS sv_8, 1.3520354116840203 AS sv_9 FROM rdb$database UNION ALL SELECT 17 AS sv_idx, 1.0 AS dual_coeff, -0.31710802152912587 AS sv_0, 0.9334053982081664 AS sv_1, 1.5400717162808615 AS sv_2, -0.8646415900316403 AS sv_3, 1.2484032420756683 AS sv_4, -1.1097192663923927 AS sv_5, 1.4188530732694966 AS sv_6, 0.7996487726741377 AS sv_7, 0.40625006679773135 AS sv_8, -0.17839297204103213 AS sv_9 FROM rdb$database UNION ALL SELECT 18 AS sv_idx, -1.0 AS dual_coeff, 1.1686105324378355 AS sv_0, -1.2042163392847756 AS sv_1, -0.5418383424141348 AS sv_2, -1.4952348163698375 AS sv_3, 0.2873489593294957 AS sv_4, 0.7728155077151273 AS sv_5, 1.2333007214593736 AS sv_6, -0.9053858273193192 AS sv_7, 1.0786062230483116 AS sv_8, -0.9761801404355992 AS sv_9 FROM rdb$database UNION ALL SELECT 19 AS sv_idx, -1.0 AS dual_coeff, 1.6443184255614427 AS sv_0, -1.4615848466342298 AS sv_1, -0.2526286244755355 AS sv_2, 0.9642512296474984 AS sv_3, -0.2822934294263184 AS sv_4, 1.126105757776256 AS sv_5, 1.4600198467310461 AS sv_6, -0.10868085944676062 AS sv_7, -1.2062779404286308 AS sv_8, -0.6064191636136073 AS sv_9 FROM rdb$database UNION ALL SELECT 20 AS sv_idx, 1.0 AS dual_coeff, 0.4807417495893374 AS sv_0, 0.8900734238419048 AS sv_1, -0.7765430963985923 AS sv_2, -0.7367012898517014 AS sv_3, -0.13509455568420115 AS sv_4, 0.323929019378858 AS sv_5, 0.5399328987122096 AS sv_6, -0.608096983570004 AS sv_7, 0.9369152150390444 AS sv_8, -0.2109815037333929 AS sv_9 FROM rdb$database UNION ALL SELECT 21 AS sv_idx, -1.0 AS dual_coeff, -1.5922841890579995 AS sv_0, 0.15734124840608935 AS sv_1, -0.8590857049920394 AS sv_2, 1.5591859895413196 AS sv_3, -0.6629690737486366 AS sv_4, -0.4258220999086861 AS sv_5, -1.4758901633603045 AS sv_6, -0.4249899649145824 AS sv_7, 1.3000578501518685 AS sv_8, -1.7054223246484363 AS sv_9 FROM rdb$database UNION ALL SELECT 22 AS sv_idx, 0.7172724482176666 AS dual_coeff, 0.774258639410301 AS sv_0, -0.8542844678082749 AS sv_1, 0.8916336082631628 AS sv_2, 0.04204353408229691 AS sv_3, -1.4674177425757804 AS sv_4, 0.4451708676291397 AS sv_5, -0.7771330504689402 AS sv_6, -1.1757435780258076 AS sv_7, -0.40668248986146854 AS sv_8, 0.3589667090126099 AS sv_9 FROM rdb$database UNION ALL SELECT 23 AS sv_idx, -1.0 AS dual_coeff, 1.0099818830254963 AS sv_0, 1.5543612882671898 AS sv_1, -1.4130241289882537 AS sv_2, 0.1935326280692892 AS sv_3, -0.1627450676411274 AS sv_4, 1.1269731467903512 AS sv_5, -0.08373867417848084 AS sv_6, 0.7967264852122542 AS sv_7, 0.9149397494354988 AS sv_8, -1.5948238366091425 AS sv_9 FROM rdb$database UNION ALL SELECT 24 AS sv_idx, -1.0 AS dual_coeff, -0.836552345897501 AS sv_0, 1.569503647809064 AS sv_1, 0.809348410413737 AS sv_2, 0.2666736590333183 AS sv_3, 1.633484445980921 AS sv_4, -0.0852340805026903 AS sv_5, 0.4898840302243585 AS sv_6, -0.14309559637786676 AS sv_7, 0.7828748897025722 AS sv_8, 1.1467636124507423 AS sv_9 FROM rdb$database UNION ALL SELECT 25 AS sv_idx, -1.0 AS dual_coeff, -1.1249873539290167 AS sv_0, 0.8957672106348914 AS sv_1, -1.1781047100172903 AS sv_2, 1.4473647965552257 AS sv_3, -0.9828664925142938 AS sv_4, -1.2791224565406982 AS sv_5, 1.3064548920386183 AS sv_6, 1.7374194552891804 AS sv_7, -0.007608724060311147 AS sv_8, -0.1884788719292792 AS sv_9 FROM rdb$database UNION ALL SELECT 26 AS sv_idx, 1.0 AS dual_coeff, 0.29678049515670873 AS sv_0, 0.3623523405608141 AS sv_1, -0.9306800827313744 AS sv_2, 1.4534205414016304 AS sv_3, 0.056290679979726366 AS sv_4, -0.000332297702583598 AS sv_5, 1.2154857007432924 AS sv_6, 1.1125338928629187 AS sv_7, 0.5627895247195668 AS sv_8, -0.5612748925336398 AS sv_9 FROM rdb$database UNION ALL SELECT 27 AS sv_idx, -1.0 AS dual_coeff, 0.7205920436868326 AS sv_0, -1.4631616661232123 AS sv_1, -0.42228829215866376 AS sv_2, -0.0203714610098207 AS sv_3, 1.689237033563938 AS sv_4, -1.2924760877304262 AS sv_5, -0.32504082981529747 AS sv_6, 0.6071072396126675 AS sv_7, -1.697211386303629 AS sv_8, 0.13503132924781547 AS sv_9 FROM rdb$database UNION ALL SELECT 28 AS sv_idx, 0.6510635462011694 AS dual_coeff, -0.7031353421580949 AS sv_0, 1.2478953848325072 AS sv_1, -1.2020157539427232 AS sv_2, -1.610496182657641 AS sv_3, 1.1019959963470876 AS sv_4, 0.8699929644752628 AS sv_5, -1.5741864831656347 AS sv_6, 1.464112181441284 AS sv_7, -1.595750420171499 AS sv_8, 0.23464255191942585 AS sv_9 FROM rdb$database UNION ALL SELECT 29 AS sv_idx, 1.0 AS dual_coeff, 0.10924906636680673 AS sv_0, 0.7310160374265112 AS sv_1, 1.2849224077551271 AS sv_2, 0.8527314276235608 AS sv_3, 1.606249550232881 AS sv_4, 1.368511415633186 AS sv_5, 0.22335917923815807 AS sv_6, 1.4210575472666842 AS sv_7, 0.7944157724343968 AS sv_8, -0.3943926382622105 AS sv_9 FROM rdb$database UNION ALL SELECT 30 AS sv_idx, -1.0 AS dual_coeff, 0.2790014125544316 AS sv_0, -0.5027121686917057 AS sv_1, -0.3941309390309876 AS sv_2, 0.7544713936611904 AS sv_3, 1.2917866118733952 AS sv_4, 0.7403898098630893 AS sv_5, -1.2961523864030644 AS sv_6, -0.3452353384559227 AS sv_7, -0.6401994040955953 AS sv_8, -1.3276802484033383 AS sv_9 FROM rdb$database UNION ALL SELECT 31 AS sv_idx, -0.923046137485856 AS dual_coeff, -1.0030505112071535 AS sv_0, -1.2136680415280388 AS sv_1, 0.6893715716376119 AS sv_2, 0.9174335133133442 AS sv_3, 0.5574783190496018 AS sv_4, 0.6565007482993399 AS sv_5, 0.2468998703252618 AS sv_6, 1.6254524327758488 AS sv_7, -0.21667902469800648 AS sv_8, 1.0103215836945247 AS sv_9 FROM rdb$database UNION ALL SELECT 32 AS sv_idx, 1.0 AS dual_coeff, 0.4923808696865368 AS sv_0, -0.8630135250505208 AS sv_1, 1.1889566921092103 AS sv_2, -0.8475058616214682 AS sv_3, 0.5277519296038365 AS sv_4, 1.145537599152512 AS sv_5, -1.3354342540601425 AS sv_6, -0.040811818544594425 AS sv_7, -1.5918868102392127 AS sv_8, 1.5325177399034835 AS sv_9 FROM rdb$database UNION ALL SELECT 33 AS sv_idx, 1.0 AS dual_coeff, 1.0494301022969794 AS sv_0, 0.5084840557718772 AS sv_1, 1.5684998137935846 AS sv_2, -1.6922457777733126 AS sv_3, 0.4924994639323586 AS sv_4, 0.8907410771792706 AS sv_5, -0.15711739129064586 AS sv_6, -0.42171066462359114 AS sv_7, -0.243523442205055 AS sv_8, -1.7448488919220035 AS sv_9 FROM rdb$database UNION ALL SELECT 34 AS sv_idx, 1.0 AS dual_coeff, -0.09451641442493136 AS sv_0, -0.6064685608726618 AS sv_1, -0.9988934481611093 AS sv_2, -0.1231235622043763 AS sv_3, 0.34368544640387333 AS sv_4, 1.2203700185316086 AS sv_5, -1.1838982142241155 AS sv_6, -1.4733198812775243 AS sv_7, 0.7845463087491901 AS sv_8, 1.0862166053442357 AS sv_9 FROM rdb$database UNION ALL SELECT 35 AS sv_idx, 1.0 AS dual_coeff, -0.9146199077362036 AS sv_0, 0.349596522129656 AS sv_1, -1.2605058272885188 AS sv_2, -0.9857005356436346 AS sv_3, 1.1398836531239458 AS sv_4, -1.7343816041514535 AS sv_5, 0.008899011956320263 AS sv_6, -0.16296045701719897 AS sv_7, 0.3144224297369062 AS sv_8, 1.1848959966203525 AS sv_9 FROM rdb$database UNION ALL SELECT 36 AS sv_idx, 1.0 AS dual_coeff, 0.9270138002984532 AS sv_0, -0.02416297317756157 AS sv_1, -1.2938590461362611 AS sv_2, 1.0113012606944565 AS sv_3, -1.1504505002781455 AS sv_4, 0.38527071002352065 AS sv_5, -1.6907188223745044 AS sv_6, -1.2475216632240507 AS sv_7, -1.2638838350421209 AS sv_8, -1.6403146423259585 AS sv_9 FROM rdb$database UNION ALL SELECT 37 AS sv_idx, 1.0 AS dual_coeff, 0.5109612925527593 AS sv_0, 0.15780132150308188 AS sv_1, 1.0309932613130215 AS sv_2, 1.5256585233437578 AS sv_3, -0.9387645473116154 AS sv_4, -0.4192893109487469 AS sv_5, 0.6788463580045032 AS sv_6, 0.9654795255805873 AS sv_7, -1.521257012273994 AS sv_8, 0.4016068499525436 AS sv_9 FROM rdb$database UNION ALL SELECT 38 AS sv_idx, 1.0 AS dual_coeff, 0.8938811136932194 AS sv_0, 0.8076245425018842 AS sv_1, -1.4262656617678393 AS sv_2, 0.7745961220827626 AS sv_3, -0.3955118458320936 AS sv_4, -0.7313158828026199 AS sv_5, -0.04713651963295504 AS sv_6, 1.7772707718863845 AS sv_7, -1.6929372040220965 AS sv_8, -0.491695231469683 AS sv_9 FROM rdb$database UNION ALL SELECT 39 AS sv_idx, -1.0 AS dual_coeff, -1.8183456132940587 AS sv_0, -0.7909573409483635 AS sv_1, -0.15336171609509455 AS sv_2, 0.7737467238733592 AS sv_3, -1.2463778997092863 AS sv_4, 1.2057143686055487 AS sv_5, -1.57902474369402 AS sv_6, -1.2508647468832117 AS sv_7, -0.5647621498283037 AS sv_8, 0.3045925444250155 AS sv_9 FROM rdb$database UNION ALL SELECT 40 AS sv_idx, -1.0 AS dual_coeff, -0.4928390170146462 AS sv_0, 1.709604606417091 AS sv_1, 0.7911744717687277 AS sv_2, 0.10738115544458696 AS sv_3, -0.8792759098591877 AS sv_4, 0.286245809719789 AS sv_5, -0.5131141026961095 AS sv_6, 0.4467493819428777 AS sv_7, -0.9718840772097392 AS sv_8, 0.988731814679282 AS sv_9 FROM rdb$database UNION ALL SELECT 41 AS sv_idx, 1.0 AS dual_coeff, 0.17679341352096 AS sv_0, -1.1128678862601735 AS sv_1, -1.4495365213492803 AS sv_2, -0.3766643990422097 AS sv_3, 1.555767628669939 AS sv_4, 1.0234622490942586 AS sv_5, 0.1357328568370306 AS sv_6, 0.009424591074634859 AS sv_7, 0.2724014141358957 AS sv_8, 1.0518465033753637 AS sv_9 FROM rdb$database UNION ALL SELECT 42 AS sv_idx, -0.19893931066686446 AS dual_coeff, 0.8254983991082917 AS sv_0, -0.7873064183339139 AS sv_1, -0.6501592198308818 AS sv_2, 0.39103814492895017 AS sv_3, 0.760545121348117 AS sv_4, 0.4580651772375852 AS sv_5, -0.8090848988058305 AS sv_6, 1.2687760752628647 AS sv_7, 0.936446651394696 AS sv_8, -0.9890626571987582 AS sv_9 FROM rdb$database UNION ALL SELECT 43 AS sv_idx, 1.0 AS dual_coeff, -1.2251539021741444 AS sv_0, -1.1520530585135722 AS sv_1, -1.228266844605792 AS sv_2, -0.15121618883533366 AS sv_3, -0.8120734896183522 AS sv_4, -1.467076505670864 AS sv_5, -0.40349030669008346 AS sv_6, 0.653389133849577 AS sv_7, -1.1583277429860173 AS sv_8, -1.0921013732131524 AS sv_9 FROM rdb$database UNION ALL SELECT 44 AS sv_idx, -1.0 AS dual_coeff, -0.9985966419836956 AS sv_0, -0.04689377617120336 AS sv_1, -0.7309487924985744 AS sv_2, -0.8823519525586082 AS sv_3, 1.7220699287097747 AS sv_4, 0.44399679907523043 AS sv_5, -1.2467373948530307 AS sv_6, -0.3112865181189524 AS sv_7, -1.4523506053473418 AS sv_8, -0.7972058445108587 AS sv_9 FROM rdb$database UNION ALL SELECT 45 AS sv_idx, -1.0 AS dual_coeff, -1.0741682118879703 AS sv_0, 0.34585420141891 AS sv_1, -0.21662230974174226 AS sv_2, -1.8416726520591635 AS sv_3, -0.15059573432347254 AS sv_4, 1.0991374817363615 AS sv_5, 1.4129111061041173 AS sv_6, -0.827339143892823 AS sv_7, 1.5892368055182875 AS sv_8, 0.7314731602218854 AS sv_9 FROM rdb$database UNION ALL SELECT 46 AS sv_idx, -1.0 AS dual_coeff, 0.7340537592095961 AS sv_0, -1.0695633658397616 AS sv_1, -0.1618316391713172 AS sv_2, -0.769101683814922 AS sv_3, -1.4470181372466597 AS sv_4, -0.864501842410407 AS sv_5, -0.9478115171907384 AS sv_6, 0.011195376817103827 AS sv_7, 1.4957131596720867 AS sv_8, 0.06912411148453655 AS sv_9 FROM rdb$database UNION ALL SELECT 47 AS sv_idx, -1.0 AS dual_coeff, 0.9631098474054448 AS sv_0, 1.714074093041958 AS sv_1, 1.2565187018533663 AS sv_2, 0.8379124611907616 AS sv_3, -0.2534591566386882 AS sv_4, -0.7256944584550123 AS sv_5, -1.015390986378015 AS sv_6, -1.288716887372162 AS sv_7, -1.5936167746212928 AS sv_8, 1.2180380833413262 AS sv_9 FROM rdb$database UNION ALL SELECT 48 AS sv_idx, -1.0 AS dual_coeff, -1.3744388386142923 AS sv_0, 1.6845934962121303 AS sv_1, 0.0588855382345239 AS sv_2, 0.362883253228666 AS sv_3, 0.030735682859276112 AS sv_4, 1.2469944766195706 AS sv_5, -0.6092314368016237 AS sv_6, -0.33268156336526084 AS sv_7, -0.4916842094514651 AS sv_8, 1.4502199019656763 AS sv_9 FROM rdb$database UNION ALL SELECT 49 AS sv_idx, 1.0 AS dual_coeff, -0.06826933702347293 AS sv_0, 1.2723739602875568 AS sv_1, -1.3122031627764688 AS sv_2, -1.3623183561003582 AS sv_3, -1.3139130130005252 AS sv_4, 0.3770769888268445 AS sv_5, -0.5491372921991071 AS sv_6, 0.7071721385135684 AS sv_7, 1.2675676408913894 AS sv_8, -0.5899164006435408 AS sv_9 FROM rdb$database UNION ALL SELECT 50 AS sv_idx, -1.0 AS dual_coeff, 1.240466581204082 AS sv_0, -1.0463555442285895 AS sv_1, -0.04745610175571387 AS sv_2, -0.7641131883718306 AS sv_3, 0.22391683140552773 AS sv_4, -1.4890153332037759 AS sv_5, 1.4741142601238297 AS sv_6, 1.0625699037347565 AS sv_7, -0.510729774853047 AS sv_8, 0.5799324088678436 AS sv_9 FROM rdb$database UNION ALL SELECT 51 AS sv_idx, -1.0 AS dual_coeff, 1.2891786388041275 AS sv_0, -0.867304857441981 AS sv_1, 0.6004588140376829 AS sv_2, 0.07319867564312882 AS sv_3, 1.6793745538775091 AS sv_4, -1.8765532895290264 AS sv_5, 1.4659810456236881 AS sv_6, 1.2833340242730968 AS sv_7, 0.6286888388626508 AS sv_8, -0.27428086058216994 AS sv_9 FROM rdb$database UNION ALL SELECT 52 AS sv_idx, 0.5824174205160911 AS dual_coeff, -0.9173039321452766 AS sv_0, 1.2672196903819226 AS sv_1, -1.1887473336933183 AS sv_2, -0.11522625972850105 AS sv_3, 1.3218099937257168 AS sv_4, -1.7913544278727394 AS sv_5, 1.6455453067389936 AS sv_6, -1.330553142593352 AS sv_7, 0.1433379991180333 AS sv_8, 1.5022920440913596 AS sv_9 FROM rdb$database UNION ALL SELECT 53 AS sv_idx, -0.9488755908599188 AS dual_coeff, -0.962905947027855 AS sv_0, 0.2762155587977838 AS sv_1, 1.0029655106974935 AS sv_2, -1.7465177207377605 AS sv_3, 0.4998643382073213 AS sv_4, -1.1765033809716992 AS sv_5, -1.1974261067676533 AS sv_6, 1.1876290677311447 AS sv_7, 1.1912738647932355 AS sv_8, 0.4095412515660559 AS sv_9 FROM rdb$database UNION ALL SELECT 54 AS sv_idx, 1.0 AS dual_coeff, 0.9874255408918629 AS sv_0, 0.0133597978402415 AS sv_1, -1.4344286058775375 AS sv_2, -1.172830417608089 AS sv_3, 0.020753547101370583 AS sv_4, 1.1790744716208936 AS sv_5, -1.279074280227283 AS sv_6, -0.4609497744739227 AS sv_7, -0.21629700210259792 AS sv_8, 1.2794052501292124 AS sv_9 FROM rdb$database UNION ALL SELECT 55 AS sv_idx, -1.0 AS dual_coeff, 0.07950331170320807 AS sv_0, -1.0477070590883466 AS sv_1, 0.4654604748116168 AS sv_2, -0.3839516706159031 AS sv_3, -0.9943929096826752 AS sv_4, 0.598470536757524 AS sv_5, -0.6257245287636255 AS sv_6, 0.8115136350259254 AS sv_7, -0.8132850687861121 AS sv_8, -0.17196956561037052 AS sv_9 FROM rdb$database UNION ALL SELECT 56 AS sv_idx, 1.0 AS dual_coeff, -2.160760024548072 AS sv_0, -0.6567631194549048 AS sv_1, 1.676182630493957 AS sv_2, 0.7172434977326312 AS sv_3, -0.4451223293509604 AS sv_4, -0.7612321638474583 AS sv_5, 0.4869985990600639 AS sv_6, 1.8656256841816443 AS sv_7, -0.5396261536512827 AS sv_8, 0.08289848882753169 AS sv_9 FROM rdb$database UNION ALL SELECT 57 AS sv_idx, 1.0 AS dual_coeff, 0.37269723670513577 AS sv_0, -1.4771702702598173 AS sv_1, 1.4315518506014344 AS sv_2, 1.5646209458264828 AS sv_3, 1.5409764559280454 AS sv_4, 0.4415518472915363 AS sv_5, 1.5328780635213548 AS sv_6, -0.5923125969119905 AS sv_7, 0.7564122900363661 AS sv_8, 0.11360320874755292 AS sv_9 FROM rdb$database UNION ALL SELECT 58 AS sv_idx, 1.0 AS dual_coeff, 0.14625477946364773 AS sv_0, -0.5023659399524281 AS sv_1, -0.8274000635560183 AS sv_2, 0.6247516493229303 AS sv_3, -0.5371780684200234 AS sv_4, 0.3221182973775815 AS sv_5, -1.0246750456718248 AS sv_6, 0.8725363153948285 AS sv_7, -0.6988176070073092 AS sv_8, 0.35409774195615795 AS sv_9 FROM rdb$database UNION ALL SELECT 59 AS sv_idx, 1.0 AS dual_coeff, -0.6566983393698069 AS sv_0, 1.2875681537786543 AS sv_1, 1.6252489317689223 AS sv_2, 1.6169297259031028 AS sv_3, -0.1469313144795046 AS sv_4, 1.2464132371893328 AS sv_5, -0.23263920518729295 AS sv_6, -0.8680741492030342 AS sv_7, -0.8003091386345385 AS sv_8, 0.33203439564828136 AS sv_9 FROM rdb$database UNION ALL SELECT 60 AS sv_idx, -1.0 AS dual_coeff, 1.6795343080177356 AS sv_0, -1.39723313863549 AS sv_1, 1.0197699745834574 AS sv_2, -1.5954060533622636 AS sv_3, -0.1636863825340123 AS sv_4, -0.24774062723045506 AS sv_5, -0.5962064431258097 AS sv_6, 0.36092010373756683 AS sv_7, 0.4122918691027763 AS sv_8, 0.9571766135004102 AS sv_9 FROM rdb$database UNION ALL SELECT 61 AS sv_idx, -1.0 AS dual_coeff, -1.51953444089451 AS sv_0, -0.3070042807820569 AS sv_1, -0.368572999888358 AS sv_2, -1.2050215737931027 AS sv_3, 0.15154975975969193 AS sv_4, -0.2701482710136357 AS sv_5, 0.8944211147151363 AS sv_6, -0.996783346776804 AS sv_7, 0.28793921258876987 AS sv_8, 0.19989552566702276 AS sv_9 FROM rdb$database UNION ALL SELECT 62 AS sv_idx, -1.0 AS dual_coeff, 0.7025339877387758 AS sv_0, -1.074811797319427 AS sv_1, -0.4885699676600532 AS sv_2, -1.791245502263879 AS sv_3, -0.9225113354730305 AS sv_4, -0.38411501122298897 AS sv_5, -0.3128591641201036 AS sv_6, 0.40324892559214887 AS sv_7, -0.8919341935837187 AS sv_8, 0.9900175691064856 AS sv_9 FROM rdb$database UNION ALL SELECT 63 AS sv_idx, 1.0 AS dual_coeff, 0.9294623603396408 AS sv_0, 0.8136981694330618 AS sv_1, -1.0571102480167467 AS sv_2, -1.536413685084081 AS sv_3, -0.05734569641996998 AS sv_4, 0.12073184730806807 AS sv_5, -0.7851665744590541 AS sv_6, 1.6137963675049345 AS sv_7, 0.8995862516579378 AS sv_8, -0.4781918662928217 AS sv_9 FROM rdb$database UNION ALL SELECT 64 AS sv_idx, -1.0 AS dual_coeff, 1.4590520955181685 AS sv_0, 0.3480479502359835 AS sv_1, 0.3688903654836848 AS sv_2, 0.6911268039175396 AS sv_3, -1.184812671564044 AS sv_4, -1.6775540009707788 AS sv_5, -1.5612540776241217 AS sv_6, 1.3115503335100762 AS sv_7, -0.32159041437825253 AS sv_8, 1.330652181964055 AS sv_9 FROM rdb$database UNION ALL SELECT 65 AS sv_idx, 1.0 AS dual_coeff, -1.4610811280778395 AS sv_0, -1.5280374640435685 AS sv_1, -1.199827540011425 AS sv_2, 0.11457863006974155 AS sv_3, 0.4918196475968878 AS sv_4, 0.5472994163652583 AS sv_5, -1.3830757781622447 AS sv_6, 1.6218534585875 AS sv_7, 0.7742761714408769 AS sv_8, -0.1316319690104646 AS sv_9 FROM rdb$database UNION ALL SELECT 66 AS sv_idx, 1.0 AS dual_coeff, -0.3472513929390381 AS sv_0, 1.1807769484135675 AS sv_1, 1.2105862486359216 AS sv_2, -0.20665691187495616 AS sv_3, -0.9296658496260938 AS sv_4, 0.21625223701756288 AS sv_5, 1.0111656544836791 AS sv_6, 0.3450566518069161 AS sv_7, -0.5924174775210433 AS sv_8, 1.0878451254822517 AS sv_9 FROM rdb$database UNION ALL SELECT 67 AS sv_idx, 1.0 AS dual_coeff, -0.4940389826845691 AS sv_0, -0.2312997357097172 AS sv_1, 1.16778681618397 AS sv_2, -1.6585318804858566 AS sv_3, -0.42233983268151504 AS sv_4, -1.8787674137403612 AS sv_5, 1.6115784556471984 AS sv_6, -0.3863032782377467 AS sv_7, -0.040838955712968875 AS sv_8, 1.496132064080464 AS sv_9 FROM rdb$database UNION ALL SELECT 68 AS sv_idx, 1.0 AS dual_coeff, 0.7258303968184058 AS sv_0, 0.08470505783743251 AS sv_1, 0.6670212282385748 AS sv_2, 1.3214398297438397 AS sv_3, -0.3462356316989889 AS sv_4, 1.2292498938493048 AS sv_5, 0.058188462220379523 AS sv_6, 1.3058820484020848 AS sv_7, 0.17715020676305146 AS sv_8, 0.01939534842004025 AS sv_9 FROM rdb$database UNION ALL SELECT 69 AS sv_idx, 1.0 AS dual_coeff, 0.3866672247664853 AS sv_0, -0.5892495824092788 AS sv_1, 1.605444962141984 AS sv_2, 0.5486552966566701 AS sv_3, -1.4297164981998967 AS sv_4, -0.18332306280364968 AS sv_5, 0.5766932552421344 AS sv_6, -1.4689652582393948 AS sv_7, -1.1731849807482455 AS sv_8, 1.1869692986004765 AS sv_9 FROM rdb$database) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE PRECISION)) + 0.0164329322197533 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * (kernel_input_with_scaling."Feature_0" * "SV_data".sv_0 + kernel_input_with_scaling."Feature_1" * "SV_data".sv_1 + kernel_input_with_scaling."Feature_2" * "SV_data".sv_2 + kernel_input_with_scaling."Feature_3" * "SV_data".sv_3 + kernel_input_with_scaling."Feature_4" * "SV_data".sv_4 + kernel_input_with_scaling."Feature_5" * "SV_data".sv_5 + kernel_input_with_scaling."Feature_6" * "SV_data".sv_6 + kernel_input_with_scaling."Feature_7" * "SV_data".sv_7 + kernel_input_with_scaling."Feature_8" * "SV_data".sv_8 + kernel_input_with_scaling."Feature_9" * "SV_data".sv_9) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", 15.3537633818605 + 5.0131713754064915 * kernel_dp.dot_product AS "Estimator" 
FROM kernel_dp