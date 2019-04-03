-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_rpart_pca
-- Dataset : BinaryClass_10
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 0.06182920523813451) / 1.236134089597546 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 0.17702463767183327) / 0.946757498519011 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 0.041383850049034464) / 1.0809597326983538 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 0.13060646805847148) / 1.0860335106241017 AS "Feature_3", (CAST("ADS"."Feature_4" AS FLOAT) - -0.05955810471983085) / 1.1165897507633815 AS "Feature_4", (CAST("ADS"."Feature_5" AS FLOAT) - -0.048929089870105816) / 1.3868824547243672 AS "Feature_5", (CAST("ADS"."Feature_6" AS FLOAT) - 0.19101797861713127) / 0.979670721363872 AS "Feature_6", (CAST("ADS"."Feature_7" AS FLOAT) - 0.02204959673267471) / 0.4775973825125086 AS "Feature_7", (CAST("ADS"."Feature_8" AS FLOAT) - -0.05772981403414008) / 1.0713243581907332 AS "Feature_8", (CAST("ADS"."Feature_9" AS FLOAT) - -0.052549592052032364) / 1.2322587258530384 AS "Feature_9" 
FROM "BinaryClass_10" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.5661592321920361 + "ADS_sca_1_OUT"."Feature_1" * -0.035526328604152946 + "ADS_sca_1_OUT"."Feature_2" * -0.0467879363120513 + "ADS_sca_1_OUT"."Feature_3" * 0.008946515209953917 + "ADS_sca_1_OUT"."Feature_4" * 0.0829511888403661 + "ADS_sca_1_OUT"."Feature_5" * -0.10205221296100445 + "ADS_sca_1_OUT"."Feature_6" * 0.1424451507903749 + "ADS_sca_1_OUT"."Feature_7" * 0.5666566688831561 + "ADS_sca_1_OUT"."Feature_8" * -0.06631427728790784 + "ADS_sca_1_OUT"."Feature_9" * -0.5593289854950824 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.0767125800279515 + "ADS_sca_1_OUT"."Feature_1" * -0.40153794458328573 + "ADS_sca_1_OUT"."Feature_2" * 0.5677578250446825 + "ADS_sca_1_OUT"."Feature_3" * 0.2369735703010663 + "ADS_sca_1_OUT"."Feature_4" * -0.09632922916256215 + "ADS_sca_1_OUT"."Feature_5" * -0.5767787279161882 + "ADS_sca_1_OUT"."Feature_6" * -0.3216376934797878 + "ADS_sca_1_OUT"."Feature_7" * -0.006693968243624504 + "ADS_sca_1_OUT"."Feature_8" * -0.06421158945215161 + "ADS_sca_1_OUT"."Feature_9" * 0.06932008034543824 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.04428807917268944 + "ADS_sca_1_OUT"."Feature_1" * 0.02244286142288565 + "ADS_sca_1_OUT"."Feature_2" * -0.1709384323174772 + "ADS_sca_1_OUT"."Feature_3" * 0.4187938020309751 + "ADS_sca_1_OUT"."Feature_4" * 0.4638804547130563 + "ADS_sca_1_OUT"."Feature_5" * 0.12436384332391155 + "ADS_sca_1_OUT"."Feature_6" * -0.2491197630750001 + "ADS_sca_1_OUT"."Feature_7" * -0.02707014062139766 + "ADS_sca_1_OUT"."Feature_8" * -0.7066063892300462 + "ADS_sca_1_OUT"."Feature_9" * 0.01375528233133572 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.035505292609370916 + "ADS_sca_1_OUT"."Feature_1" * 0.4629415976318115 + "ADS_sca_1_OUT"."Feature_2" * 0.39703949728185695 + "ADS_sca_1_OUT"."Feature_3" * 0.108176435008563 + "ADS_sca_1_OUT"."Feature_4" * -0.5443880279914196 + "ADS_sca_1_OUT"."Feature_5" * 0.3886991214463785 + "ADS_sca_1_OUT"."Feature_6" * -0.3136270685510785 + "ADS_sca_1_OUT"."Feature_7" * 0.09412147953130984 + "ADS_sca_1_OUT"."Feature_8" * -0.2041303312264922 + "ADS_sca_1_OUT"."Feature_9" * -0.1369183431411648 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.02395611334530353 + "ADS_sca_1_OUT"."Feature_1" * 0.3059663067403714 + "ADS_sca_1_OUT"."Feature_2" * 0.1244148619727216 + "ADS_sca_1_OUT"."Feature_3" * 0.7205232130433498 + "ADS_sca_1_OUT"."Feature_4" * -0.010360887714254759 + "ADS_sca_1_OUT"."Feature_5" * -0.12313866467327145 + "ADS_sca_1_OUT"."Feature_6" * 0.5630711251768787 + "ADS_sca_1_OUT"."Feature_7" * -0.04287636501865158 + "ADS_sca_1_OUT"."Feature_8" * 0.18391692419974146 + "ADS_sca_1_OUT"."Feature_9" * 0.056520588594192574 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.048169250614026715 + "ADS_sca_1_OUT"."Feature_1" * 0.6239362496677012 + "ADS_sca_1_OUT"."Feature_2" * 0.20083118524117005 + "ADS_sca_1_OUT"."Feature_3" * -0.1618608106397551 + "ADS_sca_1_OUT"."Feature_4" * 0.5432007330496692 + "ADS_sca_1_OUT"."Feature_5" * -0.2436186036944093 + "ADS_sca_1_OUT"."Feature_6" * -0.3147233303086936 + "ADS_sca_1_OUT"."Feature_7" * 0.01337545211610092 + "ADS_sca_1_OUT"."Feature_8" * 0.29670903412359584 + "ADS_sca_1_OUT"."Feature_9" * 0.01296934529502586 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * -0.06773590863463053 + "ADS_sca_1_OUT"."Feature_1" * -0.11758181773858208 + "ADS_sca_1_OUT"."Feature_2" * 0.6477095493436038 + "ADS_sca_1_OUT"."Feature_3" * -0.3112272823678729 + "ADS_sca_1_OUT"."Feature_4" * 0.33477688181210946 + "ADS_sca_1_OUT"."Feature_5" * 0.29496375499110145 + "ADS_sca_1_OUT"."Feature_6" * 0.4607366756100071 + "ADS_sca_1_OUT"."Feature_7" * -0.025868856528122847 + "ADS_sca_1_OUT"."Feature_8" * -0.2305082370268579 + "ADS_sca_1_OUT"."Feature_9" * -0.005964439285718312 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" >= -0.6583458671467259) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" < 0.3150131325989965) THEN 4 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC1" >= 1.374542423482741) THEN 10 ELSE 11 END END ELSE 3 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 4 AS nid, 0.8823529411764706 AS "P_0", 0.1176470588235294 AS "P_1", 0 AS "D", 0.8823529411764706 AS "DP" UNION ALL SELECT 10 AS nid, 0.875 AS "P_0", 0.125 AS "P_1", 0 AS "D", 0.875 AS "DP" UNION ALL SELECT 11 AS nid, 0.2307692307692308 AS "P_0", 0.7692307692307692 AS "P_1", 1 AS "D", 0.7692307692307692 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 0.0) THEN ln("DT_Output"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 0.0) THEN ln("DT_Output"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"