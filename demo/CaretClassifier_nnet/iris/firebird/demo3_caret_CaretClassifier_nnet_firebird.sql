-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet
-- Dataset : iris
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3" 
FROM iris AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -1.885409 * "IL"."Feature_0" + -1.174366 * "IL"."Feature_1" + -1.168836 * "IL"."Feature_2" + -0.2784793 * "IL"."Feature_3" + -0.4467987 AS "NEUR_1_1", 1.459676 * "IL"."Feature_0" + 0.594149 * "IL"."Feature_1" + 1.323253 * "IL"."Feature_2" + 0.5604826 * "IL"."Feature_3" + 0.1819213 AS "NEUR_1_2", 0.5805478 * "IL"."Feature_0" + 1.713948 * "IL"."Feature_1" + -2.459465 * "IL"."Feature_2" + -1.303042 * "IL"."Feature_3" + 0.24497 AS "NEUR_1_3", 0.413127 * "IL"."Feature_0" + 0.1545092 * "IL"."Feature_1" + 0.2426047 * "IL"."Feature_2" + 0.1457333 * "IL"."Feature_3" + 0.1219933 AS "NEUR_1_4", 1.167972 * "IL"."Feature_0" + 0.483822 * "IL"."Feature_1" + 1.07962 * "IL"."Feature_2" + 0.2960008 * "IL"."Feature_3" + 0.1383511 AS "NEUR_1_5", -0.4300799 * "IL"."Feature_0" + -0.04024937 * "IL"."Feature_1" + -0.6322566 * "IL"."Feature_2" + -0.2755224 * "IL"."Feature_3" + -0.09982315 AS "NEUR_1_6", -0.7956096 * "IL"."Feature_0" + -2.179347 * "IL"."Feature_1" + 3.162282 * "IL"."Feature_2" + 1.523885 * "IL"."Feature_3" + -0.2856055 AS "NEUR_1_7", 0.7584736 * "IL"."Feature_0" + 0.2290209 * "IL"."Feature_1" + 1.05071 * "IL"."Feature_2" + 0.4960505 * "IL"."Feature_3" + 0.05992346 AS "NEUR_1_8", 0.6375304 * "IL"."Feature_0" + 0.1528121 * "IL"."Feature_1" + 0.8235994 * "IL"."Feature_2" + 0.3179903 * "IL"."Feature_3" + 0.09639296 AS "NEUR_1_9", -0.2920751 * "IL"."Feature_0" + -0.0577446 * "IL"."Feature_1" + -0.6593809 * "IL"."Feature_2" + -0.329122 * "IL"."Feature_3" + -0.006874495 AS "NEUR_1_10", 1.222304 * "IL"."Feature_0" + 0.4435621 * "IL"."Feature_1" + 1.21171 * "IL"."Feature_2" + 0.4216454 * "IL"."Feature_3" + 0.1690145 AS "NEUR_1_11", 11.11919 * "IL"."Feature_0" + 9.087761 * "IL"."Feature_1" + -17.60505 * "IL"."Feature_2" + -12.31491 * "IL"."Feature_3" + 12.34535 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_1")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_1")) ELSE -709.782712893384 END)) AS "NEUR_1_1", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_2")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_2")) ELSE -709.782712893384 END)) AS "NEUR_1_2", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_3")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_3")) ELSE -709.782712893384 END)) AS "NEUR_1_3", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_4")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_4")) ELSE -709.782712893384 END)) AS "NEUR_1_4", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_5")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_5")) ELSE -709.782712893384 END)) AS "NEUR_1_5", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_6")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_6")) ELSE -709.782712893384 END)) AS "NEUR_1_6", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_7")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_7")) ELSE -709.782712893384 END)) AS "NEUR_1_7", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_8")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_8")) ELSE -709.782712893384 END)) AS "NEUR_1_8", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_9")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_9")) ELSE -709.782712893384 END)) AS "NEUR_1_9", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_10")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_10")) ELSE -709.782712893384 END)) AS "NEUR_1_10", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_11")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_11")) ELSE -709.782712893384 END)) AS "NEUR_1_11", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_12")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_12")) ELSE -709.782712893384 END)) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", 0.05788471 * "HL_1_logistic_1"."NEUR_1_1" + -0.05252858 * "HL_1_logistic_1"."NEUR_1_2" + 8.842134 * "HL_1_logistic_1"."NEUR_1_3" + 0.2157186 * "HL_1_logistic_1"."NEUR_1_4" + -0.5035078 * "HL_1_logistic_1"."NEUR_1_5" + -0.5838529 * "HL_1_logistic_1"."NEUR_1_6" + -3.084433 * "HL_1_logistic_1"."NEUR_1_7" + -0.4500896 * "HL_1_logistic_1"."NEUR_1_8" + -0.6371119 * "HL_1_logistic_1"."NEUR_1_9" + 0.2279303 * "HL_1_logistic_1"."NEUR_1_10" + -0.582718 * "HL_1_logistic_1"."NEUR_1_11" + 3.519321 * "HL_1_logistic_1"."NEUR_1_12" + -0.1865858 AS "NEUR_2_1", -0.5985937 * "HL_1_logistic_1"."NEUR_1_1" + -2.758491 * "HL_1_logistic_1"."NEUR_1_2" + -8.730934 * "HL_1_logistic_1"."NEUR_1_3" + -0.9360425 * "HL_1_logistic_1"."NEUR_1_4" + -2.587736 * "HL_1_logistic_1"."NEUR_1_5" + -0.2501352 * "HL_1_logistic_1"."NEUR_1_6" + 1.958796 * "HL_1_logistic_1"."NEUR_1_7" + -0.7244158 * "HL_1_logistic_1"."NEUR_1_8" + -0.389472 * "HL_1_logistic_1"."NEUR_1_9" + -0.6408762 * "HL_1_logistic_1"."NEUR_1_10" + -1.094376 * "HL_1_logistic_1"."NEUR_1_11" + 18.98473 * "HL_1_logistic_1"."NEUR_1_12" + -1.073578 AS "NEUR_2_2", 0.4576537 * "HL_1_logistic_1"."NEUR_1_1" + 2.915333 * "HL_1_logistic_1"."NEUR_1_2" + -0.04219196 * "HL_1_logistic_1"."NEUR_1_3" + 0.7384859 * "HL_1_logistic_1"."NEUR_1_4" + 3.057686 * "HL_1_logistic_1"."NEUR_1_5" + 0.8075117 * "HL_1_logistic_1"."NEUR_1_6" + 1.026288 * "HL_1_logistic_1"."NEUR_1_7" + 1.168407 * "HL_1_logistic_1"."NEUR_1_8" + 1.150226 * "HL_1_logistic_1"."NEUR_1_9" + 0.4117571 * "HL_1_logistic_1"."NEUR_1_10" + 1.671699 * "HL_1_logistic_1"."NEUR_1_11" + -22.41542 * "HL_1_logistic_1"."NEUR_1_12" + 1.293961 AS "NEUR_2_3" 
FROM "HL_1_logistic_1"), 
"OL_softmax" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1", "OL_BA"."NEUR_2_2" AS "NEUR_2_2", "OL_BA"."NEUR_2_3" AS "NEUR_2_3" 
FROM "OL_BA"), 
"OL_softmax_1" AS 
(SELECT "OL_softmax"."KEY" AS "KEY", "OL_softmax"."NEUR_2_1" AS "NEUR_2_1", "OL_softmax"."NEUR_2_2" AS "NEUR_2_2", "OL_softmax"."NEUR_2_3" AS "NEUR_2_3" 
FROM "OL_softmax"), 
orig_cte AS 
(SELECT "OL_softmax_1"."KEY" AS "KEY", "OL_softmax_1"."NEUR_2_1" AS "Score_0", "OL_softmax_1"."NEUR_2_2" AS "Score_1", "OL_softmax_1"."NEUR_2_3" AS "Score_2", CAST(NULL AS DOUBLE PRECISION) AS "Proba_0", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1", CAST(NULL AS DOUBLE PRECISION) AS "Proba_2", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_2", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM "OL_softmax_1"), 
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
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(CASE WHEN (maxvalue(-100.0, score_max."Score_0" - score_max."max_Score") >= -709.782712893384) THEN maxvalue(-100.0, score_max."Score_0" - score_max."max_Score") ELSE -709.782712893384 END) AS "exp_delta_Score_0", exp(CASE WHEN (maxvalue(-100.0, score_max."Score_1" - score_max."max_Score") >= -709.782712893384) THEN maxvalue(-100.0, score_max."Score_1" - score_max."max_Score") ELSE -709.782712893384 END) AS "exp_delta_Score_1", exp(CASE WHEN (maxvalue(-100.0, score_max."Score_2" - score_max."max_Score") >= -709.782712893384) THEN maxvalue(-100.0, score_max."Score_2" - score_max."max_Score") ELSE -709.782712893384 END) AS "exp_delta_Score_2" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS class, score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS class, score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 2 AS class, score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Score_2" AS "Score_2", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."Proba_2" AS "Proba_2", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."LogProba_2" AS "LogProba_2", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score_2", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1", soft_max_comp."SoftProba_2" AS "SoftProba_2" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1", score_soft_max."exp_delta_Score_2" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_2" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", arg_max_cte."SoftProba_2" AS "Proba_2", CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > 0.0) THEN ln(arg_max_cte."SoftProba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > 0.0) THEN ln(arg_max_cte."SoftProba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."SoftProba_2" IS NULL OR arg_max_cte."SoftProba_2" > 0.0) THEN ln(arg_max_cte."SoftProba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", arg_max_cte."arg_max_Score" AS "Decision", maxvalue(arg_max_cte."SoftProba_0", arg_max_cte."SoftProba_1", arg_max_cte."SoftProba_2") AS "DecisionProba" 
FROM arg_max_cte