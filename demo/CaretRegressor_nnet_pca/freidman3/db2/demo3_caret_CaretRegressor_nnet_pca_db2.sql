-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet_pca
-- Dataset : freidman3
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM "FREIDMAN3" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.6121650749100701 + "ADS_sca_1_OUT"."Feature_1" * 0.5464782903329433 + "ADS_sca_1_OUT"."Feature_2" * -0.5708677485644764 + "ADS_sca_1_OUT"."Feature_3" * -0.02693349038014348 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.4888813380420076 + "ADS_sca_1_OUT"."Feature_1" * 0.2745192584561386 + "ADS_sca_1_OUT"."Feature_2" * -0.2238449995359107 + "ADS_sca_1_OUT"."Feature_3" * -0.7971998684355868 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.024686176636208892 + "ADS_sca_1_OUT"."Feature_1" * 0.7091918576518509 + "ADS_sca_1_OUT"."Feature_2" * 0.7038817472089458 + "ADS_sca_1_OUT"."Feature_3" * 0.03143227114740615 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.6209988333786876 + "ADS_sca_1_OUT"."Feature_1" * -0.3507813620644518 + "ADS_sca_1_OUT"."Feature_2" * 0.358544161544677 + "ADS_sca_1_OUT"."Feature_3" * -0.6022947527521242 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"IL" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE) AS "PC4" 
FROM "ADS_pre_1_OUT"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -0.6219924 * "IL"."PC1" + 0.168477 * "IL"."PC2" + -0.5732471 * "IL"."PC3" + -0.1915444 * "IL"."PC4" + -1.464144 AS "NEUR_1_1", 2.5014 * "IL"."PC1" + -2.777177 * "IL"."PC2" + -1.66772 * "IL"."PC3" + 2.171119 * "IL"."PC4" + -2.985883 AS "NEUR_1_2", -1.003229 * "IL"."PC1" + 0.3027428 * "IL"."PC2" + -0.8674886 * "IL"."PC3" + -0.3188034 * "IL"."PC4" + 1.745336 AS "NEUR_1_3", -0.1132153 * "IL"."PC1" + -1.458279 * "IL"."PC2" + -0.4840396 * "IL"."PC3" + 0.9287544 * "IL"."PC4" + -0.4297005 AS "NEUR_1_4", -0.6777764 * "IL"."PC1" + -0.5765287 * "IL"."PC2" + -1.045062 * "IL"."PC3" + 0.1307895 * "IL"."PC4" + -1.770522 AS "NEUR_1_5", 0.03241388 * "IL"."PC1" + 1.355312 * "IL"."PC2" + 0.1008357 * "IL"."PC3" + -0.7541333 * "IL"."PC4" + 1.096559 AS "NEUR_1_6", -0.3600481 * "IL"."PC1" + 1.084708 * "IL"."PC2" + -1.618792 * "IL"."PC3" + 1.154593 * "IL"."PC4" + -1.115651 AS "NEUR_1_7", -1.647509 * "IL"."PC1" + -0.5604141 * "IL"."PC2" + -0.8951745 * "IL"."PC3" + 0.4947589 * "IL"."PC4" + -1.251313 AS "NEUR_1_8", -3.56474 * "IL"."PC1" + -2.038344 * "IL"."PC2" + 4.5974 * "IL"."PC3" + 2.917817 * "IL"."PC4" + 12.85164 AS "NEUR_1_9", 0.4318511 * "IL"."PC1" + 2.126435 * "IL"."PC2" + -0.1635253 * "IL"."PC3" + 0.6792771 * "IL"."PC4" + -0.7184859 AS "NEUR_1_10", 0.6194869 * "IL"."PC1" + -1.249888 * "IL"."PC2" + 0.8858053 * "IL"."PC3" + 0.5228495 * "IL"."PC4" + -1.745916 AS "NEUR_1_11", -0.2319322 * "IL"."PC1" + 1.723583 * "IL"."PC2" + 2.028785 * "IL"."PC3" + -2.838761 * "IL"."PC4" + 2.275523 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -1.210361 * "HL_1_logistic_1"."NEUR_1_1" + 0.1906166 * "HL_1_logistic_1"."NEUR_1_2" + -0.4647677 * "HL_1_logistic_1"."NEUR_1_3" + -1.014743 * "HL_1_logistic_1"."NEUR_1_4" + -0.7366278 * "HL_1_logistic_1"."NEUR_1_5" + -1.904412 * "HL_1_logistic_1"."NEUR_1_6" + 0.4120107 * "HL_1_logistic_1"."NEUR_1_7" + 0.3739939 * "HL_1_logistic_1"."NEUR_1_8" + 3.882804 * "HL_1_logistic_1"."NEUR_1_9" + -0.3107393 * "HL_1_logistic_1"."NEUR_1_10" + -1.048682 * "HL_1_logistic_1"."NEUR_1_11" + 0.3681292 * "HL_1_logistic_1"."NEUR_1_12" + -0.125492 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"