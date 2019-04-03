-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree2
-- Dataset : FourClass_10
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_3" <= -1.906348811364) THEN 2 ELSE CASE WHEN ("ADS"."Feature_7" <= 0.343057625083) THEN CASE WHEN ("ADS"."Feature_4" <= -0.368741519445) THEN 5 ELSE 6 END ELSE CASE WHEN ("ADS"."Feature_1" <= -0.133085777187) THEN 8 ELSE 9 END END END AS node_id_2 
FROM "FourClass_10" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."P_2" AS "P_2", "Values"."P_3" AS "P_3", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 1.0 AS "P_2", 0.0 AS "P_3", 2 AS "D", 1.0 AS "DP" UNION ALL SELECT 5 AS nid, 0.043478260869565195 AS "P_0", 0.0 AS "P_1", 0.13043478260869598 AS "P_2", 0.8260869565217388 AS "P_3", 3 AS "D", 0.8260869565217388 AS "DP" UNION ALL SELECT 6 AS nid, 0.5 AS "P_0", 0.375 AS "P_1", 0.0 AS "P_2", 0.125 AS "P_3", 0 AS "D", 0.5 AS "DP" UNION ALL SELECT 8 AS nid, 0.9166666666666667 AS "P_0", 0.08333333333333329 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0 AS "D", 0.9166666666666667 AS "DP" UNION ALL SELECT 9 AS nid, 0.07407407407407408 AS "P_0", 0.5925925925925929 AS "P_1", 0.25925925925925897 AS "P_2", 0.07407407407407408 AS "P_3", 1 AS "D", 0.5925925925925929 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."P_2" AS "P_2", "DT_node_data"."P_3" AS "P_3", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", CAST(NULL AS DOUBLE) AS "Score_2", CAST(NULL AS DOUBLE) AS "Score_3", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", "DT_Output"."P_2" AS "Proba_2", "DT_Output"."P_3" AS "Proba_3", log(CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 1e-100) THEN "DT_Output"."P_0" ELSE 1e-100 END) AS "LogProba_0", log(CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 1e-100) THEN "DT_Output"."P_1" ELSE 1e-100 END) AS "LogProba_1", log(CASE WHEN ("DT_Output"."P_2" IS NULL OR "DT_Output"."P_2" > 1e-100) THEN "DT_Output"."P_2" ELSE 1e-100 END) AS "LogProba_2", log(CASE WHEN ("DT_Output"."P_3" IS NULL OR "DT_Output"."P_3" > 1e-100) THEN "DT_Output"."P_3" ELSE 1e-100 END) AS "LogProba_3", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"