-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree
-- Dataset : BreastCancer
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_27" <= 0.1453) THEN CASE WHEN ("ADS"."Feature_13" <= 53.65) THEN CASE WHEN ("ADS"."Feature_23" <= 947.9) THEN CASE WHEN ("ADS"."Feature_13" <= 33.0) THEN 5 ELSE 6 END ELSE 7 END ELSE 8 END ELSE CASE WHEN ("ADS"."Feature_16" <= 0.09953) THEN 10 ELSE 11 END END AS node_id_2 
FROM "BreastCancer" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 5 AS nid, 0.003787878787878791 AS "P_0", 0.9962121212121212 AS "P_1", 1 AS "D", 0.9962121212121212 AS "DP" UNION ALL SELECT 6 AS nid, 0.148148148148148 AS "P_0", 0.851851851851852 AS "P_1", 1 AS "D", 0.851851851851852 AS "DP" UNION ALL SELECT 7 AS nid, 0.75 AS "P_0", 0.25 AS "P_1", 0 AS "D", 0.75 AS "DP" UNION ALL SELECT 8 AS nid, 0.9 AS "P_0", 0.1 AS "P_1", 0 AS "D", 0.9 AS "DP" UNION ALL SELECT 10 AS nid, 0.985611510791367 AS "P_0", 0.0143884892086331 AS "P_1", 0 AS "D", 0.985611510791367 AS "DP" UNION ALL SELECT 11 AS nid, 0.428571428571429 AS "P_0", 0.571428571428571 AS "P_1", 1 AS "D", 0.571428571428571 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", log(CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 1e-100) THEN "DT_Output"."P_0" ELSE 1e-100 END) AS "LogProba_0", log(CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 1e-100) THEN "DT_Output"."P_1" ELSE 1e-100 END) AS "LogProba_1", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"