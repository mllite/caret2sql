-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree2
-- Dataset : FourClass_100
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_44" <= -2.154589109912) THEN 2 ELSE CASE WHEN ("ADS"."Feature_78" <= -0.715454553195) THEN 4 ELSE 5 END END AS node_id_2 
FROM "FOURCLASS_100" "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."P_2" AS "P_2", "Values"."P_3" AS "P_3", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.0 AS "P_0", 0.133333333333333 AS "P_1", 0.866666666666667 AS "P_2", 0.0 AS "P_3", 2 AS "D", 0.866666666666667 AS "DP" FROM DUAL UNION ALL SELECT 4 AS nid, 0.05882352941176471 AS "P_0", 0.23529411764705904 AS "P_1", 0.26470588235294107 AS "P_2", 0.4411764705882351 AS "P_3", 3 AS "D", 0.4411764705882351 AS "DP" FROM DUAL UNION ALL SELECT 5 AS nid, 0.4680851063829786 AS "P_0", 0.3191489361702127 AS "P_1", 0.021276595744680882 AS "P_2", 0.19148936170212782 AS "P_3", 0 AS "D", 0.4680851063829786 AS "DP" FROM DUAL) "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."P_2" AS "P_2", "DT_node_data"."P_3" AS "P_3", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS BINARY_DOUBLE) AS "Score_0", CAST(NULL AS BINARY_DOUBLE) AS "Score_1", CAST(NULL AS BINARY_DOUBLE) AS "Score_2", CAST(NULL AS BINARY_DOUBLE) AS "Score_3", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", "DT_Output"."P_2" AS "Proba_2", "DT_Output"."P_3" AS "Proba_3", CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 0.0) THEN ln("DT_Output"."P_0") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_0", CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 0.0) THEN ln("DT_Output"."P_1") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_1", CASE WHEN ("DT_Output"."P_2" IS NULL OR "DT_Output"."P_2" > 0.0) THEN ln("DT_Output"."P_2") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_2", CASE WHEN ("DT_Output"."P_3" IS NULL OR "DT_Output"."P_3" > 0.0) THEN ln("DT_Output"."P_3") ELSE -BINARY_DOUBLE_INFINITY END AS "LogProba_3", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"