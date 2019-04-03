-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_xgbTree
-- Dataset : iris_str_tgt
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [DT_node_lookup] AS 
(SELECT [ADS].[KEY] AS [KEY], CASE WHEN ([ADS].[Feature_2] < 2.45000005) THEN 1 ELSE 2 END AS node_id_2 
FROM iris_str_tgt AS [ADS]), 
[DT_node_data] AS 
(SELECT [Values].nid AS nid, [Values].[Score] AS [Score] 
FROM (SELECT 1 AS nid, 0.565605104 AS [Score] UNION ALL SELECT 2 AS nid, -0.292082161 AS [Score]) AS [Values]), 
[DT_Output] AS 
(SELECT [DT_node_lookup].[KEY] AS [KEY], [DT_node_lookup].node_id_2 AS node_id_2, [DT_node_data].nid AS nid, [DT_node_data].[Score] AS [Score] 
FROM [DT_node_lookup] LEFT OUTER JOIN [DT_node_data] ON [DT_node_lookup].node_id_2 = [DT_node_data].nid), 
[XGB_Model_0_0] AS 
(SELECT [DT_Output].[KEY] AS [KEY], [DT_Output].[Score] AS [Score_CLASS_0], 0.0 AS [Score_CLASS_1], 0.0 AS [Score_CLASS_2] 
FROM [DT_Output]), 
[DT_node_lookup_1] AS 
(SELECT [ADS].[KEY] AS [KEY], CASE WHEN ([ADS].[Feature_2] < 2.45000005) THEN 1 ELSE CASE WHEN ([ADS].[Feature_2] < 4.85000038) THEN 3 ELSE 4 END END AS node_id_2 
FROM iris_str_tgt AS [ADS]), 
[DT_node_data_1] AS 
(SELECT [Values].nid AS nid, [Values].[Score] AS [Score] 
FROM (SELECT 1 AS nid, -0.282802582 AS [Score] UNION ALL SELECT 3 AS nid, 0.523636341 AS [Score] UNION ALL SELECT 4 AS nid, -0.227027059 AS [Score]) AS [Values]), 
[DT_Output_1] AS 
(SELECT [DT_node_lookup_1].[KEY] AS [KEY], [DT_node_lookup_1].node_id_2 AS node_id_2, [DT_node_data_1].nid AS nid, [DT_node_data_1].[Score] AS [Score] 
FROM [DT_node_lookup_1] LEFT OUTER JOIN [DT_node_data_1] ON [DT_node_lookup_1].node_id_2 = [DT_node_data_1].nid), 
[XGB_Model_1_0] AS 
(SELECT [DT_Output_1].[KEY] AS [KEY], 0.0 AS [Score_CLASS_0], [DT_Output_1].[Score] AS [Score_CLASS_1], 0.0 AS [Score_CLASS_2] 
FROM [DT_Output_1]), 
[DT_node_lookup_2] AS 
(SELECT [ADS].[KEY] AS [KEY], CASE WHEN ([ADS].[Feature_2] < 4.85000038) THEN 1 ELSE 2 END AS node_id_2 
FROM iris_str_tgt AS [ADS]), 
[DT_node_data_2] AS 
(SELECT [Values].nid AS nid, [Values].[Score] AS [Score] 
FROM (SELECT 1 AS nid, -0.268370628 AS [Score] UNION ALL SELECT 2 AS nid, 0.512432456 AS [Score]) AS [Values]), 
[DT_Output_2] AS 
(SELECT [DT_node_lookup_2].[KEY] AS [KEY], [DT_node_lookup_2].node_id_2 AS node_id_2, [DT_node_data_2].nid AS nid, [DT_node_data_2].[Score] AS [Score] 
FROM [DT_node_lookup_2] LEFT OUTER JOIN [DT_node_data_2] ON [DT_node_lookup_2].node_id_2 = [DT_node_data_2].nid), 
[XGB_Model_2_0] AS 
(SELECT [DT_Output_2].[KEY] AS [KEY], 0.0 AS [Score_CLASS_0], 0.0 AS [Score_CLASS_1], [DT_Output_2].[Score] AS [Score_CLASS_2] 
FROM [DT_Output_2]), 
[DT_node_lookup_3] AS 
(SELECT [ADS].[KEY] AS [KEY], CASE WHEN ([ADS].[Feature_3] < 0.800000012) THEN 1 ELSE 2 END AS node_id_2 
FROM iris_str_tgt AS [ADS]), 
[DT_node_data_3] AS 
(SELECT [Values].nid AS nid, [Values].[Score] AS [Score] 
FROM (SELECT 1 AS nid, 0.353281915 AS [Score] UNION ALL SELECT 2 AS nid, -0.25220567 AS [Score]) AS [Values]), 
[DT_Output_3] AS 
(SELECT [DT_node_lookup_3].[KEY] AS [KEY], [DT_node_lookup_3].node_id_2 AS node_id_2, [DT_node_data_3].nid AS nid, [DT_node_data_3].[Score] AS [Score] 
FROM [DT_node_lookup_3] LEFT OUTER JOIN [DT_node_data_3] ON [DT_node_lookup_3].node_id_2 = [DT_node_data_3].nid), 
[XGB_Model_0_1] AS 
(SELECT [DT_Output_3].[KEY] AS [KEY], [DT_Output_3].[Score] AS [Score_CLASS_0], 0.0 AS [Score_CLASS_1], 0.0 AS [Score_CLASS_2] 
FROM [DT_Output_3]), 
[DT_node_lookup_4] AS 
(SELECT [ADS].[KEY] AS [KEY], CASE WHEN ([ADS].[Feature_3] < 1.75) THEN CASE WHEN ([ADS].[Feature_3] < 0.800000012) THEN 3 ELSE 4 END ELSE 2 END AS node_id_2 
FROM iris_str_tgt AS [ADS]), 
[DT_node_data_4] AS 
(SELECT [Values].nid AS nid, [Values].[Score] AS [Score] 
FROM (SELECT 2 AS nid, -0.233748123 AS [Score] UNION ALL SELECT 3 AS nid, -0.241275072 AS [Score] UNION ALL SELECT 4 AS nid, 0.321771652 AS [Score]) AS [Values]), 
[DT_Output_4] AS 
(SELECT [DT_node_lookup_4].[KEY] AS [KEY], [DT_node_lookup_4].node_id_2 AS node_id_2, [DT_node_data_4].nid AS nid, [DT_node_data_4].[Score] AS [Score] 
FROM [DT_node_lookup_4] LEFT OUTER JOIN [DT_node_data_4] ON [DT_node_lookup_4].node_id_2 = [DT_node_data_4].nid), 
[XGB_Model_1_1] AS 
(SELECT [DT_Output_4].[KEY] AS [KEY], 0.0 AS [Score_CLASS_0], [DT_Output_4].[Score] AS [Score_CLASS_1], 0.0 AS [Score_CLASS_2] 
FROM [DT_Output_4]), 
[DT_node_lookup_5] AS 
(SELECT [ADS].[KEY] AS [KEY], CASE WHEN ([ADS].[Feature_2] < 4.75) THEN 1 ELSE CASE WHEN ([ADS].[Feature_2] < 5.35000038) THEN 3 ELSE 4 END END AS node_id_2 
FROM iris_str_tgt AS [ADS]), 
[DT_node_data_5] AS 
(SELECT [Values].nid AS nid, [Values].[Score] AS [Score] 
FROM (SELECT 1 AS nid, -0.237592503 AS [Score] UNION ALL SELECT 3 AS nid, 0.221523523 AS [Score] UNION ALL SELECT 4 AS nid, 0.356381148 AS [Score]) AS [Values]), 
[DT_Output_5] AS 
(SELECT [DT_node_lookup_5].[KEY] AS [KEY], [DT_node_lookup_5].node_id_2 AS node_id_2, [DT_node_data_5].nid AS nid, [DT_node_data_5].[Score] AS [Score] 
FROM [DT_node_lookup_5] LEFT OUTER JOIN [DT_node_data_5] ON [DT_node_lookup_5].node_id_2 = [DT_node_data_5].nid), 
[XGB_Model_2_1] AS 
(SELECT [DT_Output_5].[KEY] AS [KEY], 0.0 AS [Score_CLASS_0], 0.0 AS [Score_CLASS_1], [DT_Output_5].[Score] AS [Score_CLASS_2] 
FROM [DT_Output_5]), 
[XGB_0] AS 
(SELECT [XGB_esu_0].[KEY] AS [KEY], [XGB_esu_0].[Score_CLASS_0] AS [Score_CLASS_0], [XGB_esu_0].[Score_CLASS_1] AS [Score_CLASS_1], [XGB_esu_0].[Score_CLASS_2] AS [Score_CLASS_2] 
FROM (SELECT [XGB_Model_0_0].[KEY] AS [KEY], CAST([XGB_Model_0_0].[Score_CLASS_0] AS FLOAT(53)) AS [Score_CLASS_0], CAST([XGB_Model_0_0].[Score_CLASS_1] AS FLOAT(53)) AS [Score_CLASS_1], CAST([XGB_Model_0_0].[Score_CLASS_2] AS FLOAT(53)) AS [Score_CLASS_2] 
FROM [XGB_Model_0_0] UNION ALL SELECT [XGB_Model_1_0].[KEY] AS [KEY], CAST([XGB_Model_1_0].[Score_CLASS_0] AS FLOAT(53)) AS [Score_CLASS_0], CAST([XGB_Model_1_0].[Score_CLASS_1] AS FLOAT(53)) AS [Score_CLASS_1], CAST([XGB_Model_1_0].[Score_CLASS_2] AS FLOAT(53)) AS [Score_CLASS_2] 
FROM [XGB_Model_1_0] UNION ALL SELECT [XGB_Model_2_0].[KEY] AS [KEY], CAST([XGB_Model_2_0].[Score_CLASS_0] AS FLOAT(53)) AS [Score_CLASS_0], CAST([XGB_Model_2_0].[Score_CLASS_1] AS FLOAT(53)) AS [Score_CLASS_1], CAST([XGB_Model_2_0].[Score_CLASS_2] AS FLOAT(53)) AS [Score_CLASS_2] 
FROM [XGB_Model_2_0] UNION ALL SELECT [XGB_Model_0_1].[KEY] AS [KEY], CAST([XGB_Model_0_1].[Score_CLASS_0] AS FLOAT(53)) AS [Score_CLASS_0], CAST([XGB_Model_0_1].[Score_CLASS_1] AS FLOAT(53)) AS [Score_CLASS_1], CAST([XGB_Model_0_1].[Score_CLASS_2] AS FLOAT(53)) AS [Score_CLASS_2] 
FROM [XGB_Model_0_1] UNION ALL SELECT [XGB_Model_1_1].[KEY] AS [KEY], CAST([XGB_Model_1_1].[Score_CLASS_0] AS FLOAT(53)) AS [Score_CLASS_0], CAST([XGB_Model_1_1].[Score_CLASS_1] AS FLOAT(53)) AS [Score_CLASS_1], CAST([XGB_Model_1_1].[Score_CLASS_2] AS FLOAT(53)) AS [Score_CLASS_2] 
FROM [XGB_Model_1_1] UNION ALL SELECT [XGB_Model_2_1].[KEY] AS [KEY], CAST([XGB_Model_2_1].[Score_CLASS_0] AS FLOAT(53)) AS [Score_CLASS_0], CAST([XGB_Model_2_1].[Score_CLASS_1] AS FLOAT(53)) AS [Score_CLASS_1], CAST([XGB_Model_2_1].[Score_CLASS_2] AS FLOAT(53)) AS [Score_CLASS_2] 
FROM [XGB_Model_2_1]) AS [XGB_esu_0]), 
[XGB] AS 
(SELECT [XGBbig_esu].[KEY] AS [KEY], [XGBbig_esu].[Score_CLASS_0] AS [Score_CLASS_0], [XGBbig_esu].[Score_CLASS_1] AS [Score_CLASS_1], [XGBbig_esu].[Score_CLASS_2] AS [Score_CLASS_2] 
FROM (SELECT [XGB_0].[KEY] AS [KEY], CAST([XGB_0].[Score_CLASS_0] AS FLOAT(53)) AS [Score_CLASS_0], CAST([XGB_0].[Score_CLASS_1] AS FLOAT(53)) AS [Score_CLASS_1], CAST([XGB_0].[Score_CLASS_2] AS FLOAT(53)) AS [Score_CLASS_2] 
FROM [XGB_0]) AS [XGBbig_esu]), 
[XGB_sum] AS 
(SELECT [T].[KEY] AS [KEY], CAST([T].[Score_CLASS_0] AS FLOAT(53)) AS [Score_CLASS_0], CAST([T].[Score_CLASS_1] AS FLOAT(53)) AS [Score_CLASS_1], CAST([T].[Score_CLASS_2] AS FLOAT(53)) AS [Score_CLASS_2] 
FROM (SELECT [XGB].[KEY] AS [KEY], sum([XGB].[Score_CLASS_0]) AS [Score_CLASS_0], sum([XGB].[Score_CLASS_1]) AS [Score_CLASS_1], sum([XGB].[Score_CLASS_2]) AS [Score_CLASS_2] 
FROM [XGB] GROUP BY [XGB].[KEY]) AS [T]), 
orig_cte AS 
(SELECT [XGB_sum].[KEY] AS [KEY], [XGB_sum].[Score_CLASS_0] AS [Score_CLASS_0], [XGB_sum].[Score_CLASS_1] AS [Score_CLASS_1], [XGB_sum].[Score_CLASS_2] AS [Score_CLASS_2], CAST(NULL AS FLOAT(53)) AS [Proba_CLASS_0], CAST(NULL AS FLOAT(53)) AS [Proba_CLASS_1], CAST(NULL AS FLOAT(53)) AS [Proba_CLASS_2], CAST(NULL AS FLOAT(53)) AS [LogProba_CLASS_0], CAST(NULL AS FLOAT(53)) AS [LogProba_CLASS_1], CAST(NULL AS FLOAT(53)) AS [LogProba_CLASS_2], CAST(NULL AS BIGINT) AS [Decision], CAST(NULL AS FLOAT(53)) AS [DecisionProba] 
FROM [XGB_sum]), 
score_class_union AS 
(SELECT scu.[KEY_u] AS [KEY_u], scu.class AS class, scu.[LogProba] AS [LogProba], scu.[Proba] AS [Proba], scu.[Score] AS [Score] 
FROM (SELECT orig_cte.[KEY] AS [KEY_u], 'CLASS_0' AS class, orig_cte.[LogProba_CLASS_0] AS [LogProba], orig_cte.[Proba_CLASS_0] AS [Proba], orig_cte.[Score_CLASS_0] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 'CLASS_1' AS class, orig_cte.[LogProba_CLASS_1] AS [LogProba], orig_cte.[Proba_CLASS_1] AS [Proba], orig_cte.[Score_CLASS_1] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 'CLASS_2' AS class, orig_cte.[LogProba_CLASS_2] AS [LogProba], orig_cte.[Proba_CLASS_2] AS [Proba], orig_cte.[Score_CLASS_2] AS [Score] 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.[KEY] AS [KEY], orig_cte.[Score_CLASS_0] AS [Score_CLASS_0], orig_cte.[Score_CLASS_1] AS [Score_CLASS_1], orig_cte.[Score_CLASS_2] AS [Score_CLASS_2], orig_cte.[Proba_CLASS_0] AS [Proba_CLASS_0], orig_cte.[Proba_CLASS_1] AS [Proba_CLASS_1], orig_cte.[Proba_CLASS_2] AS [Proba_CLASS_2], orig_cte.[LogProba_CLASS_0] AS [LogProba_CLASS_0], orig_cte.[LogProba_CLASS_1] AS [LogProba_CLASS_1], orig_cte.[LogProba_CLASS_2] AS [LogProba_CLASS_2], orig_cte.[Decision] AS [Decision], orig_cte.[DecisionProba] AS [DecisionProba], max_select.[KEY_m] AS [KEY_m], max_select.[max_Score] AS [max_Score] 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.[KEY_u] AS [KEY_m], max(score_class_union.[Score]) AS [max_Score] 
FROM score_class_union GROUP BY score_class_union.[KEY_u]) AS max_select ON orig_cte.[KEY] = max_select.[KEY_m]), 
score_soft_max_deltas AS 
(SELECT score_max.[KEY] AS [KEY], score_max.[Score_CLASS_0] AS [Score_CLASS_0], score_max.[Score_CLASS_1] AS [Score_CLASS_1], score_max.[Score_CLASS_2] AS [Score_CLASS_2], score_max.[Proba_CLASS_0] AS [Proba_CLASS_0], score_max.[Proba_CLASS_1] AS [Proba_CLASS_1], score_max.[Proba_CLASS_2] AS [Proba_CLASS_2], score_max.[LogProba_CLASS_0] AS [LogProba_CLASS_0], score_max.[LogProba_CLASS_1] AS [LogProba_CLASS_1], score_max.[LogProba_CLASS_2] AS [LogProba_CLASS_2], score_max.[Decision] AS [Decision], score_max.[DecisionProba] AS [DecisionProba], score_max.[KEY_m] AS [KEY_m], score_max.[max_Score] AS [max_Score], exp(CASE WHEN (-100.0 <= score_max.[Score_CLASS_0] - score_max.[max_Score]) THEN score_max.[Score_CLASS_0] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_CLASS_0], exp(CASE WHEN (-100.0 <= score_max.[Score_CLASS_1] - score_max.[max_Score]) THEN score_max.[Score_CLASS_1] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_CLASS_1], exp(CASE WHEN (-100.0 <= score_max.[Score_CLASS_2] - score_max.[max_Score]) THEN score_max.[Score_CLASS_2] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_CLASS_2] 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu.[KEY] AS [KEY], soft_scu.class AS class, soft_scu.[exp_delta_Score] AS [exp_delta_Score] 
FROM (SELECT score_soft_max_deltas.[KEY] AS [KEY], 'CLASS_0' AS class, score_soft_max_deltas.[exp_delta_Score_CLASS_0] AS [exp_delta_Score] 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.[KEY] AS [KEY], 'CLASS_1' AS class, score_soft_max_deltas.[exp_delta_Score_CLASS_1] AS [exp_delta_Score] 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.[KEY] AS [KEY], 'CLASS_2' AS class, score_soft_max_deltas.[exp_delta_Score_CLASS_2] AS [exp_delta_Score] 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas.[KEY] AS [KEY], score_soft_max_deltas.[Score_CLASS_0] AS [Score_CLASS_0], score_soft_max_deltas.[Score_CLASS_1] AS [Score_CLASS_1], score_soft_max_deltas.[Score_CLASS_2] AS [Score_CLASS_2], score_soft_max_deltas.[Proba_CLASS_0] AS [Proba_CLASS_0], score_soft_max_deltas.[Proba_CLASS_1] AS [Proba_CLASS_1], score_soft_max_deltas.[Proba_CLASS_2] AS [Proba_CLASS_2], score_soft_max_deltas.[LogProba_CLASS_0] AS [LogProba_CLASS_0], score_soft_max_deltas.[LogProba_CLASS_1] AS [LogProba_CLASS_1], score_soft_max_deltas.[LogProba_CLASS_2] AS [LogProba_CLASS_2], score_soft_max_deltas.[Decision] AS [Decision], score_soft_max_deltas.[DecisionProba] AS [DecisionProba], score_soft_max_deltas.[KEY_m] AS [KEY_m], score_soft_max_deltas.[max_Score] AS [max_Score], score_soft_max_deltas.[exp_delta_Score_CLASS_0] AS [exp_delta_Score_CLASS_0], score_soft_max_deltas.[exp_delta_Score_CLASS_1] AS [exp_delta_Score_CLASS_1], score_soft_max_deltas.[exp_delta_Score_CLASS_2] AS [exp_delta_Score_CLASS_2], sum_exp_t.[KEY_sum] AS [KEY_sum], sum_exp_t.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore] 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft.[KEY] AS [KEY_sum], sum(score_class_union_soft.[exp_delta_Score]) AS [sum_ExpDeltaScore] 
FROM score_class_union_soft GROUP BY score_class_union_soft.[KEY]) AS sum_exp_t ON score_soft_max_deltas.[KEY] = sum_exp_t.[KEY_sum]), 
union_with_max AS 
(SELECT score_class_union.[KEY_u] AS [KEY_u], score_class_union.class AS class, score_class_union.[LogProba] AS [LogProba], score_class_union.[Proba] AS [Proba], score_class_union.[Score] AS [Score], score_soft_max.[KEY] AS [KEY], score_soft_max.[Score_CLASS_0] AS [Score_CLASS_0], score_soft_max.[Score_CLASS_1] AS [Score_CLASS_1], score_soft_max.[Score_CLASS_2] AS [Score_CLASS_2], score_soft_max.[Proba_CLASS_0] AS [Proba_CLASS_0], score_soft_max.[Proba_CLASS_1] AS [Proba_CLASS_1], score_soft_max.[Proba_CLASS_2] AS [Proba_CLASS_2], score_soft_max.[LogProba_CLASS_0] AS [LogProba_CLASS_0], score_soft_max.[LogProba_CLASS_1] AS [LogProba_CLASS_1], score_soft_max.[LogProba_CLASS_2] AS [LogProba_CLASS_2], score_soft_max.[Decision] AS [Decision], score_soft_max.[DecisionProba] AS [DecisionProba], score_soft_max.[KEY_m] AS [KEY_m], score_soft_max.[max_Score] AS [max_Score], score_soft_max.[exp_delta_Score_CLASS_0] AS [exp_delta_Score_CLASS_0], score_soft_max.[exp_delta_Score_CLASS_1] AS [exp_delta_Score_CLASS_1], score_soft_max.[exp_delta_Score_CLASS_2] AS [exp_delta_Score_CLASS_2], score_soft_max.[KEY_sum] AS [KEY_sum], score_soft_max.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore] 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union.[KEY_u] = score_soft_max.[KEY]), 
arg_max_cte AS 
(SELECT score_soft_max.[KEY] AS [KEY], score_soft_max.[Score_CLASS_0] AS [Score_CLASS_0], score_soft_max.[Score_CLASS_1] AS [Score_CLASS_1], score_soft_max.[Score_CLASS_2] AS [Score_CLASS_2], score_soft_max.[Proba_CLASS_0] AS [Proba_CLASS_0], score_soft_max.[Proba_CLASS_1] AS [Proba_CLASS_1], score_soft_max.[Proba_CLASS_2] AS [Proba_CLASS_2], score_soft_max.[LogProba_CLASS_0] AS [LogProba_CLASS_0], score_soft_max.[LogProba_CLASS_1] AS [LogProba_CLASS_1], score_soft_max.[LogProba_CLASS_2] AS [LogProba_CLASS_2], score_soft_max.[Decision] AS [Decision], score_soft_max.[DecisionProba] AS [DecisionProba], score_soft_max.[KEY_m] AS [KEY_m], score_soft_max.[max_Score] AS [max_Score], score_soft_max.[exp_delta_Score_CLASS_0] AS [exp_delta_Score_CLASS_0], score_soft_max.[exp_delta_Score_CLASS_1] AS [exp_delta_Score_CLASS_1], score_soft_max.[exp_delta_Score_CLASS_2] AS [exp_delta_Score_CLASS_2], score_soft_max.[KEY_sum] AS [KEY_sum], score_soft_max.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore], [arg_max_t_Score].[KEY_Score] AS [KEY_Score], [arg_max_t_Score].[arg_max_Score] AS [arg_max_Score], soft_max_comp.[KEY_softmax] AS [KEY_softmax], soft_max_comp.[SoftProba_CLASS_0] AS [SoftProba_CLASS_0], soft_max_comp.[SoftProba_CLASS_1] AS [SoftProba_CLASS_1], soft_max_comp.[SoftProba_CLASS_2] AS [SoftProba_CLASS_2] 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max.[KEY] AS [KEY_Score], min(union_with_max.class) AS [arg_max_Score] 
FROM union_with_max 
WHERE union_with_max.[max_Score] <= union_with_max.[Score] GROUP BY union_with_max.[KEY]) AS [arg_max_t_Score] ON score_soft_max.[KEY] = [arg_max_t_Score].[KEY_Score] LEFT OUTER JOIN (SELECT score_soft_max.[KEY] AS [KEY_softmax], score_soft_max.[exp_delta_Score_CLASS_0] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_CLASS_0], score_soft_max.[exp_delta_Score_CLASS_1] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_CLASS_1], score_soft_max.[exp_delta_Score_CLASS_2] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_CLASS_2] 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp.[KEY_softmax] = [arg_max_t_Score].[KEY_Score])
 SELECT arg_max_cte.[KEY] AS [KEY], CAST(NULL AS FLOAT(53)) AS [Score_CLASS_0], CAST(NULL AS FLOAT(53)) AS [Score_CLASS_1], CAST(NULL AS FLOAT(53)) AS [Score_CLASS_2], arg_max_cte.[SoftProba_CLASS_0] AS [Proba_CLASS_0], arg_max_cte.[SoftProba_CLASS_1] AS [Proba_CLASS_1], arg_max_cte.[SoftProba_CLASS_2] AS [Proba_CLASS_2], CASE WHEN (arg_max_cte.[SoftProba_CLASS_0] IS NULL OR arg_max_cte.[SoftProba_CLASS_0] > 0.0) THEN log(arg_max_cte.[SoftProba_CLASS_0]) ELSE -1.79769313486231e+308 END AS [LogProba_CLASS_0], CASE WHEN (arg_max_cte.[SoftProba_CLASS_1] IS NULL OR arg_max_cte.[SoftProba_CLASS_1] > 0.0) THEN log(arg_max_cte.[SoftProba_CLASS_1]) ELSE -1.79769313486231e+308 END AS [LogProba_CLASS_1], CASE WHEN (arg_max_cte.[SoftProba_CLASS_2] IS NULL OR arg_max_cte.[SoftProba_CLASS_2] > 0.0) THEN log(arg_max_cte.[SoftProba_CLASS_2]) ELSE -1.79769313486231e+308 END AS [LogProba_CLASS_2], arg_max_cte.[arg_max_Score] AS [Decision], CASE WHEN (arg_max_cte.[SoftProba_CLASS_0] <= CASE WHEN (arg_max_cte.[SoftProba_CLASS_1] <= arg_max_cte.[SoftProba_CLASS_2]) THEN arg_max_cte.[SoftProba_CLASS_2] ELSE arg_max_cte.[SoftProba_CLASS_1] END) THEN CASE WHEN (arg_max_cte.[SoftProba_CLASS_1] <= arg_max_cte.[SoftProba_CLASS_2]) THEN arg_max_cte.[SoftProba_CLASS_2] ELSE arg_max_cte.[SoftProba_CLASS_1] END ELSE arg_max_cte.[SoftProba_CLASS_0] END AS [DecisionProba] 
FROM arg_max_cte