-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_ctree
-- Dataset : RandomReg_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `DT_node_lookup` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_2` <= 0.468919970763) THEN CASE WHEN (`ADS`.`Feature_5` <= -0.707345853262) THEN 3 ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.120098900743) THEN 5 ELSE 6 END END ELSE CASE WHEN (`ADS`.`Feature_4` <= -0.871237880031) THEN 8 ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.163720092558) THEN 10 ELSE 11 END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 3 AS nid, -239.512915817104 AS `E` UNION ALL SELECT 5 AS nid, -87.1983637153615 AS `E` UNION ALL SELECT 6 AS nid, 148.864700624648 AS `E` UNION ALL SELECT 8 AS nid, -23.0119565200856 AS `E` UNION ALL SELECT 10 AS nid, 106.753935398927 AS `E` UNION ALL SELECT 11 AS nid, 271.084485119348 AS `E`) AS `Values`), 
`DT_Output` AS 
(SELECT `DT_node_lookup`.`KEY` AS `KEY`, `DT_node_lookup`.node_id_2 AS node_id_2, `DT_node_data`.nid AS nid, `DT_node_data`.`E` AS `E` 
FROM `DT_node_lookup` LEFT OUTER JOIN `DT_node_data` ON `DT_node_lookup`.node_id_2 = `DT_node_data`.nid)
 SELECT `DT_Output`.`KEY` AS `KEY`, `DT_Output`.`E` AS `Estimator` 
FROM `DT_Output`