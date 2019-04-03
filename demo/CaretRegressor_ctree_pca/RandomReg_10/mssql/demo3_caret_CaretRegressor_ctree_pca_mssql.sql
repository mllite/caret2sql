-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree_pca
-- Dataset : RandomReg_10
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 0.1668094729813739) / 1.03547567419981 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - -0.1635127199444346) / 0.9978373487111776 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 0.19149292241003152) / 0.9379956714934372 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 0.05838484475305535) / 1.092422041481253 AS [Feature_3], (CAST([ADS].[Feature_4] AS FLOAT(53)) - -0.09933205162122273) / 1.081168997121092 AS [Feature_4], (CAST([ADS].[Feature_5] AS FLOAT(53)) - 0.21293121660488026) / 0.9417116446342017 AS [Feature_5], (CAST([ADS].[Feature_6] AS FLOAT(53)) - 0.0478655686900296) / 1.1435269275597653 AS [Feature_6], (CAST([ADS].[Feature_7] AS FLOAT(53)) - 0.05078698959084227) / 0.9786817421858578 AS [Feature_7], (CAST([ADS].[Feature_8] AS FLOAT(53)) - -0.19131992259081876) / 1.1488000469275086 AS [Feature_8], (CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.1994040567747336) / 0.8878119561240071 AS [Feature_9] 
FROM [RandomReg_10] AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * 0.1456841447657754 + [ADS_sca_1_OUT].[Feature_1] * 0.01052326111479696 + [ADS_sca_1_OUT].[Feature_2] * 0.06914860134209275 + [ADS_sca_1_OUT].[Feature_3] * 0.395081446850409 + [ADS_sca_1_OUT].[Feature_4] * 0.5653788508678024 + [ADS_sca_1_OUT].[Feature_5] * -0.4234978636491337 + [ADS_sca_1_OUT].[Feature_6] * -0.13347391731421338 + [ADS_sca_1_OUT].[Feature_7] * 0.5073597310574229 + [ADS_sca_1_OUT].[Feature_8] * 0.17681881915451916 + [ADS_sca_1_OUT].[Feature_9] * 0.11089070562205412 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * -0.28606729371603284 + [ADS_sca_1_OUT].[Feature_1] * -0.1416224223949325 + [ADS_sca_1_OUT].[Feature_2] * -0.21284760934172509 + [ADS_sca_1_OUT].[Feature_3] * -0.2570681745801655 + [ADS_sca_1_OUT].[Feature_4] * 0.22505517518455515 + [ADS_sca_1_OUT].[Feature_5] * -0.01568473246748345 + [ADS_sca_1_OUT].[Feature_6] * -0.5725136264722785 + [ADS_sca_1_OUT].[Feature_7] * -0.08820208123478704 + [ADS_sca_1_OUT].[Feature_8] * -0.3605522366090105 + [ADS_sca_1_OUT].[Feature_9] * 0.5198800093216087 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * 0.3393859060808712 + [ADS_sca_1_OUT].[Feature_1] * 0.4706204946180642 + [ADS_sca_1_OUT].[Feature_2] * 0.4682237189969609 + [ADS_sca_1_OUT].[Feature_3] * -0.24873660011955734 + [ADS_sca_1_OUT].[Feature_4] * 0.30955843893203433 + [ADS_sca_1_OUT].[Feature_5] * 0.27598076274469385 + [ADS_sca_1_OUT].[Feature_6] * -0.3878587432228167 + [ADS_sca_1_OUT].[Feature_7] * -0.1713140961495792 + [ADS_sca_1_OUT].[Feature_8] * 0.041332656018300086 + [ADS_sca_1_OUT].[Feature_9] * -0.16954966329100976 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * 0.38499125608277135 + [ADS_sca_1_OUT].[Feature_1] * -0.4892407072526046 + [ADS_sca_1_OUT].[Feature_2] * 0.4525070336744841 + [ADS_sca_1_OUT].[Feature_3] * -0.11446163468336185 + [ADS_sca_1_OUT].[Feature_4] * -0.08228589793601762 + [ADS_sca_1_OUT].[Feature_5] * 0.05835205758419686 + [ADS_sca_1_OUT].[Feature_6] * 0.13193485154948764 + [ADS_sca_1_OUT].[Feature_7] * 0.2747942471701797 + [ADS_sca_1_OUT].[Feature_8] * -0.535971424967745 + [ADS_sca_1_OUT].[Feature_9] * 0.06481665241973472 AS [PC4], [ADS_sca_1_OUT].[Feature_0] * -0.4241318059513543 + [ADS_sca_1_OUT].[Feature_1] * -0.12904202328161374 + [ADS_sca_1_OUT].[Feature_2] * 0.4375442860931951 + [ADS_sca_1_OUT].[Feature_3] * 0.3534858161601103 + [ADS_sca_1_OUT].[Feature_4] * 0.14097295746133154 + [ADS_sca_1_OUT].[Feature_5] * 0.5320793223160138 + [ADS_sca_1_OUT].[Feature_6] * 0.15027430836617292 + [ADS_sca_1_OUT].[Feature_7] * -0.03078935335662195 + [ADS_sca_1_OUT].[Feature_8] * 0.20609808144469807 + [ADS_sca_1_OUT].[Feature_9] * 0.3436198360204909 AS [PC5], [ADS_sca_1_OUT].[Feature_0] * 0.16994011109828247 + [ADS_sca_1_OUT].[Feature_1] * 0.33484071907765084 + [ADS_sca_1_OUT].[Feature_2] * 0.10471628928699762 + [ADS_sca_1_OUT].[Feature_3] * 0.5541013299742117 + [ADS_sca_1_OUT].[Feature_4] * -0.14490660804802982 + [ADS_sca_1_OUT].[Feature_5] * -0.26123038722761205 + [ADS_sca_1_OUT].[Feature_6] * 0.06579599409431937 + [ADS_sca_1_OUT].[Feature_7] * -0.4582634526572295 + [ADS_sca_1_OUT].[Feature_8] * -0.4058380481420916 + [ADS_sca_1_OUT].[Feature_9] * 0.26968500124997136 AS [PC6], [ADS_sca_1_OUT].[Feature_0] * 0.4370347300341415 + [ADS_sca_1_OUT].[Feature_1] * 0.3004814913700811 + [ADS_sca_1_OUT].[Feature_2] * -0.29942592437311427 + [ADS_sca_1_OUT].[Feature_3] * -0.04148829060270187 + [ADS_sca_1_OUT].[Feature_4] * -0.2386399066951679 + [ADS_sca_1_OUT].[Feature_5] * 0.3468575401295237 + [ADS_sca_1_OUT].[Feature_6] * 0.08868221205015787 + [ADS_sca_1_OUT].[Feature_7] * 0.35236441046927025 + [ADS_sca_1_OUT].[Feature_8] * 0.13869954974668547 + [ADS_sca_1_OUT].[Feature_9] * 0.5466373750783862 AS [PC7] 
FROM [ADS_sca_1_OUT]), 
[DT_node_lookup] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC5] <= -0.950064023653) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.745944411993) THEN CASE WHEN ([ADS_pre_1_OUT].[PC7] <= -0.432758595075) THEN 5 ELSE 6 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.878165355047) THEN CASE WHEN ([ADS_pre_1_OUT].[PC7] <= -0.455380870024) THEN 9 ELSE 10 END ELSE 11 END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, -226.609500317705 AS [E] UNION ALL SELECT 5 AS nid, -173.737575784249 AS [E] UNION ALL SELECT 6 AS nid, -21.684893084896103 AS [E] UNION ALL SELECT 9 AS nid, 77.1118548898722 AS [E] UNION ALL SELECT 10 AS nid, 255.803862856103 AS [E] UNION ALL SELECT 11 AS nid, -0.78117185885975 AS [E]) AS [Values]), 
[DT_Output] AS 
(SELECT [DT_node_lookup].[KEY] AS [KEY], [DT_node_lookup].node_id_2 AS node_id_2, [DT_node_data].nid AS nid, [DT_node_data].[E] AS [E] 
FROM [DT_node_lookup] LEFT OUTER JOIN [DT_node_data] ON [DT_node_lookup].node_id_2 = [DT_node_data].nid)
 SELECT [DT_Output].[KEY] AS [KEY], [DT_Output].[E] AS [Estimator] 
FROM [DT_Output]