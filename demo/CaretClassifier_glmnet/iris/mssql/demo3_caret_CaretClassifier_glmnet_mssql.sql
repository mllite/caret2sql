-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet
-- Dataset : iris
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT [ADS].[KEY] AS [KEY], CAST([ADS].[Feature_0] AS FLOAT(53)) AS [Feature_0], CAST([ADS].[Feature_1] AS FLOAT(53)) AS [Feature_1], CAST([ADS].[Feature_2] AS FLOAT(53)) AS [Feature_2], CAST([ADS].[Feature_3] AS FLOAT(53)) AS [Feature_3] 
FROM iris AS [ADS]), 
linear_model_cte AS 
(SELECT linear_input.[KEY] AS [KEY], -0.1409300129025394 * linear_input.[Feature_0] + 0.2374057696554108 * linear_input.[Feature_1] + -0.1146737018440189 * linear_input.[Feature_2] + -0.2383310882590158 * linear_input.[Feature_3] + 0.6571649267148013 AS [Score_0], 0.0 * linear_input.[Feature_0] + -0.1870749837727063 * linear_input.[Feature_1] + 0.0 * linear_input.[Feature_2] + 0.0 * linear_input.[Feature_3] + 0.5735517864487583 AS [Score_1], 0.11528720243858685 * linear_input.[Feature_0] + 0.0 * linear_input.[Feature_1] + 0.07784824860723763 * linear_input.[Feature_2] + 0.21302067714664585 * linear_input.[Feature_3] + -1.2307167131635597 AS [Score_2] 
FROM linear_input), 
linear_model_cte_logistic AS 
(SELECT linear_model_cte.[KEY] AS [KEY], linear_model_cte.[Score_0] AS [Score_0], linear_model_cte.[Score_1] AS [Score_1], linear_model_cte.[Score_2] AS [Score_2] 
FROM linear_model_cte), 
orig_cte AS 
(SELECT linear_model_cte_logistic.[KEY] AS [KEY], linear_model_cte_logistic.[Score_0] AS [Score_0], linear_model_cte_logistic.[Score_1] AS [Score_1], linear_model_cte_logistic.[Score_2] AS [Score_2], CAST(NULL AS FLOAT(53)) AS [Proba_0], CAST(NULL AS FLOAT(53)) AS [Proba_1], CAST(NULL AS FLOAT(53)) AS [Proba_2], CAST(NULL AS FLOAT(53)) AS [LogProba_0], CAST(NULL AS FLOAT(53)) AS [LogProba_1], CAST(NULL AS FLOAT(53)) AS [LogProba_2], CAST(NULL AS BIGINT) AS [Decision], CAST(NULL AS FLOAT(53)) AS [DecisionProba] 
FROM linear_model_cte_logistic), 
score_class_union AS 
(SELECT scu.[KEY_u] AS [KEY_u], scu.class AS class, scu.[LogProba] AS [LogProba], scu.[Proba] AS [Proba], scu.[Score] AS [Score] 
FROM (SELECT orig_cte.[KEY] AS [KEY_u], 0 AS class, orig_cte.[LogProba_0] AS [LogProba], orig_cte.[Proba_0] AS [Proba], orig_cte.[Score_0] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 1 AS class, orig_cte.[LogProba_1] AS [LogProba], orig_cte.[Proba_1] AS [Proba], orig_cte.[Score_1] AS [Score] 
FROM orig_cte UNION ALL SELECT orig_cte.[KEY] AS [KEY_u], 2 AS class, orig_cte.[LogProba_2] AS [LogProba], orig_cte.[Proba_2] AS [Proba], orig_cte.[Score_2] AS [Score] 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.[KEY] AS [KEY], orig_cte.[Score_0] AS [Score_0], orig_cte.[Score_1] AS [Score_1], orig_cte.[Score_2] AS [Score_2], orig_cte.[Proba_0] AS [Proba_0], orig_cte.[Proba_1] AS [Proba_1], orig_cte.[Proba_2] AS [Proba_2], orig_cte.[LogProba_0] AS [LogProba_0], orig_cte.[LogProba_1] AS [LogProba_1], orig_cte.[LogProba_2] AS [LogProba_2], orig_cte.[Decision] AS [Decision], orig_cte.[DecisionProba] AS [DecisionProba], max_select.[KEY_m] AS [KEY_m], max_select.[max_Score] AS [max_Score] 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.[KEY_u] AS [KEY_m], max(score_class_union.[Score]) AS [max_Score] 
FROM score_class_union GROUP BY score_class_union.[KEY_u]) AS max_select ON orig_cte.[KEY] = max_select.[KEY_m]), 
score_soft_max_deltas AS 
(SELECT score_max.[KEY] AS [KEY], score_max.[Score_0] AS [Score_0], score_max.[Score_1] AS [Score_1], score_max.[Score_2] AS [Score_2], score_max.[Proba_0] AS [Proba_0], score_max.[Proba_1] AS [Proba_1], score_max.[Proba_2] AS [Proba_2], score_max.[LogProba_0] AS [LogProba_0], score_max.[LogProba_1] AS [LogProba_1], score_max.[LogProba_2] AS [LogProba_2], score_max.[Decision] AS [Decision], score_max.[DecisionProba] AS [DecisionProba], score_max.[KEY_m] AS [KEY_m], score_max.[max_Score] AS [max_Score], exp(CASE WHEN (-100.0 <= score_max.[Score_0] - score_max.[max_Score]) THEN score_max.[Score_0] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_0], exp(CASE WHEN (-100.0 <= score_max.[Score_1] - score_max.[max_Score]) THEN score_max.[Score_1] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_1], exp(CASE WHEN (-100.0 <= score_max.[Score_2] - score_max.[max_Score]) THEN score_max.[Score_2] - score_max.[max_Score] ELSE -100.0 END) AS [exp_delta_Score_2] 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu.[KEY] AS [KEY], soft_scu.class AS class, soft_scu.[exp_delta_Score] AS [exp_delta_Score] 
FROM (SELECT score_soft_max_deltas.[KEY] AS [KEY], 0 AS class, score_soft_max_deltas.[exp_delta_Score_0] AS [exp_delta_Score] 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.[KEY] AS [KEY], 1 AS class, score_soft_max_deltas.[exp_delta_Score_1] AS [exp_delta_Score] 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.[KEY] AS [KEY], 2 AS class, score_soft_max_deltas.[exp_delta_Score_2] AS [exp_delta_Score] 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas.[KEY] AS [KEY], score_soft_max_deltas.[Score_0] AS [Score_0], score_soft_max_deltas.[Score_1] AS [Score_1], score_soft_max_deltas.[Score_2] AS [Score_2], score_soft_max_deltas.[Proba_0] AS [Proba_0], score_soft_max_deltas.[Proba_1] AS [Proba_1], score_soft_max_deltas.[Proba_2] AS [Proba_2], score_soft_max_deltas.[LogProba_0] AS [LogProba_0], score_soft_max_deltas.[LogProba_1] AS [LogProba_1], score_soft_max_deltas.[LogProba_2] AS [LogProba_2], score_soft_max_deltas.[Decision] AS [Decision], score_soft_max_deltas.[DecisionProba] AS [DecisionProba], score_soft_max_deltas.[KEY_m] AS [KEY_m], score_soft_max_deltas.[max_Score] AS [max_Score], score_soft_max_deltas.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max_deltas.[exp_delta_Score_1] AS [exp_delta_Score_1], score_soft_max_deltas.[exp_delta_Score_2] AS [exp_delta_Score_2], sum_exp_t.[KEY_sum] AS [KEY_sum], sum_exp_t.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore] 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft.[KEY] AS [KEY_sum], sum(score_class_union_soft.[exp_delta_Score]) AS [sum_ExpDeltaScore] 
FROM score_class_union_soft GROUP BY score_class_union_soft.[KEY]) AS sum_exp_t ON score_soft_max_deltas.[KEY] = sum_exp_t.[KEY_sum]), 
union_with_max AS 
(SELECT score_class_union.[KEY_u] AS [KEY_u], score_class_union.class AS class, score_class_union.[LogProba] AS [LogProba], score_class_union.[Proba] AS [Proba], score_class_union.[Score] AS [Score], score_soft_max.[KEY] AS [KEY], score_soft_max.[Score_0] AS [Score_0], score_soft_max.[Score_1] AS [Score_1], score_soft_max.[Score_2] AS [Score_2], score_soft_max.[Proba_0] AS [Proba_0], score_soft_max.[Proba_1] AS [Proba_1], score_soft_max.[Proba_2] AS [Proba_2], score_soft_max.[LogProba_0] AS [LogProba_0], score_soft_max.[LogProba_1] AS [LogProba_1], score_soft_max.[LogProba_2] AS [LogProba_2], score_soft_max.[Decision] AS [Decision], score_soft_max.[DecisionProba] AS [DecisionProba], score_soft_max.[KEY_m] AS [KEY_m], score_soft_max.[max_Score] AS [max_Score], score_soft_max.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max.[exp_delta_Score_1] AS [exp_delta_Score_1], score_soft_max.[exp_delta_Score_2] AS [exp_delta_Score_2], score_soft_max.[KEY_sum] AS [KEY_sum], score_soft_max.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore] 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union.[KEY_u] = score_soft_max.[KEY]), 
arg_max_cte AS 
(SELECT score_soft_max.[KEY] AS [KEY], score_soft_max.[Score_0] AS [Score_0], score_soft_max.[Score_1] AS [Score_1], score_soft_max.[Score_2] AS [Score_2], score_soft_max.[Proba_0] AS [Proba_0], score_soft_max.[Proba_1] AS [Proba_1], score_soft_max.[Proba_2] AS [Proba_2], score_soft_max.[LogProba_0] AS [LogProba_0], score_soft_max.[LogProba_1] AS [LogProba_1], score_soft_max.[LogProba_2] AS [LogProba_2], score_soft_max.[Decision] AS [Decision], score_soft_max.[DecisionProba] AS [DecisionProba], score_soft_max.[KEY_m] AS [KEY_m], score_soft_max.[max_Score] AS [max_Score], score_soft_max.[exp_delta_Score_0] AS [exp_delta_Score_0], score_soft_max.[exp_delta_Score_1] AS [exp_delta_Score_1], score_soft_max.[exp_delta_Score_2] AS [exp_delta_Score_2], score_soft_max.[KEY_sum] AS [KEY_sum], score_soft_max.[sum_ExpDeltaScore] AS [sum_ExpDeltaScore], [arg_max_t_Score].[KEY_Score] AS [KEY_Score], [arg_max_t_Score].[arg_max_Score] AS [arg_max_Score], soft_max_comp.[KEY_softmax] AS [KEY_softmax], soft_max_comp.[SoftProba_0] AS [SoftProba_0], soft_max_comp.[SoftProba_1] AS [SoftProba_1], soft_max_comp.[SoftProba_2] AS [SoftProba_2] 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max.[KEY] AS [KEY_Score], max(union_with_max.class) AS [arg_max_Score] 
FROM union_with_max 
WHERE union_with_max.[max_Score] <= union_with_max.[Score] GROUP BY union_with_max.[KEY]) AS [arg_max_t_Score] ON score_soft_max.[KEY] = [arg_max_t_Score].[KEY_Score] LEFT OUTER JOIN (SELECT score_soft_max.[KEY] AS [KEY_softmax], score_soft_max.[exp_delta_Score_0] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_0], score_soft_max.[exp_delta_Score_1] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_1], score_soft_max.[exp_delta_Score_2] / score_soft_max.[sum_ExpDeltaScore] AS [SoftProba_2] 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp.[KEY_softmax] = [arg_max_t_Score].[KEY_Score])
 SELECT arg_max_cte.[KEY] AS [KEY], CAST(NULL AS FLOAT(53)) AS [Score_0], CAST(NULL AS FLOAT(53)) AS [Score_1], CAST(NULL AS FLOAT(53)) AS [Score_2], arg_max_cte.[SoftProba_0] AS [Proba_0], arg_max_cte.[SoftProba_1] AS [Proba_1], arg_max_cte.[SoftProba_2] AS [Proba_2], CASE WHEN (arg_max_cte.[SoftProba_0] IS NULL OR arg_max_cte.[SoftProba_0] > 0.0) THEN log(arg_max_cte.[SoftProba_0]) ELSE -1.79769313486231e+308 END AS [LogProba_0], CASE WHEN (arg_max_cte.[SoftProba_1] IS NULL OR arg_max_cte.[SoftProba_1] > 0.0) THEN log(arg_max_cte.[SoftProba_1]) ELSE -1.79769313486231e+308 END AS [LogProba_1], CASE WHEN (arg_max_cte.[SoftProba_2] IS NULL OR arg_max_cte.[SoftProba_2] > 0.0) THEN log(arg_max_cte.[SoftProba_2]) ELSE -1.79769313486231e+308 END AS [LogProba_2], arg_max_cte.[arg_max_Score] AS [Decision], CASE WHEN (arg_max_cte.[SoftProba_0] <= CASE WHEN (arg_max_cte.[SoftProba_1] <= arg_max_cte.[SoftProba_2]) THEN arg_max_cte.[SoftProba_2] ELSE arg_max_cte.[SoftProba_1] END) THEN CASE WHEN (arg_max_cte.[SoftProba_1] <= arg_max_cte.[SoftProba_2]) THEN arg_max_cte.[SoftProba_2] ELSE arg_max_cte.[SoftProba_1] END ELSE arg_max_cte.[SoftProba_0] END AS [DecisionProba] 
FROM arg_max_cte