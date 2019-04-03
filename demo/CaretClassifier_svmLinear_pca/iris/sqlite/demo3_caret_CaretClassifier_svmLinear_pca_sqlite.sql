-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmLinear_pca
-- Dataset : iris
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 5.8475) / 0.8305068311812104 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 3.040833333333333) / 0.4410636176856331 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 3.8441666666666667) / 1.7181578875675667 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 1.245833333333333) / 0.7517929083403303 AS "Feature_3" 
FROM iris AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.5263014514387969 + "ADS_sca_1_OUT"."Feature_1" * 0.2495430740050257 + "ADS_sca_1_OUT"."Feature_2" * -0.5822562654142306 + "ADS_sca_1_OUT"."Feature_3" * -0.5671972124538438 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.35797855187209515 + "ADS_sca_1_OUT"."Feature_1" * 0.9312088394674648 + "ADS_sca_1_OUT"."Feature_2" * 0.009350349831007576 + "ADS_sca_1_OUT"."Feature_3" * 0.06792661227568664 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.7268387018817979 + "ADS_sca_1_OUT"."Feature_1" * -0.2319858665682916 + "ADS_sca_1_OUT"."Feature_2" * -0.142090941958786 + "ADS_sca_1_OUT"."Feature_3" * -0.6306331924126783 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.2579993024404442 + "ADS_sca_1_OUT"."Feature_1" * 0.1294639302135427 + "ADS_sca_1_OUT"."Feature_2" * 0.8004376156560707 + "ADS_sca_1_OUT"."Feature_3" * -0.5253332981610163 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
kernel_input_with_scaling AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", (CAST("ADS_pre_1_OUT"."PC1" AS FLOAT) - 5.782411586589357e-20) / 1.7024643738506824 AS "PC1", (CAST("ADS_pre_1_OUT"."PC2" AS FLOAT) - -4.1251724258728475e-16) / 0.9673313864403812 AS "PC2", (CAST("ADS_pre_1_OUT"."PC3" AS FLOAT) - -9.830099697201907e-19) / 0.3786830074967196 AS "PC3", (CAST("ADS_pre_1_OUT"."PC4" AS FLOAT) - -2.532696274926138e-17) / 0.1499474054786266 AS "PC4" 
FROM "ADS_pre_1_OUT"), 
"SV_data_0" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.3871628300594355 AS dual_coeff, 1.3597383010881399 AS sv_0, 0.208529013752129 AS sv_1, -0.17848365845964853 AS sv_2, 1.70664291646024 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -0.4340580718457307 AS dual_coeff, 1.1216998823056528 AS sv_0, 0.1508448490733541 AS sv_1, 0.03287412337975043 AS sv_2, -1.1300492544148462 AS sv_3 UNION ALL SELECT 2 AS sv_idx, 1.0 AS dual_coeff, 0.3311720803058076 AS sv_0, -1.5318646212571527 AS sv_1, -0.4689638276281063 AS sv_2, -1.453196888738188 AS sv_3 UNION ALL SELECT 3 AS sv_idx, -1.0 AS dual_coeff, 1.180964848290088 AS sv_0, -2.320024268056499 AS sv_1, 0.5655409729458527 AS sv_2, -2.155262249053796 AS sv_3 UNION ALL SELECT 4 AS sv_idx, 0.8212209019051661 AS dual_coeff, 0.08585405084418345 AS sv_0, -1.0527780076245596 AS sv_1, 0.8911238859455795 AS sv_2, -0.4810347886657211 AS sv_3) AS "Values"), 
kernel_dp_0 AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS FLOAT)) + 1.20650259236498 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_0".dual_coeff * (kernel_input_with_scaling."PC1" * "SV_data_0".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_0".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_0".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_0".sv_3) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_0") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t), 
"OVR_Score_0" AS 
(SELECT kernel_dp_0."KEY" AS "KEY_0", CAST(NULL AS FLOAT) AS "Proba_0", kernel_dp_0.dot_product AS "Score_0" 
FROM kernel_dp_0), 
"SV_data_1" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.33678279324069904 AS dual_coeff, 1.35973830108814 AS sv_0, 0.208529013752129 AS sv_1, -0.17848365845964853 AS sv_2, 1.7066429164602397 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -0.21766446152449825 AS dual_coeff, 1.121699882305653 AS sv_0, 0.15084484907335408 AS sv_1, 0.03287412337975043 AS sv_2, -1.130049254414846 AS sv_3 UNION ALL SELECT 2 AS sv_idx, 0.3254915037238013 AS dual_coeff, -0.5061817232377643 AS sv_0, 0.035969749289692786 AS sv_1, -1.0271450483456157 AS sv_2, -0.008694495512959118 AS sv_3 UNION ALL SELECT 3 AS sv_idx, 0.2612515072295326 AS dual_coeff, -0.6110860518178179 AS sv_0, -0.29320221057887275 AS sv_1, 0.5430022756061417 AS sv_2, 1.3083799564314078 AS sv_3 UNION ALL SELECT 4 AS sv_idx, -0.03229575618813653 AS dual_coeff, 1.180964848290088 AS sv_0, -2.320024268056499 AS sv_1, 0.5655409729458527 AS sv_2, -2.155262249053796 AS sv_3) AS "Values"), 
kernel_dp_1 AS 
(SELECT t_1."KEY" AS "KEY", t_1.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_1."KEY" AS "KEY", sum(CAST(full_join_data_sv_1.dot_prod1 AS FLOAT)) + 0.303089847222113 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1".dual_coeff * (kernel_input_with_scaling."PC1" * "SV_data_1".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_1".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_1".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_1".sv_3) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1") AS full_join_data_sv_1 GROUP BY full_join_data_sv_1."KEY") AS t_1), 
"OVR_Score_1" AS 
(SELECT kernel_dp_1."KEY" AS "KEY_1", CAST(NULL AS FLOAT) AS "Proba_1", kernel_dp_1.dot_product AS "Score_1" 
FROM kernel_dp_1), 
"SV_data_2" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -1.0 AS dual_coeff, -0.3467508079212669 AS sv_0, -0.2119974770220477 AS sv_1, -0.15819006920484815 AS sv_2, 0.261524404362658 AS sv_3 UNION ALL SELECT 1 AS sv_idx, 1.0 AS dual_coeff, -0.8605510005635174 AS sv_0, 0.27969751982132807 AS sv_1, -0.4019788850352463 AS sv_2, -0.733837732812117 AS sv_3 UNION ALL SELECT 2 AS sv_idx, 1.0 AS dual_coeff, -0.5633103896390681 AS sv_0, 0.08109165235018401 AS sv_1, -0.8178736357731226 AS sv_2, 0.09481967641150019 AS sv_3 UNION ALL SELECT 3 AS sv_idx, -1.0 AS dual_coeff, -0.16462539018501227 AS sv_0, -0.17197653917801864 AS sv_1, -1.221524981126167 AS sv_2, 1.2859756100512512 AS sv_3 UNION ALL SELECT 4 AS sv_idx, -1.0 AS dual_coeff, -0.4096160387940097 AS sv_0, 0.8051788785127104 AS sv_1, -0.2856291778067481 AS sv_2, 0.5783778252567429 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 1.0 AS dual_coeff, -0.15885840159671633 AS sv_0, -1.556501926411469 AS sv_1, -2.587854078680349 AS sv_2, 0.825406561453712 AS sv_3 UNION ALL SELECT 6 AS sv_idx, -0.991194458812572 AS dual_coeff, -0.10748054892090064 AS sv_0, -1.118152517348885 AS sv_1, -0.21067467510208224 AS sv_2, 1.79748722144701 AS sv_3 UNION ALL SELECT 7 AS sv_idx, 1.0 AS dual_coeff, -0.7741800058650958 AS sv_0, 0.7156513391177087 AS sv_1, -0.6579287810350012 AS sv_2, -0.6530202842015935 AS sv_3 UNION ALL SELECT 8 AS sv_idx, 1.0 AS dual_coeff, -0.7374549682085078 AS sv_0, -0.4845643241472509 AS sv_1, 0.06102961064041459 AS sv_2, -0.9067886174962738 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 0.5249418316834058 AS dual_coeff, -1.1252602242923606 AS sv_0, 1.0139489920759266 AS sv_1, 1.20632327016201 AS sv_2, 1.6249817204313048 AS sv_3 UNION ALL SELECT 10 AS sv_idx, 1.0 AS dual_coeff, -0.5286750525859466 AS sv_0, -0.006901806714972248 AS sv_1, -1.3237714063682993 AS sv_2, 1.130546149523611 AS sv_3 UNION ALL SELECT 11 AS sv_idx, -1.0 AS dual_coeff, -0.17968260915338966 AS sv_0, -0.5826144709349556 AS sv_1, -0.26959656391417275 AS sv_2, 1.6193203175658533 AS sv_3 UNION ALL SELECT 12 AS sv_idx, -1.0 AS dual_coeff, -0.6538263780128066 AS sv_0, -1.6506862656401555 AS sv_1, 1.2762904419332939 AS sv_2, -1.52309619524668 AS sv_3 UNION ALL SELECT 13 AS sv_idx, 1.0 AS dual_coeff, -0.5061817232377643 AS sv_0, 0.03596974928969279 AS sv_1, -1.0271450483456157 AS sv_2, -0.008694495512959118 AS sv_3 UNION ALL SELECT 14 AS sv_idx, 1.0 AS dual_coeff, -0.6583169852095577 AS sv_0, -0.825364736409063 AS sv_1, 0.4708917462429462 AS sv_2, 3.3506790857541064 AS sv_3 UNION ALL SELECT 15 AS sv_idx, 1.0 AS dual_coeff, -0.6110860518178179 AS sv_0, -0.29320221057887275 AS sv_1, 0.5430022756061417 AS sv_2, 1.3083799564314078 AS sv_3 UNION ALL SELECT 16 AS sv_idx, 1.0 AS dual_coeff, -0.8316360531190267 AS sv_0, 0.2627044381200628 AS sv_1, -0.024465458208240958 AS sv_2, 1.1302537725898394 AS sv_3 UNION ALL SELECT 17 AS sv_idx, 1.0 AS dual_coeff, -1.0632832779220625 AS sv_0, 0.5576265704945415 AS sv_1, 1.9708190111640569 AS sv_2, 1.5441235517811938 AS sv_3 UNION ALL SELECT 18 AS sv_idx, -1.0 AS dual_coeff, -0.4024930600127821 AS sv_0, 0.42792683905349516 AS sv_1, -1.536043829642959 AS sv_2, 0.589986189653623 AS sv_3 UNION ALL SELECT 19 AS sv_idx, -0.9162480358821468 AS dual_coeff, -0.22490279064694454 AS sv_0, 0.8886339591253617 AS sv_1, -1.0741764680679287 AS sv_2, 0.7742770901490199 AS sv_3 UNION ALL SELECT 20 AS sv_idx, -1.0 AS dual_coeff, -0.67097329758465 AS sv_0, -0.9491019931972904 AS sv_1, 1.0033626968746907 AS sv_2, 0.09974331867472287 AS sv_3 UNION ALL SELECT 21 AS sv_idx, 1.0 AS dual_coeff, -0.6789075377717992 AS sv_0, -1.7369919644134428 AS sv_1, 0.704876462250472 AS sv_2, 0.4446963905862061 AS sv_3 UNION ALL SELECT 22 AS sv_idx, -1.0 AS dual_coeff, -0.37946925113163943 AS sv_0, -0.1756534081941675 AS sv_1, 0.25075742496242187 AS sv_2, 1.1417399768679672 AS sv_3 UNION ALL SELECT 23 AS sv_idx, -1.0 AS dual_coeff, -0.09017905525714784 AS sv_0, -0.26109517177108804 AS sv_1, -1.6837452789962486 AS sv_2, 1.7003246746828506 AS sv_3 UNION ALL SELECT 24 AS sv_idx, -1.0 AS dual_coeff, -0.7622391712317312 AS sv_0, 0.33966971589678224 AS sv_1, 0.7684633394319059 AS sv_2, -0.371526116902454 AS sv_3 UNION ALL SELECT 25 AS sv_idx, 0.2041189831838405 AS dual_coeff, -0.8681416850352318 AS sv_0, -0.911177722447064 AS sv_1, 0.09546468868284567 AS sv_2, -1.4536187624473933 AS sv_3 UNION ALL SELECT 26 AS sv_idx, -0.8216183201725278 AS dual_coeff, -0.6949158150850943 AS sv_0, 0.6278031227629293 AS sv_1, 1.556657693398034 AS sv_2, 0.031214583332265795 AS sv_3) AS "Values"), 
kernel_dp_2 AS 
(SELECT t_2."KEY" AS "KEY", t_2.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_2."KEY" AS "KEY", sum(CAST(full_join_data_sv_2.dot_prod1 AS FLOAT)) + -2.34401512640349 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_2".dual_coeff * (kernel_input_with_scaling."PC1" * "SV_data_2".sv_0 + kernel_input_with_scaling."PC2" * "SV_data_2".sv_1 + kernel_input_with_scaling."PC3" * "SV_data_2".sv_2 + kernel_input_with_scaling."PC4" * "SV_data_2".sv_3) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_2") AS full_join_data_sv_2 GROUP BY full_join_data_sv_2."KEY") AS t_2), 
"OVR_Score_2" AS 
(SELECT kernel_dp_2."KEY" AS "KEY_2", CAST(NULL AS FLOAT) AS "Proba_2", kernel_dp_2.dot_product AS "Score_2" 
FROM kernel_dp_2), 
"OVR_Join_CTE" AS 
(SELECT "OVR_Score_0"."KEY_0" AS "KEY_0", "OVR_Score_0"."Proba_0" AS "Proba_0", "OVR_Score_0"."Score_0" AS "Score_0", "OVR_Score_1"."KEY_1" AS "KEY_1", "OVR_Score_1"."Proba_1" AS "Proba_1", "OVR_Score_1"."Score_1" AS "Score_1", "OVR_Score_2"."KEY_2" AS "KEY_2", "OVR_Score_2"."Proba_2" AS "Proba_2", "OVR_Score_2"."Score_2" AS "Score_2" 
FROM "OVR_Score_0" LEFT OUTER JOIN "OVR_Score_1" ON "OVR_Score_0"."KEY_0" = "OVR_Score_1"."KEY_1" LEFT OUTER JOIN "OVR_Score_2" ON "OVR_Score_2"."KEY_2" = "OVR_Score_1"."KEY_1"), 
orig_cte AS 
(SELECT "OVR_Join_CTE"."KEY_0" AS "KEY", "OVR_Join_CTE"."Score_0" AS "Score_0", "OVR_Join_CTE"."Score_1" AS "Score_1", "OVR_Join_CTE"."Score_2" AS "Score_2", "OVR_Join_CTE"."Proba_0" / ("OVR_Join_CTE"."Proba_0" + "OVR_Join_CTE"."Proba_1" + "OVR_Join_CTE"."Proba_2") AS "Proba_0", "OVR_Join_CTE"."Proba_1" / ("OVR_Join_CTE"."Proba_0" + "OVR_Join_CTE"."Proba_1" + "OVR_Join_CTE"."Proba_2") AS "Proba_1", "OVR_Join_CTE"."Proba_2" / ("OVR_Join_CTE"."Proba_0" + "OVR_Join_CTE"."Proba_1" + "OVR_Join_CTE"."Proba_2") AS "Proba_2", CAST(NULL AS FLOAT) AS "LogProba_0", CAST(NULL AS FLOAT) AS "LogProba_1", CAST(NULL AS FLOAT) AS "LogProba_2", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
FROM "OVR_Join_CTE"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS class, orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_max."KEY" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Score_2" AS "Score_2", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", arg_max_cte."Proba_2" AS "Proba_2", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."Proba_2" IS NULL OR arg_max_cte."Proba_2" > 0.0) THEN ln(arg_max_cte."Proba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", arg_max_cte."arg_max_Score" AS "Decision", CASE WHEN (arg_max_cte."arg_max_Score" = 0) THEN arg_max_cte."Proba_0" WHEN (arg_max_cte."arg_max_Score" = 1) THEN arg_max_cte."Proba_1" WHEN (arg_max_cte."arg_max_Score" = 2) THEN arg_max_cte."Proba_2" END AS "DecisionProba" 
FROM arg_max_cte