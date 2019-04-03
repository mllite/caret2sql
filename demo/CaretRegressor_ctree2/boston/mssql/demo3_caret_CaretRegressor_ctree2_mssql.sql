-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree2
-- Dataset : boston
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [DT_node_lookup] AS 
(SELECT [ADS].[KEY] AS [KEY], CASE WHEN ([ADS].[Feature_12] <= 9.71) THEN CASE WHEN ([ADS].[Feature_5] <= 7.42) THEN CASE WHEN ([ADS].[Feature_5] <= 6.593) THEN CASE WHEN ([ADS].[Feature_0] <= 0.62976) THEN CASE WHEN ([ADS].[Feature_5] <= 6.121) THEN 6 ELSE 7 END ELSE 8 END ELSE CASE WHEN ([ADS].[Feature_5] <= 7.107) THEN CASE WHEN ([ADS].[Feature_12] <= 5.1) THEN CASE WHEN ([ADS].[Feature_8] <= 4.0) THEN 12 ELSE 13 END ELSE CASE WHEN ([ADS].[Feature_10] <= 17.4) THEN 15 ELSE 16 END END ELSE 17 END END ELSE CASE WHEN ([ADS].[Feature_8] <= 5.0) THEN 19 ELSE 20 END END ELSE CASE WHEN ([ADS].[Feature_12] <= 14.98) THEN CASE WHEN ([ADS].[Feature_5] <= 6.674) THEN 23 ELSE 24 END ELSE CASE WHEN ([ADS].[Feature_9] <= 437.0) THEN CASE WHEN ([ADS].[Feature_6] <= 73.1) THEN 27 ELSE CASE WHEN ([ADS].[Feature_0] <= 0.17446) THEN 29 ELSE 30 END END ELSE CASE WHEN ([ADS].[Feature_12] <= 21.32) THEN 32 ELSE 33 END END END END AS node_id_2 
FROM boston AS [ADS]), 
[DT_node_data] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 6 AS nid, 20.5545454545455 AS [E] UNION ALL SELECT 7 AS nid, 24.191999999999997 AS [E] UNION ALL SELECT 8 AS nid, 32.0 AS [E] UNION ALL SELECT 12 AS nid, 30.533333333333303 AS [E] UNION ALL SELECT 13 AS nid, 34.3333333333333 AS [E] UNION ALL SELECT 15 AS nid, 28.9583333333333 AS [E] UNION ALL SELECT 16 AS nid, 25.733333333333302 AS [E] UNION ALL SELECT 17 AS nid, 34.5 AS [E] UNION ALL SELECT 19 AS nid, 46.6 AS [E] UNION ALL SELECT 20 AS nid, 40.7857142857143 AS [E] UNION ALL SELECT 23 AS nid, 20.382692307692302 AS [E] UNION ALL SELECT 24 AS nid, 25.542857142857102 AS [E] UNION ALL SELECT 27 AS nid, 21.625 AS [E] UNION ALL SELECT 29 AS nid, 20.457142857142898 AS [E] UNION ALL SELECT 30 AS nid, 15.8647058823529 AS [E] UNION ALL SELECT 32 AS nid, 14.756818181818199 AS [E] UNION ALL SELECT 33 AS nid, 10.478125 AS [E]) AS [Values]), 
[DT_Output] AS 
(SELECT [DT_node_lookup].[KEY] AS [KEY], [DT_node_lookup].node_id_2 AS node_id_2, [DT_node_data].nid AS nid, [DT_node_data].[E] AS [E] 
FROM [DT_node_lookup] LEFT OUTER JOIN [DT_node_data] ON [DT_node_lookup].node_id_2 = [DT_node_data].nid)
 SELECT [DT_Output].[KEY] AS [KEY], [DT_Output].[E] AS [Estimator] 
FROM [DT_Output]