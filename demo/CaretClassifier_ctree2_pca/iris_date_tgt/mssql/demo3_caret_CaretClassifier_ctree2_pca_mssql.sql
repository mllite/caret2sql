-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree2_pca
-- Dataset : iris_date_tgt
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 5.8475) / 0.8305068311812104 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - 3.040833333333333) / 0.4410636176856331 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 3.8441666666666667) / 1.7181578875675667 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 1.245833333333333) / 0.7517929083403303 AS [Feature_3] 
FROM iris_date_tgt AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * -0.5263014514387969 + [ADS_sca_1_OUT].[Feature_1] * 0.2495430740050257 + [ADS_sca_1_OUT].[Feature_2] * -0.5822562654142306 + [ADS_sca_1_OUT].[Feature_3] * -0.5671972124538438 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * 0.35797855187209515 + [ADS_sca_1_OUT].[Feature_1] * 0.9312088394674648 + [ADS_sca_1_OUT].[Feature_2] * 0.009350349831007576 + [ADS_sca_1_OUT].[Feature_3] * 0.06792661227568664 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * 0.7268387018817979 + [ADS_sca_1_OUT].[Feature_1] * -0.2319858665682916 + [ADS_sca_1_OUT].[Feature_2] * -0.142090941958786 + [ADS_sca_1_OUT].[Feature_3] * -0.6306331924126783 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * -0.2579993024404442 + [ADS_sca_1_OUT].[Feature_1] * 0.1294639302135427 + [ADS_sca_1_OUT].[Feature_2] * 0.8004376156560707 + [ADS_sca_1_OUT].[Feature_3] * -0.5253332981610163 AS [PC4] 
FROM [ADS_sca_1_OUT]), 
[DT_node_lookup] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC1] <= 0.607754061772) THEN CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.861756350507) THEN CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.266924738639) THEN 4 ELSE 5 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.240952665429) THEN 7 ELSE 8 END END ELSE 9 END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data] AS 
(SELECT [Values].nid AS nid, [Values].[P_1789-07-14T00:00:00.000000000] AS [P_1789-07-14T00:00:00.000000000], [Values].[P_1789-08-14T00:00:00.000000000] AS [P_1789-08-14T00:00:00.000000000], [Values].[P_1789-09-14T00:00:00.000000000] AS [P_1789-09-14T00:00:00.000000000], [Values].[D] AS [D], [Values].[DP] AS [DP] 
FROM (SELECT 4 AS nid, 0.0 AS [P_1789-07-14T00:00:00.000000000], 0.0 AS [P_1789-08-14T00:00:00.000000000], 1.0 AS [P_1789-09-14T00:00:00.000000000], '1789-09-14T00:00:00.000000000' AS [D], 1.0 AS [DP] UNION ALL SELECT 5 AS nid, 0.0 AS [P_1789-07-14T00:00:00.000000000], 0.5 AS [P_1789-08-14T00:00:00.000000000], 0.5 AS [P_1789-09-14T00:00:00.000000000], '1789-08-14T00:00:00.000000000' AS [D], 0.5 AS [DP] UNION ALL SELECT 7 AS nid, 0.0 AS [P_1789-07-14T00:00:00.000000000], 0.857142857142857 AS [P_1789-08-14T00:00:00.000000000], 0.142857142857143 AS [P_1789-09-14T00:00:00.000000000], '1789-08-14T00:00:00.000000000' AS [D], 0.857142857142857 AS [DP] UNION ALL SELECT 8 AS nid, 0.0 AS [P_1789-07-14T00:00:00.000000000], 1.0 AS [P_1789-08-14T00:00:00.000000000], 0.0 AS [P_1789-09-14T00:00:00.000000000], '1789-08-14T00:00:00.000000000' AS [D], 1.0 AS [DP] UNION ALL SELECT 9 AS nid, 1.0 AS [P_1789-07-14T00:00:00.000000000], 0.0 AS [P_1789-08-14T00:00:00.000000000], 0.0 AS [P_1789-09-14T00:00:00.000000000], '1789-07-14T00:00:00.000000000' AS [D], 1.0 AS [DP]) AS [Values]), 
[DT_Output] AS 
(SELECT [DT_node_lookup].[KEY] AS [KEY], [DT_node_lookup].node_id_2 AS node_id_2, [DT_node_data].nid AS nid, [DT_node_data].[P_1789-07-14T00:00:00.000000000] AS [P_1789-07-14T00:00:00.000000000], [DT_node_data].[P_1789-08-14T00:00:00.000000000] AS [P_1789-08-14T00:00:00.000000000], [DT_node_data].[P_1789-09-14T00:00:00.000000000] AS [P_1789-09-14T00:00:00.000000000], [DT_node_data].[D] AS [D], [DT_node_data].[DP] AS [DP] 
FROM [DT_node_lookup] LEFT OUTER JOIN [DT_node_data] ON [DT_node_lookup].node_id_2 = [DT_node_data].nid)
 SELECT [DT_Output].[KEY] AS [KEY], CAST(NULL AS FLOAT(53)) AS [Score_1789-07-14T00:00:00.000000000], CAST(NULL AS FLOAT(53)) AS [Score_1789-08-14T00:00:00.000000000], CAST(NULL AS FLOAT(53)) AS [Score_1789-09-14T00:00:00.000000000], [DT_Output].[P_1789-07-14T00:00:00.000000000] AS [Proba_1789-07-14T00:00:00.000000000], [DT_Output].[P_1789-08-14T00:00:00.000000000] AS [Proba_1789-08-14T00:00:00.000000000], [DT_Output].[P_1789-09-14T00:00:00.000000000] AS [Proba_1789-09-14T00:00:00.000000000], CASE WHEN ([DT_Output].[P_1789-07-14T00:00:00.000000000] IS NULL OR [DT_Output].[P_1789-07-14T00:00:00.000000000] > 0.0) THEN log([DT_Output].[P_1789-07-14T00:00:00.000000000]) ELSE -1.79769313486231e+308 END AS [LogProba_1789-07-14T00:00:00.000000000], CASE WHEN ([DT_Output].[P_1789-08-14T00:00:00.000000000] IS NULL OR [DT_Output].[P_1789-08-14T00:00:00.000000000] > 0.0) THEN log([DT_Output].[P_1789-08-14T00:00:00.000000000]) ELSE -1.79769313486231e+308 END AS [LogProba_1789-08-14T00:00:00.000000000], CASE WHEN ([DT_Output].[P_1789-09-14T00:00:00.000000000] IS NULL OR [DT_Output].[P_1789-09-14T00:00:00.000000000] > 0.0) THEN log([DT_Output].[P_1789-09-14T00:00:00.000000000]) ELSE -1.79769313486231e+308 END AS [LogProba_1789-09-14T00:00:00.000000000], [DT_Output].[D] AS [Decision], [DT_Output].[DP] AS [DecisionProba] 
FROM [DT_Output]