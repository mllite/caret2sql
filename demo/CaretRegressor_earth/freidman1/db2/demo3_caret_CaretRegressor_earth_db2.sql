-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_earth
-- Dataset : freidman1
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH earth_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE) AS "Feature_9" 
FROM "FREIDMAN1" AS "ADS"), 
earth_model_cte AS 
(SELECT earth_input."KEY" AS "KEY", -8.380629989376796 * greatest(0.8231632932589577 - earth_input."Feature_1", 0) + 9.793918514381321 * greatest(earth_input."Feature_3" - 0.3244478925604231, 0) + -10.51380138268884 * greatest(0.3244478925604231 - earth_input."Feature_3", 0) + -13.116395395966398 * greatest(0.4348457212258143 - earth_input."Feature_0", 0) + 8.96110156348265 * greatest(earth_input."Feature_2" - 0.4562899507390336, 0) + 11.840075442823172 * greatest(0.4562899507390336 - earth_input."Feature_2", 0) + 6.607671635461544 * greatest(earth_input."Feature_4" - 0.4093658905237512, 0) + 13.435555385443774 AS "Estimator" 
FROM earth_input)
 SELECT earth_model_cte."KEY" AS "KEY", earth_model_cte."Estimator" AS "Estimator" 
FROM earth_model_cte