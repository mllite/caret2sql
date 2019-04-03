-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree2
-- Dataset : diabetes
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= 0.008883414899) THEN CASE WHEN ("ADS"."Feature_8" <= -0.009918957363) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_8" <= -0.00149858682) THEN 6 ELSE CASE WHEN ("ADS"."Feature_2" <= 0.055229334075) THEN CASE WHEN ("ADS"."Feature_3" <= 0.014986613607) THEN 9 ELSE 10 END ELSE 11 END END END AS node_id_2 
FROM "DIABETES" "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 95.8515625 AS "E" FROM DUAL UNION ALL SELECT 4 AS nid, 163.30526315789498 AS "E" FROM DUAL UNION ALL SELECT 6 AS nid, 160.742857142857 AS "E" FROM DUAL UNION ALL SELECT 9 AS nid, 157.826086956522 AS "E" FROM DUAL UNION ALL SELECT 10 AS nid, 224.612903225806 AS "E" FROM DUAL UNION ALL SELECT 11 AS nid, 253.31707317073202 AS "E" FROM DUAL) "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"