-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth_pca
-- Dataset : freidman2
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS BINARY_DOUBLE) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS BINARY_DOUBLE) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS BINARY_DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS BINARY_DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM "FREIDMAN2" "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.6121650749100701 + "ADS_sca_1_OUT"."Feature_1" * 0.5464782903329433 + "ADS_sca_1_OUT"."Feature_2" * -0.5708677485644764 + "ADS_sca_1_OUT"."Feature_3" * -0.02693349038014348 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.4888813380420076 + "ADS_sca_1_OUT"."Feature_1" * 0.2745192584561386 + "ADS_sca_1_OUT"."Feature_2" * -0.2238449995359107 + "ADS_sca_1_OUT"."Feature_3" * -0.7971998684355868 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.024686176636208892 + "ADS_sca_1_OUT"."Feature_1" * 0.7091918576518509 + "ADS_sca_1_OUT"."Feature_2" * 0.7038817472089458 + "ADS_sca_1_OUT"."Feature_3" * 0.03143227114740615 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.6209988333786876 + "ADS_sca_1_OUT"."Feature_1" * -0.3507813620644518 + "ADS_sca_1_OUT"."Feature_2" * 0.358544161544677 + "ADS_sca_1_OUT"."Feature_3" * -0.6022947527521242 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
earth_input AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS BINARY_DOUBLE) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS BINARY_DOUBLE) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS BINARY_DOUBLE) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS BINARY_DOUBLE) AS "PC4" 
FROM "ADS_pre_1_OUT"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", 500.0748877078677 * greatest(earth_input."PC3" - -0.1469372564657002, 0) + -178.1475012977798 * greatest(-0.1469372564657002 - earth_input."PC3", 0) + -137.768251326947 * greatest(0.6258005673894007 - earth_input."PC1", 0) + -14.26690128500144 * greatest(earth_input."PC2" - -1.4144791366792062, 0) + -212.69753757544075 * greatest(-1.4144791366792062 - earth_input."PC2", 0) + -166.4218919822176 * greatest(earth_input."PC4" - 1.011503153093654, 0) + -25.694433757558738 * greatest(1.011503153093654 - earth_input."PC4", 0) + -148.26443030745295 * greatest(earth_input."PC1" - -1.3929600097741792, 0) + 711.545868761073 AS "Estimator" 
FROM earth_input)
 SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Estimator" AS "Estimator" 
FROM earth_model_cte