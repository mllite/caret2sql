-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmPoly_pca
-- Dataset : freidman2
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `ADS_sca_1_OUT` AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 43.791281222074) / 26.1998878150635 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - 945.96728330844) / 464.3666952541536 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS `Feature_3` 
FROM freidman2 AS `ADS`), 
`ADS_pre_1_OUT` AS 
(SELECT `ADS_sca_1_OUT`.`KEY` AS `KEY`, `ADS_sca_1_OUT`.`Feature_0` * -0.6121650749100701 + `ADS_sca_1_OUT`.`Feature_1` * 0.5464782903329433 + `ADS_sca_1_OUT`.`Feature_2` * -0.5708677485644764 + `ADS_sca_1_OUT`.`Feature_3` * -0.02693349038014348 AS `PC1`, `ADS_sca_1_OUT`.`Feature_0` * 0.4888813380420076 + `ADS_sca_1_OUT`.`Feature_1` * 0.2745192584561386 + `ADS_sca_1_OUT`.`Feature_2` * -0.2238449995359107 + `ADS_sca_1_OUT`.`Feature_3` * -0.7971998684355868 AS `PC2`, `ADS_sca_1_OUT`.`Feature_0` * -0.024686176636208892 + `ADS_sca_1_OUT`.`Feature_1` * 0.7091918576518509 + `ADS_sca_1_OUT`.`Feature_2` * 0.7038817472089458 + `ADS_sca_1_OUT`.`Feature_3` * 0.03143227114740615 AS `PC3`, `ADS_sca_1_OUT`.`Feature_0` * -0.6209988333786876 + `ADS_sca_1_OUT`.`Feature_1` * -0.3507813620644518 + `ADS_sca_1_OUT`.`Feature_2` * 0.358544161544677 + `ADS_sca_1_OUT`.`Feature_3` * -0.6022947527521242 AS `PC4` 
FROM `ADS_sca_1_OUT`), 
kernel_input_with_scaling AS 
(SELECT `ADS_pre_1_OUT`.`KEY` AS `KEY`, (CAST(`ADS_pre_1_OUT`.`PC1` AS DOUBLE) - 7.259817746962938e-17) / 1.0912921970850795 AS `PC1`, (CAST(`ADS_pre_1_OUT`.`PC2` AS DOUBLE) - 4.6837533851373785e-17) / 1.0787025043586622 AS `PC2`, (CAST(`ADS_pre_1_OUT`.`PC3` AS DOUBLE) - -6.609296443471634e-17) / 0.9655534556992196 AS `PC3`, (CAST(`ADS_pre_1_OUT`.`PC4` AS DOUBLE) - -2.203098814490545e-17) / 0.8445050454904731 AS `PC4` 
FROM `ADS_pre_1_OUT`), 
`SV_data` AS 
(SELECT `Values`.sv_idx AS sv_idx, `Values`.dual_coeff AS dual_coeff, `Values`.sv_0 AS sv_0, `Values`.sv_1 AS sv_1, `Values`.sv_2 AS sv_2, `Values`.sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.253383876033811 AS dual_coeff, 1.37850089854269 AS sv_0, 1.191161406549864 AS sv_1, 0.05089855230848973 AS sv_2, -0.8964391596224827 AS sv_3 UNION ALL SELECT 1 AS sv_idx, 0.01855903373919684 AS dual_coeff, 0.15237495262279765 AS sv_0, -0.7546459295194593 AS sv_1, 1.8534269105418688 AS sv_2, -1.1168298691466336 AS sv_3 UNION ALL SELECT 2 AS sv_idx, 0.2784388218690412 AS dual_coeff, -0.5771110361354514 AS sv_0, 0.5484588455313958 AS sv_1, 1.3160792801997816 AS sv_2, 1.3039486790441286 AS sv_3 UNION ALL SELECT 3 AS sv_idx, 0.007962502075542329 AS dual_coeff, -0.11504934855312395 AS sv_0, -0.5417883638361547 AS sv_1, -1.941763685449151 AS sv_2, -1.701579213947659 AS sv_3 UNION ALL SELECT 4 AS sv_idx, -0.13201583387729118 AS dual_coeff, -1.3484161330190985 AS sv_0, 0.3619825146745239 AS sv_1, 0.20177401272176335 AS sv_2, 2.3281536354101884 AS sv_3 UNION ALL SELECT 5 AS sv_idx, -0.07422423748355764 AS dual_coeff, -0.33139320711377185 AS sv_0, -1.8324326878696413 AS sv_1, 0.615337245382805 AS sv_2, 1.730019845417768 AS sv_3 UNION ALL SELECT 6 AS sv_idx, 0.5415093334215412 AS dual_coeff, 1.1623381422247647 AS sv_0, -0.2946826758671762 AS sv_1, 1.5730523524737925 AS sv_2, 0.6221839714024429 AS sv_3 UNION ALL SELECT 7 AS sv_idx, -0.023257890980353746 AS dual_coeff, -0.4166382298158355 AS sv_0, 2.378813663050534 AS sv_1, -0.902583443484049 AS sv_2, -0.868927903554924 AS sv_3 UNION ALL SELECT 8 AS sv_idx, 0.2527075890284157 AS dual_coeff, -0.16828540326040994 AS sv_0, -1.2518904350496618 AS sv_1, 2.0197246545043206 AS sv_2, -0.8039021154910663 AS sv_3 UNION ALL SELECT 9 AS sv_idx, -0.2335490355201043 AS dual_coeff, -1.4925296439214475 AS sv_0, -1.2101666301463625 AS sv_1, -0.13193963626985628 AS sv_2, -0.2283141200818075 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -0.04266903498006475 AS dual_coeff, -0.5650957902827647 AS sv_0, -1.8692319578289327 AS sv_1, -0.6984537411456064 AS sv_2, 0.9435761306003548 AS sv_3 UNION ALL SELECT 11 AS sv_idx, -0.09537706727258828 AS dual_coeff, 2.339879525546283 AS sv_0, 1.1714521819539243 AS sv_1, -0.12302295652274545 AS sv_2, 0.5224606031209847 AS sv_3 UNION ALL SELECT 12 AS sv_idx, -0.4737849563387233 AS dual_coeff, 1.990921411400796 AS sv_0, 0.1383924046659286 AS sv_1, -0.31028705038580057 AS sv_2, -0.4961920992645837 AS sv_3 UNION ALL SELECT 13 AS sv_idx, 0.15991084736448266 AS dual_coeff, -0.07615280303272615 AS sv_0, 1.052700600607052 AS sv_1, 1.0934129854728014 AS sv_2, 0.7220233633050731 AS sv_3 UNION ALL SELECT 14 AS sv_idx, -0.4153331337683592 AS dual_coeff, -2.022673441251131 AS sv_0, -0.1084335030849492 AS sv_1, -0.12626174946808813 AS sv_2, 0.6100438112889778 AS sv_3 UNION ALL SELECT 15 AS sv_idx, 0.4845069387566333 AS dual_coeff, -1.171639821886214 AS sv_0, 0.5442159347926955 AS sv_1, 1.684051478875226 AS sv_2, -0.6066278790061805 AS sv_3) AS `Values`), 
kernel_dp AS 
(SELECT t.`KEY` AS `KEY`, t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.`KEY` AS `KEY`, sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + 0.0303245372537232 AS dot_product 
FROM (SELECT kernel_input_with_scaling.`KEY` AS `KEY`, `SV_data`.dual_coeff * power(0.1 * (kernel_input_with_scaling.`PC1` * `SV_data`.sv_0 + kernel_input_with_scaling.`PC2` * `SV_data`.sv_1 + kernel_input_with_scaling.`PC3` * `SV_data`.sv_2 + kernel_input_with_scaling.`PC4` * `SV_data`.sv_3) + 1.0, 3.0) AS dot_prod1 
FROM kernel_input_with_scaling, `SV_data`) AS full_join_data_sv GROUP BY full_join_data_sv.`KEY`) AS t)
 SELECT kernel_dp.`KEY` AS `KEY`, 499.0928844651739 + 374.0338110593958 * kernel_dp.dot_product AS `Estimator` 
FROM kernel_dp