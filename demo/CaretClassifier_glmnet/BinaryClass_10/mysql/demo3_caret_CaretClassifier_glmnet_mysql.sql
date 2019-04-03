-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet
-- Dataset : BinaryClass_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, CAST(`ADS`.`Feature_0` AS DOUBLE) AS `Feature_0`, CAST(`ADS`.`Feature_1` AS DOUBLE) AS `Feature_1`, CAST(`ADS`.`Feature_2` AS DOUBLE) AS `Feature_2`, CAST(`ADS`.`Feature_3` AS DOUBLE) AS `Feature_3`, CAST(`ADS`.`Feature_4` AS DOUBLE) AS `Feature_4`, CAST(`ADS`.`Feature_5` AS DOUBLE) AS `Feature_5`, CAST(`ADS`.`Feature_6` AS DOUBLE) AS `Feature_6`, CAST(`ADS`.`Feature_7` AS DOUBLE) AS `Feature_7`, CAST(`ADS`.`Feature_8` AS DOUBLE) AS `Feature_8`, CAST(`ADS`.`Feature_9` AS DOUBLE) AS `Feature_9` 
FROM `BinaryClass_10` AS `ADS`), 
linear_model_cte AS 
(SELECT linear_input.`KEY` AS `KEY`, -0.11376229539704255 * linear_input.`Feature_0` + 0.0 * linear_input.`Feature_1` + 0.0 * linear_input.`Feature_2` + 0.0 * linear_input.`Feature_3` + 0.0 * linear_input.`Feature_4` + 0.0 * linear_input.`Feature_5` + 0.0 * linear_input.`Feature_6` + -0.31853886431955314 * linear_input.`Feature_7` + 0.0 * linear_input.`Feature_8` + 0.12756897466011996 * linear_input.`Feature_9` + 0.02610056980810779 AS lincomb 
FROM linear_input), 
dot_prod_logistic AS 
(SELECT linear_model_cte.`KEY` AS `KEY`, linear_model_cte.lincomb AS dot_prod, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -linear_model_cte.lincomb)))) AS logistic 
FROM linear_model_cte)
 SELECT dot_prod_logistic.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, 1.0 - dot_prod_logistic.logistic AS `Proba_0`, dot_prod_logistic.logistic AS `Proba_1`, CASE WHEN (1.0 - dot_prod_logistic.logistic IS NULL OR 1.0 - dot_prod_logistic.logistic > 0.0) THEN ln(1.0 - dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (dot_prod_logistic.logistic IS NULL OR dot_prod_logistic.logistic > 0.0) THEN ln(dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS `LogProba_1`, CASE WHEN (dot_prod_logistic.dot_prod > 0.0) THEN 1 ELSE 0 END AS `Decision`, greatest(1.0 - dot_prod_logistic.logistic, dot_prod_logistic.logistic) AS `DecisionProba` 
FROM dot_prod_logistic