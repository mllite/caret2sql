-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet
-- Dataset : BinaryClass_10
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9" 
FROM "BinaryClass_10" AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -0.9958993 * "IL"."Feature_0" + 1.03536 * "IL"."Feature_1" + 1.182567 * "IL"."Feature_2" + 1.16566 * "IL"."Feature_3" + -0.1637856 * "IL"."Feature_4" + 0.8053424 * "IL"."Feature_5" + -0.566758 * "IL"."Feature_6" + -0.3595837 * "IL"."Feature_7" + 1.696663 * "IL"."Feature_8" + 0.7808231 * "IL"."Feature_9" + -1.022626 AS "NEUR_1_1", -1.990649 * "IL"."Feature_0" + 0.2147893 * "IL"."Feature_1" + -1.861611 * "IL"."Feature_2" + 0.2210381 * "IL"."Feature_3" + 0.06682182 * "IL"."Feature_4" + 1.395122 * "IL"."Feature_5" + -2.495965 * "IL"."Feature_6" + -0.5595766 * "IL"."Feature_7" + 0.8074377 * "IL"."Feature_8" + 1.604173 * "IL"."Feature_9" + -2.365408 AS "NEUR_1_2", -2.980274 * "IL"."Feature_0" + -0.8065281 * "IL"."Feature_1" + 0.07869041 * "IL"."Feature_2" + -0.1370727 * "IL"."Feature_3" + -0.2176051 * "IL"."Feature_4" + 0.8647375 * "IL"."Feature_5" + 1.145626 * "IL"."Feature_6" + -1.321456 * "IL"."Feature_7" + -0.4229365 * "IL"."Feature_8" + 3.071673 * "IL"."Feature_9" + -0.8025901 AS "NEUR_1_3", 0.9302776 * "IL"."Feature_0" + 1.137138 * "IL"."Feature_1" + 0.8367374 * "IL"."Feature_2" + 2.662186 * "IL"."Feature_3" + 2.098915 * "IL"."Feature_4" + -0.7220834 * "IL"."Feature_5" + -0.6721821 * "IL"."Feature_6" + 0.2212104 * "IL"."Feature_7" + -2.703577 * "IL"."Feature_8" + -0.5484254 * "IL"."Feature_9" + 0.6692279 AS "NEUR_1_4", -2.433322 * "IL"."Feature_0" + 0.04567665 * "IL"."Feature_1" + 0.03848845 * "IL"."Feature_2" + 0.7000527 * "IL"."Feature_3" + -0.2064414 * "IL"."Feature_4" + -3.015271 * "IL"."Feature_5" + 0.07610732 * "IL"."Feature_6" + -1.234476 * "IL"."Feature_7" + 0.1365174 * "IL"."Feature_8" + 3.002904 * "IL"."Feature_9" + -0.1913281 AS "NEUR_1_5", 3.650677 * "IL"."Feature_0" + -1.111708 * "IL"."Feature_1" + 1.137984 * "IL"."Feature_2" + -1.853856 * "IL"."Feature_3" + 0.2694618 * "IL"."Feature_4" + 2.906204 * "IL"."Feature_5" + 0.898209 * "IL"."Feature_6" + 1.692016 * "IL"."Feature_7" + 0.6409014 * "IL"."Feature_8" + -4.364652 * "IL"."Feature_9" + -0.8150321 AS "NEUR_1_6", -2.025713 * "IL"."Feature_0" + -1.782193 * "IL"."Feature_1" + -0.2658696 * "IL"."Feature_2" + 0.5425678 * "IL"."Feature_3" + 1.180917 * "IL"."Feature_4" + 0.6267196 * "IL"."Feature_5" + 1.768728 * "IL"."Feature_6" + -0.9101696 * "IL"."Feature_7" + 1.97686 * "IL"."Feature_8" + 1.859628 * "IL"."Feature_9" + -0.09325062 AS "NEUR_1_7", -1.334946 * "IL"."Feature_0" + -0.4380549 * "IL"."Feature_1" + 0.7926106 * "IL"."Feature_2" + 2.496029 * "IL"."Feature_3" + -1.87493 * "IL"."Feature_4" + 0.8796219 * "IL"."Feature_5" + 0.7632725 * "IL"."Feature_6" + -0.3807036 * "IL"."Feature_7" + -1.130449 * "IL"."Feature_8" + 1.155944 * "IL"."Feature_9" + 2.183354 AS "NEUR_1_8", 2.101779 * "IL"."Feature_0" + -1.818097 * "IL"."Feature_1" + 2.290046 * "IL"."Feature_2" + -1.151845 * "IL"."Feature_3" + -1.120371 * "IL"."Feature_4" + 3.099591 * "IL"."Feature_5" + 0.1938207 * "IL"."Feature_6" + 0.8405468 * "IL"."Feature_7" + 1.116827 * "IL"."Feature_8" + -2.837309 * "IL"."Feature_9" + 0.3433507 AS "NEUR_1_9", 1.981789 * "IL"."Feature_0" + 0.6856803 * "IL"."Feature_1" + 0.9004662 * "IL"."Feature_2" + 0.4565836 * "IL"."Feature_3" + 1.883759 * "IL"."Feature_4" + 0.2122842 * "IL"."Feature_5" + -1.507216 * "IL"."Feature_6" + 0.6872855 * "IL"."Feature_7" + 0.4353116 * "IL"."Feature_8" + -2.17956 * "IL"."Feature_9" + 2.389866 AS "NEUR_1_10", -2.14091 * "IL"."Feature_0" + -3.01604 * "IL"."Feature_1" + 1.378274 * "IL"."Feature_2" + -0.7840358 * "IL"."Feature_3" + 0.3696838 * "IL"."Feature_4" + 1.840692 * "IL"."Feature_5" + 0.4935652 * "IL"."Feature_6" + -0.8639512 * "IL"."Feature_7" + 1.357434 * "IL"."Feature_8" + 1.621761 * "IL"."Feature_9" + -1.006882 AS "NEUR_1_11", 0.547418 * "IL"."Feature_0" + 0.4350616 * "IL"."Feature_1" + 0.3326924 * "IL"."Feature_2" + 0.1206272 * "IL"."Feature_3" + 0.02164127 * "IL"."Feature_4" + -0.3852297 * "IL"."Feature_5" + 0.6101615 * "IL"."Feature_6" + 0.2369971 * "IL"."Feature_7" + -0.08487903 * "IL"."Feature_8" + -0.3334303 * "IL"."Feature_9" + 1.03605 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_1")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_1")) ELSE -709.782712893384 END)) AS "NEUR_1_1", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_2")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_2")) ELSE -709.782712893384 END)) AS "NEUR_1_2", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_3")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_3")) ELSE -709.782712893384 END)) AS "NEUR_1_3", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_4")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_4")) ELSE -709.782712893384 END)) AS "NEUR_1_4", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_5")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_5")) ELSE -709.782712893384 END)) AS "NEUR_1_5", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_6")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_6")) ELSE -709.782712893384 END)) AS "NEUR_1_6", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_7")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_7")) ELSE -709.782712893384 END)) AS "NEUR_1_7", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_8")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_8")) ELSE -709.782712893384 END)) AS "NEUR_1_8", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_9")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_9")) ELSE -709.782712893384 END)) AS "NEUR_1_9", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_10")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_10")) ELSE -709.782712893384 END)) AS "NEUR_1_10", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_11")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_11")) ELSE -709.782712893384 END)) AS "NEUR_1_11", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_12")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_12")) ELSE -709.782712893384 END)) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -4.358244 * "HL_1_logistic_1"."NEUR_1_1" + 7.714548 * "HL_1_logistic_1"."NEUR_1_2" + -6.189692 * "HL_1_logistic_1"."NEUR_1_3" + -7.748282 * "HL_1_logistic_1"."NEUR_1_4" + 5.978964 * "HL_1_logistic_1"."NEUR_1_5" + -8.787435 * "HL_1_logistic_1"."NEUR_1_6" + 5.918957 * "HL_1_logistic_1"."NEUR_1_7" + 8.347619 * "HL_1_logistic_1"."NEUR_1_8" + -6.402023 * "HL_1_logistic_1"."NEUR_1_9" + 6.547018 * "HL_1_logistic_1"."NEUR_1_10" + 2.526512 * "HL_1_logistic_1"."NEUR_1_11" + -0.6513634 * "HL_1_logistic_1"."NEUR_1_12" + -0.7725623 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_softmax" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_softmax_1" AS 
(SELECT "OL_softmax"."KEY" AS "KEY", "OL_softmax"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_softmax"), 
orig_cte AS 
(SELECT "OL_softmax_1"."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", 1.0 - "OL_softmax_1"."NEUR_2_1" AS "Proba_0", "OL_softmax_1"."NEUR_2_1" AS "Proba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM "OL_softmax_1"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte