-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_glmnet
-- Dataset : BreastCancer
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT `ADS`.`KEY` AS `KEY`, CAST(`ADS`.`Feature_0` AS DOUBLE) AS `Feature_0`, CAST(`ADS`.`Feature_1` AS DOUBLE) AS `Feature_1`, CAST(`ADS`.`Feature_2` AS DOUBLE) AS `Feature_2`, CAST(`ADS`.`Feature_3` AS DOUBLE) AS `Feature_3`, CAST(`ADS`.`Feature_4` AS DOUBLE) AS `Feature_4`, CAST(`ADS`.`Feature_5` AS DOUBLE) AS `Feature_5`, CAST(`ADS`.`Feature_6` AS DOUBLE) AS `Feature_6`, CAST(`ADS`.`Feature_7` AS DOUBLE) AS `Feature_7`, CAST(`ADS`.`Feature_8` AS DOUBLE) AS `Feature_8`, CAST(`ADS`.`Feature_9` AS DOUBLE) AS `Feature_9`, CAST(`ADS`.`Feature_10` AS DOUBLE) AS `Feature_10`, CAST(`ADS`.`Feature_11` AS DOUBLE) AS `Feature_11`, CAST(`ADS`.`Feature_12` AS DOUBLE) AS `Feature_12`, CAST(`ADS`.`Feature_13` AS DOUBLE) AS `Feature_13`, CAST(`ADS`.`Feature_14` AS DOUBLE) AS `Feature_14`, CAST(`ADS`.`Feature_15` AS DOUBLE) AS `Feature_15`, CAST(`ADS`.`Feature_16` AS DOUBLE) AS `Feature_16`, CAST(`ADS`.`Feature_17` AS DOUBLE) AS `Feature_17`, CAST(`ADS`.`Feature_18` AS DOUBLE) AS `Feature_18`, CAST(`ADS`.`Feature_19` AS DOUBLE) AS `Feature_19`, CAST(`ADS`.`Feature_20` AS DOUBLE) AS `Feature_20`, CAST(`ADS`.`Feature_21` AS DOUBLE) AS `Feature_21`, CAST(`ADS`.`Feature_22` AS DOUBLE) AS `Feature_22`, CAST(`ADS`.`Feature_23` AS DOUBLE) AS `Feature_23`, CAST(`ADS`.`Feature_24` AS DOUBLE) AS `Feature_24`, CAST(`ADS`.`Feature_25` AS DOUBLE) AS `Feature_25`, CAST(`ADS`.`Feature_26` AS DOUBLE) AS `Feature_26`, CAST(`ADS`.`Feature_27` AS DOUBLE) AS `Feature_27`, CAST(`ADS`.`Feature_28` AS DOUBLE) AS `Feature_28`, CAST(`ADS`.`Feature_29` AS DOUBLE) AS `Feature_29` 
FROM `BreastCancer` AS `ADS`), 
linear_model_cte AS 
(SELECT linear_input.`KEY` AS `KEY`, -0.022782582462136255 * linear_input.`Feature_0` + -0.002352170901368625 * linear_input.`Feature_1` + -0.0033920517145767785 * linear_input.`Feature_2` + -0.00019744130217397732 * linear_input.`Feature_3` + 0.0 * linear_input.`Feature_4` + -0.8639594819415342 * linear_input.`Feature_5` + -0.8029480856431988 * linear_input.`Feature_6` + -2.5328591799015214 * linear_input.`Feature_7` + 0.0 * linear_input.`Feature_8` + 0.0 * linear_input.`Feature_9` + -0.13447614483277856 * linear_input.`Feature_10` + 0.0 * linear_input.`Feature_11` + -0.01472482475379402 * linear_input.`Feature_12` + -0.0004454004417376462 * linear_input.`Feature_13` + 0.0 * linear_input.`Feature_14` + 0.0 * linear_input.`Feature_15` + 0.0 * linear_input.`Feature_16` + 0.0 * linear_input.`Feature_17` + 0.0 * linear_input.`Feature_18` + 0.0 * linear_input.`Feature_19` + -0.02060496090542948 * linear_input.`Feature_20` + -0.004664955269626282 * linear_input.`Feature_21` + -0.002921476607101871 * linear_input.`Feature_22` + -0.0001434103727815258 * linear_input.`Feature_23` + -1.1292299253525695 * linear_input.`Feature_24` + -0.3639002043174477 * linear_input.`Feature_25` + -0.30909869804636814 * linear_input.`Feature_26` + -1.7094054509567527 * linear_input.`Feature_27` + -0.42826551383052164 * linear_input.`Feature_28` + 0.0 * linear_input.`Feature_29` + 3.413328882812064 AS lincomb 
FROM linear_input), 
dot_prod_logistic AS 
(SELECT linear_model_cte.`KEY` AS `KEY`, linear_model_cte.lincomb AS dot_prod, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -linear_model_cte.lincomb)))) AS logistic 
FROM linear_model_cte)
 SELECT dot_prod_logistic.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, 1.0 - dot_prod_logistic.logistic AS `Proba_0`, dot_prod_logistic.logistic AS `Proba_1`, CASE WHEN (1.0 - dot_prod_logistic.logistic IS NULL OR 1.0 - dot_prod_logistic.logistic > 0.0) THEN ln(1.0 - dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (dot_prod_logistic.logistic IS NULL OR dot_prod_logistic.logistic > 0.0) THEN ln(dot_prod_logistic.logistic) ELSE -1.79769313486231e+308 END AS `LogProba_1`, CASE WHEN (dot_prod_logistic.dot_prod > 0.0) THEN 1 ELSE 0 END AS `Decision`, greatest(1.0 - dot_prod_logistic.logistic, dot_prod_logistic.logistic) AS `DecisionProba` 
FROM dot_prod_logistic