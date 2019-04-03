-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmLinear_pca
-- Dataset : FourClass_10
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - -0.003903374463034224) / 0.985685974308334 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 0.6152232215702326) / 1.398851036008891 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.04279623691429167) / 1.5057087871323842 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 0.770981955890407) / 2.3480777416797296 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - -0.43300733624893323) / 1.4118274472656485 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - -0.04249569657940362) / 0.961839508883184 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - -0.29809080119845444) / 1.0234297313191445 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - 0.14672241507251668) / 1.610898315451602 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - 0.01746942384662041) / 1.1559772136551034 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - 0.11507331415602873) / 0.975205386360447 AS "Feature_9" 
FROM "FourClass_10" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.04932772619908273 + "ADS_sca_1_OUT"."Feature_1" * -0.30424192738374856 + "ADS_sca_1_OUT"."Feature_2" * -0.3679687561849888 + "ADS_sca_1_OUT"."Feature_3" * -0.5380769831115797 + "ADS_sca_1_OUT"."Feature_4" * 0.10802988742400396 + "ADS_sca_1_OUT"."Feature_5" * 0.13910407016754714 + "ADS_sca_1_OUT"."Feature_6" * 0.5384086347891889 + "ADS_sca_1_OUT"."Feature_7" * -0.3713071820395216 + "ADS_sca_1_OUT"."Feature_8" * 0.0483137135579316 + "ADS_sca_1_OUT"."Feature_9" * 0.13772539520944088 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.4566046379002287 + "ADS_sca_1_OUT"."Feature_1" * 0.22867203934764516 + "ADS_sca_1_OUT"."Feature_2" * -0.2673956790968541 + "ADS_sca_1_OUT"."Feature_3" * 0.01671202428135116 + "ADS_sca_1_OUT"."Feature_4" * -0.7163497555230034 + "ADS_sca_1_OUT"."Feature_5" * 0.3501083253113648 + "ADS_sca_1_OUT"."Feature_6" * -0.02365108420686553 + "ADS_sca_1_OUT"."Feature_7" * -0.15293556467571348 + "ADS_sca_1_OUT"."Feature_8" * -0.04278465473081572 + "ADS_sca_1_OUT"."Feature_9" * -0.07700365586043896 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.4595639307438372 + "ADS_sca_1_OUT"."Feature_1" * 0.3158880900516212 + "ADS_sca_1_OUT"."Feature_2" * -0.23051961282840416 + "ADS_sca_1_OUT"."Feature_3" * -0.0044376721269756845 + "ADS_sca_1_OUT"."Feature_4" * -0.16274384812665132 + "ADS_sca_1_OUT"."Feature_5" * -0.27453767262313855 + "ADS_sca_1_OUT"."Feature_6" * 0.06030524407436345 + "ADS_sca_1_OUT"."Feature_7" * -0.14174903890838467 + "ADS_sca_1_OUT"."Feature_8" * -0.7115147418569482 + "ADS_sca_1_OUT"."Feature_9" * -0.06338366606522455 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.12741284788275034 + "ADS_sca_1_OUT"."Feature_1" * 0.08549541136134871 + "ADS_sca_1_OUT"."Feature_2" * -0.3821190712444285 + "ADS_sca_1_OUT"."Feature_3" * -0.10433262844841386 + "ADS_sca_1_OUT"."Feature_4" * 0.08250986211203802 + "ADS_sca_1_OUT"."Feature_5" * -0.36296260084226667 + "ADS_sca_1_OUT"."Feature_6" * 0.10962886388759648 + "ADS_sca_1_OUT"."Feature_7" * 0.2426374781882909 + "ADS_sca_1_OUT"."Feature_8" * 0.2287736877363014 + "ADS_sca_1_OUT"."Feature_9" * -0.7468451366164522 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.5052628362580355 + "ADS_sca_1_OUT"."Feature_1" * 0.5459531848285842 + "ADS_sca_1_OUT"."Feature_2" * -0.22747468245471705 + "ADS_sca_1_OUT"."Feature_3" * 0.10502795983753949 + "ADS_sca_1_OUT"."Feature_4" * 0.09502215073405063 + "ADS_sca_1_OUT"."Feature_5" * 0.36269377695620797 + "ADS_sca_1_OUT"."Feature_6" * 0.0045813170830969465 + "ADS_sca_1_OUT"."Feature_7" * -0.05707137281293255 + "ADS_sca_1_OUT"."Feature_8" * 0.4879473635061551 + "ADS_sca_1_OUT"."Feature_9" * 0.04384333678041198 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * -0.364462956028093 + "ADS_sca_1_OUT"."Feature_1" * -0.4012918066249357 + "ADS_sca_1_OUT"."Feature_2" * 0.1851889259404308 + "ADS_sca_1_OUT"."Feature_3" * -0.03041929320097767 + "ADS_sca_1_OUT"."Feature_4" * -0.1029513075574872 + "ADS_sca_1_OUT"."Feature_5" * 0.5811919009803136 + "ADS_sca_1_OUT"."Feature_6" * -0.060907389766695234 + "ADS_sca_1_OUT"."Feature_7" * 0.12041134521888586 + "ADS_sca_1_OUT"."Feature_8" * -0.186159059340367 + "ADS_sca_1_OUT"."Feature_9" * -0.5192923770633756 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.20119583886282807 + "ADS_sca_1_OUT"."Feature_1" * 0.0677442703839704 + "ADS_sca_1_OUT"."Feature_2" * -0.41277620208310173 + "ADS_sca_1_OUT"."Feature_3" * -0.019873248265688318 + "ADS_sca_1_OUT"."Feature_4" * 0.327357356668028 + "ADS_sca_1_OUT"."Feature_5" * 0.3399166161542765 + "ADS_sca_1_OUT"."Feature_6" * 0.007401751370061409 + "ADS_sca_1_OUT"."Feature_7" * 0.6352452099253666 + "ADS_sca_1_OUT"."Feature_8" * -0.3190683902934043 + "ADS_sca_1_OUT"."Feature_9" * 0.23674831363349555 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
kernel_input_with_scaling AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", (CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE PRECISION) - -1.214306433183765e-17) / 1.8343905422664024 AS "PC1", (CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE PRECISION) - -2.51534904016637e-17) / 1.1475554524091378 AS "PC2", (CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE PRECISION) - -5.4643789493269414e-18) / 1.0574439208258866 AS "PC3", (CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE PRECISION) - -4.145989107584569e-17) / 1.0311261086329635 AS "PC4", (CAST("ADS_pre_1_OUT"."PC5" AS DOUBLE PRECISION) - -3.4867941867133825e-17) / 0.975565387158156 AS "PC5", (CAST("ADS_pre_1_OUT"."PC6" AS DOUBLE PRECISION) - 3.209238430557093e-17) / 0.9443823157431064 AS "PC6", (CAST("ADS_pre_1_OUT"."PC7" AS DOUBLE PRECISION) - -1.43982048506075e-17) / 0.867380833893038 AS "PC7" 
FROM "ADS_pre_1_OUT"), 
"SV_data_0" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6 
FROM (SELECT 0 AS sv_idx, -1.0 AS dual_coeff, -0.3345971844571676 AS sv_0, -1.8511735776570144 AS sv_1, -0.5884810125690079 AS sv_2, -0.3279487339190181 AS sv_3, -2.174429339473813 AS sv_4, -0.7197360680891133 AS sv_5, 0.497506578717893 AS sv_6 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, 0.8754866412582724 AS dual_coeff, 0.002361778277690275 AS sv_0, -0.2419379671349237 AS sv_1, -0.2789230887775386 AS sv_2, -0.3164297066609931 AS sv_3, 1.4453120889239068 AS sv_4, -0.2264368249696782 AS sv_5, -0.09725840719150226 AS sv_6 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, 1.0 AS dual_coeff, 0.050107294838932254 AS sv_0, -0.7199405408141479 AS sv_1, 0.2477918518809012 AS sv_2, 1.461665350953976 AS sv_3, 1.3145168898402484 AS sv_4, -0.21977276824255287 AS sv_5, -0.13861668894250775 AS sv_6 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, 0.2680993358318674 AS dual_coeff, -0.7161780670288813 AS sv_0, -1.6767994684163634 AS sv_1, -1.1739575038908068 AS sv_2, -1.5256624000121706 AS sv_3, 0.4778642851776185 AS sv_4, 0.2924939739823008 AS sv_5, 2.33759928852062 AS sv_6 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, 0.8312309634921169 AS dual_coeff, -0.8826196912201385 AS sv_0, -2.219986574344384 AS sv_1, 0.9733218239029984 AS sv_2, 0.3568589552025004 AS sv_3, -0.7302908263286286 AS sv_4, 0.5125567465184426 AS sv_5, 1.1447144278508794 AS sv_6 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, -0.8378401491925859 AS dual_coeff, 0.4085184441633754 AS sv_0, -0.1677856204737739 AS sv_1, 0.8903245398933477 AS sv_2, -0.3797850662615115 AS sv_3, 0.1660727782513719 AS sv_4, 1.9784617218059055 AS sv_5, 0.407846366089412 AS sv_6 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, -1.0 AS dual_coeff, 0.004005875464129689 AS sv_0, -1.0718798624336634 AS sv_1, -0.4673627540721789 AS sv_2, 0.1537423005765415 AS sv_3, -0.627766377101503 AS sv_4, -0.07384479584962345 AS sv_5, -0.02620260306297711 AS sv_6 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, 1.0 AS dual_coeff, -0.37524822891033127 AS sv_0, -1.385568986660278 AS sv_1, 0.9849410529778836 AS sv_2, 0.6231182869538224 AS sv_3, -0.9816426398553604 AS sv_4, -0.5498287471744446 AS sv_5, -0.5547733145281648 AS sv_6 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, -0.6014702873479287 AS dual_coeff, 1.0868888846561886 AS sv_0, -1.7110092295504902 AS sv_1, 0.1445463249358758 AS sv_2, 1.472980038260435 AS sv_3, 3.368668255499539 AS sv_4, -1.9819250597108464 AS sv_5, -0.9287047615080992 AS sv_6 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, 1.0 AS dual_coeff, -0.7056866915456456 AS sv_0, -1.6464937788564404 AS sv_1, -0.470651857385205 AS sv_2, 0.1906221711587319 AS sv_3, -0.2819348682592612 AS sv_4, 0.3204009242908391 AS sv_5, 0.16616806469487874 AS sv_6 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, -1.0 AS dual_coeff, 0.37690881073920013 AS sv_0, -1.8552039898390005 AS sv_1, 0.2547566663474474 AS sv_2, -0.4580674780316899 AS sv_3, 1.5432893026169614 AS sv_4, -0.398340501046101 AS sv_5, 0.7326875851830328 AS sv_6 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, -1.0 AS dual_coeff, -0.5506111559864147 AS sv_0, -0.9830692766477124 AS sv_1, 0.1108972486466891 AS sv_2, 1.1843957357952437 AS sv_3, -0.9129209093699034 AS sv_4, 1.4541177383423167 AS sv_5, 0.01941153139718888 AS sv_6 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, 0.4644934959582583 AS dual_coeff, -0.14720400380177598 AS sv_0, -0.8868617470462954 AS sv_1, -0.94054707025561 AS sv_2, -2.800148368002331 AS sv_3, -0.6784597572750806 AS sv_4, 1.2421270366495187 AS sv_5, -0.8211139769246166 AS sv_6 FROM rdb$database) AS "Values"), 
kernel_dp_0 AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE PRECISION)) + 0.148190711269677 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_0".dual_coeff * (kernel_input_with_scaling."PC1" * "SV_data_0".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_0".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_0".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_0".sv_3 + kernel_input_with_scaling."PC5" * "SV_data_0".sv_4 + kernel_input_with_scaling."PC6" * "SV_data_0".sv_5 + kernel_input_with_scaling."PC7" * "SV_data_0".sv_6) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_0") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t), 
"OVR_Score_0" AS 
(SELECT kernel_dp_0."KEY" AS "KEY_0", CAST(NULL AS DOUBLE PRECISION) AS "Proba_0", kernel_dp_0.dot_product AS "Score_0" 
FROM kernel_dp_0), 
"SV_data_1" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6 
FROM (SELECT 0 AS sv_idx, 1.0 AS dual_coeff, -0.6561454853307152 AS sv_0, 0.7177934238146094 AS sv_1, -0.9661902261417994 AS sv_2, -0.39854869638176665 AS sv_3, 0.5365566127105641 AS sv_4, -0.09389661704345917 AS sv_5, 0.5185787861170956 AS sv_6 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, 0.563767438646054 AS dual_coeff, -0.36210990883259775 AS sv_0, 0.7843649674922581 AS sv_1, 1.4312318260134933 AS sv_2, 2.629460560584275 AS sv_3, -1.4636872636399323 AS sv_4, -1.957336594494812 AS sv_5, 1.0232485695891342 AS sv_6 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, 0.9215905721418376 AS dual_coeff, 1.2171556411065751 AS sv_0, 0.7115506780623034 AS sv_1, -0.696696764092539 AS sv_2, 0.6901767509541269 AS sv_3, -1.8801697052771045 AS sv_4, 0.7938258567566251 AS sv_5, -0.0798133888634432 AS sv_6 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, -1.0 AS dual_coeff, 0.9236609946255624 AS sv_0, 0.07180221745314723 AS sv_1, -0.5571467220000372 AS sv_2, -1.7268854084122247 AS sv_3, -0.5517866490857157 AS sv_4, -1.417282460831504 AS sv_5, 0.2915156326706115 AS sv_6 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, 1.0 AS dual_coeff, 0.9182238221519244 AS sv_0, 0.1401196228909782 AS sv_1, -0.008819277401294215 AS sv_2, -0.2907427842376591 AS sv_3, 1.5397868680379292 AS sv_4, 0.33425284826848933 AS sv_5, 2.54020183759471 AS sv_6 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, -1.0 AS dual_coeff, -0.02188187020339541 AS sv_0, -0.07688846191150436 AS sv_1, -1.2714330053688383 AS sv_2, 0.5665327263515318 AS sv_3, -0.5646083152955992 AS sv_4, 0.5879259821616275 AS sv_5, 0.17166282655540874 AS sv_6 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, 1.0 AS dual_coeff, 1.8711535374224977 AS sv_0, -0.28117763741077345 AS sv_1, -1.4355988450296504 AS sv_2, -1.3756785696871372 AS sv_3, -1.1227908012028007 AS sv_4, 0.03679921186313172 AS sv_5, -0.772762249791748 AS sv_6 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, 1.0 AS dual_coeff, 1.4693641558195143 AS sv_0, -0.842786513083001 AS sv_1, -1.0281206718605267 AS sv_2, 0.546910348103118 AS sv_3, -0.8832378253755077 AS sv_4, 0.7956110291140098 AS sv_5, 0.3369112357768519 AS sv_6 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, 1.0 AS dual_coeff, -1.7261349996524182 AS sv_0, 0.2351463396958849 AS sv_1, 0.19852472597100068 AS sv_2, -0.1828876854404412 AS sv_3, -0.05386258161813244 AS sv_4, -1.6551196751390973 AS sv_5, 1.6642222546704235 AS sv_6 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, 0.5548632406689236 AS dual_coeff, 0.2732297131342676 AS sv_0, -0.8137870656729306 AS sv_1, 1.109538545274104 AS sv_2, -0.4466644660885919 AS sv_3, 1.0423977863922775 AS sv_4, 1.1848321692253203 AS sv_5, 0.06278936584466681 AS sv_6 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, -1.0 AS dual_coeff, 0.686133764835691 AS sv_0, -0.970756510315395 AS sv_1, 0.043170491014517975 AS sv_2, -0.09535109415803054 AS sv_3, -0.6192399741283798 AS sv_4, 1.0789555925235654 AS sv_5, 0.4220967528861776 AS sv_6 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, 0.3258237606843717 AS dual_coeff, 0.7588997506871101 AS sv_0, -0.4968506748568415 AS sv_1, 1.678677588710055 AS sv_2, 1.2595795161458023 AS sv_3, -0.06658775869658355 AS sv_4, -1.095994661450009 AS sv_5, -0.8181703120578486 AS sv_6 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, -1.0 AS dual_coeff, 0.40851844416337546 AS sv_0, -0.16778562047377388 AS sv_1, 0.8903245398933477 AS sv_2, -0.3797850662615115 AS sv_3, 0.16607277825137187 AS sv_4, 1.9784617218059055 AS sv_5, 0.407846366089412 AS sv_6 FROM rdb$database UNION ALL SELECT 13 AS sv_idx, 0.5288092887238831 AS dual_coeff, -1.792542036037742 AS sv_0, 0.6415152562565198 AS sv_1, -1.1632587695437748 AS sv_2, 2.081844283427368 AS sv_3, 0.8919559047948165 AS sv_4, 1.8236754291972928 AS sv_5, 0.6986114454514343 AS sv_6 FROM rdb$database UNION ALL SELECT 14 AS sv_idx, -1.0 AS dual_coeff, 1.1489799275947223 AS sv_0, -0.11162134252524046 AS sv_1, -0.3919713567802732 AS sv_2, -0.2597371875465321 AS sv_3, 0.6510953240149309 AS sv_4, -1.7825461483093044 AS sv_5, 0.4331644561774357 AS sv_6 FROM rdb$database UNION ALL SELECT 15 AS sv_idx, -1.0 AS dual_coeff, 0.6480361294590039 AS sv_0, -0.11545332097550183 AS sv_1, -0.3217619238237475 AS sv_2, 1.0949956752339411 AS sv_3, 0.3728608458032336 AS sv_4, -0.3956459610479332 AS sv_5, 0.8238394488577373 AS sv_6 FROM rdb$database UNION ALL SELECT 16 AS sv_idx, -0.3284092647321974 AS dual_coeff, 1.0868888846561886 AS sv_0, -1.71100922955049 AS sv_1, 0.1445463249358758 AS sv_2, 1.4729800382604348 AS sv_3, 3.3686682554995384 AS sv_4, -1.9819250597108464 AS sv_5, -0.9287047615080992 AS sv_6 FROM rdb$database UNION ALL SELECT 17 AS sv_idx, -1.0 AS dual_coeff, -0.13565086469012014 AS sv_0, -1.0503202415937147 AS sv_1, 0.6236074303335104 AS sv_2, 1.2868887113396277 AS sv_3, -0.461849488934119 AS sv_4, 1.4060871164159783 AS sv_5, 0.6823900493805904 AS sv_6 FROM rdb$database UNION ALL SELECT 18 AS sv_idx, -1.0 AS dual_coeff, 1.0807769580462963 AS sv_0, 0.1470466102103454 AS sv_1, -0.2889143912950218 AS sv_2, -0.8669482420973037 AS sv_3, -0.7362271806898507 AS sv_4, -1.852053114708404 AS sv_5, -0.6907573379712022 AS sv_6 FROM rdb$database UNION ALL SELECT 19 AS sv_idx, 1.0 AS dual_coeff, 1.9871105242217224 AS sv_0, -1.3997061096201866 AS sv_1, 0.3897698945886708 AS sv_2, -0.27784495162213063 AS sv_3, 0.08156628642684642 AS sv_4, -0.7077755621770648 AS sv_5, -2.9464882500359977 AS sv_6 FROM rdb$database UNION ALL SELECT 20 AS sv_idx, -0.7576777066266962 AS dual_coeff, 0.9582369765111732 AS sv_0, 1.0418195428709751 AS sv_1, -2.2524244247379888 AS sv_2, 0.7279980307869675 AS sv_3, -0.833290666564815 AS sv_4, -2.0117624818307895 AS sv_5, 0.4768682837154133 AS sv_6 FROM rdb$database UNION ALL SELECT 21 AS sv_idx, -0.8087673295061765 AS dual_coeff, -0.5506111559864147 AS sv_0, -0.9830692766477124 AS sv_1, 0.11089724864668912 AS sv_2, 1.1843957357952437 AS sv_3, -0.9129209093699034 AS sv_4, 1.4541177383423167 AS sv_5, 0.01941153139718888 AS sv_6 FROM rdb$database UNION ALL SELECT 22 AS sv_idx, 1.0 AS dual_coeff, 1.5481248372292007 AS sv_0, -0.5933890625013034 AS sv_1, 0.14671516819351876 AS sv_2, 0.33253329696971656 AS sv_3, -0.12127075874425128 AS sv_4, -0.4883438370352101 AS sv_5, 0.3418362006217776 AS sv_6 FROM rdb$database) AS "Values"), 
kernel_dp_1 AS 
(SELECT t_1."KEY" AS "KEY", t_1.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_1."KEY" AS "KEY", sum(CAST(full_join_data_sv_1.dot_prod1 AS DOUBLE PRECISION)) + 0.275440117638665 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1".dual_coeff * (kernel_input_with_scaling."PC1" * "SV_data_1".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_1".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_1".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_1".sv_3 + kernel_input_with_scaling."PC5" * "SV_data_1".sv_4 + kernel_input_with_scaling."PC6" * "SV_data_1".sv_5 + kernel_input_with_scaling."PC7" * "SV_data_1".sv_6) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1") AS full_join_data_sv_1 GROUP BY full_join_data_sv_1."KEY") AS t_1), 
"OVR_Score_1" AS 
(SELECT kernel_dp_1."KEY" AS "KEY_1", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1", kernel_dp_1.dot_product AS "Score_1" 
FROM kernel_dp_1), 
"SV_data_2" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6 
FROM (SELECT 0 AS sv_idx, -0.6097501179626059 AS dual_coeff, 0.9236609946255624 AS sv_0, 0.07180221745314723 AS sv_1, -0.5571467220000372 AS sv_2, -1.7268854084122247 AS sv_3, -0.5517866490857157 AS sv_4, -1.417282460831504 AS sv_5, 0.2915156326706115 AS sv_6 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, 0.4326719694776349 AS dual_coeff, 1.0747417127553935 AS sv_0, 1.3722715529031737 AS sv_1, 0.7854773838266315 AS sv_2, -0.4030651558857429 AS sv_3, -0.2451244804681255 AS sv_4, 0.7677226307253836 AS sv_5, 1.1870883679146123 AS sv_6 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, -1.0 AS dual_coeff, 0.4085184441633755 AS sv_0, -0.16778562047377388 AS sv_1, 0.8903245398933477 AS sv_2, -0.3797850662615115 AS sv_3, 0.1660727782513719 AS sv_4, 1.978461721805906 AS sv_5, 0.407846366089412 AS sv_6 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, 1.0 AS dual_coeff, 0.6278430279074162 AS sv_0, 0.18614990008211407 AS sv_1, 0.675578395928101 AS sv_2, -0.6062169640158908 AS sv_3, 0.7981243501202919 AS sv_4, -1.290117018439116 AS sv_5, 0.515158872727216 AS sv_6 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, -0.3586737666422896 AS dual_coeff, 1.0868888846561886 AS sv_0, -1.71100922955049 AS sv_1, 0.1445463249358758 AS sv_2, 1.472980038260435 AS sv_3, 3.368668255499539 AS sv_4, -1.9819250597108464 AS sv_5, -0.9287047615080992 AS sv_6 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, -1.0 AS dual_coeff, 1.0807769580462965 AS sv_0, 0.1470466102103454 AS sv_1, -0.2889143912950218 AS sv_2, -0.8669482420973036 AS sv_3, -0.7362271806898507 AS sv_4, -1.852053114708404 AS sv_5, -0.6907573379712022 AS sv_6 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, -0.01247997500386459 AS dual_coeff, -0.5506111559864147 AS sv_0, -0.9830692766477124 AS sv_1, 0.1108972486466891 AS sv_2, 1.1843957357952437 AS sv_3, -0.9129209093699034 AS sv_4, 1.4541177383423167 AS sv_5, 0.01941153139718888 AS sv_6 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, 0.9976714293240684 AS dual_coeff, 0.5544733218197831 AS sv_0, 0.08499743183529067 AS sv_1, 0.4436068231835378 AS sv_2, -0.7298881836034868 AS sv_3, -0.1389795026745959 AS sv_4, -0.8816093947484308 AS sv_5, -1.6826333840926166 AS sv_6 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, 0.550560460807057 AS dual_coeff, -0.7663809720431453 AS sv_0, -0.2418777544081048 AS sv_1, -0.6100062838676397 AS sv_2, -0.7915019959291102 AS sv_3, 0.4927541097459983 AS sv_4, 0.5620875891176889 AS sv_5, -0.3014702879926438 AS sv_6 FROM rdb$database) AS "Values"), 
kernel_dp_2 AS 
(SELECT t_2."KEY" AS "KEY", t_2.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_2."KEY" AS "KEY", sum(CAST(full_join_data_sv_2.dot_prod1 AS DOUBLE PRECISION)) + 0.415303826569026 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_2".dual_coeff * (kernel_input_with_scaling."PC1" * "SV_data_2".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_2".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_2".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_2".sv_3 + kernel_input_with_scaling."PC5" * "SV_data_2".sv_4 + kernel_input_with_scaling."PC6" * "SV_data_2".sv_5 + kernel_input_with_scaling."PC7" * "SV_data_2".sv_6) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_2") AS full_join_data_sv_2 GROUP BY full_join_data_sv_2."KEY") AS t_2), 
"OVR_Score_2" AS 
(SELECT kernel_dp_2."KEY" AS "KEY_2", CAST(NULL AS DOUBLE PRECISION) AS "Proba_2", kernel_dp_2.dot_product AS "Score_2" 
FROM kernel_dp_2), 
"SV_data_3" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6 
FROM (SELECT 0 AS sv_idx, 1.0 AS dual_coeff, -0.6561454853307152 AS sv_0, 0.7177934238146094 AS sv_1, -0.9661902261417994 AS sv_2, -0.3985486963817667 AS sv_3, 0.536556612710564 AS sv_4, -0.09389661704345917 AS sv_5, 0.5185787861170956 AS sv_6 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, 0.3973469901954832 AS dual_coeff, -0.36210990883259775 AS sv_0, 0.7843649674922581 AS sv_1, 1.4312318260134933 AS sv_2, 2.629460560584275 AS sv_3, -1.4636872636399323 AS sv_4, -1.957336594494812 AS sv_5, 1.0232485695891342 AS sv_6 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, -1.0 AS dual_coeff, 0.002361778277690275 AS sv_0, -0.2419379671349237 AS sv_1, -0.2789230887775386 AS sv_2, -0.3164297066609931 AS sv_3, 1.4453120889239068 AS sv_4, -0.2264368249696782 AS sv_5, -0.09725840719150226 AS sv_6 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, -1.0 AS dual_coeff, 0.050107294838932254 AS sv_0, -0.7199405408141479 AS sv_1, 0.2477918518809012 AS sv_2, 1.461665350953976 AS sv_3, 1.3145168898402486 AS sv_4, -0.21977276824255287 AS sv_5, -0.13861668894250775 AS sv_6 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, 0.1040561758214198 AS dual_coeff, 0.9182238221519244 AS sv_0, 0.1401196228909782 AS sv_1, -0.008819277401294215 AS sv_2, -0.2907427842376591 AS sv_3, 1.5397868680379292 AS sv_4, 0.33425284826848933 AS sv_5, 2.54020183759471 AS sv_6 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, 1.0 AS dual_coeff, -1.7261349996524185 AS sv_0, 0.2351463396958849 AS sv_1, 0.19852472597100068 AS sv_2, -0.1828876854404412 AS sv_3, -0.05386258161813244 AS sv_4, -1.6551196751390973 AS sv_5, 1.6642222546704235 AS sv_6 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, -1.0 AS dual_coeff, -1.221203423284629 AS sv_0, -0.3608574407751101 AS sv_1, 0.5386282522068156 AS sv_2, 0.657445678600048 AS sv_3, -1.8555313739248644 AS sv_4, -1.231404926797327 AS sv_5, 0.456857660664161 AS sv_6 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, 1.0 AS dual_coeff, 0.2732297131342676 AS sv_0, -0.8137870656729306 AS sv_1, 1.109538545274104 AS sv_2, -0.4466644660885919 AS sv_3, 1.0423977863922775 AS sv_4, 1.1848321692253203 AS sv_5, 0.06278936584466681 AS sv_6 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, 0.2791773042743921 AS dual_coeff, 1.058685847065344 AS sv_0, -0.06148308344444019 AS sv_1, 0.7153047894152371 AS sv_2, 0.3598760493393792 AS sv_3, -1.3225468312471715 AS sv_4, 0.6629983919688718 AS sv_5, -0.6454072755583962 AS sv_6 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, 1.0 AS dual_coeff, -0.3473049087663909 AS sv_0, 1.5873376414104325 AS sv_1, -1.8697561168540413 AS sv_2, -0.6024731800379223 AS sv_3, 1.1249060378159041 AS sv_4, 0.7319655426088918 AS sv_5, 0.8207261642849264 AS sv_6 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, 1.0 AS dual_coeff, 0.7588997506871101 AS sv_0, -0.4968506748568415 AS sv_1, 1.678677588710055 AS sv_2, 1.2595795161458023 AS sv_3, -0.06658775869658355 AS sv_4, -1.095994661450009 AS sv_5, -0.8181703120578486 AS sv_6 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, 1.0 AS dual_coeff, -1.792542036037742 AS sv_0, 0.6415152562565198 AS sv_1, -1.1632587695437748 AS sv_2, 2.081844283427368 AS sv_3, 0.8919559047948165 AS sv_4, 1.8236754291972928 AS sv_5, 0.6986114454514343 AS sv_6 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, -1.0 AS dual_coeff, -0.5056902657333177 AS sv_0, 1.7499117878375123 AS sv_1, -0.4529308336092538 AS sv_2, 1.838104172023864 AS sv_3, 0.638713842710674 AS sv_4, -0.4542609451915066 AS sv_5, 0.04586577847178762 AS sv_6 FROM rdb$database UNION ALL SELECT 13 AS sv_idx, -0.0920194945936699 AS dual_coeff, -0.37524822891033127 AS sv_0, -1.385568986660278 AS sv_1, 0.9849410529778836 AS sv_2, 0.6231182869538224 AS sv_3, -0.9816426398553602 AS sv_4, -0.5498287471744446 AS sv_5, -0.5547733145281648 AS sv_6 FROM rdb$database UNION ALL SELECT 14 AS sv_idx, -0.06253783582559871 AS dual_coeff, -0.9593073416187768 AS sv_0, -0.2687924007350037 AS sv_1, 1.1533783640996818 AS sv_2, -1.05057017239524 AS sv_3, 0.24399240199845776 AS sv_4, -0.9993435562508624 AS sv_5, 1.1425594588779424 AS sv_6 FROM rdb$database UNION ALL SELECT 15 AS sv_idx, -0.9470086799789976 AS dual_coeff, -0.14097797915161522 AS sv_0, -0.4733873191903191 AS sv_1, -0.25018851228288524 AS sv_2, -0.7625185569462175 AS sv_3, 1.9134069051057576 AS sv_4, 0.8622676230661878 AS sv_5, 0.913357674446127 AS sv_6 FROM rdb$database UNION ALL SELECT 16 AS sv_idx, -1.0 AS dual_coeff, -0.5607011756299504 AS sv_0, 0.26479299425918484 AS sv_1, -0.2368553356597597 AS sv_2, 1.2051129525494833 AS sv_3, -0.0008682905823419099 AS sv_4, 0.2572086455793289 AS sv_5, -0.6474424777903396 AS sv_6 FROM rdb$database UNION ALL SELECT 17 AS sv_idx, 0.7652477543724858 AS dual_coeff, 1.987110524221722 AS sv_0, -1.3997061096201866 AS sv_1, 0.3897698945886708 AS sv_2, -0.2778449516221306 AS sv_3, 0.08156628642684641 AS sv_4, -0.7077755621770648 AS sv_5, -2.9464882500359977 AS sv_6 FROM rdb$database UNION ALL SELECT 18 AS sv_idx, -1.0 AS dual_coeff, -0.28588832258541325 AS sv_0, 0.8714311292578749 AS sv_1, 0.8759590983041393 AS sv_2, -0.2985878710408927 AS sv_3, 0.010208729731727373 AS sv_4, 0.7177068265092533 AS sv_5, 0.8685146441635344 AS sv_6 FROM rdb$database UNION ALL SELECT 19 AS sv_idx, -0.44426221426551465 AS dual_coeff, -0.14720400380177598 AS sv_0, -0.8868617470462955 AS sv_1, -0.9405470702556098 AS sv_2, -2.800148368002331 AS sv_3, -0.6784597572750806 AS sv_4, 1.2421270366495187 AS sv_5, -0.8211139769246166 AS sv_6 FROM rdb$database) AS "Values"), 
kernel_dp_3 AS 
(SELECT t_3."KEY" AS "KEY", t_3.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_3."KEY" AS "KEY", sum(CAST(full_join_data_sv_3.dot_prod1 AS DOUBLE PRECISION)) + -0.0378741735911635 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_3".dual_coeff * (kernel_input_with_scaling."PC1" * "SV_data_3".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_3".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_3".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_3".sv_3 + kernel_input_with_scaling."PC5" * "SV_data_3".sv_4 + kernel_input_with_scaling."PC6" * "SV_data_3".sv_5 + kernel_input_with_scaling."PC7" * "SV_data_3".sv_6) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_3") AS full_join_data_sv_3 GROUP BY full_join_data_sv_3."KEY") AS t_3), 
"OVR_Score_3" AS 
(SELECT kernel_dp_3."KEY" AS "KEY_3", CAST(NULL AS DOUBLE PRECISION) AS "Proba_3", kernel_dp_3.dot_product AS "Score_3" 
FROM kernel_dp_3), 
"OVR_Join_CTE" AS 
(SELECT "OVR_Score_0"."KEY_0" AS "KEY_0", "OVR_Score_0"."Proba_0" AS "Proba_0", "OVR_Score_0"."Score_0" AS "Score_0", "OVR_Score_1"."KEY_1" AS "KEY_1", "OVR_Score_1"."Proba_1" AS "Proba_1", "OVR_Score_1"."Score_1" AS "Score_1", "OVR_Score_2"."KEY_2" AS "KEY_2", "OVR_Score_2"."Proba_2" AS "Proba_2", "OVR_Score_2"."Score_2" AS "Score_2", "OVR_Score_3"."KEY_3" AS "KEY_3", "OVR_Score_3"."Proba_3" AS "Proba_3", "OVR_Score_3"."Score_3" AS "Score_3" 
FROM "OVR_Score_0" LEFT OUTER JOIN "OVR_Score_1" ON "OVR_Score_0"."KEY_0" = "OVR_Score_1"."KEY_1" LEFT OUTER JOIN "OVR_Score_2" ON "OVR_Score_2"."KEY_2" = "OVR_Score_1"."KEY_1" LEFT OUTER JOIN "OVR_Score_3" ON "OVR_Score_3"."KEY_3" = "OVR_Score_2"."KEY_2"), 
orig_cte AS 
(SELECT "OVR_Join_CTE"."KEY_0" AS "KEY", "OVR_Join_CTE"."Score_0" AS "Score_0", "OVR_Join_CTE"."Score_1" AS "Score_1", "OVR_Join_CTE"."Score_2" AS "Score_2", "OVR_Join_CTE"."Score_3" AS "Score_3", "OVR_Join_CTE"."Proba_0" / ("OVR_Join_CTE"."Proba_0" + "OVR_Join_CTE"."Proba_1" + "OVR_Join_CTE"."Proba_2" + "OVR_Join_CTE"."Proba_3") AS "Proba_0", "OVR_Join_CTE"."Proba_1" / ("OVR_Join_CTE"."Proba_0" + "OVR_Join_CTE"."Proba_1" + "OVR_Join_CTE"."Proba_2" + "OVR_Join_CTE"."Proba_3") AS "Proba_1", "OVR_Join_CTE"."Proba_2" / ("OVR_Join_CTE"."Proba_0" + "OVR_Join_CTE"."Proba_1" + "OVR_Join_CTE"."Proba_2" + "OVR_Join_CTE"."Proba_3") AS "Proba_2", "OVR_Join_CTE"."Proba_3" / ("OVR_Join_CTE"."Proba_0" + "OVR_Join_CTE"."Proba_1" + "OVR_Join_CTE"."Proba_2" + "OVR_Join_CTE"."Proba_3") AS "Proba_3", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_2", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_3", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM "OVR_Join_CTE"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS class, orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS class, orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_max."KEY" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Score_2" AS "Score_2", arg_max_cte."Score_3" AS "Score_3", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", arg_max_cte."Proba_2" AS "Proba_2", arg_max_cte."Proba_3" AS "Proba_3", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."Proba_2" IS NULL OR arg_max_cte."Proba_2" > 0.0) THEN ln(arg_max_cte."Proba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN (arg_max_cte."Proba_3" IS NULL OR arg_max_cte."Proba_3" > 0.0) THEN ln(arg_max_cte."Proba_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", arg_max_cte."arg_max_Score" AS "Decision", CASE WHEN (arg_max_cte."arg_max_Score" = 0) THEN arg_max_cte."Proba_0" WHEN (arg_max_cte."arg_max_Score" = 1) THEN arg_max_cte."Proba_1" WHEN (arg_max_cte."arg_max_Score" = 2) THEN arg_max_cte."Proba_2" WHEN (arg_max_cte."arg_max_Score" = 3) THEN arg_max_cte."Proba_3" END AS "DecisionProba" 
FROM arg_max_cte