-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree_pca
-- Dataset : freidman3
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 43.791281222074) / 26.1998878150635 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - 945.96728330844) / 464.3666952541536 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 0.5310009099975209) / 0.2920171749459157 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 6.139967152050498) / 3.0923049253819994 AS [Feature_3] 
FROM freidman3 AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * -0.6121650749100701 + [ADS_sca_1_OUT].[Feature_1] * 0.5464782903329433 + [ADS_sca_1_OUT].[Feature_2] * -0.5708677485644764 + [ADS_sca_1_OUT].[Feature_3] * -0.02693349038014348 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * 0.4888813380420076 + [ADS_sca_1_OUT].[Feature_1] * 0.2745192584561386 + [ADS_sca_1_OUT].[Feature_2] * -0.2238449995359107 + [ADS_sca_1_OUT].[Feature_3] * -0.7971998684355868 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * -0.024686176636208892 + [ADS_sca_1_OUT].[Feature_1] * 0.7091918576518509 + [ADS_sca_1_OUT].[Feature_2] * 0.7038817472089458 + [ADS_sca_1_OUT].[Feature_3] * 0.03143227114740615 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * -0.6209988333786876 + [ADS_sca_1_OUT].[Feature_1] * -0.3507813620644518 + [ADS_sca_1_OUT].[Feature_2] * 0.358544161544677 + [ADS_sca_1_OUT].[Feature_3] * -0.6022947527521242 AS [PC4] 
FROM [ADS_sca_1_OUT]), 
[DT_node_lookup] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.569463483746) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.049145273072) THEN 4 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.696688842546) THEN 6 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.591623930212) THEN 8 ELSE 9 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, 1.1141061849074099 AS [E] UNION ALL SELECT 4 AS nid, 1.3643933364328402 AS [E] UNION ALL SELECT 6 AS nid, 1.48631528766843 AS [E] UNION ALL SELECT 8 AS nid, 1.5454993885883102 AS [E] UNION ALL SELECT 9 AS nid, 1.50843913328263 AS [E]) AS [Values]), 
[DT_Output] AS 
(SELECT [DT_node_lookup].[KEY] AS [KEY], [DT_node_lookup].node_id_2 AS node_id_2, [DT_node_data].nid AS nid, [DT_node_data].[E] AS [E] 
FROM [DT_node_lookup] LEFT OUTER JOIN [DT_node_data] ON [DT_node_lookup].node_id_2 = [DT_node_data].nid)
 SELECT [DT_Output].[KEY] AS [KEY], [DT_Output].[E] AS [Estimator] 
FROM [DT_Output]