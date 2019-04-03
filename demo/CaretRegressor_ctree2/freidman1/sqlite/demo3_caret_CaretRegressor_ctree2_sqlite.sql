-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree2
-- Dataset : freidman1
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_1" <= 0.442479840339) THEN CASE WHEN ("ADS"."Feature_3" <= 0.49096166785) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_3" <= 0.267780373233) THEN 6 ELSE 7 END END AS node_id_2 
FROM freidman1 AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 9.647465581008289 AS "E" UNION ALL SELECT 4 AS nid, 14.551119504212199 AS "E" UNION ALL SELECT 6 AS nid, 14.2936220845291 AS "E" UNION ALL SELECT 7 AS nid, 19.552805150224 AS "E") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"