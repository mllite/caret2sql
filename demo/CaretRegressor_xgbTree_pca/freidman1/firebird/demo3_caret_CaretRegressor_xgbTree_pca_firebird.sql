-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_xgbTree_pca
-- Dataset : freidman1
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 0.5629846484809589) / 0.2600015884118536 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 0.4560644242337592) / 0.2896884193099619 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.4711381748147476) / 0.3128833495879441 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 0.5339680200945178) / 0.2844030958277151 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE PRECISION) - 0.478093626237387) / 0.2879458120111227 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE PRECISION) - 0.5682849224172328) / 0.2995521696075025 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE PRECISION) - 0.4791437471428049) / 0.2752572650336402 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE PRECISION) - 0.4594152477223208) / 0.2890235713417702 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE PRECISION) - 0.4901106996809652) / 0.2808092486405501 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE PRECISION) - 0.5378806933707535) / 0.297685615548656 AS "Feature_9" 
FROM freidman1 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.01078044206398687 + "ADS_sca_1_OUT"."Feature_1" * 0.20275672425035265 + "ADS_sca_1_OUT"."Feature_2" * -0.3032095959115069 + "ADS_sca_1_OUT"."Feature_3" * 0.28036946451509137 + "ADS_sca_1_OUT"."Feature_4" * -0.456472170133784 + "ADS_sca_1_OUT"."Feature_5" * 0.36405052299186 + "ADS_sca_1_OUT"."Feature_6" * -0.4779398415021841 + "ADS_sca_1_OUT"."Feature_7" * -0.2499537237134235 + "ADS_sca_1_OUT"."Feature_8" * -0.08553249751289721 + "ADS_sca_1_OUT"."Feature_9" * -0.38614972165398104 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * -0.2486501060343723 + "ADS_sca_1_OUT"."Feature_1" * 0.18538688464371286 + "ADS_sca_1_OUT"."Feature_2" * -0.2340911061275425 + "ADS_sca_1_OUT"."Feature_3" * -0.5312215967757172 + "ADS_sca_1_OUT"."Feature_4" * -0.034157117099708666 + "ADS_sca_1_OUT"."Feature_5" * -0.11403009160110295 + "ADS_sca_1_OUT"."Feature_6" * 0.03913846092020175 + "ADS_sca_1_OUT"."Feature_7" * -0.3193281863661248 + "ADS_sca_1_OUT"."Feature_8" * 0.6497321497824414 + "ADS_sca_1_OUT"."Feature_9" * -0.16427431415508242 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.529444486853135 + "ADS_sca_1_OUT"."Feature_1" * -0.042432305775754416 + "ADS_sca_1_OUT"."Feature_2" * -0.467456082445249 + "ADS_sca_1_OUT"."Feature_3" * -0.12113349070226218 + "ADS_sca_1_OUT"."Feature_4" * 0.3516615435966041 + "ADS_sca_1_OUT"."Feature_5" * 0.05456396920784263 + "ADS_sca_1_OUT"."Feature_6" * -0.0169721401066592 + "ADS_sca_1_OUT"."Feature_7" * 0.44796273797836184 + "ADS_sca_1_OUT"."Feature_8" * 0.09951231655089274 + "ADS_sca_1_OUT"."Feature_9" * -0.3836601176822301 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.18967062357660877 + "ADS_sca_1_OUT"."Feature_1" * -0.6739997429415825 + "ADS_sca_1_OUT"."Feature_2" * -0.05142756480300252 + "ADS_sca_1_OUT"."Feature_3" * -0.4240887569157897 + "ADS_sca_1_OUT"."Feature_4" * -0.1753617554170441 + "ADS_sca_1_OUT"."Feature_5" * -0.23730999119190946 + "ADS_sca_1_OUT"."Feature_6" * -0.3492917073303225 + "ADS_sca_1_OUT"."Feature_7" * -0.24015917199949824 + "ADS_sca_1_OUT"."Feature_8" * -0.24578721855897134 + "ADS_sca_1_OUT"."Feature_9" * 0.009647497508173676 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * 0.22360120393586685 + "ADS_sca_1_OUT"."Feature_1" * -0.27882706563202 + "ADS_sca_1_OUT"."Feature_2" * 0.3325159145316829 + "ADS_sca_1_OUT"."Feature_3" * 0.03231293124673378 + "ADS_sca_1_OUT"."Feature_4" * 0.31176328828301664 + "ADS_sca_1_OUT"."Feature_5" * 0.5846343873278481 + "ADS_sca_1_OUT"."Feature_6" * 0.2256344434749018 + "ADS_sca_1_OUT"."Feature_7" * -0.4544239404125063 + "ADS_sca_1_OUT"."Feature_8" * 0.13999262235747426 + "ADS_sca_1_OUT"."Feature_9" * -0.21128970950531886 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.3346351973554642 + "ADS_sca_1_OUT"."Feature_1" * 0.0673786411182812 + "ADS_sca_1_OUT"."Feature_2" * 0.2578168786971707 + "ADS_sca_1_OUT"."Feature_3" * 0.1264276445937259 + "ADS_sca_1_OUT"."Feature_4" * -0.40729831882959366 + "ADS_sca_1_OUT"."Feature_5" * -0.455689833219327 + "ADS_sca_1_OUT"."Feature_6" * 0.4311593109248494 + "ADS_sca_1_OUT"."Feature_7" * -0.10623939522740035 + "ADS_sca_1_OUT"."Feature_8" * 0.004192902519120928 + "ADS_sca_1_OUT"."Feature_9" * -0.4798729265184412 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.5345631681819778 + "ADS_sca_1_OUT"."Feature_1" * 0.2916209104051029 + "ADS_sca_1_OUT"."Feature_2" * 0.4273963159452305 + "ADS_sca_1_OUT"."Feature_3" * -0.2195301363042834 + "ADS_sca_1_OUT"."Feature_4" * -0.235065733216965 + "ADS_sca_1_OUT"."Feature_5" * 0.1295961010443568 + "ADS_sca_1_OUT"."Feature_6" * -0.3373404838354823 + "ADS_sca_1_OUT"."Feature_7" * 0.1550843553371763 + "ADS_sca_1_OUT"."Feature_8" * 0.2854751024551945 + "ADS_sca_1_OUT"."Feature_9" * 0.3270191591377724 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", 0 AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 0 AS nid, 5.69907141 AS "Estimator" FROM rdb$database) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."Estimator" AS "Estimator" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"XGB_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."Estimator" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", 0 AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 0 AS nid, 3.4888196 AS "Estimator" FROM rdb$database) AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."Estimator" AS "Estimator" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"XGB_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."Estimator" AS "Estimator" 
FROM "DT_Output_1"), 
"XGB_0" AS 
(SELECT "XGB_esu_0"."KEY" AS "KEY", "XGB_esu_0"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_Model_0"."KEY" AS "KEY", CAST("XGB_Model_0"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_Model_0" UNION ALL SELECT "XGB_Model_1"."KEY" AS "KEY", CAST("XGB_Model_1"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_Model_1") AS "XGB_esu_0"), 
"XGB" AS 
(SELECT "XGBbig_esu"."KEY" AS "KEY", "XGBbig_esu"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_0"."KEY" AS "KEY", CAST("XGB_0"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM "XGB_0") AS "XGBbig_esu"), 
"XGB_sum" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Estimator" AS DOUBLE PRECISION) AS "Estimator" 
FROM (SELECT "XGB"."KEY" AS "KEY", sum("XGB"."Estimator") AS "Estimator" 
FROM "XGB" GROUP BY "XGB"."KEY") AS "T")
 SELECT "XGB_sum"."KEY" AS "KEY", "XGB_sum"."Estimator" + 0.5 AS "Estimator" 
FROM "XGB_sum"