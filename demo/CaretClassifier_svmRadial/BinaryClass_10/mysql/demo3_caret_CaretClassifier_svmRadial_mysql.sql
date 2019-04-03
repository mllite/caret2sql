-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmRadial
-- Dataset : BinaryClass_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 0.06182920523813451) / 1.236134089597546 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - 0.17702463767183327) / 0.9467574985190108 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.041383850049034464) / 1.0809597326983538 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 0.13060646805847148) / 1.0860335106241017 AS `Feature_3`, (CAST(`ADS`.`Feature_4` AS DOUBLE) - -0.05955810471983085) / 1.1165897507633815 AS `Feature_4`, (CAST(`ADS`.`Feature_5` AS DOUBLE) - -0.048929089870105816) / 1.3868824547243672 AS `Feature_5`, (CAST(`ADS`.`Feature_6` AS DOUBLE) - 0.19101797861713127) / 0.979670721363872 AS `Feature_6`, (CAST(`ADS`.`Feature_7` AS DOUBLE) - 0.02204959673267471) / 0.4775973825125086 AS `Feature_7`, (CAST(`ADS`.`Feature_8` AS DOUBLE) - -0.05772981403414008) / 1.0713243581907332 AS `Feature_8`, (CAST(`ADS`.`Feature_9` AS DOUBLE) - -0.052549592052032364) / 1.2322587258530384 AS `Feature_9` 
FROM `BinaryClass_10` AS `ADS`), 
`SV_data` AS 
(SELECT `Values`.sv_idx AS sv_idx, `Values`.dual_coeff AS dual_coeff, `Values`.sv_0 AS sv_0, `Values`.sv_1 AS sv_1, `Values`.sv_2 AS sv_2, `Values`.sv_3 AS sv_3, `Values`.sv_4 AS sv_4, `Values`.sv_5 AS sv_5, `Values`.sv_6 AS sv_6, `Values`.sv_7 AS sv_7, `Values`.sv_8 AS sv_8, `Values`.sv_9 AS sv_9 
FROM (SELECT 0 AS sv_idx, 0.5508117978112931 AS dual_coeff, -0.9789086075076514 AS sv_0, 0.15252599961299965 AS sv_1, -0.10412504739495128 AS sv_2, -0.8298797163201294 AS sv_3, -0.13896364449966714 AS sv_4, 0.7110427215194252 AS sv_5, -0.18661640977183006 AS sv_6, -0.9004999493496066 AS sv_7, 0.20186701179603014 AS sv_8, 0.829301824499033 AS sv_9 UNION ALL SELECT 1 AS sv_idx, -0.7161446713677124 AS dual_coeff, 1.0719731412530988 AS sv_0, 1.1886114992540306 AS sv_1, -0.15739168609465715 AS sv_2, -0.29955951481423027 AS sv_3, -0.08244264610371395 AS sv_4, -1.1632416612153944 AS sv_5, 0.06927040056587755 AS sv_6, 0.9290819511507716 AS sv_7, 0.6919797344959592 AS sv_8, -0.8090080695413454 AS sv_9 UNION ALL SELECT 2 AS sv_idx, 0.969321107615214 AS dual_coeff, -1.8520281749542775 AS sv_0, 0.8910569422044758 AS sv_1, -0.8164844838131115 AS sv_2, 0.9343783023222736 AS sv_3, 0.900987076498768 AS sv_4, -0.13511551324742735 AS sv_5, 0.26642870153268783 AS sv_6, -1.923190972686 AS sv_7, -0.4592677687064413 AS sv_8, 1.95056234764916 AS sv_9 UNION ALL SELECT 3 AS sv_idx, 1.0 AS dual_coeff, 0.4767818683255514 AS sv_0, -0.28136563198507386 AS sv_1, 1.8087790521738945 AS sv_2, 0.4449539533195914 AS sv_3, -0.16902725173840266 AS sv_4, -1.4791780781476596 AS sv_5, -0.7302410329129739 AS sv_6, 0.2706127321879131 AS sv_7, -0.5143238548060276 AS sv_8, -0.11190694923804112 AS sv_9 UNION ALL SELECT 4 AS sv_idx, 1.0 AS dual_coeff, 0.08731081953801947 AS sv_0, 0.4199233175588533 AS sv_1, 0.08679506491664504 AS sv_2, 1.0174400930801393 AS sv_3, -0.6549833482800742 AS sv_4, -0.685165635637578 AS sv_5, 0.11599876482082065 AS sv_6, -0.011874677152135459 AS sv_7, -1.848525091555032 AS sv_8, 0.08629526864015696 AS sv_9 UNION ALL SELECT 5 AS sv_idx, 0.993912049940292 AS dual_coeff, 0.6499395316012174 AS sv_0, -1.506720424067879 AS sv_1, 1.7845923767119436 AS sv_2, -0.09886845177631504 AS sv_3, -0.6213985646247768 AS sv_4, -0.8340575865045254 AS sv_5, 2.008045248044393 AS sv_6, 0.5442086455727778 AS sv_7, 0.942421558835432 AS sv_8, -0.457308264456212 AS sv_9 UNION ALL SELECT 6 AS sv_idx, 0.993128559873939 AS dual_coeff, 0.03247492302713887 AS sv_0, 1.047286707612166 AS sv_1, 1.0391283253022847 AS sv_2, -1.3383605111337342 AS sv_3, -0.6795344453699088 AS sv_4, -1.1278249500885464 AS sv_5, -0.8399858584070454 AS sv_6, -0.13386158693372827 AS sv_7, -1.5700426095706588 AS sv_8, 0.25711802388268823 AS sv_9 UNION ALL SELECT 7 AS sv_idx, 0.988716998779224 AS dual_coeff, -1.7358997467122637 AS sv_0, -0.8252586264151421 AS sv_1, 1.0804635472270645 AS sv_2, -1.734500890885477 AS sv_3, -0.6221841674685673 AS sv_4, -0.14066469376680832 AS sv_5, 0.331328285018261 AS sv_6, -1.8046794760208436 AS sv_7, 0.4586112234969305 AS sv_8, 1.831869667788819 AS sv_9 UNION ALL SELECT 8 AS sv_idx, -0.9428999834046626 AS dual_coeff, 1.1133869723141923 AS sv_0, 0.5138746169600092 AS sv_1, 1.5342898307024992 AS sv_2, 0.7606893168796812 AS sv_3, -1.51538847416013 AS sv_4, -0.5725812599340797 AS sv_5, 0.3168592107899858 AS sv_6, 1.0592217484485507 AS sv_7, -1.0522638102484991 AS sv_8, -1.004096068856431 AS sv_9 UNION ALL SELECT 9 AS sv_idx, 0.9955175225012288 AS dual_coeff, 0.14083620190832646 AS sv_0, -0.17050728659476827 AS sv_1, -0.17476119918004282 AS sv_2, -1.3116930533698625 AS sv_3, -1.8522798067714217 AS sv_4, 2.1631555501499937 AS sv_5, -2.301092696036681 AS sv_6, 0.4654752574193307 AS sv_7, -1.48934370977668 AS sv_8, -0.7032592838031525 AS sv_9 UNION ALL SELECT 10 AS sv_idx, -0.735604286909139 AS dual_coeff, 1.2402824202062483 AS sv_0, 0.5853286612238678 AS sv_1, 0.07673943594265224 AS sv_2, 0.2508037389185669 AS sv_3, 0.2687972267516133 AS sv_4, -0.7786508204484434 AS sv_5, 0.519592345736705 AS sv_6, 1.1590644943838202 AS sv_7, 0.4514501315819648 AS sv_8, -1.08223966980515 AS sv_9 UNION ALL SELECT 11 AS sv_idx, -0.9953466435839966 AS dual_coeff, 1.6650626530715869 AS sv_0, -1.5766827074506495 AS sv_1, 0.5565243718857906 AS sv_2, 0.4884517606942003 AS sv_3, 0.3810898411966673 AS sv_4, -1.802779371470432 AS sv_5, -0.13241280888701454 AS sv_6, 1.443714407925888 AS sv_7, 1.7622796749286411 AS sv_8, -1.2576505372849975 AS sv_9 UNION ALL SELECT 12 AS sv_idx, -1.0 AS dual_coeff, 0.3390716331602923 AS sv_0, 1.8495748250780832 AS sv_1, 0.4600537982105392 AS sv_2, 0.7202543181900448 AS sv_3, 1.9303542345114997 AS sv_4, -0.16002169001695207 AS sv_5, -0.99700583736059 AS sv_6, 0.3247043113431265 AS sv_7, 1.3653876633263504 AS sv_8, -0.30948765635421005 AS sv_9 UNION ALL SELECT 13 AS sv_idx, 0.98487446614143 AS dual_coeff, 0.4316632164451289 AS sv_0, 0.9432865010471296 AS sv_1, 1.4751609859952413 AS sv_2, 1.556256383029816 AS sv_3, 1.0010203990914768 AS sv_4, -1.0441170028461593 AS sv_5, -0.3593685870288738 AS sv_6, 0.2887590395694796 AS sv_7, -0.84927467797952 AS sv_8, -0.17737835735188892 AS sv_9 UNION ALL SELECT 14 AS sv_idx, 0.9908831053219692 AS dual_coeff, -2.2691497528005993 AS sv_0, -1.0457196379235802 AS sv_1, -0.8442698672983282 AS sv_2, -1.04045767662178 AS sv_3, 0.6349261856337909 AS sv_4, -0.07043917866057522 AS sv_5, -0.5255415135068954 AS sv_6, -2.3422376496475774 AS sv_7, -0.3488935952609054 AS sv_8, 2.3653611089618134 AS sv_9 UNION ALL SELECT 15 AS sv_idx, 0.9551746031140834 AS dual_coeff, 0.6221885599110655 AS sv_0, 0.18208594849454285 AS sv_1, -0.4810904853567675 AS sv_2, 0.8906503536555366 AS sv_3, 0.405159495681492 AS sv_4, -1.4484025904128284 AS sv_5, 0.3789677119541289 AS sv_6, 0.4245969561363369 AS sv_7, 1.1135607471616895 AS sv_8, -0.270248120878393 AS sv_9 UNION ALL SELECT 16 AS sv_idx, -0.9731014230234948 AS dual_coeff, -0.22486873581581127 AS sv_0, -0.747124622008959 AS sv_1, -0.5343402174111191 AS sv_2, -0.8661290484799834 AS sv_3, -0.8078241668385704 AS sv_4, 1.1550372867564416 AS sv_5, -0.6640411432231608 AS sv_6, -0.05980851644639337 AS sv_7, -1.6384879600188207 AS sv_8, -0.06512049285154635 AS sv_9 UNION ALL SELECT 17 AS sv_idx, -0.950983960634162 AS dual_coeff, 1.6604381804917951 AS sv_0, -0.6821963137259358 AS sv_1, 0.16169520485134758 AS sv_2, -0.17582710111469463 AS sv_3, 0.7085719937099278 AS sv_4, -1.7360860790027677 AS sv_5, 0.9678721066213984 AS sv_6, 1.4488515007742588 AS sv_7, 0.2531905223118302 AS sv_8, -1.2700579644213548 AS sv_9 UNION ALL SELECT 18 AS sv_idx, -0.8131703546396593 AS dual_coeff, 0.5437636969550028 AS sv_0, 1.1725515049139292 AS sv_1, 0.13525603577238227 AS sv_2, 0.15287416932472261 AS sv_3, -0.5333342594554455 AS sv_4, -0.3733667497505653 AS sv_5, 0.7589891487410354 AS sv_6, 0.5034125581080473 AS sv_7, 0.22128542987670494 AS sv_8, -0.4662285978408736 AS sv_9 UNION ALL SELECT 19 AS sv_idx, -0.9961292272588522 AS dual_coeff, -0.09219307051230703 AS sv_0, -0.03383840306373853 AS sv_1, 0.4557758820420369 AS sv_2, 1.1984793822247075 AS sv_3, 0.7145275034771345 AS sv_4, 1.069357624606272 AS sv_5, -0.16068247962651222 AS sv_6, 0.06382534115002213 AS sv_7, -0.7681712621935882 AS sv_8, -0.18027504043848688 AS sv_9 UNION ALL SELECT 20 AS sv_idx, 1.0 AS dual_coeff, -0.5804832306627995 AS sv_0, -0.39562408389751746 AS sv_1, -0.3963090122082156 AS sv_2, -0.007554630167357402 AS sv_3, 0.8224036722817619 AS sv_4, 1.2488290063983079 AS sv_5, -0.3667354334678337 AS sv_6, -0.4113329093675934 AS sv_7, -1.3370459277006963 AS sv_8, 0.2785506180157216 AS sv_9 UNION ALL SELECT 21 AS sv_idx, 0.8247543765012444 AS dual_coeff, -1.3441361139156147 AS sv_0, 0.5861829227208665 AS sv_1, 0.706763647208877 AS sv_2, -0.24168747697701246 AS sv_3, -0.8225046970054326 AS sv_4, 0.09962417376079823 AS sv_5, -0.6910551228601497 AS sv_6, -1.3664707787618104 AS sv_7, 0.26987215158040967 AS sv_8, 1.3646927851835764 AS sv_9 UNION ALL SELECT 22 AS sv_idx, 0.9093183890151806 AS dual_coeff, -0.8073840363957818 AS sv_0, -0.30688652426677715 AS sv_1, 0.94416164172329 AS sv_2, 0.08616722240970885 AS sv_3, 0.4756249870095519 AS sv_4, 0.6385821218711153 AS sv_5, -0.7827600058286099 AS sv_6, -0.7349845919862718 AS sv_7, 0.08979218933977293 AS sv_8, 0.6705546683085666 AS sv_9 UNION ALL SELECT 23 AS sv_idx, 0.9758597611061984 AS dual_coeff, -0.10759627726857526 AS sv_0, -1.2035048608261008 AS sv_1, 0.9972537700980548 AS sv_2, 0.5134827890691511 AS sv_3, 1.164611073552145 AS sv_4, -1.034192901207155 AS sv_5, -1.5078593462982837 AS sv_6, -0.2639159703111233 AS sv_7, -0.05821681009343978 AS sv_8, 0.3778726797236848 AS sv_9 UNION ALL SELECT 24 AS sv_idx, 0.980222778722174 AS dual_coeff, -0.09891964243446902 AS sv_0, -0.30449347031299984 AS sv_1, -0.01883596854382725 AS sv_2, 0.505907480233906 AS sv_3, 1.8210050106690003 AS sv_4, -1.0542400095056774 AS sv_5, 0.14787735242067032 AS sv_6, -0.25797237417608665 AS sv_7, 0.19396934304780647 AS sv_8, 0.37406495947864465 AS sv_9 UNION ALL SELECT 25 AS sv_idx, 0.9932525914294148 AS dual_coeff, -1.640728373807161 AS sv_0, -1.0567317589861207 AS sv_1, 0.13643895138804696 AS sv_2, 1.1499014284537104 AS sv_3, -2.2704324061441 AS sv_4, 0.35312889673237596 AS sv_5, 1.0844154895343023 AS sv_6, -1.6336614178045423 AS sv_7, -0.9891542140995307 AS sv_8, 1.6061435096142618 AS sv_9 UNION ALL SELECT 26 AS sv_idx, 0.9911006284220444 AS dual_coeff, -0.6741740084493218 AS sv_0, 1.3646656522236915 AS sv_1, -1.906140160140472 AS sv_2, -0.5931437739198017 AS sv_3, 1.0353787114989919 AS sv_4, 1.191745649244083 AS sv_5, -0.8156318134701581 AS sv_6, -0.5160744362918246 AS sv_7, -0.24535321458751425 AS sv_8, 0.39017809766384187 AS sv_9 UNION ALL SELECT 27 AS sv_idx, 0.9734173738973536 AS dual_coeff, -0.6587850557714721 AS sv_0, 1.2733227255492003 AS sv_1, -0.8227481344684896 AS sv_2, -0.305210206650154 AS sv_3, -0.6634569232975569 AS sv_4, 1.0804098987454418 AS sv_5, -0.5310991352079625 AS sv_6, -0.5167694294933857 AS sv_7, 0.8631286880823567 AS sv_8, 0.4029578791240681 AS sv_9 UNION ALL SELECT 28 AS sv_idx, 0.9818905072148651 AS dual_coeff, -0.9730298579824046 AS sv_0, -0.5528118537256436 AS sv_1, 0.6444302265607575 AS sv_2, -0.38729055443904026 AS sv_3, -1.548445133971511 AS sv_4, 1.3091520605668152 AS sv_5, -0.44888306295951064 AS sv_6, -0.8057717091317707 AS sv_7, 1.3065328895941806 AS sv_8, 0.6690512016756802 AS sv_9 UNION ALL SELECT 29 AS sv_idx, -0.94868065075743 AS dual_coeff, 0.08020016657299005 AS sv_0, 0.1505015978993766 AS sv_1, 1.277098083690131 AS sv_2, 0.8835114967570349 AS sv_3, 0.2441777680306949 AS sv_4, 1.2161656377224639 AS sv_5, -1.1337905809449507 AS sv_6, 0.2627463288807569 AS sv_7, 0.5846592700183276 AS sv_8, -0.3964397842248741 AS sv_9 UNION ALL SELECT 30 AS sv_idx, -0.9705167344066588 AS dual_coeff, 1.0925822804072598 AS sv_0, 0.19552766924013928 AS sv_1, 0.4678215084766359 AS sv_2, 0.3422724595730984 AS sv_3, 0.9672812210493053 AS sv_4, 1.052821010512257 AS sv_5, -1.4952841354203252 AS sv_6, 1.2788561281158193 AS sv_7, -0.33751769202131765 AS sv_8, -1.4015421143874784 AS sv_9 UNION ALL SELECT 31 AS sv_idx, 0.747650816065744 AS dual_coeff, -0.8960449006810026 AS sv_0, -0.06767861728773622 AS sv_1, 0.3955153071673583 AS sv_2, -0.8205013141283433 AS sv_3, 0.17494187825177776 AS sv_4, 1.0993645721313074 AS sv_5, 0.3379235938543237 AS sv_6, -0.7577685980946971 AS sv_7, -0.394323434099768 AS sv_8, 0.643493265350324 AS sv_9 UNION ALL SELECT 32 AS sv_idx, -0.9999481350790396 AS dual_coeff, -0.6647834094376374 AS sv_0, 0.3969131818824111 AS sv_1, -0.2555668615993008 AS sv_2, -1.2897839952702206 AS sv_3, 1.3576478261985563 AS sv_4, 1.148216139427111 AS sv_5, 2.6741150801024878 AS sv_6, -0.5128791186300218 AS sv_7, 0.630037118647296 AS sv_8, 0.3916847168371329 AS sv_9 UNION ALL SELECT 33 AS sv_idx, 0.979186496580879 AS dual_coeff, -0.9345293723890356 AS sv_0, 0.8139078655891595 AS sv_1, -0.872472581952349 AS sv_2, 0.9520965407256556 AS sv_3, -0.3402356104018998 AS sv_4, 0.7158995537911227 AS sv_5, 0.4480011926160543 AS sv_6, -0.8541753925232733 AS sv_7, -1.218484711415826 AS sv_8, 0.7821441151205006 AS sv_9 UNION ALL SELECT 34 AS sv_idx, -0.8574140681020734 AS dual_coeff, 1.2278340552679778 AS sv_0, 1.4854892001527353 AS sv_1, -0.26787616090286 AS sv_2, 0.6270988042259832 AS sv_3, 0.18063306811982147 AS sv_4, -0.1220476246734819 AS sv_5, 1.0178194183248555 AS sv_6, 1.2436330977956065 AS sv_7, -0.18926924549325486 AS sv_8, -1.23861023049531 AS sv_9 UNION ALL SELECT 35 AS sv_idx, 0.9881678322913062 AS dual_coeff, 0.8166965027571061 AS sv_0, -0.856837819570681 AS sv_1, -0.8346208486211699 AS sv_2, 1.508846145001042 AS sv_3, -0.08284783125819263 AS sv_4, -1.2743169957083567 AS sv_5, 1.8625996360263628 AS sv_6, 0.6502878578362915 AS sv_7, -0.0979226946412716 AS sv_8, -0.5163193927874381 AS sv_9 UNION ALL SELECT 36 AS sv_idx, 0.994836786537008 AS dual_coeff, -0.0402579003378627 AS sv_0, 0.28240036238327587 AS sv_1, -1.3979939985038197 AS sv_2, 0.29567763320855905 AS sv_3, -1.5021951825115891 AS sv_4, -1.0180651995815984 AS sv_5, -0.5395902153033929 AS sv_6, -0.19232721470954892 AS sv_7, 1.426455850368092 AS sv_8, 0.3040608757006605 AS sv_9 UNION ALL SELECT 37 AS sv_idx, -0.8568667785527216 AS dual_coeff, 0.5854796706416528 AS sv_0, 0.9467243711695577 AS sv_1, 0.08062093545781357 AS sv_2, -0.6416465388511702 AS sv_3, -1.273839257565051 AS sv_4, -0.5694030134631977 AS sv_5, 0.07658207122439202 AS sv_6, 0.5172120543419477 AS sv_7, 1.2408273951392916 AS sv_8, -0.4588488968355255 AS sv_9 UNION ALL SELECT 38 AS sv_idx, -0.9762693918925588 AS dual_coeff, 0.7784951411325082 AS sv_0, -1.2955240145471107 AS sv_1, -0.28669367363515763 AS sv_2, 1.465882579742903 AS sv_3, 0.8934094142753678 AS sv_4, 0.12914852341724695 AS sv_5, -0.27697430459404665 AS sv_6, 0.8191366938869794 AS sv_7, -1.8504050374483836 AS sv_8, -0.8385635683477661 AS sv_9 UNION ALL SELECT 39 AS sv_idx, -1.0 AS dual_coeff, 0.6344607400588634 AS sv_0, 0.5219605676861228 AS sv_1, 0.5568897193137823 AS sv_2, 0.2579143348274752 AS sv_3, -0.09328581761317237 AS sv_4, 0.3778743026837201 AS sv_5, 0.5562292068303814 AS sv_6, 0.7080068804275642 AS sv_7, -2.1534352041325775 AS sv_8, -0.7536866014343861 AS sv_9 UNION ALL SELECT 40 AS sv_idx, -0.9903527876687556 AS dual_coeff, 0.8724200570194672 AS sv_0, 0.5272266339939217 AS sv_1, -1.401079622483255 AS sv_2, 0.5541152573071053 AS sv_3, 1.3935420392658495 AS sv_4, -1.0234665862047136 AS sv_5, 0.9523691295891799 AS sv_6, 0.744745651531851 AS sv_7, -0.18356194808830936 AS sv_8, -0.6386193584599393 AS sv_9 UNION ALL SELECT 41 AS sv_idx, -0.95658749819873 AS dual_coeff, 0.5510564765507573 AS sv_0, -0.4397336283863665 AS sv_1, -0.9209732070268521 AS sv_2, 1.1053807270278273 AS sv_3, 0.6421893033944561 AS sv_4, 0.1862566062713102 AS sv_5, -0.544274868062212 AS sv_6, 0.593887192412277 AS sv_7, -0.41395632599615995 AS sv_8, -0.6180216801636585 AS sv_9 UNION ALL SELECT 42 AS sv_idx, -1.0 AS dual_coeff, 0.3846891437751013 AS sv_0, -0.2365274338597743 AS sv_1, 0.2351377768853404 AS sv_2, -2.786052368959439 AS sv_3, 1.1836730271232743 AS sv_4, -0.5213144343955008 AS sv_5, -1.209342049277925 AS sv_6, 0.3180089465843848 AS sv_7, -0.2348436242987612 AS sv_8, -0.2635469140867004 AS sv_9 UNION ALL SELECT 43 AS sv_idx, -0.9937583946693844 AS dual_coeff, 1.0112936591576875 AS sv_0, -1.3549564944666233 AS sv_1, -0.5914718313741482 AS sv_2, -0.5831072000130609 AS sv_3, -0.25128229927553514 AS sv_4, 0.26471527301928316 AS sv_5, -0.5841969804613494 AS sv_6, 1.0784636934865377 AS sv_7, 0.7455198586342726 AS sv_8, -1.1143138638133698 AS sv_9 UNION ALL SELECT 44 AS sv_idx, -1.0 AS dual_coeff, 0.756869285918571 AS sv_0, 1.258789574806844 AS sv_1, 1.350773227203448 AS sv_2, -1.9694866659979935 AS sv_3, -0.20286962878653206 AS sv_4, 0.7222829574316827 AS sv_5, 0.8046058646300936 AS sv_6, 0.884863349002005 AS sv_7, 0.7880361351637792 AS sv_8, -0.9690811357141482 AS sv_9 UNION ALL SELECT 45 AS sv_idx, 0.8918152471719825 AS dual_coeff, -0.8884316786590069 AS sv_0, 0.6088454147923283 AS sv_1, 0.13766534702631306 AS sv_2, -0.8018881668724402 AS sv_3, 0.6605380682131401 AS sv_4, -0.8163822540549722 AS sv_5, 0.4376131802918367 AS sv_6, -1.034010688148867 AS sv_7, 0.2677902182894805 AS sv_8, 1.129424238436701 AS sv_9 UNION ALL SELECT 46 AS sv_idx, -1.0 AS dual_coeff, 1.1397479765968883 AS sv_0, 0.4796148030964088 AS sv_1, -2.6297692669350003 AS sv_2, 0.967494758252302 AS sv_3, 0.4003646020672368 AS sv_4, 0.0028303241470059607 AS sv_5, -0.44043435773706735 AS sv_6, 1.1716320804139333 AS sv_7, -1.6558567360796592 AS sv_8, -1.179682889728438 AS sv_9 UNION ALL SELECT 47 AS sv_idx, 0.9891861591374042 AS dual_coeff, -0.820626840393269 AS sv_0, -0.5139375199917596 AS sv_1, -0.7347150193820885 AS sv_2, 0.9176334626914524 AS sv_3, 0.9404589891941124 AS sv_4, -0.4702336680600465 AS sv_5, -2.1425521212594 AS sv_6, -0.913007347442184 AS sv_7, 0.0069194547004425315 AS sv_8, 0.970063197527468 AS sv_9 UNION ALL SELECT 48 AS sv_idx, -0.9508354159713452 AS dual_coeff, 0.27960861386112984 AS sv_0, 1.264238596760879 AS sv_1, -0.34087310709709 AS sv_2, -0.5767049209229327 AS sv_3, 0.521316595461216 AS sv_4, 1.3559438178247885 AS sv_5, -0.8534621035323254 AS sv_6, 0.4883859432672015 AS sv_7, 0.3141378889994094 AS sv_8, -0.6387369934302088 AS sv_9 UNION ALL SELECT 49 AS sv_idx, -1.0 AS dual_coeff, 1.1889154088716587 AS sv_0, -1.3722304255158289 AS sv_1, -1.0324508753759585 AS sv_2, -1.7211923206928126 AS sv_3, 2.730774171694979 AS sv_4, -0.7061799882522317 AS sv_5, -0.6338707837654344 AS sv_6, 1.117025340897981 AS sv_7, -0.43526263546840094 AS sv_8, -1.047785923709626 AS sv_9 UNION ALL SELECT 50 AS sv_idx, 0.9847705151991938 AS dual_coeff, -0.43824883917905855 AS sv_0, -1.0915512782355736 AS sv_1, 0.5195844874702117 AS sv_2, 0.7370875011952652 AS sv_3, -0.8345353363906336 AS sv_4, -0.7072109789390935 AS sv_5, 0.0467039072122988 AS sv_6, -0.5552120529132509 AS sv_7, 1.6135700550167213 AS sv_8, 0.6356157171399341 AS sv_9 UNION ALL SELECT 51 AS sv_idx, 0.993810679291665 AS dual_coeff, -0.14055392156453275 AS sv_0, -3.307009155707085 AS sv_1, -0.5053088265507224 AS sv_2, -0.23723664654797286 AS sv_3, 1.529687672782185 AS sv_4, -1.4022076887762727 AS sv_5, -0.7271252300575837 AS sv_6, -0.3523524125978137 AS sv_7, -1.7653312868419129 AS sv_8, 0.5068241116651305 AS sv_9 UNION ALL SELECT 52 AS sv_idx, 1.0 AS dual_coeff, 0.6894274057055135 AS sv_0, 0.4514552890095735 AS sv_1, 0.2093204069248752 AS sv_2, 1.0368484617551743 AS sv_3, 0.03717007641055501 AS sv_4, -1.030430272112848 AS sv_5, 0.42755899213875986 AS sv_6, 0.5556686478624994 AS sv_7, -0.10328987231898806 AS sv_8, -0.4475371044214476 AS sv_9 UNION ALL SELECT 53 AS sv_idx, 0.9989980204912786 AS dual_coeff, -0.6440716426524146 AS sv_0, -1.6937945609945309 AS sv_1, -0.7604782422693294 AS sv_2, 1.2277185724937787 AS sv_3, 0.15273447561018624 AS sv_4, 1.0754549630378707 AS sv_5, 0.8801545491936706 AS sv_6, -0.5023845449922668 AS sv_7, 1.0057121033769099 AS sv_8, 0.3890155424170703 AS sv_9 UNION ALL SELECT 54 AS sv_idx, 0.8650988701613814 AS dual_coeff, -1.5273908614815168 AS sv_0, 0.5920548170418891 AS sv_1, -0.5545773121252258 AS sv_2, -0.7715713310159885 AS sv_3, -0.4189052719263103 AS sv_4, 0.3648445675336658 AS sv_5, -0.4129469687251176 AS sv_6, -1.5154578653512556 AS sv_7, -1.0056838167040976 AS sv_8, 1.4858875316741011 AS sv_9 UNION ALL SELECT 55 AS sv_idx, -0.9488560702160926 AS dual_coeff, 0.609007821301338 AS sv_0, 0.4921879175895734 AS sv_1, 0.6711257633210173 AS sv_2, -1.4197715909345507 AS sv_3, -1.084955026111522 AS sv_4, 0.2424604585100448 AS sv_5, -0.870129119218945 AS sv_6, 0.6617722341678564 AS sv_7, 0.9869044066354536 AS sv_8, -0.6924536492928886 AS sv_9 UNION ALL SELECT 56 AS sv_idx, -1.0 AS dual_coeff, 0.4191755661898865 AS sv_0, -0.4362848376718623 AS sv_1, 0.36418742871327614 AS sv_2, 1.1130259015135746 AS sv_3, -1.6358625035920635 AS sv_4, 0.0499132664130655 AS sv_5, -0.8372968035882955 AS sv_6, 0.43814862780670494 AS sv_7, -1.3003945708887839 AS sv_8, -0.44646020877036335 AS sv_9 UNION ALL SELECT 57 AS sv_idx, 0.993820728280946 AS dual_coeff, 0.2794373691093419 AS sv_0, 1.9748184218306333 AS sv_1, -3.730640694613173 AS sv_2, 0.651614605956266 AS sv_3, 0.5376239706138513 AS sv_4, 1.887838518503456 AS sv_5, 2.2897668532896183 AS sv_6, 0.567078913830321 AS sv_7, 0.3516434659057892 AS sv_8, -0.7756619176900128 AS sv_9 UNION ALL SELECT 58 AS sv_idx, -1.0 AS dual_coeff, -0.05965227040296731 AS sv_0, -1.1278824561246392 AS sv_1, -0.5067205861155859 AS sv_2, -0.3438480794724477 AS sv_3, 0.1819222668680084 AS sv_4, 1.0766603006052455 AS sv_5, 0.4653057588055848 AS sv_6, 0.09834731334434337 AS sv_7, -1.2093505684195625 AS sv_8, -0.21581753779977167 AS sv_9 UNION ALL SELECT 59 AS sv_idx, 0.9928612878427122 AS dual_coeff, -0.8462488544969619 AS sv_0, 1.8598059021857047 AS sv_1, 1.7203052900293963 AS sv_2, 0.8213283141724823 AS sv_3, 0.9648042183018316 AS sv_4, 0.34382672764636 AS sv_5, -1.5870192743139786 AS sv_6, -0.818628437053331 AS sv_7, -0.6530030490785796 AS sv_8, 0.7867330080045859 AS sv_9 UNION ALL SELECT 60 AS sv_idx, -0.9411256231870224 AS dual_coeff, 0.3240403716133946 AS sv_0, 0.6764010854445784 AS sv_1, -0.43734388073111014 AS sv_2, -0.2926512670636697 AS sv_3, 0.940718127743086 AS sv_4, 0.2095176702360163 AS sv_5, 1.0626785634937808 AS sv_6, 0.3640531056765275 AS sv_7, -0.1402260432400554 AS sv_8, -0.3891924232644148 AS sv_9 UNION ALL SELECT 61 AS sv_idx, 0.6757296212478805 AS dual_coeff, -1.493688533883966 AS sv_0, 0.7818994295348014 AS sv_1, -0.052143335997599766 AS sv_2, -0.4323306835939843 AS sv_3, 0.452748280711666 AS sv_4, -0.09760633317154324 AS sv_5, -0.27248753269684045 AS sv_6, -1.549397004037312 AS sv_7, -0.08669421420781234 AS sv_8, 1.5702280127187471 AS sv_9 UNION ALL SELECT 62 AS sv_idx, -0.95441495455755 AS dual_coeff, 0.8567407564610297 AS sv_0, -0.3400373127239785 AS sv_1, -1.7961459525068124 AS sv_2, -2.483452589097957 AS sv_3, -0.4291684473729733 AS sv_4, -0.514974581583108 AS sv_5, 0.441189674132107 AS sv_6, 0.8040323094927 AS sv_7, -0.17848757638385487 AS sv_8, -0.7534704588279592 AS sv_9 UNION ALL SELECT 63 AS sv_idx, -1.0 AS dual_coeff, -0.7645658302552634 AS sv_0, 0.3422472361142004 AS sv_1, 0.1911042670120429 AS sv_2, 0.6801860167145513 AS sv_3, 1.8410573400703392 AS sv_4, 1.7516302168692475 AS sv_5, 2.474097517744636 AS sv_6, -0.5259423987639593 AS sv_7, -0.006825346235036049 AS sv_8, 0.33936246816863225 AS sv_9 UNION ALL SELECT 64 AS sv_idx, 0.9800989086648524 AS dual_coeff, -1.598811850472008 AS sv_0, 0.5389140198030888 AS sv_1, 0.7620078333102643 AS sv_2, 0.951462577653892 AS sv_3, -1.0637562750345815 AS sv_4, -0.13356966635583178 AS sv_5, -1.851278574895738 AS sv_6, -1.6627550207395836 AS sv_7, -0.8182343187617075 AS sv_8, 1.688237358399718 AS sv_9 UNION ALL SELECT 65 AS sv_idx, -1.0 AS dual_coeff, 0.5375286223309171 AS sv_0, -0.3316233054726869 AS sv_1, 1.696629945926522 AS sv_2, 1.2825840459604203 AS sv_3, -0.35942908021069986 AS sv_4, -0.6647233962692908 AS sv_5, -0.20701215675681173 AS sv_6, 0.4538032124898558 AS sv_7, -0.1379393345057123 AS sv_8, -0.38467847534567856 AS sv_9 UNION ALL SELECT 66 AS sv_idx, 0.9940002192952588 AS dual_coeff, -0.981511322713352 AS sv_0, 0.16368239748214616 AS sv_1, -0.40707232091879497 AS sv_2, -1.9672795492365152 AS sv_3, -1.0067655708198464 AS sv_4, -0.9310982149083262 AS sv_5, -1.0996391748313303 AS sv_6, -1.1466699288547044 AS sv_7, 2.920077641049384 AS sv_8, 1.2552750378483835 AS sv_9 UNION ALL SELECT 67 AS sv_idx, -0.9956027141148568 AS dual_coeff, 0.10090115670650003 AS sv_0, 0.554346723698571 AS sv_1, -0.197751203387923 AS sv_2, -1.065209679886695 AS sv_3, -1.2140227330434523 AS sv_4, 0.09673389409372697 AS sv_5, 2.1174637540416263 AS sv_6, 0.11803031054174727 AS sv_7, 0.03452695980479888 AS sv_8, -0.12930627127635813 AS sv_9 UNION ALL SELECT 68 AS sv_idx, -0.8563594023510185 AS dual_coeff, 0.5027354599595949 AS sv_0, 0.0892484298626883 AS sv_1, 0.3894657113560689 AS sv_2, -0.02159045357372714 AS sv_3, 0.25829801913814826 AS sv_4, 1.6014483663597658 AS sv_5, -0.3832162801447876 AS sv_6, 0.7540757635971618 AS sv_7, 0.3646331522181552 AS sv_8, -0.9328206773891496 AS sv_9 UNION ALL SELECT 69 AS sv_idx, 0.9820600394260788 AS dual_coeff, -0.882972487531501 AS sv_0, -1.219336807983632 AS sv_1, 1.5853496426285412 AS sv_2, 0.7197215150212883 AS sv_3, -0.02006938150829118 AS sv_4, 0.917317513202626 AS sv_5, 0.4545273917601003 AS sv_6, -0.771329101498273 AS sv_7, 1.7437596770039452 AS sv_8, 0.6768959353502201 AS sv_9 UNION ALL SELECT 70 AS sv_idx, -1.0 AS dual_coeff, -0.29854940524111245 AS sv_0, -0.27591262235697506 AS sv_1, -0.1591283541815007 AS sv_2, 0.3957093617338647 AS sv_3, -1.038885445178377 AS sv_4, 0.9853371169504632 AS sv_5, 1.2610319116699569 AS sv_6, -0.16068626198837024 AS sv_7, 1.1625050210441923 AS sv_8, 0.05483686149403229 AS sv_9 UNION ALL SELECT 71 AS sv_idx, -0.9495816501867642 AS dual_coeff, 1.1828246679827443 AS sv_0, 0.6981378314299006 AS sv_1, 1.4020279391874684 AS sv_2, 0.22150989384659106 AS sv_3, -1.6729442565022723 AS sv_4, 0.7787205376258522 AS sv_5, 0.17008146953755168 AS sv_6, 1.3309463798080479 AS sv_7, -0.3272397570667602 AS sv_8, -1.4242360922609711 AS sv_9 UNION ALL SELECT 72 AS sv_idx, -0.9573877775929608 AS dual_coeff, 1.163509113205292 AS sv_0, 0.5806697851803536 AS sv_1, 0.9226972940543215 AS sv_2, -0.8705187503570428 AS sv_3, 0.7731810615291885 AS sv_4, -1.3177554079530895 AS sv_5, 0.9106018845485772 AS sv_6, 1.0002337275739708 AS sv_7, -0.4527686485604048 AS sv_8, -0.8638650015809851 AS sv_9 UNION ALL SELECT 73 AS sv_idx, -0.9673757261867628 AS dual_coeff, 1.3330104867062402 AS sv_0, -2.004419008069948 AS sv_1, 0.4179504207851609 AS sv_2, 0.4329564613298016 AS sv_3, -0.024340118612492058 AS sv_4, -1.542589836095544 AS sv_5, 0.18127516015523207 AS sv_6, 1.1410761582546198 AS sv_7, -0.9682759523566362 AS sv_8, -0.9812432350972058 AS sv_9 UNION ALL SELECT 74 AS sv_idx, 0.9981903404108934 AS dual_coeff, 0.2223351200571684 AS sv_0, -0.7767745396114429 AS sv_1, -1.5514094382140453 AS sv_2, -0.5859919130917198 AS sv_3, -0.14614709090844266 AS sv_4, 2.1293025969237926 AS sv_5, 0.3065489513353151 AS sv_6, 0.544204383292988 AS sv_7, 0.9354410688231648 AS sv_8, -0.7788356308066725 AS sv_9 UNION ALL SELECT 75 AS sv_idx, -0.9633681965358084 AS dual_coeff, 1.3581161239351511 AS sv_0, -2.0570420906155285 AS sv_1, -0.10733298286267932 AS sv_2, -0.12375430086279528 AS sv_3, -1.0530576599783898 AS sv_4, -1.5381786064428615 AS sv_5, 0.0468218077114789 AS sv_6, 1.167528967449606 AS sv_7, 0.3429170609750644 AS sv_8, -1.008349508800099 AS sv_9 UNION ALL SELECT 76 AS sv_idx, 0.9610355595278696 AS dual_coeff, -1.805852346297556 AS sv_0, -0.20478304710013576 AS sv_1, 0.05300098505022429 AS sv_2, 0.06364414093636919 AS sv_3, -1.7589031390708998 AS sv_4, -0.4622958126416504 AS sv_5, -0.5347743498729075 AS sv_6, -1.9242544387407587 AS sv_7, 0.5727667130055276 AS sv_8, 1.9871326863449248 AS sv_9 UNION ALL SELECT 77 AS sv_idx, 0.9936542357488009 AS dual_coeff, -3.0584276692461434 AS sv_0, 0.460992574133467 AS sv_1, 0.4725620009000146 AS sv_2, 1.0312257112147751 AS sv_3, -0.14847399618587726 AS sv_4, -1.0042629011088753 AS sv_5, -0.4926058889541967 AS sv_6, -3.2917714214518026 AS sv_7, 1.6713222082370487 AS sv_8, 3.4224927743504074 AS sv_9 UNION ALL SELECT 78 AS sv_idx, -0.9492133953537344 AS dual_coeff, 0.7403868926294338 AS sv_0, 0.9449554112828747 AS sv_1, -0.1797975601199856 AS sv_2, 1.0101114939183733 AS sv_3, -1.2294433258505943 AS sv_4, 0.7467296913109664 AS sv_5, 0.4813616847363005 AS sv_6, 0.8715508780702134 AS sv_7, 0.5963010033679291 AS sv_8, -0.9583332071708348 AS sv_9 UNION ALL SELECT 79 AS sv_idx, -0.9492330643773368 AS dual_coeff, 1.0288046916148474 AS sv_0, -0.6108917539862642 AS sv_1, -1.1942394632100557 AS sv_2, -1.8896165334496131 AS sv_3, -0.3569306722436835 AS sv_4, -0.04088088193652705 AS sv_5, 1.0196431704922162 AS sv_6, 1.0511445777813448 AS sv_7, 0.995155465470413 AS sv_8, -1.0536562742226288 AS sv_9) AS `Values`), 
kernel_dp AS 
(SELECT t.`KEY` AS `KEY`, t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.`KEY` AS `KEY`, sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + 0.00622633596816927 AS dot_product 
FROM (SELECT kernel_input_with_scaling.`KEY` AS `KEY`, `SV_data`.dual_coeff * exp(least(100.0, greatest(-100.0, -1.0 * (power(kernel_input_with_scaling.`Feature_0` - `SV_data`.sv_0, 2) + power(kernel_input_with_scaling.`Feature_1` - `SV_data`.sv_1, 2) + power(kernel_input_with_scaling.`Feature_2` - `SV_data`.sv_2, 2) + power(kernel_input_with_scaling.`Feature_3` - `SV_data`.sv_3, 2) + power(kernel_input_with_scaling.`Feature_4` - `SV_data`.sv_4, 2) + power(kernel_input_with_scaling.`Feature_5` - `SV_data`.sv_5, 2) + power(kernel_input_with_scaling.`Feature_6` - `SV_data`.sv_6, 2) + power(kernel_input_with_scaling.`Feature_7` - `SV_data`.sv_7, 2) + power(kernel_input_with_scaling.`Feature_8` - `SV_data`.sv_8, 2) + power(kernel_input_with_scaling.`Feature_9` - `SV_data`.sv_9, 2))))) AS dot_prod1 
FROM kernel_input_with_scaling, `SV_data`) AS full_join_data_sv GROUP BY full_join_data_sv.`KEY`) AS t)
 SELECT kernel_dp.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, 1.0 - 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424)))))) AS `Proba_0`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424)))))) AS `Proba_1`, CASE WHEN (1.0 - 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424)))))) IS NULL OR 1.0 - 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424)))))) > 0.0) THEN ln(1.0 - 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424))))))) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424)))))) IS NULL OR 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424)))))) > 0.0) THEN ln(1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424))))))) ELSE -1.79769313486231e+308 END AS `LogProba_1`, CASE WHEN (1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424)))))) > 1.0 - 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424))))))) THEN 1 ELSE 0 END AS `Decision`, greatest(1.0 - 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424)))))), 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -(-(kernel_dp.dot_product * -24.21618633361199 + -0.1463207099630424))))))) AS `DecisionProba` 
FROM kernel_dp