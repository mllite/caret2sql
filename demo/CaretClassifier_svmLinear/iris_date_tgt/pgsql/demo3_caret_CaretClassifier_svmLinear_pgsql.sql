-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmLinear
-- Dataset : iris_date_tgt
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 5.8475) / 0.8305068311812105 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 3.040833333333333) / 0.4410636176856331 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 3.8441666666666667) / 1.7181578875675667 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 1.245833333333333) / 0.7517929083403303 AS "Feature_3" 
FROM iris_date_tgt AS "ADS"), 
"SV_data_1789-07-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.3353889323240217 AS dual_coeff, -0.9000528014162733 AS sv_0, 0.5875947511304064 AS sv_1, -1.2479450708119786 AS sv_2, -0.992072850194672 AS sv_3 UNION ALL SELECT 1 AS sv_idx, 0.9200926024851172 AS dual_coeff, -0.9000528014162733 AS sv_0, -1.2262025513943229 AS sv_1, -0.4913207760328543 AS sv_2, -0.1939807248983995 AS sv_3 UNION ALL SELECT 2 AS sv_idx, 0.030998909816682168 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.452927214209914 AS sv_1, -0.3167151695453643 AS sv_2, -0.326996079114445 AS sv_3 UNION ALL SELECT 3 AS sv_idx, -0.6157025799777774 AS dual_coeff, -1.6225032105798365 AS sv_0, -1.6796518770255056 AS sv_1, -1.480752546128632 AS sv_2, -1.2581035586267628 AS sv_3) AS "Values"), 
"kernel_dp_1789-07-14T00:00:00.000000000" AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS FLOAT)) + 1.58630870429677 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-07-14T00:00:00.000000000".dual_coeff * (kernel_input_with_scaling."Feature_0" * "SV_data_1789-07-14T00:00:00.000000000".sv_0 + kernel_input_with_scaling."Feature_1" * "SV_data_1789-07-14T00:00:00.000000000".sv_1 + kernel_input_with_scaling."Feature_2" * "SV_data_1789-07-14T00:00:00.000000000".sv_2 + kernel_input_with_scaling."Feature_3" * "SV_data_1789-07-14T00:00:00.000000000".sv_3) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1789-07-14T00:00:00.000000000") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t), 
"OVR_Score_1789-07-14T00:00:00.000000000" AS 
(SELECT "kernel_dp_1789-07-14T00:00:00.000000000"."KEY" AS "KEY_1789-07-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "Proba_1789-07-14T00:00:00.000000000", "kernel_dp_1789-07-14T00:00:00.000000000".dot_product AS "Score_1789-07-14T00:00:00.000000000" 
FROM "kernel_dp_1789-07-14T00:00:00.000000000"), 
"SV_data_1789-08-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.1234894706881692 AS dual_coeff, -0.9000528014162733 AS sv_0, 0.5875947511304064 AS sv_1, -1.2479450708119786 AS sv_2, -0.992072850194672 AS sv_3 UNION ALL SELECT 1 AS sv_idx, 0.3098168973835633 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.2262025513943229 AS sv_1, 0.3817072564045966 AS sv_2, 0.6041114003978728 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -0.1863274266953941 AS dual_coeff, -1.6225032105798365 AS sv_0, -1.6796518770255056 AS sv_1, -1.480752546128632 AS sv_2, -1.2581035586267628 AS sv_3) AS "Values"), 
"kernel_dp_1789-08-14T00:00:00.000000000" AS 
(SELECT t_1."KEY" AS "KEY", t_1.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_1."KEY" AS "KEY", sum(CAST(full_join_data_sv_1.dot_prod1 AS FLOAT)) + 0.359611754189863 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-08-14T00:00:00.000000000".dual_coeff * (kernel_input_with_scaling."Feature_0" * "SV_data_1789-08-14T00:00:00.000000000".sv_0 + kernel_input_with_scaling."Feature_1" * "SV_data_1789-08-14T00:00:00.000000000".sv_1 + kernel_input_with_scaling."Feature_2" * "SV_data_1789-08-14T00:00:00.000000000".sv_2 + kernel_input_with_scaling."Feature_3" * "SV_data_1789-08-14T00:00:00.000000000".sv_3) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data_1789-08-14T00:00:00.000000000") AS full_join_data_sv_1 GROUP BY full_join_data_sv_1."KEY") AS t_1), 
"OVR_Score_1789-08-14T00:00:00.000000000" AS 
(SELECT "kernel_dp_1789-08-14T00:00:00.000000000"."KEY" AS "KEY_1789-08-14T00:00:00.000000000", CAST(NULL AS FLOAT) AS "Proba_1789-08-14T00:00:00.000000000", "kernel_dp_1789-08-14T00:00:00.000000000".dot_product AS "Score_1789-08-14T00:00:00.000000000" 
FROM "kernel_dp_1789-08-14T00:00:00.000000000"), 
"SV_data_1789-09-14T00:00:00.000000000" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -1.0 AS dual_coeff, 0.18362281232907215 AS sv_0, -0.3193039001319582 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -0.3500017119361373 AS dual_coeff, 1.1468900245471565 AS sv_0, -0.5460285629475496 AS sv_1, 0.5563128628920867 AS sv_2, 0.20506533774973654 AS sv_3 UNION ALL SELECT 2 AS sv_idx, 1.0 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.0925792373163668 AS sv_1, 0.6145147317212504 AS sv_2, 0.7371267546139184 AS sv_3 UNION ALL SELECT 3 AS sv_idx, -1.0 AS dual_coeff, -0.2980107937799705 AS sv_0, -0.0925792373163668 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 UNION ALL SELECT 4 AS sv_idx, -0.01619694306667593 AS dual_coeff, 0.5448480169108537 AS sv_0, 0.5875947511304064 AS sv_1, 0.4981109940629235 AS sv_2, 0.4710960461818276 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 1.0 AS dual_coeff, -1.1408696044707936 AS sv_0, -1.2262025513943229 AS sv_1, 0.3817072564045966 AS sv_2, 0.6041114003978728 AS sv_3 UNION ALL SELECT 6 AS sv_idx, 1.0 AS dual_coeff, 0.785664819965375 AS sv_0, 0.360870088314816 AS sv_1, 0.7309184693795767 AS sv_2, 1.0031574630460092 AS sv_3 UNION ALL SELECT 7 AS sv_idx, -0.6875683388014568 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.6796518770255056 AS sv_1, 0.3235053875754334 AS sv_2, 0.07204998353369131 AS sv_3 UNION ALL SELECT 8 AS sv_idx, 1.0 AS dual_coeff, 0.5448480169108537 AS sv_0, -0.7727532257631398 AS sv_1, 0.6145147317212504 AS sv_2, 0.7371267546139184 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 1.0 AS dual_coeff, 0.06321441080181206 AS sv_0, -0.0925792373163668 AS sv_1, 0.7309184693795767 AS sv_2, 0.7371267546139184 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -1.0 AS dual_coeff, 0.4244396153835936 AS sv_0, -1.906376539841096 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 1.0 AS dual_coeff, 0.18362281232907215 AS sv_0, -0.0925792373163668 AS sv_1, 0.5563128628920867 AS sv_2, 0.7371267546139184 AS sv_3 UNION ALL SELECT 12 AS sv_idx, 1.0 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.9994778885787314 AS sv_1, 1.0219278135253935 AS sv_2, 0.20506533774973654 AS sv_3 UNION ALL SELECT 13 AS sv_idx, 1.0 AS dual_coeff, 0.5448480169108537 AS sv_0, -0.5460285629475496 AS sv_1, 0.7309184693795767 AS sv_2, 0.3380806919657821 AS sv_3 UNION ALL SELECT 14 AS sv_idx, 0.05376699380427026 AS dual_coeff, 0.785664819965375 AS sv_0, -0.0925792373163668 AS sv_1, 0.9637259446962304 AS sv_2, 0.7371267546139184 AS sv_3 UNION ALL SELECT 15 AS sv_idx, 1.0 AS dual_coeff, 1.628523630656199 AS sv_0, -0.0925792373163668 AS sv_1, 1.1383315511837206 AS sv_2, 0.4710960461818276 AS sv_3 UNION ALL SELECT 16 AS sv_idx, -1.0 AS dual_coeff, 0.06321441080181206 AS sv_0, 0.360870088314816 AS sv_1, 0.5563128628920867 AS sv_2, 0.7371267546139184 AS sv_3 UNION ALL SELECT 17 AS sv_idx, -1.0 AS dual_coeff, 0.5448480169108537 AS sv_0, -1.2262025513943229 AS sv_1, 0.6145147317212504 AS sv_2, 0.3380806919657821 AS sv_3 UNION ALL SELECT 18 AS sv_idx, 1.0 AS dual_coeff, 0.18362281232907215 AS sv_0, -1.906376539841096 AS sv_1, 0.6727166005504135 AS sv_2, 0.3380806919657821 AS sv_3 UNION ALL SELECT 19 AS sv_idx, -1.0 AS dual_coeff, 0.3040312138563324 AS sv_0, -0.3193039001319582 AS sv_1, 0.4981109940629235 AS sv_2, 0.20506533774973654 AS sv_3 UNION ALL SELECT 20 AS sv_idx, -1.0 AS dual_coeff, -0.5388275968344908 AS sv_0, -0.0925792373163668 AS sv_1, 0.3817072564045966 AS sv_2, 0.3380806919657821 AS sv_3 UNION ALL SELECT 21 AS sv_idx, -1.0 AS dual_coeff, 1.0264816230198963 AS sv_0, -0.0925792373163668 AS sv_1, 0.6727166005504135 AS sv_2, 0.6041114003978728 AS sv_3 UNION ALL SELECT 22 AS sv_idx, -1.0 AS dual_coeff, 1.2672984260744176 AS sv_0, 0.13414542549922462 AS sv_1, 0.6145147317212504 AS sv_2, 0.3380806919657821 AS sv_3) AS "Values"), 
"kernel_dp_1789-09-14T00:00:00.000000000" AS 
(SELECT t_2."KEY" AS "KEY", t_2.dot_product AS dot_product 
FROM (SELECT full_join_data_sv_2."KEY" AS "KEY", sum(CAST(full_join_data_sv_2.dot_prod1 AS FLOAT)) + -2.7093604181989 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data_1789-09-14T00:00:00.000000000".dual_coeff * (kernel_input_with_scaling."Feature_0" * "SV_data_1789-09-14T00:00:00.000000000".sv_0 + kernel_input_with_scaling."Feature_1" * "SV_data_1789-09-14T00:00:00.000000000".sv_1 + kernel_input_with_scaling."Feature_2" * "SV_data_1789-09-14T00:00:00.000000000".sv_2 + kernel_input_with_scaling."Feature_3" * "SV_data_1789-09-14T00:00:00.000000000".sv_3) AS dot_prod1 
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