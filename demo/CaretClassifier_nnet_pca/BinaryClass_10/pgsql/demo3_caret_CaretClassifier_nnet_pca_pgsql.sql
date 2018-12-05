-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet_pca
-- Dataset : BinaryClass_10
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 0.06182920523813451) / 1.236134089597546 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 0.17702463767183327) / 0.946757498519011 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 0.041383850049034464) / 1.0809597326983538 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 0.13060646805847148) / 1.0860335106241017 AS "Feature_3", (CAST("ADS"."Feature_4" AS FLOAT) - -0.05955810471983085) / 1.1165897507633815 AS "Feature_4", (CAST("ADS"."Feature_5" AS FLOAT) - -0.048929089870105816) / 1.3868824547243672 AS "Feature_5", (CAST("ADS"."Feature_6" AS FLOAT) - 0.19101797861713127) / 0.979670721363872 AS "Feature_6", (CAST("ADS"."Feature_7" AS FLOAT) - 0.02204959673267471) / 0.4775973825125086 AS "Feature_7", (CAST("ADS"."Feature_8" AS FLOAT) - -0.05772981403414008) / 1.0713243581907332 AS "Feature_8", (CAST("ADS"."Feature_9" AS FLOAT) - -0.052549592052032364) / 1.2322587258530384 AS "Feature_9" 
FROM "BinaryClass_10" AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * 0.5661592321920361 + "CenteredDataForPCA"."Feature_1" * -0.035526328604152946 + "CenteredDataForPCA"."Feature_2" * -0.0467879363120513 + "CenteredDataForPCA"."Feature_3" * 0.008946515209953917 + "CenteredDataForPCA"."Feature_4" * 0.0829511888403661 + "CenteredDataForPCA"."Feature_5" * -0.10205221296100445 + "CenteredDataForPCA"."Feature_6" * 0.1424451507903749 + "CenteredDataForPCA"."Feature_7" * 0.5666566688831561 + "CenteredDataForPCA"."Feature_8" * -0.06631427728790784 + "CenteredDataForPCA"."Feature_9" * -0.5593289854950824 AS caress_2, "CenteredDataForPCA"."Feature_0" * 0.0767125800279515 + "CenteredDataForPCA"."Feature_1" * -0.40153794458328573 + "CenteredDataForPCA"."Feature_2" * 0.5677578250446825 + "CenteredDataForPCA"."Feature_3" * 0.2369735703010663 + "CenteredDataForPCA"."Feature_4" * -0.09632922916256215 + "CenteredDataForPCA"."Feature_5" * -0.5767787279161882 + "CenteredDataForPCA"."Feature_6" * -0.3216376934797878 + "CenteredDataForPCA"."Feature_7" * -0.006693968243624504 + "CenteredDataForPCA"."Feature_8" * -0.06421158945215161 + "CenteredDataForPCA"."Feature_9" * 0.06932008034543824 AS caress_3, "CenteredDataForPCA"."Feature_0" * -0.04428807917268944 + "CenteredDataForPCA"."Feature_1" * 0.02244286142288565 + "CenteredDataForPCA"."Feature_2" * -0.1709384323174772 + "CenteredDataForPCA"."Feature_3" * 0.4187938020309751 + "CenteredDataForPCA"."Feature_4" * 0.4638804547130563 + "CenteredDataForPCA"."Feature_5" * 0.12436384332391155 + "CenteredDataForPCA"."Feature_6" * -0.2491197630750001 + "CenteredDataForPCA"."Feature_7" * -0.02707014062139766 + "CenteredDataForPCA"."Feature_8" * -0.7066063892300462 + "CenteredDataForPCA"."Feature_9" * 0.01375528233133572 AS caress_4, "CenteredDataForPCA"."Feature_0" * 0.035505292609370916 + "CenteredDataForPCA"."Feature_1" * 0.4629415976318115 + "CenteredDataForPCA"."Feature_2" * 0.39703949728185695 + "CenteredDataForPCA"."Feature_3" * 0.108176435008563 + "CenteredDataForPCA"."Feature_4" * -0.5443880279914196 + "CenteredDataForPCA"."Feature_5" * 0.3886991214463785 + "CenteredDataForPCA"."Feature_6" * -0.3136270685510785 + "CenteredDataForPCA"."Feature_7" * 0.09412147953130984 + "CenteredDataForPCA"."Feature_8" * -0.2041303312264922 + "CenteredDataForPCA"."Feature_9" * -0.1369183431411648 AS caress_5, "CenteredDataForPCA"."Feature_0" * -0.02395611334530353 + "CenteredDataForPCA"."Feature_1" * 0.3059663067403714 + "CenteredDataForPCA"."Feature_2" * 0.1244148619727216 + "CenteredDataForPCA"."Feature_3" * 0.7205232130433498 + "CenteredDataForPCA"."Feature_4" * -0.010360887714254759 + "CenteredDataForPCA"."Feature_5" * -0.12313866467327145 + "CenteredDataForPCA"."Feature_6" * 0.5630711251768787 + "CenteredDataForPCA"."Feature_7" * -0.04287636501865158 + "CenteredDataForPCA"."Feature_8" * 0.18391692419974146 + "CenteredDataForPCA"."Feature_9" * 0.056520588594192574 AS caress_6, "CenteredDataForPCA"."Feature_0" * 0.048169250614026715 + "CenteredDataForPCA"."Feature_1" * 0.6239362496677012 + "CenteredDataForPCA"."Feature_2" * 0.20083118524117005 + "CenteredDataForPCA"."Feature_3" * -0.1618608106397551 + "CenteredDataForPCA"."Feature_4" * 0.5432007330496692 + "CenteredDataForPCA"."Feature_5" * -0.2436186036944093 + "CenteredDataForPCA"."Feature_6" * -0.3147233303086936 + "CenteredDataForPCA"."Feature_7" * 0.01337545211610092 + "CenteredDataForPCA"."Feature_8" * 0.29670903412359584 + "CenteredDataForPCA"."Feature_9" * 0.01296934529502586 AS caress_7, "CenteredDataForPCA"."Feature_0" * -0.06773590863463053 + "CenteredDataForPCA"."Feature_1" * -0.11758181773858208 + "CenteredDataForPCA"."Feature_2" * 0.6477095493436038 + "CenteredDataForPCA"."Feature_3" * -0.3112272823678729 + "CenteredDataForPCA"."Feature_4" * 0.33477688181210946 + "CenteredDataForPCA"."Feature_5" * 0.29496375499110145 + "CenteredDataForPCA"."Feature_6" * 0.4607366756100071 + "CenteredDataForPCA"."Feature_7" * -0.025868856528122847 + "CenteredDataForPCA"."Feature_8" * -0.2305082370268579 + "CenteredDataForPCA"."Feature_9" * -0.005964439285718312 AS caress_8, "CenteredDataForPCA"."Feature_0" * -0.01348111056993069 + "CenteredDataForPCA"."Feature_1" * -0.3548932879282882 + "CenteredDataForPCA"."Feature_2" * 0.1151596627089844 + "CenteredDataForPCA"."Feature_3" * 0.33831649869357505 + "CenteredDataForPCA"."Feature_4" * 0.2550420232392573 + "CenteredDataForPCA"."Feature_5" * 0.5455133411718404 + "CenteredDataForPCA"."Feature_6" * -0.29573269647793504 + "CenteredDataForPCA"."Feature_7" * 0.06703502793247182 + "CenteredDataForPCA"."Feature_8" * 0.5249016800369088 + "CenteredDataForPCA"."Feature_9" * -0.12666758536301886 AS caress_9, "CenteredDataForPCA"."Feature_0" * 0.8139977198992024 + "CenteredDataForPCA"."Feature_1" * -2.220446049250313e-16 + "CenteredDataForPCA"."Feature_2" * 2.7755575615628907e-17 + "CenteredDataForPCA"."Feature_3" * -5.941427905220563e-17 + "CenteredDataForPCA"."Feature_4" * 4.85722573273506e-17 + "CenteredDataForPCA"."Feature_5" * 0.1604357089829339 + "CenteredDataForPCA"."Feature_6" * 4.163336342344337e-17 + "CenteredDataForPCA"."Feature_7" * -0.3933978761968223 + "CenteredDataForPCA"."Feature_8" * -1.7347234759768068e-17 + "CenteredDataForPCA"."Feature_9" * 0.3961138804509038 AS caress_10, "CenteredDataForPCA"."Feature_0" * -0.01002448881032891 + "CenteredDataForPCA"."Feature_1" * 4.510281037539698e-17 + "CenteredDataForPCA"."Feature_2" * -2.4489416571016328e-17 + "CenteredDataForPCA"."Feature_3" * 4.2243227145466467e-17 + "CenteredDataForPCA"."Feature_4" * -7.258733544790452e-17 + "CenteredDataForPCA"."Feature_5" * 0.07427703977921568 + "CenteredDataForPCA"."Feature_6" * 6.407634839389331e-17 + "CenteredDataForPCA"."Feature_7" * 0.7122651878874191 + "CenteredDataForPCA"."Feature_8" * -6.331740687315346e-17 + "CenteredDataForPCA"."Feature_9" * 0.6978973657418605 AS caress_11 
FROM "CenteredDataForPCA"), 
"IL" AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CAST("ADS_car_1_OUT".caress_2 AS FLOAT) AS caress_2, CAST("ADS_car_1_OUT".caress_3 AS FLOAT) AS caress_3, CAST("ADS_car_1_OUT".caress_4 AS FLOAT) AS caress_4, CAST("ADS_car_1_OUT".caress_5 AS FLOAT) AS caress_5, CAST("ADS_car_1_OUT".caress_6 AS FLOAT) AS caress_6, CAST("ADS_car_1_OUT".caress_7 AS FLOAT) AS caress_7, CAST("ADS_car_1_OUT".caress_8 AS FLOAT) AS caress_8, CAST("ADS_car_1_OUT".caress_9 AS FLOAT) AS caress_9, CAST("ADS_car_1_OUT".caress_10 AS FLOAT) AS caress_10, CAST("ADS_car_1_OUT".caress_11 AS FLOAT) AS caress_11 
FROM "ADS_car_1_OUT"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -1.533462 * "IL".caress_2 + -1.156371 * "IL".caress_3 + 0.3696407 * "IL".caress_4 + -0.1106453 * "IL".caress_5 + -0.8833033 * "IL".caress_6 + -0.1226381 * "IL".caress_7 + -1.363647 * "IL".caress_8 + 0.9100464 * "IL".caress_9 + -4.187118e-06 * "IL".caress_10 + -4.204592e-06 * "IL".caress_11 + -1.914068 AS "NEUR_1_1", -1.11935 * "IL".caress_2 + -0.5426964 * "IL".caress_3 + -0.3857183 * "IL".caress_4 + -1.203331 * "IL".caress_5 + 1.017044 * "IL".caress_6 + -0.5169515 * "IL".caress_7 + 0.0684003 * "IL".caress_8 + 0.3590548 * "IL".caress_9 + 7.986694e-06 * "IL".caress_10 + -8.050473e-06 * "IL".caress_11 + 0.1247092 AS "NEUR_1_2", -1.427149 * "IL".caress_2 + 1.392786 * "IL".caress_3 + -0.01425523 * "IL".caress_4 + -0.8851174 * "IL".caress_5 + 0.8202502 * "IL".caress_6 + 0.1978492 * "IL".caress_7 + -0.3444385 * "IL".caress_8 + -1.076591 * "IL".caress_9 + 2.113068e-06 * "IL".caress_10 + 7.785989e-06 * "IL".caress_11 + -0.5970791 AS "NEUR_1_3", 1.861597 * "IL".caress_2 + -1.680578 * "IL".caress_3 + 0.06370139 * "IL".caress_4 + 1.19179 * "IL".caress_5 + -1.022645 * "IL".caress_6 + -0.2134691 * "IL".caress_7 + 0.4583662 * "IL".caress_8 + 1.395506 * "IL".caress_9 + 2.409821e-06 * "IL".caress_10 + -4.701121e-06 * "IL".caress_11 + 0.6406874 AS "NEUR_1_4", -1.432021 * "IL".caress_2 + 0.3558732 * "IL".caress_3 + 0.5875475 * "IL".caress_4 + 0.3081743 * "IL".caress_5 + -0.4882428 * "IL".caress_6 + 0.3111623 * "IL".caress_7 + -0.5852139 * "IL".caress_8 + -0.5451246 * "IL".caress_9 + -2.023392e-06 * "IL".caress_10 + -2.344878e-06 * "IL".caress_11 + -0.530634 AS "NEUR_1_5" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", 4.183857 * "HL_1_logistic_1"."NEUR_1_1" + 1.9118 * "HL_1_logistic_1"."NEUR_1_2" + 2.48639 * "HL_1_logistic_1"."NEUR_1_3" + -3.990976 * "HL_1_logistic_1"."NEUR_1_4" + 1.898638 * "HL_1_logistic_1"."NEUR_1_5" + -0.8318708 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"