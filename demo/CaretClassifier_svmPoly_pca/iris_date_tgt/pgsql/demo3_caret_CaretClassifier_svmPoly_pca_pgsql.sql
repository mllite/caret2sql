-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmPoly_pca
-- Dataset : iris_date_tgt
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 5.8475) / 0.8305068311812104 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 3.040833333333333) / 0.4410636176856331 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 3.8441666666666667) / 1.7181578875675667 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 1.245833333333333) / 0.7517929083403303 AS "Feature_3" 
FROM iris_date_tgt AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.5263014514387969 + "ADS_sca_1_OUT"."Feature_1" * 0.2495430740050257 + "ADS_sca_1_OUT"."Feature_2" * -0.5822562654142306 + "ADS_sca_1_OUT"."Feature_3" * -0.5671972124538438 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.35797855187209515 + "ADS_sca_1_OUT"."Feature_1" * 0.9312088394674648 + "ADS_sca_1_OUT"."Feature_2" * 0.009350349831007576 + "ADS_sca_1_OUT"."Feature_3" * 0.06792661227568664 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.7268387018817979 + "ADS_sca_1_OUT"."Feature_1" * -0.2319858665682916 + "ADS_sca_1_OUT"."Feature_2" * -0.142090941958786 + "ADS_sca_1_OUT"."Feature_3" * -0.6306331924126783 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.2579993024404442 + "ADS_sca_1_OUT"."Feature_1" * 0.1294639302135427 + "ADS_sca_1_OUT"."Feature_2" * 0.8004376156560707 + "ADS_sca_1_OUT"."Feature_3" * -0.5253332981610163 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
kernel_input_with_scaling AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", (CAST("ADS_pre_1_OUT"."PC1" AS FLOAT) - 5.782411586589357e-20) / 1.7024643738506824 AS "PC1", (CAST("ADS_pre_1_OUT"."PC2" AS FLOAT) - -4.1251724258728475e-16) / 0.9673313864403812 AS "PC2", (CAST("ADS_pre_1_OUT"."PC3" AS FLOAT) - -9.830099697201907e-19) / 0.3786830074967196 AS "PC3", (CAST("ADS_pre_1_OUT"."PC4" AS FLOAT) - -2.532696274926138e-17) / 0.1499474054786266 AS "PC4" 
FROM "ADS_pre_1_OUT"), 
"SV_data_1789-07-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, 0.03698239332241758 AS dual_coeff, -0.2290477843222614 AS sv_0, -0.4071901395685993 AS sv_1, 0.7640377136387312 AS sv_2, -0.762821332898633 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -1.0 AS dual_coeff, 1.3197565542586798 AS sv_0, -0.4479333556302453 AS sv_1, 0.303715499171448 AS sv_2, 0.18731757446329592 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -0.6225804683504559 AS dual_coeff, 1.3597383010881399 AS sv_0, 0.208529013752129 AS sv_1, -0.17848365845964853 AS sv_2, 1.70664291646024 AS sv_3 UNION ALL SELECT 3 AS sv_idx, -1.0 AS dual_coeff, 1.1216998823056528 AS sv_0, 0.1508448490733541 AS sv_1, 0.03287412337975043 AS sv_2, -1.130049254414846 AS sv_3 UNION ALL SELECT 4 AS sv_idx, 1.0 AS dual_coeff, 0.3311720803058076 AS sv_0, -1.5318646212571527 AS sv_1, -0.4689638276281063 AS sv_2, -1.4531968887381883 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 0.0780436295325227 AS dual_coeff, -0.4766262633420692 AS sv_0, 0.5265311353535093 AS sv_1, 1.4251458952980132 AS sv_2, -0.6418671768968254 AS sv_3 UNION ALL SELECT 6 AS sv_idx, 0.8936004787998726 AS dual_coeff, -0.009184894451922408 AS sv_0, -0.1571262461630556 AS sv_1, -0.2603541692315079 AS sv_2, 1.5447730540364581 AS sv_3 UNION ALL SELECT 7 AS sv_idx, -0.24671964960617865 AS dual_coeff, 1.4419947262281017 AS sv_0, -1.0638122004046346 AS sv_1, -0.2992589914813187 AS sv_2, 0.00313214239519926 AS sv_3 UNION ALL SELECT 8 AS sv_idx, 0.24292564694509644 AS dual_coeff, -0.22490279064694457 AS sv_0, 0.8886339591253616 AS sv_1, -1.0741764680679287 AS sv_2, 0.7742770901490198 AS sv_3 UNION ALL SELECT 9 AS sv_idx, -0.4482531273784429 AS dual_coeff, 1.180964848290088 AS sv_0, -2.320024268056499 AS sv_1, 0.5655409729458527 AS sv_2, -2.155262249053796 AS sv_3 UNION ALL SELECT 10 AS sv_idx, 1.0 AS dual_coeff, 0.08585405084418343 AS sv_0, -1.0527780076245596 AS sv_1, 0.8911238859455795 AS sv_2, -0.4810347886657211 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 0.0660010967351681 AS dual_coeff, -0.3959452341354214 AS sv_0, 0.6210143972545975 AS sv_1, 0.3495675779918653 AS sv_2, 0.020085504375629268 AS sv_3) AS "Values"), 
"kernel_dp_1789-07-14T00:00:00.000000000" AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS FLOAT)) + 0.766486520398831 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-07-14T00:00:00.000000000".dual_coeff * power(0.1 * (kernel_input_with_scaling."PC1" * "SV_data_1789-07-14T00:00:00.000000000".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_1789-07-14T00:00:00.000000000".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_1789-07-14T00:00:00.000000000".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_1789-07-14T00:00:00.000000000".sv_3) + 1.0, 3.0) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1789-07-14T00:00:00.000000000") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t), 
"OVR_Score_1789-07-14T00:00:00.000000000" AS 
(SELECT "kernel_dp_1789-07-14T00:00:00.000000000"."KEY" AS "KEY_1789-07-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "Proba_1789-07-14T00:00:00.000000000", "kernel_dp_1789-07-14T00:00:00.000000000".dot_product AS "Score_1789-07-14T00:00:00.000000000" 
FROM "kernel_dp_1789-07-14T00:00:00.000000000"), 
"SV_data_1789-08-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.41822897496453226 AS dual_coeff, 1.3197565542586795 AS sv_0, -0.4479333556302453 AS sv_1, 0.303715499171448 AS sv_2, 0.18731757446329592 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -0.3868870267625282 AS dual_coeff, 1.35973830108814 AS sv_0, 0.208529013752129 AS sv_1, -0.17848365845964853 AS sv_2, 1.7066429164602397 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -0.9212947737107436 AS dual_coeff, 1.121699882305653 AS sv_0, 0.15084484907335408 AS sv_1, 0.03287412337975043 AS sv_2, -1.130049254414846 AS sv_3 UNION ALL SELECT 3 AS sv_idx, 0.03678350139057858 AS dual_coeff, -1.0892525899862582 AS sv_0, 0.7036516642633818 AS sv_1, -0.2591383229856554 AS sv_2, -3.075509578911965 AS sv_3 UNION ALL SELECT 4 AS sv_idx, 0.5368577519433659 AS dual_coeff, -0.7374549682085079 AS sv_0, -0.484564324147251 AS sv_1, 0.06102961064041459 AS sv_2, -0.9067886174962738 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 0.677038313930345 AS dual_coeff, -0.5061817232377643 AS sv_0, 0.035969749289692786 AS sv_1, -1.0271450483456157 AS sv_2, -0.008694495512959118 AS sv_3 UNION ALL SELECT 6 AS sv_idx, 0.4925658455874589 AS dual_coeff, -0.6110860518178179 AS sv_0, -0.29320221057887275 AS sv_1, 0.5430022756061417 AS sv_2, 1.3083799564314078 AS sv_3 UNION ALL SELECT 7 AS sv_idx, -0.0168346374139441 AS dual_coeff, 1.2923683459618376 AS sv_0, 1.2339206167555417 AS sv_1, -0.483760112293777 AS sv_2, 0.9361062325332176 AS sv_3) AS "Values"), 
"kernel_dp_1789-08-14T00:00:00.000000000" AS 
(SELECT t_1."KEY" AS "KEY", t_1.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_1."KEY" AS "KEY", sum(CAST(full_join_data_sv_1.dot_prod1 AS FLOAT)) + 0.352294275487715 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-08-14T00:00:00.000000000".dual_coeff * power(0.1 * (kernel_input_with_scaling."PC1" * "SV_data_1789-08-14T00:00:00.000000000".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_1789-08-14T00:00:00.000000000".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_1789-08-14T00:00:00.000000000".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_1789-08-14T00:00:00.000000000".sv_3) + 1.0, 3.0) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1789-08-14T00:00:00.000000000") AS full_join_data_sv_1 GROUP BY full_join_data_sv_1."KEY") AS t_1), 
"OVR_Score_1789-08-14T00:00:00.000000000" AS 
(SELECT "kernel_dp_1789-08-14T00:00:00.000000000"."KEY" AS "KEY_1789-08-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "Proba_1789-08-14T00:00:00.000000000", "kernel_dp_1789-08-14T00:00:00.000000000".dot_product AS "Score_1789-08-14T00:00:00.000000000" 
FROM "kernel_dp_1789-08-14T00:00:00.000000000"), 
"SV_data_1789-09-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -1.0 AS dual_coeff, -0.3467508079212669 AS sv_0, -0.2119974770220477 AS sv_1, -0.15819006920484815 AS sv_2, 0.261524404362658 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -1.0 AS dual_coeff, -0.10540702318024228 AS sv_0, -1.3293206464383127 AS sv_1, -0.20594023142806456 AS sv_2, -0.10703336828000429 AS sv_3 UNION ALL SELECT 2 AS sv_idx, 1.0 AS dual_coeff, -0.8605510005635174 AS sv_0, 0.27969751982132807 AS sv_1, -0.4019788850352463 AS sv_2, -0.733837732812117 AS sv_3 UNION ALL SELECT 3 AS sv_idx, 0.06291150636754685 AS dual_coeff, -0.6354658508918914 AS sv_0, -0.6968953111054446 AS sv_1, -1.359713424717213 AS sv_2, 0.2844487562226476 AS sv_3 UNION ALL SELECT 4 AS sv_idx, 1.0 AS dual_coeff, -0.5633103896390681 AS sv_0, 0.08109165235018401 AS sv_1, -0.8178736357731226 AS sv_2, 0.09481967641150019 AS sv_3 UNION ALL SELECT 5 AS sv_idx, -1.0 AS dual_coeff, -0.16462539018501227 AS sv_0, -0.17197653917801864 AS sv_1, -1.221524981126167 AS sv_2, 1.2859756100512512 AS sv_3 UNION ALL SELECT 6 AS sv_idx, -1.0 AS dual_coeff, -0.4096160387940097 AS sv_0, 0.8051788785127104 AS sv_1, -0.2856291778067481 AS sv_2, 0.5783778252567429 AS sv_3 UNION ALL SELECT 7 AS sv_idx, 0.7625756412115418 AS dual_coeff, -0.15885840159671633 AS sv_0, -1.556501926411469 AS sv_1, -2.587854078680349 AS sv_2, 0.825406561453712 AS sv_3 UNION ALL SELECT 8 AS sv_idx, -0.7362225494054027 AS dual_coeff, -0.1718725189412923 AS sv_0, -1.7658370524986495 AS sv_1, 0.0718484009342381 AS sv_2, -0.4985395211307865 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 1.0 AS dual_coeff, -1.1319626242616307 AS sv_0, -0.7377801841458396 AS sv_1, 1.0667102114799558 AS sv_2, 0.669205438552054 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -1.0 AS dual_coeff, 0.04831775178167375 AS sv_0, -1.0177043550349694 AS sv_1, -1.3767353921902683 AS sv_2, 0.1292949809373294 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 1.0 AS dual_coeff, -0.7741800058650958 AS sv_0, 0.7156513391177087 AS sv_1, -0.6579287810350012 AS sv_2, -0.6530202842015935 AS sv_3 UNION ALL SELECT 12 AS sv_idx, 1.0 AS dual_coeff, -0.7374549682085078 AS sv_0, -0.4845643241472509 AS sv_1, 0.06102961064041459 AS sv_2, -0.9067886174962738 AS sv_3 UNION ALL SELECT 13 AS sv_idx, 0.3295253398129857 AS dual_coeff, -1.1252602242923606 AS sv_0, 1.0139489920759266 AS sv_1, 1.20632327016201 AS sv_2, 1.6249817204313048 AS sv_3 UNION ALL SELECT 14 AS sv_idx, 1.0 AS dual_coeff, -0.5286750525859466 AS sv_0, -0.006901806714972248 AS sv_1, -1.3237714063682993 AS sv_2, 1.130546149523611 AS sv_3 UNION ALL SELECT 15 AS sv_idx, -0.523079788483837 AS dual_coeff, -0.6538263780128066 AS sv_0, -1.6506862656401555 AS sv_1, 1.2762904419332939 AS sv_2, -1.52309619524668 AS sv_3 UNION ALL SELECT 16 AS sv_idx, 1.0 AS dual_coeff, -0.8103279650090582 AS sv_0, -0.044109810739219005 AS sv_1, -0.36963017625972133 AS sv_2, 1.6595384650363063 AS sv_3 UNION ALL SELECT 17 AS sv_idx, 1.0 AS dual_coeff, -0.5061817232377643 AS sv_0, 0.03596974928969279 AS sv_1, -1.0271450483456157 AS sv_2, -0.008694495512959118 AS sv_3 UNION ALL SELECT 18 AS sv_idx, 1.0 AS dual_coeff, -0.6110860518178179 AS sv_0, -0.29320221057887275 AS sv_1, 0.5430022756061417 AS sv_2, 1.3083799564314078 AS sv_3 UNION ALL SELECT 19 AS sv_idx, 1.0 AS dual_coeff, -0.8316360531190267 AS sv_0, 0.2627044381200628 AS sv_1, -0.024465458208240958 AS sv_2, 1.1302537725898394 AS sv_3 UNION ALL SELECT 20 AS sv_idx, 1.0 AS dual_coeff, -0.9791423086649674 AS sv_0, 1.0357441163212526 AS sv_1, -0.6871500354786788 AS sv_2, 0.5265032566931478 AS sv_3 UNION ALL SELECT 21 AS sv_idx, 0.43394558328621863 AS dual_coeff, -0.6354658508918914 AS sv_0, -0.6968953111054446 AS sv_1, -1.359713424717213 AS sv_2, 0.2844487562226476 AS sv_3 UNION ALL SELECT 22 AS sv_idx, 0.3390635615706725 AS dual_coeff, -1.0632832779220625 AS sv_0, 0.5576265704945415 AS sv_1, 1.9708190111640569 AS sv_2, 1.5441235517811938 AS sv_3 UNION ALL SELECT 23 AS sv_idx, -1.0 AS dual_coeff, -0.4024930600127821 AS sv_0, 0.42792683905349516 AS sv_1, -1.536043829642959 AS sv_2, 0.589986189653623 AS sv_3 UNION ALL SELECT 24 AS sv_idx, -0.9333457458230092 AS dual_coeff, -0.22490279064694454 AS sv_0, 0.8886339591253617 AS sv_1, -1.0741764680679287 AS sv_2, 0.7742770901490199 AS sv_3 UNION ALL SELECT 25 AS sv_idx, -1.0 AS dual_coeff, -0.5806584822824865 AS sv_0, 0.5375593166419463 AS sv_1, 1.138114868253046 AS sv_2, -0.17581376051664788 AS sv_3 UNION ALL SELECT 26 AS sv_idx, -1.0 AS dual_coeff, -0.67097329758465 AS sv_0, -0.9491019931972904 AS sv_1, 1.0033626968746907 AS sv_2, 0.09974331867472287 AS sv_3 UNION ALL SELECT 27 AS sv_idx, 1.0 AS dual_coeff, -0.6789075377717992 AS sv_0, -1.7369919644134428 AS sv_1, 0.704876462250472 AS sv_2, 0.4446963905862061 AS sv_3 UNION ALL SELECT 28 AS sv_idx, -1.0 AS dual_coeff, -0.37946925113163943 AS sv_0, -0.1756534081941675 AS sv_1, 0.25075742496242187 AS sv_2, 1.1417399768679672 AS sv_3 UNION ALL SELECT 29 AS sv_idx, -0.6534378190294636 AS dual_coeff, -0.09017905525714784 AS sv_0, -0.26109517177108804 AS sv_1, -1.6837452789962486 AS sv_2, 1.7003246746828506 AS sv_3 UNION ALL SELECT 30 AS sv_idx, -1.0 AS dual_coeff, -0.7622391712317312 AS sv_0, 0.33966971589678224 AS sv_1, 0.7684633394319059 AS sv_2, -0.371526116902454 AS sv_3 UNION ALL SELECT 31 AS sv_idx, -1.0 AS dual_coeff, -0.2165783957646952 AS sv_0, -0.03998635058028351 AS sv_1, -0.4626783252333973 AS sv_2, -0.26761409961692223 AS sv_3 UNION ALL SELECT 32 AS sv_idx, 0.8666694606780595 AS dual_coeff, -1.3968587718079994 AS sv_0, 0.2399378203088459 AS sv_1, 1.9807672784368275 AS sv_2, 0.27229635799780355 AS sv_3 UNION ALL SELECT 33 AS sv_idx, 1.0 AS dual_coeff, -0.8986158535502288 AS sv_0, -0.4284142397983223 AS sv_1, -0.01673000383205732 AS sv_2, -0.33722102919164065 AS sv_3 UNION ALL SELECT 34 AS sv_idx, -1.0 AS dual_coeff, -0.32407055475555924 AS sv_0, -0.41259245321747107 AS sv_1, 0.8326813770582218 AS sv_2, 1.8780122931237608 AS sv_3 UNION ALL SELECT 35 AS sv_idx, 1.0 AS dual_coeff, -0.8681416850352318 AS sv_0, -0.911177722447064 AS sv_1, 0.09546468868284567 AS sv_2, -1.4536187624473933 AS sv_3 UNION ALL SELECT 36 AS sv_idx, -0.9486051901853124 AS dual_coeff, -0.3959452341354214 AS sv_0, 0.6210143972545975 AS sv_1, 0.3495675779918653 AS sv_2, 0.02008550437562927 AS sv_3 UNION ALL SELECT 37 AS sv_idx, -1.0 AS dual_coeff, -0.6949158150850943 AS sv_0, 0.6278031227629293 AS sv_1, 1.556657693398034 AS sv_2, 0.031214583332265795 AS sv_3) AS "Values"), 
"kernel_dp_1789-09-14T00:00:00.000000000" AS 
(SELECT t_2."KEY" AS "KEY", t_2.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_2."KEY" AS "KEY", sum(CAST(full_join_data_sv_2.dot_prod1 AS FLOAT)) + -1.54088002264008 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-09-14T00:00:00.000000000".dual_coeff * power(0.1 * (kernel_input_with_scaling."PC1" * "SV_data_1789-09-14T00:00:00.000000000".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_1789-09-14T00:00:00.000000000".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_1789-09-14T00:00:00.000000000".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_1789-09-14T00:00:00.000000000".sv_3) + 1.0, 3.0) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1789-09-14T00:00:00.000000000") AS full_join_data_sv_2 GROUP BY full_join_data_sv_2."KEY") AS t_2), 
"OVR_Score_1789-09-14T00:00:00.000000000" AS 
(SELECT "kernel_dp_1789-09-14T00:00:00.000000000"."KEY" AS "KEY_1789-09-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "Proba_1789-09-14T00:00:00.000000000", "kernel_dp_1789-09-14T00:00:00.000000000".dot_product AS "Score_1789-09-14T00:00:00.000000000" 
FROM "kernel_dp_1789-09-14T00:00:00.000000000"), 
"OVR_Join_CTE" AS 
(SELECT "OVR_Score_1789-07-14T00:00:00.000000000"."KEY_1789-07-14T00:00:00.000000000" AS "KEY_1789-07-14T00:00:00.000000000", "OVR_Score_1789-07-14T00:00:00.000000000"."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", "OVR_Score_1789-07-14T00:00:00.000000000"."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", "OVR_Score_1789-08-14T00:00:00.000000000"."KEY_1789-08-14T00:00:00.000000000" AS "KEY_1789-08-14T00:00:00.000000000", "OVR_Score_1789-08-14T00:00:00.000000000"."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", "OVR_Score_1789-08-14T00:00:00.000000000"."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", "OVR_Score_1789-09-14T00:00:00.000000000"."KEY_1789-09-14T00:00:00.000000000" AS "KEY_1789-09-14T00:00:00.000000000", "OVR_Score_1789-09-14T00:00:00.000000000"."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", "OVR_Score_1789-09-14T00:00:00.000000000"."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000" 
FROM "OVR_Score_1789-07-14T00:00:00.000000000" LEFT OUTER JOIN "OVR_Score_1789-08-14T00:00:00.000000000" ON "OVR_Score_1789-07-14T00:00:00.000000000"."KEY_1789-07-14T00:00:00.000000000" = "OVR_Score_1789-08-14T00:00:00.000000000"."KEY_1789-08-14T00:00:00.000000000" LEFT OUTER JOIN "OVR_Score_1789-09-14T00:00:00.000000000" ON "OVR_Score_1789-09-14T00:00:00.000000000"."KEY_1789-09-14T00:00:00.000000000" = "OVR_Score_1789-08-14T00:00:00.000000000"."KEY_1789-08-14T00:00:00.000000000"), 
orig_cte AS 
(SELECT "OVR_Join_CTE"."KEY_1789-07-14T00:00:00.000000000" AS "KEY", "OVR_Join_CTE"."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", "OVR_Join_CTE"."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", "OVR_Join_CTE"."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", "OVR_Join_CTE"."Proba_1789-07-14T00:00:00.000000000" / ("OVR_Join_CTE"."Proba_1789-07-14T00:00:00.000000000" + "OVR_Join_CTE"."Proba_1789-08-14T00:00:00.000000000" + "OVR_Join_CTE"."Proba_1789-09-14T00:00:00.000000000") AS "Proba_1789-07-14T00:00:00.000000000", "OVR_Join_CTE"."Proba_1789-08-14T00:00:00.000000000" / ("OVR_Join_CTE"."Proba_1789-07-14T00:00:00.000000000" + "OVR_Join_CTE"."Proba_1789-08-14T00:00:00.000000000" + "OVR_Join_CTE"."Proba_1789-09-14T00:00:00.000000000") AS "Proba_1789-08-14T00:00:00.000000000", "OVR_Join_CTE"."Proba_1789-09-14T00:00:00.000000000" / ("OVR_Join_CTE"."Proba_1789-07-14T00:00:00.000000000" + "OVR_Join_CTE"."Proba_1789-08-14T00:00:00.000000000" + "OVR_Join_CTE"."Proba_1789-09-14T00:00:00.000000000") AS "Proba_1789-09-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "LogProba_1789-07-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "LogProba_1789-08-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "LogProba_1789-09-14T00:00:00.000000000", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
FROM "OVR_Join_CTE"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", '1789-07-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-08-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", '1789-09-14T00:00:00.000000000' AS class, orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", orig_cte."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", orig_cte."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", orig_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", orig_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", orig_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", orig_cte."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", orig_cte."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", orig_cte."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", score_max."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", score_max."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", score_max."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", score_max."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", score_max."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", score_max."LogProba_1789-07-14T00:00:00.000000000" AS "LogProba_1789-07-14T00:00:00.000000000", score_max."LogProba_1789-08-14T00:00:00.000000000" AS "LogProba_1789-08-14T00:00:00.000000000", score_max."LogProba_1789-09-14T00:00:00.000000000" AS "LogProba_1789-09-14T00:00:00.000000000", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_max."KEY" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_1789-07-14T00:00:00.000000000" AS "Score_1789-07-14T00:00:00.000000000", arg_max_cte."Score_1789-08-14T00:00:00.000000000" AS "Score_1789-08-14T00:00:00.000000000", arg_max_cte."Score_1789-09-14T00:00:00.000000000" AS "Score_1789-09-14T00:00:00.000000000", arg_max_cte."Proba_1789-07-14T00:00:00.000000000" AS "Proba_1789-07-14T00:00:00.000000000", arg_max_cte."Proba_1789-08-14T00:00:00.000000000" AS "Proba_1789-08-14T00:00:00.000000000", arg_max_cte."Proba_1789-09-14T00:00:00.000000000" AS "Proba_1789-09-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-07-14T00:00:00.000000000" IS NULL OR arg_max_cte."Proba_1789-07-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."Proba_1789-07-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-07-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-08-14T00:00:00.000000000" IS NULL OR arg_max_cte."Proba_1789-08-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."Proba_1789-08-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-08-14T00:00:00.000000000", CASE WHEN (arg_max_cte."Proba_1789-09-14T00:00:00.000000000" IS NULL OR arg_max_cte."Proba_1789-09-14T00:00:00.000000000" > 0.0) THEN ln(arg_max_cte."Proba_1789-09-14T00:00:00.000000000") ELSE -1.79769313486231e+308 END AS "LogProba_1789-09-14T00:00:00.000000000", arg_max_cte."arg_max_Score" AS "Decision", CASE WHEN (arg_max_cte."arg_max_Score" = '1789-07-14T00:00:00.000000000') THEN arg_max_cte."Proba_1789-07-14T00:00:00.000000000" WHEN (arg_max_cte."arg_max_Score" = '1789-08-14T00:00:00.000000000') THEN arg_max_cte."Proba_1789-08-14T00:00:00.000000000" WHEN (arg_max_cte."arg_max_Score" = '1789-09-14T00:00:00.000000000') THEN arg_max_cte."Proba_1789-09-14T00:00:00.000000000" END AS "DecisionProba" 
FROM arg_max_cte