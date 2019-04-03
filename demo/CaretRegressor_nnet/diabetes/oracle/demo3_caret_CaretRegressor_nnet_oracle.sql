-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet
-- Dataset : diabetes
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS BINARY_DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS BINARY_DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS BINARY_DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS BINARY_DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS BINARY_DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS BINARY_DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS BINARY_DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS BINARY_DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS BINARY_DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS BINARY_DOUBLE) AS "Feature_9" 
FROM "DIABETES" "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -626.6887 * "IL"."Feature_0" + 348.7406 * "IL"."Feature_1" + -1683.886 * "IL"."Feature_2" + -1102.104 * "IL"."Feature_3" + -233.9997 * "IL"."Feature_4" + 1934.592 * "IL"."Feature_5" + 538.6661 * "IL"."Feature_6" + 2048.307 * "IL"."Feature_7" + -2031.965 * "IL"."Feature_8" + 313.6396 * "IL"."Feature_9" + -30.44751 AS "NEUR_1_1", 68.24896 * "IL"."Feature_0" + 14.20588 * "IL"."Feature_1" + 212.2798 * "IL"."Feature_2" + 160.5047 * "IL"."Feature_3" + 71.94538 * "IL"."Feature_4" + 57.19275 * "IL"."Feature_5" + -142.2771 * "IL"."Feature_6" + 156.7876 * "IL"."Feature_7" + 203.7438 * "IL"."Feature_8" + 140.85 * "IL"."Feature_9" + 183.5913 AS "NEUR_1_2", 19.68054 * "IL"."Feature_0" + 3.54238 * "IL"."Feature_1" + 59.56806 * "IL"."Feature_2" + 44.47011 * "IL"."Feature_3" + 20.17378 * "IL"."Feature_4" + 16.47656 * "IL"."Feature_5" + -38.74363 * "IL"."Feature_6" + 42.77059 * "IL"."Feature_7" + 56.98803 * "IL"."Feature_8" + 39.52237 * "IL"."Feature_9" + 43.80785 AS "NEUR_1_3", 54.83502 * "IL"."Feature_0" + 11.22158 * "IL"."Feature_1" + 166.615 * "IL"."Feature_2" + 125.3815 * "IL"."Feature_3" + 57.21719 * "IL"."Feature_4" + 45.59709 * "IL"."Feature_5" + -110.4761 * "IL"."Feature_6" + 121.9645 * "IL"."Feature_7" + 159.5487 * "IL"."Feature_8" + 110.4954 * "IL"."Feature_9" + 154.9057 AS "NEUR_1_4", -254.3696 * "IL"."Feature_0" + -66.1232 * "IL"."Feature_1" + 606.5886 * "IL"."Feature_2" + -94.79522 * "IL"."Feature_3" + 789.6608 * "IL"."Feature_4" + -1105.485 * "IL"."Feature_5" + -409.4901 * "IL"."Feature_6" + 346.5129 * "IL"."Feature_7" + 323.492 * "IL"."Feature_8" + -194.1028 * "IL"."Feature_9" + -0.3970048 AS "NEUR_1_5", 2.277847 * "IL"."Feature_0" + 0.7551502 * "IL"."Feature_1" + 5.681691 * "IL"."Feature_2" + 4.238302 * "IL"."Feature_3" + 2.413413 * "IL"."Feature_4" + 1.423511 * "IL"."Feature_5" + -3.925892 * "IL"."Feature_6" + 4.951251 * "IL"."Feature_7" + 5.957485 * "IL"."Feature_8" + 4.006471 * "IL"."Feature_9" + -31.14389 AS "NEUR_1_6", 454.1318 * "IL"."Feature_0" + -539.9425 * "IL"."Feature_1" + 732.1945 * "IL"."Feature_2" + 1772.399 * "IL"."Feature_3" + -1344.733 * "IL"."Feature_4" + 2807.695 * "IL"."Feature_5" + -2144.335 * "IL"."Feature_6" + -1955.188 * "IL"."Feature_7" + 1813.404 * "IL"."Feature_8" + 2586.113 * "IL"."Feature_9" + -127.7245 AS "NEUR_1_7", 56.96839 * "IL"."Feature_0" + 10.12859 * "IL"."Feature_1" + 176.9748 * "IL"."Feature_2" + 135.5305 * "IL"."Feature_3" + 62.70812 * "IL"."Feature_4" + 52.77948 * "IL"."Feature_5" + -117.4683 * "IL"."Feature_6" + 132.7235 * "IL"."Feature_7" + 166.8883 * "IL"."Feature_8" + 114.8776 * "IL"."Feature_9" + -124.6027 AS "NEUR_1_8", 11.92098 * "IL"."Feature_0" + 2.690967 * "IL"."Feature_1" + 35.90221 * "IL"."Feature_2" + 26.74944 * "IL"."Feature_3" + 11.64761 * "IL"."Feature_4" + 9.790271 * "IL"."Feature_5" + -23.97798 * "IL"."Feature_6" + 26.04817 * "IL"."Feature_7" + 34.89054 * "IL"."Feature_8" + 23.55637 * "IL"."Feature_9" + -217.8361 AS "NEUR_1_9", 16.99813 * "IL"."Feature_0" + 3.868908 * "IL"."Feature_1" + 52.73973 * "IL"."Feature_2" + 39.31841 * "IL"."Feature_3" + 18.0019 * "IL"."Feature_4" + 14.74853 * "IL"."Feature_5" + -35.40409 * "IL"."Feature_6" + 38.45533 * "IL"."Feature_7" + 50.56634 * "IL"."Feature_8" + 34.76006 * "IL"."Feature_9" + -426.1394 AS "NEUR_1_10", 16.68518 * "IL"."Feature_0" + 3.532662 * "IL"."Feature_1" + 53.39185 * "IL"."Feature_2" + 40.34394 * "IL"."Feature_3" + 18.09177 * "IL"."Feature_4" + 14.25267 * "IL"."Feature_5" + -35.5426 * "IL"."Feature_6" + 38.8352 * "IL"."Feature_7" + 51.35271 * "IL"."Feature_8" + 35.08415 * "IL"."Feature_9" + 33.22637 AS "NEUR_1_11", 0.6737284 * "IL"."Feature_0" + 0.4203307 * "IL"."Feature_1" + 1.984957 * "IL"."Feature_2" + 1.142351 * "IL"."Feature_3" + 0.7998989 * "IL"."Feature_4" + -0.06050122 * "IL"."Feature_5" + -1.018662 * "IL"."Feature_6" + 1.227687 * "IL"."Feature_7" + 1.112602 * "IL"."Feature_8" + 1.287911 * "IL"."Feature_9" + -23.86551 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -21.73521 * "HL_1_logistic_1"."NEUR_1_1" + -17.72408 * "HL_1_logistic_1"."NEUR_1_2" + 20.68149 * "HL_1_logistic_1"."NEUR_1_3" + -6.510366 * "HL_1_logistic_1"."NEUR_1_4" + 65.95535 * "HL_1_logistic_1"."NEUR_1_5" + 42.33953 * "HL_1_logistic_1"."NEUR_1_6" + 68.82578 * "HL_1_logistic_1"."NEUR_1_7" + 24.02252 * "HL_1_logistic_1"."NEUR_1_8" + 60.33094 * "HL_1_logistic_1"."NEUR_1_9" + 49.50775 * "HL_1_logistic_1"."NEUR_1_10" + 22.95353 * "HL_1_logistic_1"."NEUR_1_11" + 59.09962 * "HL_1_logistic_1"."NEUR_1_12" + 89.38067 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"