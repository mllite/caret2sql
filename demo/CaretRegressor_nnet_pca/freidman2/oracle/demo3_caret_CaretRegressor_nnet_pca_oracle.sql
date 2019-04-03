-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet_pca
-- Dataset : freidman2
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS BINARY_DOUBLE) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS BINARY_DOUBLE) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS BINARY_DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS BINARY_DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM "FREIDMAN2" "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.6121650749100701 + "ADS_sca_1_OUT"."Feature_1" * 0.5464782903329433 + "ADS_sca_1_OUT"."Feature_2" * -0.5708677485644764 + "ADS_sca_1_OUT"."Feature_3" * -0.02693349038014348 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.4888813380420076 + "ADS_sca_1_OUT"."Feature_1" * 0.2745192584561386 + "ADS_sca_1_OUT"."Feature_2" * -0.2238449995359107 + "ADS_sca_1_OUT"."Feature_3" * -0.7971998684355868 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.024686176636208892 + "ADS_sca_1_OUT"."Feature_1" * 0.7091918576518509 + "ADS_sca_1_OUT"."Feature_2" * 0.7038817472089458 + "ADS_sca_1_OUT"."Feature_3" * 0.03143227114740615 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.6209988333786876 + "ADS_sca_1_OUT"."Feature_1" * -0.3507813620644518 + "ADS_sca_1_OUT"."Feature_2" * 0.358544161544677 + "ADS_sca_1_OUT"."Feature_3" * -0.6022947527521242 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"IL" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS BINARY_DOUBLE) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS BINARY_DOUBLE) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS BINARY_DOUBLE) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS BINARY_DOUBLE) AS "PC4" 
FROM "ADS_pre_1_OUT"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -3.702802 * "IL"."PC1" + -16.06694 * "IL"."PC2" + 2.762968 * "IL"."PC3" + -13.43143 * "IL"."PC4" + -29.85076 AS "NEUR_1_1", 11.14638 * "IL"."PC1" + -16.52031 * "IL"."PC2" + 36.11207 * "IL"."PC3" + 16.40362 * "IL"."PC4" + -20.5038 AS "NEUR_1_2", -5.057857 * "IL"."PC1" + 24.17754 * "IL"."PC2" + 86.04621 * "IL"."PC3" + 3.93881 * "IL"."PC4" + -45.53269 AS "NEUR_1_3", -17.24994 * "IL"."PC1" + 21.71375 * "IL"."PC2" + -1.603223 * "IL"."PC3" + -21.5058 * "IL"."PC4" + -43.17071 AS "NEUR_1_4", -0.8866956 * "IL"."PC1" + 1.697542 * "IL"."PC2" + 20.2064 * "IL"."PC3" + -9.564322 * "IL"."PC4" + -1.018177 AS "NEUR_1_5", -8.805498 * "IL"."PC1" + 11.20494 * "IL"."PC2" + 22.26618 * "IL"."PC3" + -15.10813 * "IL"."PC4" + -27.02548 AS "NEUR_1_6", 0.7115305 * "IL"."PC1" + 1.520458 * "IL"."PC2" + -5.851449 * "IL"."PC3" + 2.220471 * "IL"."PC4" + -23.74959 AS "NEUR_1_7", 7.200505 * "IL"."PC1" + -1.266119 * "IL"."PC2" + -11.94298 * "IL"."PC3" + 3.876215 * "IL"."PC4" + -44.73042 AS "NEUR_1_8", -0.5120345 * "IL"."PC1" + -0.4863235 * "IL"."PC2" + 2.700307 * "IL"."PC3" + 0.7636842 * "IL"."PC4" + -0.3551617 AS "NEUR_1_9", -0.5079745 * "IL"."PC1" + -0.2253923 * "IL"."PC2" + 22.38803 * "IL"."PC3" + 2.136688 * "IL"."PC4" + -28.05076 AS "NEUR_1_10", 0.2092006 * "IL"."PC1" + 2.121905 * "IL"."PC2" + -4.605309 * "IL"."PC3" + 5.672673 * "IL"."PC4" + -48.31988 AS "NEUR_1_11", 12.58682 * "IL"."PC1" + 1.080118 * "IL"."PC2" + 35.88511 * "IL"."PC3" + 11.98565 * "IL"."PC4" + 22.33681 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", 169.3812 * "HL_1_logistic_1"."NEUR_1_1" + 190.7739 * "HL_1_logistic_1"."NEUR_1_2" + 152.2185 * "HL_1_logistic_1"."NEUR_1_3" + 100.8678 * "HL_1_logistic_1"."NEUR_1_4" + 187.8023 * "HL_1_logistic_1"."NEUR_1_5" + 145.6596 * "HL_1_logistic_1"."NEUR_1_6" + 107.4824 * "HL_1_logistic_1"."NEUR_1_7" + 169.9927 * "HL_1_logistic_1"."NEUR_1_8" + 236.2769 * "HL_1_logistic_1"."NEUR_1_9" + 194.4295 * "HL_1_logistic_1"."NEUR_1_10" + 173.9552 * "HL_1_logistic_1"."NEUR_1_11" + 46.35011 * "HL_1_logistic_1"."NEUR_1_12" + 98.25081 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"