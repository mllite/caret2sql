-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmLinear
-- Dataset : RandomReg_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 0.1668094729813739) / 1.03547567419981 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - -0.1635127199444346) / 0.9978373487111776 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.19149292241003152) / 0.9379956714934372 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 0.05838484475305535) / 1.092422041481253 AS `Feature_3`, (CAST(`ADS`.`Feature_4` AS DOUBLE) - -0.09933205162122273) / 1.081168997121092 AS `Feature_4`, (CAST(`ADS`.`Feature_5` AS DOUBLE) - 0.21293121660488026) / 0.9417116446342017 AS `Feature_5`, (CAST(`ADS`.`Feature_6` AS DOUBLE) - 0.0478655686900296) / 1.1435269275597653 AS `Feature_6`, (CAST(`ADS`.`Feature_7` AS DOUBLE) - 0.05078698959084227) / 0.9786817421858578 AS `Feature_7`, (CAST(`ADS`.`Feature_8` AS DOUBLE) - -0.19131992259081876) / 1.1488000469275086 AS `Feature_8`, (CAST(`ADS`.`Feature_9` AS DOUBLE) - 0.1994040567747336) / 0.8878119561240071 AS `Feature_9` 
FROM `RandomReg_10` AS `ADS`), 
`SV_data` AS 
(SELECT `Values`.sv_idx AS sv_idx, `Values`.dual_coeff AS dual_coeff, `Values`.sv_0 AS sv_0, `Values`.sv_1 AS sv_1, `Values`.sv_2 AS sv_2, `Values`.sv_3 AS sv_3, `Values`.sv_4 AS sv_4, `Values`.sv_5 AS sv_5, `Values`.sv_6 AS sv_6, `Values`.sv_7 AS sv_7, `Values`.sv_8 AS sv_8, `Values`.sv_9 AS sv_9 
FROM (SELECT 0 AS sv_idx, -0.02219845074712171 AS dual_coeff, -0.3367795047933305 AS sv_0, -1.6721581876474532 AS sv_1, -1.866557450543607 AS sv_2, -0.9810352611139644 AS sv_3, -0.96142148417521 AS sv_4, -1.0231894253818945 AS sv_5, -0.6750418339230857 AS sv_6, -0.6304890884632106 AS sv_7, 0.3865408603405424 AS sv_8, 0.1229016185527221 AS sv_9 UNION ALL SELECT 1 AS sv_idx, 0.05814331260122756 AS dual_coeff, 0.9863451308921274 AS sv_0, 0.8068375141404786 AS sv_1, -0.481869483126543 AS sv_2, -0.2806281147295018 AS sv_3, 0.1691628624420773 AS sv_4, 1.4553196491617308 AS sv_5, 0.623974553611113 AS sv_6, 0.9828168027369012 AS sv_7, 0.7452294509648771 AS sv_8, 1.2066044923109978 AS sv_9 UNION ALL SELECT 2 AS sv_idx, 0.01830293394606523 AS dual_coeff, 0.21862046259210835 AS sv_0, 0.0008778363753956915 AS sv_1, 2.429159355867712 AS sv_2, 0.6449150364417418 AS sv_3, 0.663647301317877 AS sv_4, -0.6093759322430545 AS sv_5, -0.4648534272676816 AS sv_6, -0.6999006450067693 AS sv_7, 0.034170244613154085 AS sv_8, 1.768234676613871 AS sv_9 UNION ALL SELECT 3 AS sv_idx, 0.0179798262271952 AS dual_coeff, 0.10919945375605628 AS sv_0, 0.8433284775994204 AS sv_1, 1.3598441722933734 AS sv_2, -0.196022132095844 AS sv_3, -0.690864432729647 AS sv_4, -0.8966125913233876 AS sv_5, 1.9701527740970948 AS sv_6, -0.8082892613915197 AS sv_7, 1.0110213051178871 AS sv_8, 0.463304182882941 AS sv_9 UNION ALL SELECT 4 AS sv_idx, -0.187019078555252 AS dual_coeff, 0.5511935398194927 AS sv_0, -1.028281784886602 AS sv_1, -0.7663109565943843 AS sv_2, -1.092552313062242 AS sv_3, -0.4243183467402153 AS sv_4, -0.9772387068910952 AS sv_5, -0.228590720960698 AS sv_6, -0.04619917178998606 AS sv_7, -1.3492515312314266 AS sv_8, -0.7708901415274917 AS sv_9 UNION ALL SELECT 5 AS sv_idx, 0.02952058709684969 AS dual_coeff, 1.7009709095930452 AS sv_0, -0.36130593642636893 AS sv_1, 2.0302468170629453 AS sv_2, 1.2327272356034404 AS sv_3, 0.5901163778370215 AS sv_4, 0.7432164412191822 AS sv_5, -0.7289596754339414 AS sv_6, -1.1984813309711315 AS sv_7, 2.76890332494536 AS sv_8, -2.1829736734777847 AS sv_9 UNION ALL SELECT 6 AS sv_idx, -0.015052585904636382 AS dual_coeff, 0.07642906085355697 AS sv_0, -1.668736902524744 AS sv_1, -1.5299725393127543 AS sv_2, 0.07626662324608538 AS sv_3, 1.9329666642078032 AS sv_4, -1.631758396057862 AS sv_5, -2.301877134596247 AS sv_6, -0.0285076268192774 AS sv_7, 0.5903691871523145 AS sv_8, 0.9562211040797955 AS sv_9 UNION ALL SELECT 7 AS sv_idx, 0.05592053513339528 AS dual_coeff, 2.553377950875531 AS sv_0, 0.4123643877549645 AS sv_1, 0.4538948187779143 AS sv_2, -0.2684479715434145 AS sv_3, 1.9381611098462992 AS sv_4, 0.3609108522887454 AS sv_5, 0.7183439997615954 AS sv_6, 2.6198832352109167 AS sv_7, 0.10992160839454378 AS sv_8, 0.3397630725233129 AS sv_9 UNION ALL SELECT 8 AS sv_idx, 0.02236945814651219 AS dual_coeff, 0.3800674725573591 AS sv_0, 1.6234011136147313 AS sv_1, 1.455685474374032 AS sv_2, -1.1698333988606595 AS sv_3, 1.190398713409102 AS sv_4, 0.1536676314764517 AS sv_5, -0.11548768287645278 AS sv_6, -1.3497024670269315 AS sv_7, 0.052831151601545015 AS sv_8, 1.382060644652528 AS sv_9 UNION ALL SELECT 9 AS sv_idx, 0.0220334620557649 AS dual_coeff, -0.4287069160591596 AS sv_0, -1.1713881641464514 AS sv_1, 0.6933753066428534 AS sv_2, -1.346758336265982 AS sv_3, 1.8827117277665737 AS sv_4, 1.0581035417568927 AS sv_5, -0.02648848106957009 AS sv_6, 1.853459285295502 AS sv_7, 1.3709976023326913 AS sv_8, 0.4060316077017176 AS sv_9) AS `Values`), 
kernel_dp AS 
(SELECT t.`KEY` AS `KEY`, t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.`KEY` AS `KEY`, sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + -0.00437902814810597 AS dot_product 
FROM (SELECT kernel_input_with_scaling.`KEY` AS `KEY`, `SV_data`.dual_coeff * (kernel_input_with_scaling.`Feature_0` * `SV_data`.sv_0 + kernel_input_with_scaling.`Feature_1` * `SV_data`.sv_1 + kernel_input_with_scaling.`Feature_2` * `SV_data`.sv_2 + kernel_input_with_scaling.`Feature_3` * `SV_data`.sv_3 + kernel_input_with_scaling.`Feature_4` * `SV_data`.sv_4 + kernel_input_with_scaling.`Feature_5` * `SV_data`.sv_5 + kernel_input_with_scaling.`Feature_6` * `SV_data`.sv_6 + kernel_input_with_scaling.`Feature_7` * `SV_data`.sv_7 + kernel_input_with_scaling.`Feature_8` * `SV_data`.sv_8 + kernel_input_with_scaling.`Feature_9` * `SV_data`.sv_9) AS dot_prod1 
FROM kernel_input_with_scaling, `SV_data`) AS full_join_data_sv GROUP BY full_join_data_sv.`KEY`) AS t)
 SELECT kernel_dp.`KEY` AS `KEY`, 26.405852730652423 + 212.6549441322689 * kernel_dp.dot_product AS `Estimator` 
FROM kernel_dp