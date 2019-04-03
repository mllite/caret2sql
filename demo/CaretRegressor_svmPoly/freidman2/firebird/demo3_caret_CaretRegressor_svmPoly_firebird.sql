-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmPoly
-- Dataset : freidman2
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM freidman2 AS "ADS"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.16776729985569552 AS dual_coeff, 0.1761714069719212 AS sv_0, 1.4752368786239876 AS sv_1, -1.3832462117331343 AS sv_2, -0.6073360229414164 AS sv_3 FROM rdb$database UNION ALL SELECT 1 AS sv_idx, 0.0342830405574434 AS dual_coeff, 0.04176611343366199 AS sv_0, 1.4674056735783636 AS sv_1, 1.0087784473355752 AS sv_2, 1.268788761557724 AS sv_3 FROM rdb$database UNION ALL SELECT 2 AS sv_idx, 0.40545484084164896 AS dual_coeff, -0.04043482156586061 AS sv_0, 0.33316647170492614 AS sv_1, 1.516378433743919 AS sv_2, -1.0779792006390798 AS sv_3 FROM rdb$database UNION ALL SELECT 3 AS sv_idx, 0.037277611176329516 AS dual_coeff, 0.7297966940855642 AS sv_0, -1.0546257130717192 AS sv_1, -1.6324213800380485 AS sv_2, 1.2758491111612755 AS sv_3 FROM rdb$database UNION ALL SELECT 4 AS sv_idx, -0.2470277614718432 AS dual_coeff, -0.13407363073193884 AS sv_0, -1.2484766986547693 AS sv_1, 1.5947158390479144 AS sv_2, -1.4497212689408288 AS sv_3 FROM rdb$database UNION ALL SELECT 5 AS sv_idx, -0.0912149867121087 AS dual_coeff, -1.6669124897856251 AS sv_0, -0.8313958413955534 AS sv_1, 1.5909574525996732 AS sv_2, 0.72424156579339 AS sv_3 FROM rdb$database UNION ALL SELECT 6 AS sv_idx, 0.5797046103510032 AS dual_coeff, -1.2956953232218467 AS sv_0, 1.4987717050067189 AS sv_1, 0.6045319069288795 AS sv_2, -0.049480778656289616 AS sv_3 FROM rdb$database UNION ALL SELECT 7 AS sv_idx, -0.09066110668412 AS dual_coeff, 0.9667911606739577 AS sv_0, 0.560283003864504 AS sv_1, -0.9587146348985598 AS sv_2, -0.3528923186995045 AS sv_3 FROM rdb$database UNION ALL SELECT 8 AS sv_idx, 0.2521339872078813 AS dual_coeff, -0.17431668183364954 AS sv_0, 1.1501017450587885 AS sv_1, 1.5363842711868212 AS sv_2, 1.551694080146041 AS sv_3 FROM rdb$database UNION ALL SELECT 9 AS sv_idx, -0.15623927790480102 AS dual_coeff, 0.4817765801022509 AS sv_0, -1.2711686162379983 AS sv_1, 1.0632281967706565 AS sv_2, 1.1966669970792532 AS sv_3 FROM rdb$database UNION ALL SELECT 10 AS sv_idx, -0.08730443118145695 AS dual_coeff, -1.0864384290982352 AS sv_0, -1.6483271949983813 AS sv_1, 0.6144078655656166 AS sv_2, 1.1229003779563531 AS sv_3 FROM rdb$database UNION ALL SELECT 11 AS sv_idx, -0.18360737883041728 AS dual_coeff, 1.21879454372484 AS sv_0, 0.07229586633146984 AS sv_1, -0.6398301029289686 AS sv_2, 0.17785804513924774 AS sv_3 FROM rdb$database UNION ALL SELECT 12 AS sv_idx, -0.5211735803161128 AS dual_coeff, -0.9894374348380393 AS sv_0, 1.1628195030168447 AS sv_1, -1.6348530109335948 AS sv_2, 0.06543940945798173 AS sv_3 FROM rdb$database UNION ALL SELECT 13 AS sv_idx, -0.01085900092762758 AS dual_coeff, -1.3445193007126655 AS sv_0, 0.476367891619324 AS sv_1, -1.0814171294453323 AS sv_2, 1.4174747937922738 AS sv_3 FROM rdb$database UNION ALL SELECT 14 AS sv_idx, 0.02729294879696802 AS dual_coeff, 0.201305624800676 AS sv_0, 0.8011541044277309 AS sv_1, 0.7549999623153412 AS sv_2, -1.2370886970911996 AS sv_3 FROM rdb$database UNION ALL SELECT 15 AS sv_idx, -0.31483864045837995 AS dual_coeff, 0.9771459510823812 AS sv_0, -1.5055431734679958 AS sv_1, 1.3851794474085446 AS sv_2, -0.16142774484821756 AS sv_3 FROM rdb$database UNION ALL SELECT 16 AS sv_idx, 0.5345464254112885 AS dual_coeff, 1.3477086249535588 AS sv_0, 0.795308777919337 AS sv_1, 1.5593635512024997 AS sv_2, -0.07389069627856555 AS sv_3 FROM rdb$database) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE PRECISION)) + 0.0611938576447689 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * power(0.1 * (kernel_input_with_scaling."Feature_0" * "SV_data".sv_0 + kernel_input_with_scaling."Feature_1" * "SV_data".sv_1 + kernel_input_with_scaling."Feature_2" * "SV_data".sv_2 + kernel_input_with_scaling."Feature_3" * "SV_data".sv_3) + 1.0, 3.0) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", 499.0928844651739 + 374.0338110593958 * kernel_dp.dot_product AS "Estimator" 
FROM kernel_dp