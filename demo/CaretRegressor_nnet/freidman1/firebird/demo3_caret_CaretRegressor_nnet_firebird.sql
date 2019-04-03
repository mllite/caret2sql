-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet
-- Dataset : freidman1
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9" 
FROM freidman1 AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -0.390005 * "IL"."Feature_0" + -3.136234 * "IL"."Feature_1" + -0.01687662 * "IL"."Feature_2" + -1.993105 * "IL"."Feature_3" + -0.9116776 * "IL"."Feature_4" + 0.01716051 * "IL"."Feature_5" + 0.1515231 * "IL"."Feature_6" + 0.0959176 * "IL"."Feature_7" + -0.06586776 * "IL"."Feature_8" + -0.003534024 * "IL"."Feature_9" + 1.839138 AS "NEUR_1_1", -3.938998 * "IL"."Feature_0" + -1.991299 * "IL"."Feature_1" + -4.252288 * "IL"."Feature_2" + -2.200536 * "IL"."Feature_3" + -3.137559 * "IL"."Feature_4" + -4.075193 * "IL"."Feature_5" + -4.14391 * "IL"."Feature_6" + -2.372157 * "IL"."Feature_7" + -4.291992 * "IL"."Feature_8" + -4.691681 * "IL"."Feature_9" + -7.149831 AS "NEUR_1_2", -1.834669 * "IL"."Feature_0" + -1.36897 * "IL"."Feature_1" + -3.523802 * "IL"."Feature_2" + -1.720222 * "IL"."Feature_3" + -2.098447 * "IL"."Feature_4" + -2.10022 * "IL"."Feature_5" + -2.389836 * "IL"."Feature_6" + -2.627102 * "IL"."Feature_7" + -2.371936 * "IL"."Feature_8" + -3.091202 * "IL"."Feature_9" + -5.629398 AS "NEUR_1_3", -3.155565 * "IL"."Feature_0" + -1.758592 * "IL"."Feature_1" + -3.465403 * "IL"."Feature_2" + -2.422351 * "IL"."Feature_3" + -3.180812 * "IL"."Feature_4" + -4.337509 * "IL"."Feature_5" + -3.775354 * "IL"."Feature_6" + -3.41745 * "IL"."Feature_7" + -4.754655 * "IL"."Feature_8" + -4.286217 * "IL"."Feature_9" + -8.451322 AS "NEUR_1_4", -27.43991 * "IL"."Feature_0" + 13.89167 * "IL"."Feature_1" + -0.7342694 * "IL"."Feature_2" + -6.23222 * "IL"."Feature_3" + -5.629803 * "IL"."Feature_4" + -1.338169 * "IL"."Feature_5" + -4.401329 * "IL"."Feature_6" + -2.236337 * "IL"."Feature_7" + 1.928108 * "IL"."Feature_8" + 2.27011 * "IL"."Feature_9" + 5.323085 AS "NEUR_1_5", -3.071257 * "IL"."Feature_0" + -2.091888 * "IL"."Feature_1" + -3.34666 * "IL"."Feature_2" + -3.348989 * "IL"."Feature_3" + -2.545796 * "IL"."Feature_4" + -3.627032 * "IL"."Feature_5" + -2.779548 * "IL"."Feature_6" + -2.338139 * "IL"."Feature_7" + -3.049816 * "IL"."Feature_8" + -3.413898 * "IL"."Feature_9" + -6.762622 AS "NEUR_1_6", -9.904013 * "IL"."Feature_0" + -13.60788 * "IL"."Feature_1" + 0.007830305 * "IL"."Feature_2" + -11.96657 * "IL"."Feature_3" + -1.528258 * "IL"."Feature_4" + 2.282576 * "IL"."Feature_5" + 4.696848 * "IL"."Feature_6" + -4.196567 * "IL"."Feature_7" + -1.346261 * "IL"."Feature_8" + 1.965346 * "IL"."Feature_9" + 4.835396 AS "NEUR_1_7", -5.162354 * "IL"."Feature_0" + -2.617576 * "IL"."Feature_1" + -4.917908 * "IL"."Feature_2" + -2.680735 * "IL"."Feature_3" + -3.450612 * "IL"."Feature_4" + -4.694474 * "IL"."Feature_5" + -4.777227 * "IL"."Feature_6" + -3.386622 * "IL"."Feature_7" + -5.629793 * "IL"."Feature_8" + -5.370946 * "IL"."Feature_9" + -9.276738 AS "NEUR_1_8", -4.306855 * "IL"."Feature_0" + -3.240416 * "IL"."Feature_1" + -4.190417 * "IL"."Feature_2" + -4.187531 * "IL"."Feature_3" + -4.245736 * "IL"."Feature_4" + -4.793883 * "IL"."Feature_5" + -3.685574 * "IL"."Feature_6" + -4.027338 * "IL"."Feature_7" + -3.886491 * "IL"."Feature_8" + -4.918135 * "IL"."Feature_9" + -8.40023 AS "NEUR_1_9", -4.270463 * "IL"."Feature_0" + -2.853337 * "IL"."Feature_1" + -3.682998 * "IL"."Feature_2" + -3.617178 * "IL"."Feature_3" + -3.19192 * "IL"."Feature_4" + -3.953894 * "IL"."Feature_5" + -3.273237 * "IL"."Feature_6" + -3.624287 * "IL"."Feature_7" + -3.607953 * "IL"."Feature_8" + -4.046647 * "IL"."Feature_9" + -7.115755 AS "NEUR_1_10", -3.584166 * "IL"."Feature_0" + -0.607518 * "IL"."Feature_1" + -3.275268 * "IL"."Feature_2" + -1.450009 * "IL"."Feature_3" + -1.977316 * "IL"."Feature_4" + -2.875902 * "IL"."Feature_5" + -2.674036 * "IL"."Feature_6" + -3.115613 * "IL"."Feature_7" + -2.97909 * "IL"."Feature_8" + -4.012344 * "IL"."Feature_9" + -6.350596 AS "NEUR_1_11", -5.250595 * "IL"."Feature_0" + -3.434367 * "IL"."Feature_1" + -4.325011 * "IL"."Feature_2" + -4.665286 * "IL"."Feature_3" + -4.221893 * "IL"."Feature_4" + -6.058591 * "IL"."Feature_5" + -4.939752 * "IL"."Feature_6" + -4.258136 * "IL"."Feature_7" + -5.36939 * "IL"."Feature_8" + -5.299187 * "IL"."Feature_9" + -10.42355 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_1")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_1")) ELSE -709.782712893384 END)) AS "NEUR_1_1", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_2")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_2")) ELSE -709.782712893384 END)) AS "NEUR_1_2", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_3")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_3")) ELSE -709.782712893384 END)) AS "NEUR_1_3", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_4")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_4")) ELSE -709.782712893384 END)) AS "NEUR_1_4", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_5")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_5")) ELSE -709.782712893384 END)) AS "NEUR_1_5", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_6")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_6")) ELSE -709.782712893384 END)) AS "NEUR_1_6", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_7")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_7")) ELSE -709.782712893384 END)) AS "NEUR_1_7", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_8")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_8")) ELSE -709.782712893384 END)) AS "NEUR_1_8", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_9")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_9")) ELSE -709.782712893384 END)) AS "NEUR_1_9", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_10")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_10")) ELSE -709.782712893384 END)) AS "NEUR_1_10", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_11")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_11")) ELSE -709.782712893384 END)) AS "NEUR_1_11", 1.0 / (1.0 + exp(CASE WHEN (minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_12")) >= -709.782712893384) THEN minvalue(100.0, maxvalue(-100.0, -"HL_BA_1"."NEUR_1_12")) ELSE -709.782712893384 END)) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -23.84721 * "HL_1_logistic_1"."NEUR_1_1" + 2.437162 * "HL_1_logistic_1"."NEUR_1_2" + -0.1682402 * "HL_1_logistic_1"."NEUR_1_3" + 4.542695 * "HL_1_logistic_1"."NEUR_1_4" + -7.283211 * "HL_1_logistic_1"."NEUR_1_5" + 9.467165 * "HL_1_logistic_1"."NEUR_1_6" + -4.128597 * "HL_1_logistic_1"."NEUR_1_7" + 5.953023 * "HL_1_logistic_1"."NEUR_1_8" + 7.762861 * "HL_1_logistic_1"."NEUR_1_9" + 6.056423 * "HL_1_logistic_1"."NEUR_1_10" + 1.018443 * "HL_1_logistic_1"."NEUR_1_11" + 14.25582 * "HL_1_logistic_1"."NEUR_1_12" + 22.69712 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"