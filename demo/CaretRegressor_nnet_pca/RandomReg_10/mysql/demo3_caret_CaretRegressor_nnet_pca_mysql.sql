-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet_pca
-- Dataset : RandomReg_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `ADS_sca_1_OUT` AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 0.1668094729813739) / 1.03547567419981 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - -0.1635127199444346) / 0.9978373487111776 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.19149292241003152) / 0.9379956714934372 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 0.05838484475305535) / 1.092422041481253 AS `Feature_3`, (CAST(`ADS`.`Feature_4` AS DOUBLE) - -0.09933205162122273) / 1.081168997121092 AS `Feature_4`, (CAST(`ADS`.`Feature_5` AS DOUBLE) - 0.21293121660488026) / 0.9417116446342017 AS `Feature_5`, (CAST(`ADS`.`Feature_6` AS DOUBLE) - 0.0478655686900296) / 1.1435269275597653 AS `Feature_6`, (CAST(`ADS`.`Feature_7` AS DOUBLE) - 0.05078698959084227) / 0.9786817421858578 AS `Feature_7`, (CAST(`ADS`.`Feature_8` AS DOUBLE) - -0.19131992259081876) / 1.1488000469275086 AS `Feature_8`, (CAST(`ADS`.`Feature_9` AS DOUBLE) - 0.1994040567747336) / 0.8878119561240071 AS `Feature_9` 
FROM `RandomReg_10` AS `ADS`), 
`ADS_pre_1_OUT` AS 
(SELECT `ADS_sca_1_OUT`.`KEY` AS `KEY`, `ADS_sca_1_OUT`.`Feature_0` * 0.1456841447657754 + `ADS_sca_1_OUT`.`Feature_1` * 0.01052326111479696 + `ADS_sca_1_OUT`.`Feature_2` * 0.06914860134209275 + `ADS_sca_1_OUT`.`Feature_3` * 0.395081446850409 + `ADS_sca_1_OUT`.`Feature_4` * 0.5653788508678024 + `ADS_sca_1_OUT`.`Feature_5` * -0.4234978636491337 + `ADS_sca_1_OUT`.`Feature_6` * -0.13347391731421338 + `ADS_sca_1_OUT`.`Feature_7` * 0.5073597310574229 + `ADS_sca_1_OUT`.`Feature_8` * 0.17681881915451916 + `ADS_sca_1_OUT`.`Feature_9` * 0.11089070562205412 AS `PC1`, `ADS_sca_1_OUT`.`Feature_0` * -0.28606729371603284 + `ADS_sca_1_OUT`.`Feature_1` * -0.1416224223949325 + `ADS_sca_1_OUT`.`Feature_2` * -0.21284760934172509 + `ADS_sca_1_OUT`.`Feature_3` * -0.2570681745801655 + `ADS_sca_1_OUT`.`Feature_4` * 0.22505517518455515 + `ADS_sca_1_OUT`.`Feature_5` * -0.01568473246748345 + `ADS_sca_1_OUT`.`Feature_6` * -0.5725136264722785 + `ADS_sca_1_OUT`.`Feature_7` * -0.08820208123478704 + `ADS_sca_1_OUT`.`Feature_8` * -0.3605522366090105 + `ADS_sca_1_OUT`.`Feature_9` * 0.5198800093216087 AS `PC2`, `ADS_sca_1_OUT`.`Feature_0` * 0.3393859060808712 + `ADS_sca_1_OUT`.`Feature_1` * 0.4706204946180642 + `ADS_sca_1_OUT`.`Feature_2` * 0.4682237189969609 + `ADS_sca_1_OUT`.`Feature_3` * -0.24873660011955734 + `ADS_sca_1_OUT`.`Feature_4` * 0.30955843893203433 + `ADS_sca_1_OUT`.`Feature_5` * 0.27598076274469385 + `ADS_sca_1_OUT`.`Feature_6` * -0.3878587432228167 + `ADS_sca_1_OUT`.`Feature_7` * -0.1713140961495792 + `ADS_sca_1_OUT`.`Feature_8` * 0.041332656018300086 + `ADS_sca_1_OUT`.`Feature_9` * -0.16954966329100976 AS `PC3`, `ADS_sca_1_OUT`.`Feature_0` * 0.38499125608277135 + `ADS_sca_1_OUT`.`Feature_1` * -0.4892407072526046 + `ADS_sca_1_OUT`.`Feature_2` * 0.4525070336744841 + `ADS_sca_1_OUT`.`Feature_3` * -0.11446163468336185 + `ADS_sca_1_OUT`.`Feature_4` * -0.08228589793601762 + `ADS_sca_1_OUT`.`Feature_5` * 0.05835205758419686 + `ADS_sca_1_OUT`.`Feature_6` * 0.13193485154948764 + `ADS_sca_1_OUT`.`Feature_7` * 0.2747942471701797 + `ADS_sca_1_OUT`.`Feature_8` * -0.535971424967745 + `ADS_sca_1_OUT`.`Feature_9` * 0.06481665241973472 AS `PC4`, `ADS_sca_1_OUT`.`Feature_0` * -0.4241318059513543 + `ADS_sca_1_OUT`.`Feature_1` * -0.12904202328161374 + `ADS_sca_1_OUT`.`Feature_2` * 0.4375442860931951 + `ADS_sca_1_OUT`.`Feature_3` * 0.3534858161601103 + `ADS_sca_1_OUT`.`Feature_4` * 0.14097295746133154 + `ADS_sca_1_OUT`.`Feature_5` * 0.5320793223160138 + `ADS_sca_1_OUT`.`Feature_6` * 0.15027430836617292 + `ADS_sca_1_OUT`.`Feature_7` * -0.03078935335662195 + `ADS_sca_1_OUT`.`Feature_8` * 0.20609808144469807 + `ADS_sca_1_OUT`.`Feature_9` * 0.3436198360204909 AS `PC5`, `ADS_sca_1_OUT`.`Feature_0` * 0.16994011109828247 + `ADS_sca_1_OUT`.`Feature_1` * 0.33484071907765084 + `ADS_sca_1_OUT`.`Feature_2` * 0.10471628928699762 + `ADS_sca_1_OUT`.`Feature_3` * 0.5541013299742117 + `ADS_sca_1_OUT`.`Feature_4` * -0.14490660804802982 + `ADS_sca_1_OUT`.`Feature_5` * -0.26123038722761205 + `ADS_sca_1_OUT`.`Feature_6` * 0.06579599409431937 + `ADS_sca_1_OUT`.`Feature_7` * -0.4582634526572295 + `ADS_sca_1_OUT`.`Feature_8` * -0.4058380481420916 + `ADS_sca_1_OUT`.`Feature_9` * 0.26968500124997136 AS `PC6`, `ADS_sca_1_OUT`.`Feature_0` * 0.4370347300341415 + `ADS_sca_1_OUT`.`Feature_1` * 0.3004814913700811 + `ADS_sca_1_OUT`.`Feature_2` * -0.29942592437311427 + `ADS_sca_1_OUT`.`Feature_3` * -0.04148829060270187 + `ADS_sca_1_OUT`.`Feature_4` * -0.2386399066951679 + `ADS_sca_1_OUT`.`Feature_5` * 0.3468575401295237 + `ADS_sca_1_OUT`.`Feature_6` * 0.08868221205015787 + `ADS_sca_1_OUT`.`Feature_7` * 0.35236441046927025 + `ADS_sca_1_OUT`.`Feature_8` * 0.13869954974668547 + `ADS_sca_1_OUT`.`Feature_9` * 0.5466373750783862 AS `PC7` 
FROM `ADS_sca_1_OUT`), 
`IL` AS 
(SELECT `ADS_pre_1_OUT`.`KEY` AS `KEY`, CAST(`ADS_pre_1_OUT`.`PC1` AS DOUBLE) AS `PC1`, CAST(`ADS_pre_1_OUT`.`PC2` AS DOUBLE) AS `PC2`, CAST(`ADS_pre_1_OUT`.`PC3` AS DOUBLE) AS `PC3`, CAST(`ADS_pre_1_OUT`.`PC4` AS DOUBLE) AS `PC4`, CAST(`ADS_pre_1_OUT`.`PC5` AS DOUBLE) AS `PC5`, CAST(`ADS_pre_1_OUT`.`PC6` AS DOUBLE) AS `PC6`, CAST(`ADS_pre_1_OUT`.`PC7` AS DOUBLE) AS `PC7` 
FROM `ADS_pre_1_OUT`), 
`HL_BA_1` AS 
(SELECT `IL`.`KEY` AS `KEY`, 83.97232 * `IL`.`PC1` + -76.77144 * `IL`.`PC2` + 112.8967 * `IL`.`PC3` + -11.89547 * `IL`.`PC4` + 106.3288 * `IL`.`PC5` + -5.657423 * `IL`.`PC6` + 59.44377 * `IL`.`PC7` + 24.46676 AS `NEUR_1_1`, 7.729126 * `IL`.`PC1` + 5.969355 * `IL`.`PC2` + 6.142141 * `IL`.`PC3` + 14.96232 * `IL`.`PC4` + 8.497759 * `IL`.`PC5` + -7.25676 * `IL`.`PC6` + 17.98674 * `IL`.`PC7` + -64.53236 AS `NEUR_1_2`, 103.4486 * `IL`.`PC1` + -6.772398 * `IL`.`PC2` + 32.30612 * `IL`.`PC3` + -11.29283 * `IL`.`PC4` + 61.9539 * `IL`.`PC5` + -34.76305 * `IL`.`PC6` + 24.94992 * `IL`.`PC7` + -25.58717 AS `NEUR_1_3`, -37.47276 * `IL`.`PC1` + 93.07602 * `IL`.`PC2` + -69.02543 * `IL`.`PC3` + 41.73531 * `IL`.`PC4` + -113.6599 * `IL`.`PC5` + 6.390174 * `IL`.`PC6` + -57.09446 * `IL`.`PC7` + -37.58414 AS `NEUR_1_4`, -35.64566 * `IL`.`PC1` + 53.68354 * `IL`.`PC2` + -44.44306 * `IL`.`PC3` + 40.82629 * `IL`.`PC4` + -77.61596 * `IL`.`PC5` + 6.798126 * `IL`.`PC6` + -52.01113 * `IL`.`PC7` + -2.66334 AS `NEUR_1_5`, 0.617433 * `IL`.`PC1` + -3.011726 * `IL`.`PC2` + -1.176188 * `IL`.`PC3` + -2.271506 * `IL`.`PC4` + -10.2573 * `IL`.`PC5` + 3.877937 * `IL`.`PC6` + 5.318785 * `IL`.`PC7` + -65.87483 AS `NEUR_1_6`, -118.8894 * `IL`.`PC1` + -19.73958 * `IL`.`PC2` + -60.8711 * `IL`.`PC3` + 24.75927 * `IL`.`PC4` + -46.00153 * `IL`.`PC5` + 2.403381 * `IL`.`PC6` + -15.89862 * `IL`.`PC7` + -72.94179 AS `NEUR_1_7`, -8.865129 * `IL`.`PC1` + 9.630092 * `IL`.`PC2` + 41.91367 * `IL`.`PC3` + -52.35988 * `IL`.`PC4` + 54.29812 * `IL`.`PC5` + -14.46906 * `IL`.`PC6` + 9.416569 * `IL`.`PC7` + -1.156251 AS `NEUR_1_8`, 54.60512 * `IL`.`PC1` + 7.558424 * `IL`.`PC2` + 19.42035 * `IL`.`PC3` + -18.4314 * `IL`.`PC4` + 50.46488 * `IL`.`PC5` + -15.63529 * `IL`.`PC6` + -16.13227 * `IL`.`PC7` + 17.13527 AS `NEUR_1_9`, -47.39415 * `IL`.`PC1` + 0.4317514 * `IL`.`PC2` + 46.25705 * `IL`.`PC3` + 6.707527 * `IL`.`PC4` + 5.637655 * `IL`.`PC5` + 23.69139 * `IL`.`PC6` + 43.27619 * `IL`.`PC7` + -74.47519 AS `NEUR_1_10`, -79.86396 * `IL`.`PC1` + 96.12973 * `IL`.`PC2` + -82.27485 * `IL`.`PC3` + 33.15751 * `IL`.`PC4` + -99.99094 * `IL`.`PC5` + -17.0124 * `IL`.`PC6` + -75.52756 * `IL`.`PC7` + -18.45018 AS `NEUR_1_11`, 71.95266 * `IL`.`PC1` + -53.79583 * `IL`.`PC2` + 15.07734 * `IL`.`PC3` + 34.7564 * `IL`.`PC4` + 29.46265 * `IL`.`PC5` + -7.482735 * `IL`.`PC6` + 66.06244 * `IL`.`PC7` + -25.4109 AS `NEUR_1_12` 
FROM `IL`), 
`HL_1_logistic` AS 
(SELECT `HL_BA_1`.`KEY` AS `KEY`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_1`)))) AS `NEUR_1_1`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_2`)))) AS `NEUR_1_2`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_3`)))) AS `NEUR_1_3`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_4`)))) AS `NEUR_1_4`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_5`)))) AS `NEUR_1_5`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_6`)))) AS `NEUR_1_6`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_7`)))) AS `NEUR_1_7`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_8`)))) AS `NEUR_1_8`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_9`)))) AS `NEUR_1_9`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_10`)))) AS `NEUR_1_10`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_11`)))) AS `NEUR_1_11`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_12`)))) AS `NEUR_1_12` 
FROM `HL_BA_1`), 
`HL_1_logistic_1` AS 
(SELECT `HL_1_logistic`.`KEY` AS `KEY`, `HL_1_logistic`.`NEUR_1_1` AS `NEUR_1_1`, `HL_1_logistic`.`NEUR_1_2` AS `NEUR_1_2`, `HL_1_logistic`.`NEUR_1_3` AS `NEUR_1_3`, `HL_1_logistic`.`NEUR_1_4` AS `NEUR_1_4`, `HL_1_logistic`.`NEUR_1_5` AS `NEUR_1_5`, `HL_1_logistic`.`NEUR_1_6` AS `NEUR_1_6`, `HL_1_logistic`.`NEUR_1_7` AS `NEUR_1_7`, `HL_1_logistic`.`NEUR_1_8` AS `NEUR_1_8`, `HL_1_logistic`.`NEUR_1_9` AS `NEUR_1_9`, `HL_1_logistic`.`NEUR_1_10` AS `NEUR_1_10`, `HL_1_logistic`.`NEUR_1_11` AS `NEUR_1_11`, `HL_1_logistic`.`NEUR_1_12` AS `NEUR_1_12` 
FROM `HL_1_logistic`), 
`OL_BA` AS 
(SELECT `HL_1_logistic_1`.`KEY` AS `KEY`, 21.4479 * `HL_1_logistic_1`.`NEUR_1_1` + 260.9546 * `HL_1_logistic_1`.`NEUR_1_2` + 110.8445 * `HL_1_logistic_1`.`NEUR_1_3` + -138.5386 * `HL_1_logistic_1`.`NEUR_1_4` + -48.62121 * `HL_1_logistic_1`.`NEUR_1_5` + 134.6655 * `HL_1_logistic_1`.`NEUR_1_6` + -47.29779 * `HL_1_logistic_1`.`NEUR_1_7` + 122.2525 * `HL_1_logistic_1`.`NEUR_1_8` + -27.00906 * `HL_1_logistic_1`.`NEUR_1_9` + 95.97373 * `HL_1_logistic_1`.`NEUR_1_10` + 48.36984 * `HL_1_logistic_1`.`NEUR_1_11` + 157.6943 * `HL_1_logistic_1`.`NEUR_1_12` + -80.39637 AS `NEUR_2_1` 
FROM `HL_1_logistic_1`), 
`OL_identity` AS 
(SELECT `OL_BA`.`KEY` AS `KEY`, `OL_BA`.`NEUR_2_1` AS `NEUR_2_1` 
FROM `OL_BA`), 
`OL_identity_1` AS 
(SELECT `OL_identity`.`KEY` AS `KEY`, `OL_identity`.`NEUR_2_1` AS `NEUR_2_1` 
FROM `OL_identity`)
 SELECT `OL_identity_1`.`KEY` AS `KEY`, `OL_identity_1`.`NEUR_2_1` AS `Estimator` 
FROM `OL_identity_1`