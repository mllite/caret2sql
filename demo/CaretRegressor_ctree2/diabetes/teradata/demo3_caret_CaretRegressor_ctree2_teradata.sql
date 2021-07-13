-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree2
-- Dataset : diabetes
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_2" <= CAST(0.008883414899 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS"."Feature_8" <= CAST(-0.009918957363 AS DOUBLE PRECISION)) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_8" <= CAST(-0.00149858682 AS DOUBLE PRECISION)) THEN 6 ELSE CASE WHEN ("ADS"."Feature_2" <= CAST(0.055229334075 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS"."Feature_3" <= CAST(0.014986613607 AS DOUBLE PRECISION)) THEN 9 ELSE 10 END ELSE 11 END END END AS node_id_2 
FROM diabetes AS "ADS"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, CAST(95.8515625 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 4 AS nid, CAST(163.30526315789498 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 6 AS nid, CAST(160.742857142857 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 9 AS nid, CAST(157.826086956522 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 10 AS nid, CAST(224.612903225806 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte UNION ALL SELECT 11 AS nid, CAST(253.317073170732 AS DOUBLE PRECISION) AS "E" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"