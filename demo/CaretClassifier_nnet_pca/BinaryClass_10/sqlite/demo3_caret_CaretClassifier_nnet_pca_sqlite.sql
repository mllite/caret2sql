-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet_pca
-- Dataset : BinaryClass_10
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 0.06182920523813451) / 1.236134089597546 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 0.17702463767183327) / 0.946757498519011 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 0.041383850049034464) / 1.0809597326983538 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 0.13060646805847148) / 1.0860335106241017 AS "Feature_3", (CAST("ADS"."Feature_4" AS FLOAT) - -0.05955810471983085) / 1.1165897507633815 AS "Feature_4", (CAST("ADS"."Feature_5" AS FLOAT) - -0.048929089870105816) / 1.3868824547243672 AS "Feature_5", (CAST("ADS"."Feature_6" AS FLOAT) - 0.19101797861713127) / 0.979670721363872 AS "Feature_6", (CAST("ADS"."Feature_7" AS FLOAT) - 0.02204959673267471) / 0.4775973825125086 AS "Feature_7", (CAST("ADS"."Feature_8" AS FLOAT) - -0.05772981403414008) / 1.0713243581907332 AS "Feature_8", (CAST("ADS"."Feature_9" AS FLOAT) - -0.052549592052032364) / 1.2322587258530384 AS "Feature_9" 
FROM "BinaryClass_10" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.5661592321920361 + "ADS_sca_1_OUT"."Feature_1" * -0.035526328604152946 + "ADS_sca_1_OUT"."Feature_2" * -0.0467879363120513 + "ADS_sca_1_OUT"."Feature_3" * 0.008946515209953917 + "ADS_sca_1_OUT"."Feature_4" * 0.0829511888403661 + "ADS_sca_1_OUT"."Feature_5" * -0.10205221296100445 + "ADS_sca_1_OUT"."Feature_6" * 0.1424451507903749 + "ADS_sca_1_OUT"."Feature_7" * 0.5666566688831561 + "ADS_sca_1_OUT"."Feature_8" * -0.06631427728790784 + "ADS_sca_1_OUT"."Feature_9" * -0.5593289854950824 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.0767125800279515 + "ADS_sca_1_OUT"."Feature_1" * -0.40153794458328573 + "ADS_sca_1_OUT"."Feature_2" * 0.5677578250446825 + "ADS_sca_1_OUT"."Feature_3" * 0.2369735703010663 + "ADS_sca_1_OUT"."Feature_4" * -0.09632922916256215 + "ADS_sca_1_OUT"."Feature_5" * -0.5767787279161882 + "ADS_sca_1_OUT"."Feature_6" * -0.3216376934797878 + "ADS_sca_1_OUT"."Feature_7" * -0.006693968243624504 + "ADS_sca_1_OUT"."Feature_8" * -0.06421158945215161 + "ADS_sca_1_OUT"."Feature_9" * 0.06932008034543824 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.04428807917268944 + "ADS_sca_1_OUT"."Feature_1" * 0.02244286142288565 + "ADS_sca_1_OUT"."Feature_2" * -0.1709384323174772 + "ADS_sca_1_OUT"."Feature_3" * 0.4187938020309751 + "ADS_sca_1_OUT"."Feature_4" * 0.4638804547130563 + "ADS_sca_1_OUT"."Feature_5" * 0.12436384332391155 + "ADS_sca_1_OUT"."Feature_6" * -0.2491197630750001 + "ADS_sca_1_OUT"."Feature_7" * -0.02707014062139766 + "ADS_sca_1_OUT"."Feature_8" * -0.7066063892300462 + "ADS_sca_1_OUT"."Feature_9" * 0.01375528233133572 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.035505292609370916 + "ADS_sca_1_OUT"."Feature_1" * 0.4629415976318115 + "ADS_sca_1_OUT"."Feature_2" * 0.39703949728185695 + "ADS_sca_1_OUT"."Feature_3" * 0.108176435008563 + "ADS_sca_1_OUT"."Feature_4" * -0.5443880279914196 + "ADS_sca_1_OUT"."Feature_5" * 0.3886991214463785 + "ADS_sca_1_OUT"."Feature_6" * -0.3136270685510785 + "ADS_sca_1_OUT"."Feature_7" * 0.09412147953130984 + "ADS_sca_1_OUT"."Feature_8" * -0.2041303312264922 + "ADS_sca_1_OUT"."Feature_9" * -0.1369183431411648 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.02395611334530353 + "ADS_sca_1_OUT"."Feature_1" * 0.3059663067403714 + "ADS_sca_1_OUT"."Feature_2" * 0.1244148619727216 + "ADS_sca_1_OUT"."Feature_3" * 0.7205232130433498 + "ADS_sca_1_OUT"."Feature_4" * -0.010360887714254759 + "ADS_sca_1_OUT"."Feature_5" * -0.12313866467327145 + "ADS_sca_1_OUT"."Feature_6" * 0.5630711251768787 + "ADS_sca_1_OUT"."Feature_7" * -0.04287636501865158 + "ADS_sca_1_OUT"."Feature_8" * 0.18391692419974146 + "ADS_sca_1_OUT"."Feature_9" * 0.056520588594192574 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.048169250614026715 + "ADS_sca_1_OUT"."Feature_1" * 0.6239362496677012 + "ADS_sca_1_OUT"."Feature_2" * 0.20083118524117005 + "ADS_sca_1_OUT"."Feature_3" * -0.1618608106397551 + "ADS_sca_1_OUT"."Feature_4" * 0.5432007330496692 + "ADS_sca_1_OUT"."Feature_5" * -0.2436186036944093 + "ADS_sca_1_OUT"."Feature_6" * -0.3147233303086936 + "ADS_sca_1_OUT"."Feature_7" * 0.01337545211610092 + "ADS_sca_1_OUT"."Feature_8" * 0.29670903412359584 + "ADS_sca_1_OUT"."Feature_9" * 0.01296934529502586 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * -0.06773590863463053 + "ADS_sca_1_OUT"."Feature_1" * -0.11758181773858208 + "ADS_sca_1_OUT"."Feature_2" * 0.6477095493436038 + "ADS_sca_1_OUT"."Feature_3" * -0.3112272823678729 + "ADS_sca_1_OUT"."Feature_4" * 0.33477688181210946 + "ADS_sca_1_OUT"."Feature_5" * 0.29496375499110145 + "ADS_sca_1_OUT"."Feature_6" * 0.4607366756100071 + "ADS_sca_1_OUT"."Feature_7" * -0.025868856528122847 + "ADS_sca_1_OUT"."Feature_8" * -0.2305082370268579 + "ADS_sca_1_OUT"."Feature_9" * -0.005964439285718312 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"IL" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS FLOAT) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS FLOAT) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS FLOAT) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS FLOAT) AS "PC4", CAST("ADS_pre_1_OUT"."PC5" AS FLOAT) AS "PC5", CAST("ADS_pre_1_OUT"."PC6" AS FLOAT) AS "PC6", CAST("ADS_pre_1_OUT"."PC7" AS FLOAT) AS "PC7" 
FROM "ADS_pre_1_OUT"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -3.567382 * "IL"."PC1" + 1.721026 * "IL"."PC2" + 1.788402 * "IL"."PC3" + -0.802329 * "IL"."PC4" + 0.05299994 * "IL"."PC5" + 0.9209386 * "IL"."PC6" + -1.529888 * "IL"."PC7" + -1.278253 AS "NEUR_1_1", 4.232301 * "IL"."PC1" + -4.232684 * "IL"."PC2" + -1.360063 * "IL"."PC3" + 0.8572558 * "IL"."PC4" + -3.481319 * "IL"."PC5" + 0.2438343 * "IL"."PC6" + -1.381224 * "IL"."PC7" + 0.1311864 AS "NEUR_1_2", -1.722759 * "IL"."PC1" + 0.01936179 * "IL"."PC2" + 0.07056267 * "IL"."PC3" + -0.4214224 * "IL"."PC4" + 0.340954 * "IL"."PC5" + -0.3440801 * "IL"."PC6" + 0.3303606 * "IL"."PC7" + -0.4826253 AS "NEUR_1_3", 4.668975 * "IL"."PC1" + 1.512751 * "IL"."PC2" + 0.3805184 * "IL"."PC3" + 0.2105604 * "IL"."PC4" + -0.1092641 * "IL"."PC5" + -1.621299 * "IL"."PC6" + -2.890557 * "IL"."PC7" + -0.8007623 AS "NEUR_1_4", 2.872416 * "IL"."PC1" + -1.157005 * "IL"."PC2" + -1.324613 * "IL"."PC3" + -1.941542 * "IL"."PC4" + -2.560656 * "IL"."PC5" + 3.405694 * "IL"."PC6" + -0.9616352 * "IL"."PC7" + 3.171522 AS "NEUR_1_5", -4.331364 * "IL"."PC1" + -1.484701 * "IL"."PC2" + 0.5972719 * "IL"."PC3" + 0.3153913 * "IL"."PC4" + -1.614025 * "IL"."PC5" + -0.5684577 * "IL"."PC6" + -2.298759 * "IL"."PC7" + -0.4634878 AS "NEUR_1_6", 3.046094 * "IL"."PC1" + 0.1918164 * "IL"."PC2" + -0.4347957 * "IL"."PC3" + 0.6140331 * "IL"."PC4" + 1.897109 * "IL"."PC5" + 0.8735528 * "IL"."PC6" + 0.9637155 * "IL"."PC7" + 0.1815289 AS "NEUR_1_7", 3.297666 * "IL"."PC1" + 0.4546855 * "IL"."PC2" + 0.6093639 * "IL"."PC3" + 2.272446 * "IL"."PC4" + -3.149615 * "IL"."PC5" + 1.952807 * "IL"."PC6" + 0.964679 * "IL"."PC7" + -0.9210666 AS "NEUR_1_8", -4.457515 * "IL"."PC1" + 1.887777 * "IL"."PC2" + 1.873296 * "IL"."PC3" + -0.3947702 * "IL"."PC4" + 0.03794934 * "IL"."PC5" + 0.6386019 * "IL"."PC6" + -0.7770899 * "IL"."PC7" + -1.839816 AS "NEUR_1_9", -4.608675 * "IL"."PC1" + 0.5117683 * "IL"."PC2" + 0.7074803 * "IL"."PC3" + 1.917331 * "IL"."PC4" + 2.954067 * "IL"."PC5" + -2.747645 * "IL"."PC6" + 0.8874437 * "IL"."PC7" + -1.175729 AS "NEUR_1_10", 3.089574 * "IL"."PC1" + -1.480684 * "IL"."PC2" + -1.349558 * "IL"."PC3" + 0.5558124 * "IL"."PC4" + -0.3574827 * "IL"."PC5" + -0.6249397 * "IL"."PC6" + 0.9833712 * "IL"."PC7" + 1.221207 AS "NEUR_1_11", -0.3501488 * "IL"."PC1" + 0.1976878 * "IL"."PC2" + 2.334814 * "IL"."PC3" + -3.252734 * "IL"."PC4" + -2.250592 * "IL"."PC5" + 0.6504985 * "IL"."PC6" + 0.2550863 * "IL"."PC7" + -1.221383 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", 4.334979 * "HL_1_logistic_1"."NEUR_1_1" + -10.73098 * "HL_1_logistic_1"."NEUR_1_2" + -0.3437471 * "HL_1_logistic_1"."NEUR_1_3" + 8.18088 * "HL_1_logistic_1"."NEUR_1_4" + 8.32675 * "HL_1_logistic_1"."NEUR_1_5" + 10.68226 * "HL_1_logistic_1"."NEUR_1_6" + -5.505124 * "HL_1_logistic_1"."NEUR_1_7" + -8.787587 * "HL_1_logistic_1"."NEUR_1_8" + 5.391638 * "HL_1_logistic_1"."NEUR_1_9" + -6.405681 * "HL_1_logistic_1"."NEUR_1_10" + -3.318527 * "HL_1_logistic_1"."NEUR_1_11" + -4.045238 * "HL_1_logistic_1"."NEUR_1_12" + 3.08585 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_softmax" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_softmax_1" AS 
(SELECT "OL_softmax"."KEY" AS "KEY", "OL_softmax"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_softmax"), 
orig_cte AS 
(SELECT "OL_softmax_1"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", CAST(NULL AS FLOAT) AS "Score_1", 1.0 - "OL_softmax_1"."NEUR_2_1" AS "Proba_0", "OL_softmax_1"."NEUR_2_1" AS "Proba_1", CAST(NULL AS FLOAT) AS "LogProba_0", CAST(NULL AS FLOAT) AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
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