-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart
-- Dataset : digits
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_36" < 0.5) THEN 2 ELSE CASE WHEN ("ADS"."Feature_21" < 0.5) THEN 6 ELSE 7 END END AS node_id_2 
FROM "DIGITS" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."P_2" AS "P_2", "Values"."P_3" AS "P_3", "Values"."P_4" AS "P_4", "Values"."P_5" AS "P_5", "Values"."P_6" AS "P_6", "Values"."P_7" AS "P_7", "Values"."P_8" AS "P_8", "Values"."P_9" AS "P_9", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.6118721461187214 AS "P_0", 0.0 AS "P_1", 0.013698630136986304 AS "P_2", 0.004566210045662101 AS "P_3", 0.027397260273972608 AS "P_4", 0.08675799086757995 AS "P_5", 0.018264840182648404 AS "P_6", 0.0 AS "P_7", 0.013698630136986304 AS "P_8", 0.22374429223744297 AS "P_9", 0 AS "D", 0.6118721461187214 AS "DP" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 6 AS nid, 0.0 AS "P_0", 0.096514745308311 AS "P_1", 0.09919571045576407 AS "P_2", 0.02949061662198392 AS "P_3", 0.06970509383378015 AS "P_4", 0.3190348525469169 AS "P_5", 0.3619302949061662 AS "P_6", 0.013404825737265409 AS "P_7", 0.008042895442359248 AS "P_8", 0.0026809651474530827 AS "P_9", 6 AS "D", 0.3619302949061662 AS "DP" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 7 AS nid, 0.004733727810650888 AS "P_0", 0.13136094674556212 AS "P_1", 0.12781065088757404 AS "P_2", 0.15739644970414202 AS "P_3", 0.14082840236686392 AS "P_4", 0.007100591715976333 AS "P_5", 0.0035502958579881664 AS "P_6", 0.15976331360946744 AS "P_7", 0.15266272189349112 AS "P_8", 0.11479289940828402 AS "P_9", 7 AS "D", 0.15976331360946744 AS "DP" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."P_2" AS "P_2", "DT_node_data"."P_3" AS "P_3", "DT_node_data"."P_4" AS "P_4", "DT_node_data"."P_5" AS "P_5", "DT_node_data"."P_6" AS "P_6", "DT_node_data"."P_7" AS "P_7", "DT_node_data"."P_8" AS "P_8", "DT_node_data"."P_9" AS "P_9", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", CAST(NULL AS DOUBLE) AS "Score_2", CAST(NULL AS DOUBLE) AS "Score_3", CAST(NULL AS DOUBLE) AS "Score_4", CAST(NULL AS DOUBLE) AS "Score_5", CAST(NULL AS DOUBLE) AS "Score_6", CAST(NULL AS DOUBLE) AS "Score_7", CAST(NULL AS DOUBLE) AS "Score_8", CAST(NULL AS DOUBLE) AS "Score_9", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", "DT_Output"."P_2" AS "Proba_2", "DT_Output"."P_3" AS "Proba_3", "DT_Output"."P_4" AS "Proba_4", "DT_Output"."P_5" AS "Proba_5", "DT_Output"."P_6" AS "Proba_6", "DT_Output"."P_7" AS "Proba_7", "DT_Output"."P_8" AS "Proba_8", "DT_Output"."P_9" AS "Proba_9", CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 0.0) THEN ln("DT_Output"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 0.0) THEN ln("DT_Output"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN ("DT_Output"."P_2" IS NULL OR "DT_Output"."P_2" > 0.0) THEN ln("DT_Output"."P_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN ("DT_Output"."P_3" IS NULL OR "DT_Output"."P_3" > 0.0) THEN ln("DT_Output"."P_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", CASE WHEN ("DT_Output"."P_4" IS NULL OR "DT_Output"."P_4" > 0.0) THEN ln("DT_Output"."P_4") ELSE -1.79769313486231e+308 END AS "LogProba_4", CASE WHEN ("DT_Output"."P_5" IS NULL OR "DT_Output"."P_5" > 0.0) THEN ln("DT_Output"."P_5") ELSE -1.79769313486231e+308 END AS "LogProba_5", CASE WHEN ("DT_Output"."P_6" IS NULL OR "DT_Output"."P_6" > 0.0) THEN ln("DT_Output"."P_6") ELSE -1.79769313486231e+308 END AS "LogProba_6", CASE WHEN ("DT_Output"."P_7" IS NULL OR "DT_Output"."P_7" > 0.0) THEN ln("DT_Output"."P_7") ELSE -1.79769313486231e+308 END AS "LogProba_7", CASE WHEN ("DT_Output"."P_8" IS NULL OR "DT_Output"."P_8" > 0.0) THEN ln("DT_Output"."P_8") ELSE -1.79769313486231e+308 END AS "LogProba_8", CASE WHEN ("DT_Output"."P_9" IS NULL OR "DT_Output"."P_9" > 0.0) THEN ln("DT_Output"."P_9") ELSE -1.79769313486231e+308 END AS "LogProba_9", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"