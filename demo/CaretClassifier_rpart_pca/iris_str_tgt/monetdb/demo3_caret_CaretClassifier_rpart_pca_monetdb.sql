-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart_pca
-- Dataset : iris_str_tgt
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 5.8475) / 0.8305068311812104 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 3.040833333333333) / 0.4410636176856331 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 3.8441666666666667) / 1.7181578875675667 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 1.245833333333333) / 0.7517929083403303 AS "Feature_3" 
FROM iris_str_tgt AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.5263014514387969 + "ADS_sca_1_OUT"."Feature_1" * 0.2495430740050257 + "ADS_sca_1_OUT"."Feature_2" * -0.5822562654142306 + "ADS_sca_1_OUT"."Feature_3" * -0.5671972124538438 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.35797855187209515 + "ADS_sca_1_OUT"."Feature_1" * 0.9312088394674648 + "ADS_sca_1_OUT"."Feature_2" * 0.009350349831007576 + "ADS_sca_1_OUT"."Feature_3" * 0.06792661227568664 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.7268387018817979 + "ADS_sca_1_OUT"."Feature_1" * -0.2319858665682916 + "ADS_sca_1_OUT"."Feature_2" * -0.142090941958786 + "ADS_sca_1_OUT"."Feature_3" * -0.6306331924126783 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.2579993024404442 + "ADS_sca_1_OUT"."Feature_1" * 0.1294639302135427 + "ADS_sca_1_OUT"."Feature_2" * 0.8004376156560707 + "ADS_sca_1_OUT"."Feature_3" * -0.5253332981610163 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" >= 1.2587040747751652) THEN 2 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC1" >= -0.8365977917440433) THEN 6 ELSE 7 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_CLASS_0" AS "P_CLASS_0", "Values"."P_CLASS_1" AS "P_CLASS_1", "Values"."P_CLASS_2" AS "P_CLASS_2", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 1.0 AS "P_CLASS_0", 0.0 AS "P_CLASS_1", 0.0 AS "P_CLASS_2", 'CLASS_0' AS "D", 1.0 AS "DP" UNION ALL SELECT 6 AS nid, 0.0 AS "P_CLASS_0", 0.9696969696969697 AS "P_CLASS_1", 0.030303030303030304 AS "P_CLASS_2", 'CLASS_1' AS "D", 0.9696969696969697 AS "DP" UNION ALL SELECT 7 AS nid, 0.0 AS "P_CLASS_0", 0.16 AS "P_CLASS_1", 0.84 AS "P_CLASS_2", 'CLASS_2' AS "D", 0.84 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_CLASS_0" AS "P_CLASS_0", "DT_node_data"."P_CLASS_1" AS "P_CLASS_1", "DT_node_data"."P_CLASS_2" AS "P_CLASS_2", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_CLASS_0", CAST(NULL AS DOUBLE) AS "Score_CLASS_1", CAST(NULL AS DOUBLE) AS "Score_CLASS_2", "DT_Output"."P_CLASS_0" AS "Proba_CLASS_0", "DT_Output"."P_CLASS_1" AS "Proba_CLASS_1", "DT_Output"."P_CLASS_2" AS "Proba_CLASS_2", log(CASE WHEN ("DT_Output"."P_CLASS_0" IS NULL OR "DT_Output"."P_CLASS_0" > 1e-100) THEN "DT_Output"."P_CLASS_0" ELSE 1e-100 END) AS "LogProba_CLASS_0", log(CASE WHEN ("DT_Output"."P_CLASS_1" IS NULL OR "DT_Output"."P_CLASS_1" > 1e-100) THEN "DT_Output"."P_CLASS_1" ELSE 1e-100 END) AS "LogProba_CLASS_1", log(CASE WHEN ("DT_Output"."P_CLASS_2" IS NULL OR "DT_Output"."P_CLASS_2" > 1e-100) THEN "DT_Output"."P_CLASS_2" ELSE 1e-100 END) AS "LogProba_CLASS_2", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"