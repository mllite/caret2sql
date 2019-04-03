-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet_pca
-- Dataset : FourClass_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `ADS_sca_1_OUT` AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - -0.003903374463034224) / 0.985685974308334 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - 0.6152232215702326) / 1.398851036008891 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.04279623691429167) / 1.5057087871323842 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 0.770981955890407) / 2.3480777416797296 AS `Feature_3`, (CAST(`ADS`.`Feature_4` AS DOUBLE) - -0.43300733624893323) / 1.4118274472656485 AS `Feature_4`, (CAST(`ADS`.`Feature_5` AS DOUBLE) - -0.04249569657940362) / 0.961839508883184 AS `Feature_5`, (CAST(`ADS`.`Feature_6` AS DOUBLE) - -0.29809080119845444) / 1.0234297313191445 AS `Feature_6`, (CAST(`ADS`.`Feature_7` AS DOUBLE) - 0.14672241507251668) / 1.610898315451602 AS `Feature_7`, (CAST(`ADS`.`Feature_8` AS DOUBLE) - 0.01746942384662041) / 1.1559772136551034 AS `Feature_8`, (CAST(`ADS`.`Feature_9` AS DOUBLE) - 0.11507331415602873) / 0.975205386360447 AS `Feature_9` 
FROM `FourClass_10` AS `ADS`), 
`ADS_pre_1_OUT` AS 
(SELECT `ADS_sca_1_OUT`.`KEY` AS `KEY`, `ADS_sca_1_OUT`.`Feature_0` * -0.04932772619908273 + `ADS_sca_1_OUT`.`Feature_1` * -0.30424192738374856 + `ADS_sca_1_OUT`.`Feature_2` * -0.3679687561849888 + `ADS_sca_1_OUT`.`Feature_3` * -0.5380769831115797 + `ADS_sca_1_OUT`.`Feature_4` * 0.10802988742400396 + `ADS_sca_1_OUT`.`Feature_5` * 0.13910407016754714 + `ADS_sca_1_OUT`.`Feature_6` * 0.5384086347891889 + `ADS_sca_1_OUT`.`Feature_7` * -0.3713071820395216 + `ADS_sca_1_OUT`.`Feature_8` * 0.0483137135579316 + `ADS_sca_1_OUT`.`Feature_9` * 0.13772539520944088 AS `PC1`, `ADS_sca_1_OUT`.`Feature_0` * 0.4566046379002287 + `ADS_sca_1_OUT`.`Feature_1` * 0.22867203934764516 + `ADS_sca_1_OUT`.`Feature_2` * -0.2673956790968541 + `ADS_sca_1_OUT`.`Feature_3` * 0.01671202428135116 + `ADS_sca_1_OUT`.`Feature_4` * -0.7163497555230034 + `ADS_sca_1_OUT`.`Feature_5` * 0.3501083253113648 + `ADS_sca_1_OUT`.`Feature_6` * -0.02365108420686553 + `ADS_sca_1_OUT`.`Feature_7` * -0.15293556467571348 + `ADS_sca_1_OUT`.`Feature_8` * -0.04278465473081572 + `ADS_sca_1_OUT`.`Feature_9` * -0.07700365586043896 AS `PC2`, `ADS_sca_1_OUT`.`Feature_0` * -0.4595639307438372 + `ADS_sca_1_OUT`.`Feature_1` * 0.3158880900516212 + `ADS_sca_1_OUT`.`Feature_2` * -0.23051961282840416 + `ADS_sca_1_OUT`.`Feature_3` * -0.0044376721269756845 + `ADS_sca_1_OUT`.`Feature_4` * -0.16274384812665132 + `ADS_sca_1_OUT`.`Feature_5` * -0.27453767262313855 + `ADS_sca_1_OUT`.`Feature_6` * 0.06030524407436345 + `ADS_sca_1_OUT`.`Feature_7` * -0.14174903890838467 + `ADS_sca_1_OUT`.`Feature_8` * -0.7115147418569482 + `ADS_sca_1_OUT`.`Feature_9` * -0.06338366606522455 AS `PC3`, `ADS_sca_1_OUT`.`Feature_0` * 0.12741284788275034 + `ADS_sca_1_OUT`.`Feature_1` * 0.08549541136134871 + `ADS_sca_1_OUT`.`Feature_2` * -0.3821190712444285 + `ADS_sca_1_OUT`.`Feature_3` * -0.10433262844841386 + `ADS_sca_1_OUT`.`Feature_4` * 0.08250986211203802 + `ADS_sca_1_OUT`.`Feature_5` * -0.36296260084226667 + `ADS_sca_1_OUT`.`Feature_6` * 0.10962886388759648 + `ADS_sca_1_OUT`.`Feature_7` * 0.2426374781882909 + `ADS_sca_1_OUT`.`Feature_8` * 0.2287736877363014 + `ADS_sca_1_OUT`.`Feature_9` * -0.7468451366164522 AS `PC4`, `ADS_sca_1_OUT`.`Feature_0` * -0.5052628362580355 + `ADS_sca_1_OUT`.`Feature_1` * 0.5459531848285842 + `ADS_sca_1_OUT`.`Feature_2` * -0.22747468245471705 + `ADS_sca_1_OUT`.`Feature_3` * 0.10502795983753949 + `ADS_sca_1_OUT`.`Feature_4` * 0.09502215073405063 + `ADS_sca_1_OUT`.`Feature_5` * 0.36269377695620797 + `ADS_sca_1_OUT`.`Feature_6` * 0.0045813170830969465 + `ADS_sca_1_OUT`.`Feature_7` * -0.05707137281293255 + `ADS_sca_1_OUT`.`Feature_8` * 0.4879473635061551 + `ADS_sca_1_OUT`.`Feature_9` * 0.04384333678041198 AS `PC5`, `ADS_sca_1_OUT`.`Feature_0` * -0.364462956028093 + `ADS_sca_1_OUT`.`Feature_1` * -0.4012918066249357 + `ADS_sca_1_OUT`.`Feature_2` * 0.1851889259404308 + `ADS_sca_1_OUT`.`Feature_3` * -0.03041929320097767 + `ADS_sca_1_OUT`.`Feature_4` * -0.1029513075574872 + `ADS_sca_1_OUT`.`Feature_5` * 0.5811919009803136 + `ADS_sca_1_OUT`.`Feature_6` * -0.060907389766695234 + `ADS_sca_1_OUT`.`Feature_7` * 0.12041134521888586 + `ADS_sca_1_OUT`.`Feature_8` * -0.186159059340367 + `ADS_sca_1_OUT`.`Feature_9` * -0.5192923770633756 AS `PC6`, `ADS_sca_1_OUT`.`Feature_0` * 0.20119583886282807 + `ADS_sca_1_OUT`.`Feature_1` * 0.0677442703839704 + `ADS_sca_1_OUT`.`Feature_2` * -0.41277620208310173 + `ADS_sca_1_OUT`.`Feature_3` * -0.019873248265688318 + `ADS_sca_1_OUT`.`Feature_4` * 0.327357356668028 + `ADS_sca_1_OUT`.`Feature_5` * 0.3399166161542765 + `ADS_sca_1_OUT`.`Feature_6` * 0.007401751370061409 + `ADS_sca_1_OUT`.`Feature_7` * 0.6352452099253666 + `ADS_sca_1_OUT`.`Feature_8` * -0.3190683902934043 + `ADS_sca_1_OUT`.`Feature_9` * 0.23674831363349555 AS `PC7` 
FROM `ADS_sca_1_OUT`), 
linear_input AS 
(SELECT `ADS_pre_1_OUT`.`KEY` AS `KEY`, CAST(`ADS_pre_1_OUT`.`PC1` AS DOUBLE) AS `PC1`, CAST(`ADS_pre_1_OUT`.`PC2` AS DOUBLE) AS `PC2`, CAST(`ADS_pre_1_OUT`.`PC3` AS DOUBLE) AS `PC3`, CAST(`ADS_pre_1_OUT`.`PC4` AS DOUBLE) AS `PC4`, CAST(`ADS_pre_1_OUT`.`PC5` AS DOUBLE) AS `PC5`, CAST(`ADS_pre_1_OUT`.`PC6` AS DOUBLE) AS `PC6`, CAST(`ADS_pre_1_OUT`.`PC7` AS DOUBLE) AS `PC7` 
FROM `ADS_pre_1_OUT`), 
linear_model_cte AS 
(SELECT linear_input.`KEY` AS `KEY`, 0.0 * linear_input.`PC1` + -0.03509185685949591 * linear_input.`PC2` + -0.01623192033270016 * linear_input.`PC3` + 0.0 * linear_input.`PC4` + 0.0 * linear_input.`PC5` + 0.0 * linear_input.`PC6` + 0.0 * linear_input.`PC7` + -0.10159057992336902 AS `Score_0`, -0.06149529266462904 * linear_input.`PC1` + 0.0 * linear_input.`PC2` + 0.0 * linear_input.`PC3` + 0.0 * linear_input.`PC4` + 0.0 * linear_input.`PC5` + 0.0 * linear_input.`PC6` + 0.0 * linear_input.`PC7` + 0.0003054242318690232 AS `Score_1`, 0.030794689378285993 * linear_input.`PC1` + 0.0 * linear_input.`PC2` + 0.0 * linear_input.`PC3` + 0.0 * linear_input.`PC4` + 0.0 * linear_input.`PC5` + 0.0 * linear_input.`PC6` + 0.0 * linear_input.`PC7` + 0.002650917323445189 AS `Score_2`, 0.0 * linear_input.`PC1` + 0.03956682725633712 * linear_input.`PC2` + 0.04667735727806427 * linear_input.`PC3` + 0.0 * linear_input.`PC4` + 0.0 * linear_input.`PC5` + 0.0 * linear_input.`PC6` + -0.0237507604499786 * linear_input.`PC7` + 0.0986342383680548 AS `Score_3` 
FROM linear_input), 
linear_model_cte_logistic AS 
(SELECT linear_model_cte.`KEY` AS `KEY`, linear_model_cte.`Score_0` AS `Score_0`, linear_model_cte.`Score_1` AS `Score_1`, linear_model_cte.`Score_2` AS `Score_2`, linear_model_cte.`Score_3` AS `Score_3` 
FROM linear_model_cte), 
orig_cte AS 
(SELECT linear_model_cte_logistic.`KEY` AS `KEY`, linear_model_cte_logistic.`Score_0` AS `Score_0`, linear_model_cte_logistic.`Score_1` AS `Score_1`, linear_model_cte_logistic.`Score_2` AS `Score_2`, linear_model_cte_logistic.`Score_3` AS `Score_3`, NULL AS `Proba_0`, NULL AS `Proba_1`, NULL AS `Proba_2`, NULL AS `Proba_3`, NULL AS `LogProba_0`, NULL AS `LogProba_1`, NULL AS `LogProba_2`, NULL AS `LogProba_3`, CAST(NULL AS SIGNED INTEGER) AS `Decision`, NULL AS `DecisionProba` 
FROM linear_model_cte_logistic), 
score_class_union AS 
(SELECT scu.`KEY_u` AS `KEY_u`, scu.class AS class, scu.`LogProba` AS `LogProba`, scu.`Proba` AS `Proba`, scu.`Score` AS `Score` 
FROM (SELECT orig_cte.`KEY` AS `KEY_u`, 0 AS class, orig_cte.`LogProba_0` AS `LogProba`, orig_cte.`Proba_0` AS `Proba`, orig_cte.`Score_0` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 1 AS class, orig_cte.`LogProba_1` AS `LogProba`, orig_cte.`Proba_1` AS `Proba`, orig_cte.`Score_1` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 2 AS class, orig_cte.`LogProba_2` AS `LogProba`, orig_cte.`Proba_2` AS `Proba`, orig_cte.`Score_2` AS `Score` 
FROM orig_cte UNION ALL SELECT orig_cte.`KEY` AS `KEY_u`, 3 AS class, orig_cte.`LogProba_3` AS `LogProba`, orig_cte.`Proba_3` AS `Proba`, orig_cte.`Score_3` AS `Score` 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte.`KEY` AS `KEY`, orig_cte.`Score_0` AS `Score_0`, orig_cte.`Score_1` AS `Score_1`, orig_cte.`Score_2` AS `Score_2`, orig_cte.`Score_3` AS `Score_3`, orig_cte.`Proba_0` AS `Proba_0`, orig_cte.`Proba_1` AS `Proba_1`, orig_cte.`Proba_2` AS `Proba_2`, orig_cte.`Proba_3` AS `Proba_3`, orig_cte.`LogProba_0` AS `LogProba_0`, orig_cte.`LogProba_1` AS `LogProba_1`, orig_cte.`LogProba_2` AS `LogProba_2`, orig_cte.`LogProba_3` AS `LogProba_3`, orig_cte.`Decision` AS `Decision`, orig_cte.`DecisionProba` AS `DecisionProba`, max_select.`KEY_m` AS `KEY_m`, max_select.`max_Score` AS `max_Score` 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union.`KEY_u` AS `KEY_m`, max(score_class_union.`Score`) AS `max_Score` 
FROM score_class_union GROUP BY score_class_union.`KEY_u`) AS max_select ON orig_cte.`KEY` = max_select.`KEY_m`), 
score_soft_max_deltas AS 
(SELECT score_max.`KEY` AS `KEY`, score_max.`Score_0` AS `Score_0`, score_max.`Score_1` AS `Score_1`, score_max.`Score_2` AS `Score_2`, score_max.`Score_3` AS `Score_3`, score_max.`Proba_0` AS `Proba_0`, score_max.`Proba_1` AS `Proba_1`, score_max.`Proba_2` AS `Proba_2`, score_max.`Proba_3` AS `Proba_3`, score_max.`LogProba_0` AS `LogProba_0`, score_max.`LogProba_1` AS `LogProba_1`, score_max.`LogProba_2` AS `LogProba_2`, score_max.`LogProba_3` AS `LogProba_3`, score_max.`Decision` AS `Decision`, score_max.`DecisionProba` AS `DecisionProba`, score_max.`KEY_m` AS `KEY_m`, score_max.`max_Score` AS `max_Score`, exp(greatest(-100.0, score_max.`Score_0` - score_max.`max_Score`)) AS `exp_delta_Score_0`, exp(greatest(-100.0, score_max.`Score_1` - score_max.`max_Score`)) AS `exp_delta_Score_1`, exp(greatest(-100.0, score_max.`Score_2` - score_max.`max_Score`)) AS `exp_delta_Score_2`, exp(greatest(-100.0, score_max.`Score_3` - score_max.`max_Score`)) AS `exp_delta_Score_3` 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu.`KEY` AS `KEY`, soft_scu.class AS class, soft_scu.`exp_delta_Score` AS `exp_delta_Score` 
FROM (SELECT score_soft_max_deltas.`KEY` AS `KEY`, 0 AS class, score_soft_max_deltas.`exp_delta_Score_0` AS `exp_delta_Score` 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.`KEY` AS `KEY`, 1 AS class, score_soft_max_deltas.`exp_delta_Score_1` AS `exp_delta_Score` 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.`KEY` AS `KEY`, 2 AS class, score_soft_max_deltas.`exp_delta_Score_2` AS `exp_delta_Score` 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas.`KEY` AS `KEY`, 3 AS class, score_soft_max_deltas.`exp_delta_Score_3` AS `exp_delta_Score` 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas.`KEY` AS `KEY`, score_soft_max_deltas.`Score_0` AS `Score_0`, score_soft_max_deltas.`Score_1` AS `Score_1`, score_soft_max_deltas.`Score_2` AS `Score_2`, score_soft_max_deltas.`Score_3` AS `Score_3`, score_soft_max_deltas.`Proba_0` AS `Proba_0`, score_soft_max_deltas.`Proba_1` AS `Proba_1`, score_soft_max_deltas.`Proba_2` AS `Proba_2`, score_soft_max_deltas.`Proba_3` AS `Proba_3`, score_soft_max_deltas.`LogProba_0` AS `LogProba_0`, score_soft_max_deltas.`LogProba_1` AS `LogProba_1`, score_soft_max_deltas.`LogProba_2` AS `LogProba_2`, score_soft_max_deltas.`LogProba_3` AS `LogProba_3`, score_soft_max_deltas.`Decision` AS `Decision`, score_soft_max_deltas.`DecisionProba` AS `DecisionProba`, score_soft_max_deltas.`KEY_m` AS `KEY_m`, score_soft_max_deltas.`max_Score` AS `max_Score`, score_soft_max_deltas.`exp_delta_Score_0` AS `exp_delta_Score_0`, score_soft_max_deltas.`exp_delta_Score_1` AS `exp_delta_Score_1`, score_soft_max_deltas.`exp_delta_Score_2` AS `exp_delta_Score_2`, score_soft_max_deltas.`exp_delta_Score_3` AS `exp_delta_Score_3`, sum_exp_t.`KEY_sum` AS `KEY_sum`, sum_exp_t.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore` 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft.`KEY` AS `KEY_sum`, sum(score_class_union_soft.`exp_delta_Score`) AS `sum_ExpDeltaScore` 
FROM score_class_union_soft GROUP BY score_class_union_soft.`KEY`) AS sum_exp_t ON score_soft_max_deltas.`KEY` = sum_exp_t.`KEY_sum`), 
union_with_max AS 
(SELECT score_class_union.`KEY_u` AS `KEY_u`, score_class_union.class AS class, score_class_union.`LogProba` AS `LogProba`, score_class_union.`Proba` AS `Proba`, score_class_union.`Score` AS `Score`, score_soft_max.`KEY` AS `KEY`, score_soft_max.`Score_0` AS `Score_0`, score_soft_max.`Score_1` AS `Score_1`, score_soft_max.`Score_2` AS `Score_2`, score_soft_max.`Score_3` AS `Score_3`, score_soft_max.`Proba_0` AS `Proba_0`, score_soft_max.`Proba_1` AS `Proba_1`, score_soft_max.`Proba_2` AS `Proba_2`, score_soft_max.`Proba_3` AS `Proba_3`, score_soft_max.`LogProba_0` AS `LogProba_0`, score_soft_max.`LogProba_1` AS `LogProba_1`, score_soft_max.`LogProba_2` AS `LogProba_2`, score_soft_max.`LogProba_3` AS `LogProba_3`, score_soft_max.`Decision` AS `Decision`, score_soft_max.`DecisionProba` AS `DecisionProba`, score_soft_max.`KEY_m` AS `KEY_m`, score_soft_max.`max_Score` AS `max_Score`, score_soft_max.`exp_delta_Score_0` AS `exp_delta_Score_0`, score_soft_max.`exp_delta_Score_1` AS `exp_delta_Score_1`, score_soft_max.`exp_delta_Score_2` AS `exp_delta_Score_2`, score_soft_max.`exp_delta_Score_3` AS `exp_delta_Score_3`, score_soft_max.`KEY_sum` AS `KEY_sum`, score_soft_max.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore` 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union.`KEY_u` = score_soft_max.`KEY`), 
arg_max_cte AS 
(SELECT score_soft_max.`KEY` AS `KEY`, score_soft_max.`Score_0` AS `Score_0`, score_soft_max.`Score_1` AS `Score_1`, score_soft_max.`Score_2` AS `Score_2`, score_soft_max.`Score_3` AS `Score_3`, score_soft_max.`Proba_0` AS `Proba_0`, score_soft_max.`Proba_1` AS `Proba_1`, score_soft_max.`Proba_2` AS `Proba_2`, score_soft_max.`Proba_3` AS `Proba_3`, score_soft_max.`LogProba_0` AS `LogProba_0`, score_soft_max.`LogProba_1` AS `LogProba_1`, score_soft_max.`LogProba_2` AS `LogProba_2`, score_soft_max.`LogProba_3` AS `LogProba_3`, score_soft_max.`Decision` AS `Decision`, score_soft_max.`DecisionProba` AS `DecisionProba`, score_soft_max.`KEY_m` AS `KEY_m`, score_soft_max.`max_Score` AS `max_Score`, score_soft_max.`exp_delta_Score_0` AS `exp_delta_Score_0`, score_soft_max.`exp_delta_Score_1` AS `exp_delta_Score_1`, score_soft_max.`exp_delta_Score_2` AS `exp_delta_Score_2`, score_soft_max.`exp_delta_Score_3` AS `exp_delta_Score_3`, score_soft_max.`KEY_sum` AS `KEY_sum`, score_soft_max.`sum_ExpDeltaScore` AS `sum_ExpDeltaScore`, `arg_max_t_Score`.`KEY_Score` AS `KEY_Score`, `arg_max_t_Score`.`arg_max_Score` AS `arg_max_Score`, soft_max_comp.`KEY_softmax` AS `KEY_softmax`, soft_max_comp.`SoftProba_0` AS `SoftProba_0`, soft_max_comp.`SoftProba_1` AS `SoftProba_1`, soft_max_comp.`SoftProba_2` AS `SoftProba_2`, soft_max_comp.`SoftProba_3` AS `SoftProba_3` 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max.`KEY` AS `KEY_Score`, max(union_with_max.class) AS `arg_max_Score` 
FROM union_with_max 
WHERE union_with_max.`max_Score` <= union_with_max.`Score` GROUP BY union_with_max.`KEY`) AS `arg_max_t_Score` ON score_soft_max.`KEY` = `arg_max_t_Score`.`KEY_Score` LEFT OUTER JOIN (SELECT score_soft_max.`KEY` AS `KEY_softmax`, score_soft_max.`exp_delta_Score_0` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_0`, score_soft_max.`exp_delta_Score_1` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_1`, score_soft_max.`exp_delta_Score_2` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_2`, score_soft_max.`exp_delta_Score_3` / score_soft_max.`sum_ExpDeltaScore` AS `SoftProba_3` 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp.`KEY_softmax` = `arg_max_t_Score`.`KEY_Score`)
 SELECT arg_max_cte.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, NULL AS `Score_2`, NULL AS `Score_3`, arg_max_cte.`SoftProba_0` AS `Proba_0`, arg_max_cte.`SoftProba_1` AS `Proba_1`, arg_max_cte.`SoftProba_2` AS `Proba_2`, arg_max_cte.`SoftProba_3` AS `Proba_3`, CASE WHEN (arg_max_cte.`SoftProba_0` IS NULL OR arg_max_cte.`SoftProba_0` > 0.0) THEN ln(arg_max_cte.`SoftProba_0`) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (arg_max_cte.`SoftProba_1` IS NULL OR arg_max_cte.`SoftProba_1` > 0.0) THEN ln(arg_max_cte.`SoftProba_1`) ELSE -1.79769313486231e+308 END AS `LogProba_1`, CASE WHEN (arg_max_cte.`SoftProba_2` IS NULL OR arg_max_cte.`SoftProba_2` > 0.0) THEN ln(arg_max_cte.`SoftProba_2`) ELSE -1.79769313486231e+308 END AS `LogProba_2`, CASE WHEN (arg_max_cte.`SoftProba_3` IS NULL OR arg_max_cte.`SoftProba_3` > 0.0) THEN ln(arg_max_cte.`SoftProba_3`) ELSE -1.79769313486231e+308 END AS `LogProba_3`, arg_max_cte.`arg_max_Score` AS `Decision`, greatest(arg_max_cte.`SoftProba_0`, arg_max_cte.`SoftProba_1`, arg_max_cte.`SoftProba_2`, arg_max_cte.`SoftProba_3`) AS `DecisionProba` 
FROM arg_max_cte