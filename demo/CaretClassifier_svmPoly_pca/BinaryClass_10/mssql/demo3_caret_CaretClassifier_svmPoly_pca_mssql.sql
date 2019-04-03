-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmPoly_pca
-- Dataset : BinaryClass_10
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 0.06182920523813451) / 1.236134089597546 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - 0.17702463767183327) / 0.946757498519011 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 0.041383850049034464) / 1.0809597326983538 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 0.13060646805847148) / 1.0860335106241017 AS [Feature_3], (CAST([ADS].[Feature_4] AS FLOAT(53)) - -0.05955810471983085) / 1.1165897507633815 AS [Feature_4], (CAST([ADS].[Feature_5] AS FLOAT(53)) - -0.048929089870105816) / 1.3868824547243672 AS [Feature_5], (CAST([ADS].[Feature_6] AS FLOAT(53)) - 0.19101797861713127) / 0.979670721363872 AS [Feature_6], (CAST([ADS].[Feature_7] AS FLOAT(53)) - 0.02204959673267471) / 0.4775973825125086 AS [Feature_7], (CAST([ADS].[Feature_8] AS FLOAT(53)) - -0.05772981403414008) / 1.0713243581907332 AS [Feature_8], (CAST([ADS].[Feature_9] AS FLOAT(53)) - -0.052549592052032364) / 1.2322587258530384 AS [Feature_9] 
FROM [BinaryClass_10] AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * 0.5661592321920361 + [ADS_sca_1_OUT].[Feature_1] * -0.035526328604152946 + [ADS_sca_1_OUT].[Feature_2] * -0.0467879363120513 + [ADS_sca_1_OUT].[Feature_3] * 0.008946515209953917 + [ADS_sca_1_OUT].[Feature_4] * 0.0829511888403661 + [ADS_sca_1_OUT].[Feature_5] * -0.10205221296100445 + [ADS_sca_1_OUT].[Feature_6] * 0.1424451507903749 + [ADS_sca_1_OUT].[Feature_7] * 0.5666566688831561 + [ADS_sca_1_OUT].[Feature_8] * -0.06631427728790784 + [ADS_sca_1_OUT].[Feature_9] * -0.5593289854950824 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * 0.0767125800279515 + [ADS_sca_1_OUT].[Feature_1] * -0.40153794458328573 + [ADS_sca_1_OUT].[Feature_2] * 0.5677578250446825 + [ADS_sca_1_OUT].[Feature_3] * 0.2369735703010663 + [ADS_sca_1_OUT].[Feature_4] * -0.09632922916256215 + [ADS_sca_1_OUT].[Feature_5] * -0.5767787279161882 + [ADS_sca_1_OUT].[Feature_6] * -0.3216376934797878 + [ADS_sca_1_OUT].[Feature_7] * -0.006693968243624504 + [ADS_sca_1_OUT].[Feature_8] * -0.06421158945215161 + [ADS_sca_1_OUT].[Feature_9] * 0.06932008034543824 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * -0.04428807917268944 + [ADS_sca_1_OUT].[Feature_1] * 0.02244286142288565 + [ADS_sca_1_OUT].[Feature_2] * -0.1709384323174772 + [ADS_sca_1_OUT].[Feature_3] * 0.4187938020309751 + [ADS_sca_1_OUT].[Feature_4] * 0.4638804547130563 + [ADS_sca_1_OUT].[Feature_5] * 0.12436384332391155 + [ADS_sca_1_OUT].[Feature_6] * -0.2491197630750001 + [ADS_sca_1_OUT].[Feature_7] * -0.02707014062139766 + [ADS_sca_1_OUT].[Feature_8] * -0.7066063892300462 + [ADS_sca_1_OUT].[Feature_9] * 0.01375528233133572 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * 0.035505292609370916 + [ADS_sca_1_OUT].[Feature_1] * 0.4629415976318115 + [ADS_sca_1_OUT].[Feature_2] * 0.39703949728185695 + [ADS_sca_1_OUT].[Feature_3] * 0.108176435008563 + [ADS_sca_1_OUT].[Feature_4] * -0.5443880279914196 + [ADS_sca_1_OUT].[Feature_5] * 0.3886991214463785 + [ADS_sca_1_OUT].[Feature_6] * -0.3136270685510785 + [ADS_sca_1_OUT].[Feature_7] * 0.09412147953130984 + [ADS_sca_1_OUT].[Feature_8] * -0.2041303312264922 + [ADS_sca_1_OUT].[Feature_9] * -0.1369183431411648 AS [PC4], [ADS_sca_1_OUT].[Feature_0] * -0.02395611334530353 + [ADS_sca_1_OUT].[Feature_1] * 0.3059663067403714 + [ADS_sca_1_OUT].[Feature_2] * 0.1244148619727216 + [ADS_sca_1_OUT].[Feature_3] * 0.7205232130433498 + [ADS_sca_1_OUT].[Feature_4] * -0.010360887714254759 + [ADS_sca_1_OUT].[Feature_5] * -0.12313866467327145 + [ADS_sca_1_OUT].[Feature_6] * 0.5630711251768787 + [ADS_sca_1_OUT].[Feature_7] * -0.04287636501865158 + [ADS_sca_1_OUT].[Feature_8] * 0.18391692419974146 + [ADS_sca_1_OUT].[Feature_9] * 0.056520588594192574 AS [PC5], [ADS_sca_1_OUT].[Feature_0] * 0.048169250614026715 + [ADS_sca_1_OUT].[Feature_1] * 0.6239362496677012 + [ADS_sca_1_OUT].[Feature_2] * 0.20083118524117005 + [ADS_sca_1_OUT].[Feature_3] * -0.1618608106397551 + [ADS_sca_1_OUT].[Feature_4] * 0.5432007330496692 + [ADS_sca_1_OUT].[Feature_5] * -0.2436186036944093 + [ADS_sca_1_OUT].[Feature_6] * -0.3147233303086936 + [ADS_sca_1_OUT].[Feature_7] * 0.01337545211610092 + [ADS_sca_1_OUT].[Feature_8] * 0.29670903412359584 + [ADS_sca_1_OUT].[Feature_9] * 0.01296934529502586 AS [PC6], [ADS_sca_1_OUT].[Feature_0] * -0.06773590863463053 + [ADS_sca_1_OUT].[Feature_1] * -0.11758181773858208 + [ADS_sca_1_OUT].[Feature_2] * 0.6477095493436038 + [ADS_sca_1_OUT].[Feature_3] * -0.3112272823678729 + [ADS_sca_1_OUT].[Feature_4] * 0.33477688181210946 + [ADS_sca_1_OUT].[Feature_5] * 0.29496375499110145 + [ADS_sca_1_OUT].[Feature_6] * 0.4607366756100071 + [ADS_sca_1_OUT].[Feature_7] * -0.025868856528122847 + [ADS_sca_1_OUT].[Feature_8] * -0.2305082370268579 + [ADS_sca_1_OUT].[Feature_9] * -0.005964439285718312 AS [PC7] 
FROM [ADS_sca_1_OUT]), 
kernel_input_with_scaling AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], (CAST([ADS_pre_1_OUT].[PC1] AS FLOAT(53)) - 2.7755575615628907e-17) / 1.750515830938198 AS [PC1], (CAST([ADS_pre_1_OUT].[PC2] AS FLOAT(53)) - 1.2012960071139389e-17) / 1.1828291474333126 AS [PC2], (CAST([ADS_pre_1_OUT].[PC3] AS FLOAT(53)) - 1.843143693225358e-17) / 1.103709859701247 AS [PC3], (CAST([ADS_pre_1_OUT].[PC4] AS FLOAT(53)) - 1.188285581044113e-17) / 1.0461365510031468 AS [PC4], (CAST([ADS_pre_1_OUT].[PC5] AS FLOAT(53)) - 8.847089727481716e-18) / 1.0140836067768206 AS [PC5], (CAST([ADS_pre_1_OUT].[PC6] AS FLOAT(53)) - 2.42861286636753e-17) / 0.9460405862227468 AS [PC6], (CAST([ADS_pre_1_OUT].[PC7] AS FLOAT(53)) - 6.6786853825107075e-18) / 0.8075122271618536 AS [PC7] 
FROM [ADS_pre_1_OUT]), 
[SV_data] AS 
(SELECT [Values].sv_idx AS sv_idx, [Values].dual_coeff AS dual_coeff, [Values].sv_0 AS sv_0, [Values].sv_1 AS sv_1, [Values].sv_2 AS sv_2, [Values].sv_3 AS sv_3, [Values].sv_4 AS sv_4, [Values].sv_5 AS sv_5, [Values].sv_6 AS sv_6 
FROM (SELECT 0 AS sv_idx, 0.8985914873843216 AS dual_coeff, -0.948506914731264 AS sv_0, -0.5734295194291505 AS sv_1, -0.28936378630678683 AS sv_2, 0.07244617487300856 AS sv_3, -0.6009065340529729 AS sv_4, 0.03177186770827721 AS sv_5, 0.3569691667315485 AS sv_6 UNION ALL SELECT 1 AS sv_idx, 1.0 AS dual_coeff, 0.27548423115615545 AS sv_0, 2.037247200666669 AS sv_1, 0.11219991163395412 AS sv_2, 0.5208009537227081 AS sv_3, 0.10682082926109288 AS sv_4, 0.5143307621780513 AS sv_5, 0.3922586144116844 AS sv_6 UNION ALL SELECT 2 AS sv_idx, 1.0 AS dual_coeff, 0.07955189581996161 AS sv_0, 0.5699887681573519 AS sv_1, 1.1837940458270515 AS sv_2, 0.7267622090184046 AS sv_3, 0.6825494995371613 AS sv_4, -0.6912293646853506 AS sv_5, -0.31920412318982017 AS sv_6 UNION ALL SELECT 3 AS sv_idx, 1.0 AS dual_coeff, 0.6617436816445926 AS sv_0, 1.220679731507282 AS sv_1, -1.8014054214493893 AS sv_2, -0.6412383849190259 AS sv_3, 1.0237603815371676 AS sv_4, -1.0779067369200777 AS sv_5, 1.9347742030664297 AS sv_6 UNION ALL SELECT 4 AS sv_idx, 1.0 AS dual_coeff, -0.1461778043282589 AS sv_0, 0.8119964549724767 AS sv_1, 0.13978131181119674 AS sv_2, 1.1675909578214236 AS sv_3, -1.0954896808491577 AS sv_4, 0.8308512126319662 AS sv_5, 0.4717091288654833 AS sv_6 UNION ALL SELECT 5 AS sv_idx, 0.7542406433634237 AS dual_coeff, 0.07765393421048028 AS sv_0, -0.520901590025541 AS sv_1, 0.43817296778647463 AS sv_2, 2.609377567223523 AS sv_3, -2.858609727456618 AS sv_4, -1.2432037785458612 AS sv_5, -0.4968810092950847 AS sv_6 UNION ALL SELECT 6 AS sv_idx, -0.7673449924095614 AS dual_coeff, 1.4729544402647035 AS sv_0, 1.714728347167229 AS sv_1, -1.1921170073194032 AS sv_2, -1.2573104154859347 AS sv_3, 0.230252010627733 AS sv_4, 0.3624766047893383 AS sv_5, -0.7680337698712456 AS sv_6 UNION ALL SELECT 7 AS sv_idx, -0.5024671638690654 AS dual_coeff, 0.23545769032876265 AS sv_0, -0.14293001262199623 AS sv_1, 0.3584076951905413 AS sv_2, 0.1172917428266495 AS sv_3, 0.7810056579781307 AS sv_4, 3.121376623732287 AS sv_5, -0.4312404610511464 AS sv_6 UNION ALL SELECT 8 AS sv_idx, 1.0 AS dual_coeff, 0.35037731749156753 AS sv_0, 1.2870518043916954 AS sv_1, 1.2825080890510847 AS sv_2, 0.5666608873551245 AS sv_3, 1.3020335702178796 AS sv_4, 1.389477698635463 AS sv_5, 0.4729270854177354 AS sv_6 UNION ALL SELECT 9 AS sv_idx, 1.0 AS dual_coeff, 0.5310337534998661 AS sv_0, 0.4175940500418061 AS sv_1, -0.41395423518497015 AS sv_2, -0.9951240379835304 AS sv_3, 1.1651422241836251 AS sv_4, 0.728350950295779 AS sv_5, -1.28220583456238 AS sv_6 UNION ALL SELECT 10 AS sv_idx, -1.0 AS dual_coeff, -0.14384478547412094 AS sv_0, -0.4223636108330652 AS sv_1, 0.7380810515456131 AS sv_2, 0.740856491099349 AS sv_3, -1.7000356067524793 AS sv_4, -1.5254297439051472 AS sv_5, 0.21110691468100132 AS sv_6 UNION ALL SELECT 11 AS sv_idx, -1.0 AS dual_coeff, 0.5110374302463636 AS sv_0, -0.2903059653594348 AS sv_1, -0.5582831814169112 AS sv_2, 0.578881176532182 AS sv_3, 0.9312257141996326 AS sv_4, 0.41111701444925747 AS sv_5, -0.1670669225862319 AS sv_6 UNION ALL SELECT 12 AS sv_idx, -1.0 AS dual_coeff, 0.03061759448886487 AS sv_0, -0.040780363957985344 AS sv_1, 1.3322259543765906 AS sv_2, 0.531708391689867 AS sv_3, 0.5209916243611578 AS sv_4, -0.18945005748309884 AS sv_5, 0.730051044882225 AS sv_6 UNION ALL SELECT 13 AS sv_idx, 1.0 AS dual_coeff, -0.4043395581850245 AS sv_0, -0.5800645093390175 AS sv_1, 1.5124526894702746 AS sv_2, -0.01254212576336542 AS sv_3, -0.7328929305584821 AS sv_4, -0.5220329033746006 AS sv_5, 0.771985601406731 AS sv_6 UNION ALL SELECT 14 AS sv_idx, 0.7054897615834029 AS dual_coeff, -0.07331721053725535 AS sv_0, 0.5276806037894831 AS sv_1, 0.6926519864008411 AS sv_2, -1.5866113976337253 AS sv_3, 0.5260641952108013 AS sv_4, 1.0337799354155304 AS sv_5, 0.24690895369790225 AS sv_6 UNION ALL SELECT 15 AS sv_idx, 0.2384032284470947 AS dual_coeff, -0.5670416051319388 AS sv_0, -1.9453228876208797 AS sv_1, 1.0530937325706575 AS sv_2, -0.10484159696711984 AS sv_3, -0.836729801018761 AS sv_4, 1.0425861280123434 AS sv_5, -0.9595973600199736 AS sv_6 UNION ALL SELECT 16 AS sv_idx, 1.0 AS dual_coeff, -0.684854978491799 AS sv_0, -1.2797529928767664 AS sv_1, -0.5081783385483383 AS sv_2, 0.8355514565471263 AS sv_3, -0.13651101823566286 AS sv_4, 0.4702444308312827 AS sv_5, -1.0886855109493188 AS sv_6 UNION ALL SELECT 17 AS sv_idx, 0.5143133337683876 AS dual_coeff, -1.0330171044267331 AS sv_0, -0.0610746685802054 AS sv_1, -1.4292810503647928 AS sv_2, 0.9386495071809638 AS sv_3, -0.42399536235942015 AS sv_4, -0.8804033211892746 AS sv_5, 0.056330850933704726 AS sv_6 UNION ALL SELECT 18 AS sv_idx, -1.0 AS dual_coeff, 0.0312515293241151 AS sv_0, 0.38304726593357136 AS sv_1, 0.2471718795921851 AS sv_2, 1.2715359416075838 AS sv_3, 0.12106706504196492 AS sv_4, 0.609144699478889 AS sv_5, 0.38138967737599266 AS sv_6 UNION ALL SELECT 19 AS sv_idx, 1.0 AS dual_coeff, -0.7674656998893696 AS sv_0, -0.5884823373027398 AS sv_1, 0.06217326174928697 AS sv_2, 0.14558285042750546 AS sv_3, -0.4849673865712953 AS sv_4, -0.28655093987695124 AS sv_5, 1.5174828404796517 AS sv_6 UNION ALL SELECT 20 AS sv_idx, 0.7622115665155837 AS dual_coeff, -0.7922419418026398 AS sv_0, -0.8913329420717395 AS sv_1, 1.1977730460088896 AS sv_2, 0.4630632416897789 AS sv_3, 0.8611056889394418 AS sv_4, -0.7711628933414677 AS sv_5, -0.3614218656123108 AS sv_6 UNION ALL SELECT 21 AS sv_idx, 1.0 AS dual_coeff, 0.9126672814378564 AS sv_0, 0.3385431871874667 AS sv_1, 0.09307776903985814 AS sv_2, -1.3557715906164047 AS sv_3, 1.8076112187350792 AS sv_4, -1.3265030109858276 AS sv_5, -0.6208855467325257 AS sv_6 UNION ALL SELECT 22 AS sv_idx, 0.3675038077855233 AS dual_coeff, -0.24906573922215786 AS sv_0, -0.003306335419387821 AS sv_1, -1.192941475577012 AS sv_2, -0.14663324039582545 AS sv_3, 0.24787083055976886 AS sv_4, -0.13519262553010727 AS sv_5, -2.9788340244253453 AS sv_6 UNION ALL SELECT 23 AS sv_idx, -0.9395583960900996 AS dual_coeff, 0.4108070070354165 AS sv_0, -0.10987345928092407 AS sv_1, -1.689819940229543 AS sv_2, 0.6958916089449138 AS sv_3, 0.12807870924793696 AS sv_4, 0.5610146779877736 AS sv_5, -0.9347766463732676 AS sv_6 UNION ALL SELECT 24 AS sv_idx, -1.0 AS dual_coeff, 0.96702856769522 AS sv_0, -0.5889689857666525 AS sv_1, 0.7496671693484454 AS sv_2, -1.4160886934924553 AS sv_3, 0.898748209845073 AS sv_4, 0.6909848615123568 AS sv_5, -0.7067973977841511 AS sv_6 UNION ALL SELECT 25 AS sv_idx, -1.0 AS dual_coeff, 0.5980977147222275 AS sv_0, -0.04782444106552365 AS sv_1, 1.187505013445299 AS sv_2, -0.2978369599296436 AS sv_3, 0.060687424370785836 AS sv_4, -0.27465842578524785 AS sv_5, -1.0195070543179503 AS sv_6 UNION ALL SELECT 26 AS sv_idx, -0.7564765133339677 AS dual_coeff, 0.2928162378725643 AS sv_0, 0.14209860597690102 AS sv_1, -0.2628332290867731 AS sv_2, -0.6286378339959764 AS sv_3, -2.722146353648964 AS sv_4, 1.533618353852649 AS sv_5, 0.933655937956696 AS sv_6 UNION ALL SELECT 27 AS sv_idx, 0.03428196673046933 AS dual_coeff, -0.8987089205109762 AS sv_0, -0.07607697826688277 AS sv_1, -0.3227104172259321 AS sv_2, -0.86275545691584 AS sv_3, 0.14242556532517925 AS sv_4, 1.0515027729968696 AS sv_5, 0.5790188405417612 AS sv_6 UNION ALL SELECT 28 AS sv_idx, -0.4539812165089365 AS dual_coeff, 1.2360197379570017 AS sv_0, -1.0574513743999823 AS sv_1, 2.02307349516572 AS sv_2, -0.1394428526027683 AS sv_3, -0.1820187283471692 AS sv_4, -0.4927079970776084 AS sv_5, -2.288106406344806 AS sv_6 UNION ALL SELECT 29 AS sv_idx, -1.0 AS dual_coeff, 0.29742841981395013 AS sv_0, -1.2190241482958446 AS sv_1, 0.19192760397222455 AS sv_2, 0.9345740506732344 AS sv_3, -0.7198813696113961 AS sv_4, 1.2050937382293123 AS sv_5, -0.13482073745222806 AS sv_6 UNION ALL SELECT 30 AS sv_idx, 0.4327886415884353 AS dual_coeff, -0.08011086471737344 AS sv_0, 1.7078737198737763 AS sv_1, 1.7208174822418305 AS sv_2, -2.5371139841361154 AS sv_3, -1.751133292049263 AS sv_4, -1.3252819791774528 AS sv_5, 0.3980269857722175 AS sv_6 UNION ALL SELECT 31 AS sv_idx, 1.0 AS dual_coeff, 0.6369309789758077 AS sv_0, 0.5590666984415578 AS sv_1, 0.1924522124914468 AS sv_2, 0.008174290842419277 AS sv_3, 1.177279664725638 AS sv_4, 0.3136678102977383 AS sv_5, -0.4573286261667396 AS sv_6 UNION ALL SELECT 32 AS sv_idx, -1.0 AS dual_coeff, 0.3255675644815461 AS sv_0, 0.9516052346585376 AS sv_1, 0.6635202900031917 AS sv_2, 1.5469017198375916 AS sv_3, -0.03954195956928642 AS sv_4, -1.4608791683858675 AS sv_5, -0.8857203015224363 AS sv_6 UNION ALL SELECT 33 AS sv_idx, 0.33901840838790376 AS dual_coeff, 0.6731738895006416 AS sv_0, -3.967172315270469 AS sv_1, 0.5271303071620047 AS sv_2, -0.6459839789068769 AS sv_3, 1.62774885006463 AS sv_4, -0.4183073896134164 AS sv_5, -1.4483928762477731 AS sv_6 UNION ALL SELECT 34 AS sv_idx, -1.0 AS dual_coeff, 0.14570792703778285 AS sv_0, -0.5470016736650908 AS sv_1, 0.789356381447791 AS sv_2, -0.29006422655177894 AS sv_3, -0.7551223388336274 AS sv_4, -1.5040955985297657 AS sv_5, 0.97315819238167 AS sv_6 UNION ALL SELECT 35 AS sv_idx, -0.6754776800608048 AS dual_coeff, -0.347834007470628 AS sv_0, -1.5913711473315026 AS sv_1, 0.700351062122941 AS sv_2, -0.8709763304083342 AS sv_3, 1.8102046106869287 AS sv_4, -0.110972660890376 AS sv_5, 2.736438031787115 AS sv_6 UNION ALL SELECT 36 AS sv_idx, -1.0 AS dual_coeff, 0.4217010283215089 AS sv_0, 1.6108551021198392 AS sv_1, 0.08873199253174968 AS sv_2, 0.7682488802483245 AS sv_3, 0.9104973407536217 AS sv_4, -0.059069338262476824 AS sv_5, 0.38749429042224137 AS sv_6 UNION ALL SELECT 37 AS sv_idx, -1.0 AS dual_coeff, 0.20857758137957744 AS sv_0, -1.0241776440150807 AS sv_1, -1.3702256155571508 AS sv_2, 0.11722993353104905 AS sv_3, 0.5542077702483189 AS sv_4, -0.9046703461426278 AS sv_5, 0.8902402463194918 AS sv_6 UNION ALL SELECT 38 AS sv_idx, -1.0 AS dual_coeff, -0.20231752822832952 AS sv_0, -0.7205588725553869 AS sv_1, -1.168698449425828 AS sv_2, 0.12849437746722625 AS sv_3, 0.9972813853420232 AS sv_4, -1.2053381648696213 AS sv_5, 0.10668642385867516 AS sv_6 UNION ALL SELECT 39 AS sv_idx, -0.9515368832821108 AS dual_coeff, 1.2859628952265545 AS sv_0, 1.7477519228452603 AS sv_1, 0.36002704070084035 AS sv_2, -0.8331825086127165 AS sv_3, -0.2676865465937381 AS sv_4, -1.2174849477859295 AS sv_5, 0.125380761527336 AS sv_6 UNION ALL SELECT 40 AS sv_idx, 1.0 AS dual_coeff, 0.4096108464668072 AS sv_0, -1.79322854323232 AS sv_1, -0.5194132075701663 AS sv_2, -0.2419239392302549 AS sv_3, -0.8299305853599314 AS sv_4, -1.1738836527283167 AS sv_5, -0.310697807533894 AS sv_6) AS [Values]), 
kernel_dp AS 
(SELECT t.[KEY] AS [KEY], t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.[KEY] AS [KEY], sum(CAST(full_join_data_sv.dot_prod1 AS FLOAT(53))) + -0.0442288534899598 AS dot_product 
FROM (SELECT kernel_input_with_scaling.[KEY] AS [KEY], [SV_data].dual_coeff * power(CAST(0.1 * (kernel_input_with_scaling.[PC1] * [SV_data].sv_0 + kernel_input_with_scaling.[PC2] * [SV_data].sv_1 + kernel_input_with_scaling.[PC3] * [SV_data].sv_2 + kernel_input_with_scaling.[PC4] * [SV_data].sv_3 + kernel_input_with_scaling.[PC5] * [SV_data].sv_4 + kernel_input_with_scaling.[PC6] * [SV_data].sv_5 + kernel_input_with_scaling.[PC7] * [SV_data].sv_6) + 1.0 AS FLOAT(53)), 2.0) AS dot_prod1 
FROM kernel_input_with_scaling, [SV_data]) AS full_join_data_sv GROUP BY full_join_data_sv.[KEY]) AS t)
 SELECT kernel_dp.[KEY] AS [KEY], -kernel_dp.dot_product AS [Score_0], kernel_dp.dot_product AS [Score_1], CAST(NULL AS FLOAT(53)) AS [Proba_0], CAST(NULL AS FLOAT(53)) AS [Proba_1], CAST(NULL AS FLOAT(53)) AS [LogProba_0], CAST(NULL AS FLOAT(53)) AS [LogProba_1], CASE WHEN (kernel_dp.dot_product > 0.0) THEN 1 ELSE 0 END AS [Decision], CAST(NULL AS FLOAT(53)) AS [DecisionProba] 
FROM kernel_dp