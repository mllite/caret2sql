-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree2
-- Dataset : BinaryClass_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `DT_node_lookup` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_9` <= 0.015023609022) THEN 2 ELSE CASE WHEN (`ADS`.`Feature_6` <= 0.522071829574) THEN 4 ELSE 5 END END AS node_id_2 
FROM `BinaryClass_10` AS `ADS`), 
`DT_node_data` AS 
(SELECT `Values`.nid AS nid, `Values`.`P_0` AS `P_0`, `Values`.`P_1` AS `P_1`, `Values`.`D` AS `D`, `Values`.`DP` AS `DP` 
FROM (SELECT 2 AS nid, 0.808510638297872 AS `P_0`, 0.191489361702128 AS `P_1`, 0 AS `D`, 0.808510638297872 AS `DP` UNION ALL SELECT 4 AS nid, 0.0 AS `P_0`, 1.0 AS `P_1`, 1 AS `D`, 1.0 AS `DP` UNION ALL SELECT 5 AS nid, 0.285714285714286 AS `P_0`, 0.714285714285714 AS `P_1`, 1 AS `D`, 0.714285714285714 AS `DP`) AS `Values`), 
`DT_Output` AS 
(SELECT `DT_node_lookup`.`KEY` AS `KEY`, `DT_node_lookup`.node_id_2 AS node_id_2, `DT_node_data`.nid AS nid, `DT_node_data`.`P_0` AS `P_0`, `DT_node_data`.`P_1` AS `P_1`, `DT_node_data`.`D` AS `D`, `DT_node_data`.`DP` AS `DP` 
FROM `DT_node_lookup` LEFT OUTER JOIN `DT_node_data` ON `DT_node_lookup`.node_id_2 = `DT_node_data`.nid)
 SELECT `DT_Output`.`KEY` AS `KEY`, NULL AS `Score_0`, NULL AS `Score_1`, `DT_Output`.`P_0` AS `Proba_0`, `DT_Output`.`P_1` AS `Proba_1`, CASE WHEN (`DT_Output`.`P_0` IS NULL OR `DT_Output`.`P_0` > 0.0) THEN ln(`DT_Output`.`P_0`) ELSE -1.79769313486231e+308 END AS `LogProba_0`, CASE WHEN (`DT_Output`.`P_1` IS NULL OR `DT_Output`.`P_1` > 0.0) THEN ln(`DT_Output`.`P_1`) ELSE -1.79769313486231e+308 END AS `LogProba_1`, `DT_Output`.`D` AS `Decision`, `DT_Output`.`DP` AS `DecisionProba` 
FROM `DT_Output`