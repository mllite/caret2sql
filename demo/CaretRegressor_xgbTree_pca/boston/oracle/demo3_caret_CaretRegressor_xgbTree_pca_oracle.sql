-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_xgbTree_pca
-- Dataset : boston
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS BINARY_DOUBLE) - 3.3936090099009895) / 8.010536728867239 AS "Feature_0", (CAST("ADS"."Feature_1" AS BINARY_DOUBLE) - 12.113861386138614) / 24.217647441147463 AS "Feature_1", (CAST("ADS"."Feature_2" AS BINARY_DOUBLE) - 10.983613861386141) / 6.826200750364282 AS "Feature_2", (CAST("ADS"."Feature_3" AS BINARY_DOUBLE) - 0.07178217821782178) / 0.2584469594478702 AS "Feature_3", (CAST("ADS"."Feature_4" AS BINARY_DOUBLE) - 0.5541153465346534) / 0.1181544189262098 AS "Feature_4", (CAST("ADS"."Feature_5" AS BINARY_DOUBLE) - 6.299148514851484) / 0.7069171793669617 AS "Feature_5", (CAST("ADS"."Feature_6" AS BINARY_DOUBLE) - 67.85049504950496) / 28.14225428392539 AS "Feature_6", (CAST("ADS"."Feature_7" AS BINARY_DOUBLE) - 3.8198420792079206) / 2.0959683176629325 AS "Feature_7", (CAST("ADS"."Feature_8" AS BINARY_DOUBLE) - 9.559405940594061) / 8.73962685484057 AS "Feature_8", (CAST("ADS"."Feature_9" AS BINARY_DOUBLE) - 405.8019801980198) / 169.99638120813233 AS "Feature_9", (CAST("ADS"."Feature_10" AS BINARY_DOUBLE) - 18.409158415841585) / 2.169479311043464 AS "Feature_10", (CAST("ADS"."Feature_11" AS BINARY_DOUBLE) - 358.3797277227722) / 90.75931171894922 AS "Feature_11", (CAST("ADS"."Feature_12" AS BINARY_DOUBLE) - 12.626584158415842) / 7.176826037708456 AS "Feature_12" 
FROM "BOSTON" "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.25022067888868665 + "ADS_sca_1_OUT"."Feature_1" * -0.25765762216632226 + "ADS_sca_1_OUT"."Feature_2" * 0.3491428172111632 + "ADS_sca_1_OUT"."Feature_3" * 0.01094773991121527 + "ADS_sca_1_OUT"."Feature_4" * 0.34170294050212857 + "ADS_sca_1_OUT"."Feature_5" * -0.18342485606154985 + "ADS_sca_1_OUT"."Feature_6" * 0.3129084082735513 + "ADS_sca_1_OUT"."Feature_7" * -0.3220310104224693 + "ADS_sca_1_OUT"."Feature_8" * 0.3210957066290012 + "ADS_sca_1_OUT"."Feature_9" * 0.3372514741075172 + "ADS_sca_1_OUT"."Feature_10" * 0.2041002866212432 + "ADS_sca_1_OUT"."Feature_11" * -0.20483878453228935 + "ADS_sca_1_OUT"."Feature_12" * 0.3106501513197035 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * -0.33389249833500073 + "ADS_sca_1_OUT"."Feature_1" * -0.3461278969103596 + "ADS_sca_1_OUT"."Feature_2" * 0.08741121935217115 + "ADS_sca_1_OUT"."Feature_3" * 0.4245155851940165 + "ADS_sca_1_OUT"."Feature_4" * 0.2112937184640132 + "ADS_sca_1_OUT"."Feature_5" * 0.0574342949321771 + "ADS_sca_1_OUT"."Feature_6" * 0.3143514152302056 + "ADS_sca_1_OUT"."Feature_7" * -0.33832121905897383 + "ADS_sca_1_OUT"."Feature_8" * -0.3093926550229444 + "ADS_sca_1_OUT"."Feature_9" * -0.27803257944665394 + "ADS_sca_1_OUT"."Feature_10" * -0.28693120813154377 + "ADS_sca_1_OUT"."Feature_11" * 0.2527117523816798 + "ADS_sca_1_OUT"."Feature_12" * -0.020410873762011308 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.19608688758362933 + "ADS_sca_1_OUT"."Feature_1" * 0.2469257706594379 + "ADS_sca_1_OUT"."Feature_2" * -0.02294168584923974 + "ADS_sca_1_OUT"."Feature_3" * 0.2950722382634112 + "ADS_sca_1_OUT"."Feature_4" * 0.14475391738768567 + "ADS_sca_1_OUT"."Feature_5" * 0.6390828425216293 + "ADS_sca_1_OUT"."Feature_6" * 0.04637333835457555 + "ADS_sca_1_OUT"."Feature_7" * -0.10318310122143892 + "ADS_sca_1_OUT"."Feature_8" * 0.2497932777479205 + "ADS_sca_1_OUT"."Feature_9" * 0.18494382558800715 + "ADS_sca_1_OUT"."Feature_10" * -0.3548131264402329 + "ADS_sca_1_OUT"."Feature_11" * -0.2684239315694441 + "ADS_sca_1_OUT"."Feature_12" * -0.2761542549039 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.07043882717757964 + "ADS_sca_1_OUT"."Feature_1" * -0.3664439770890674 + "ADS_sca_1_OUT"."Feature_2" * 0.0055058786745181285 + "ADS_sca_1_OUT"."Feature_3" * -0.3946776597336387 + "ADS_sca_1_OUT"."Feature_4" * -0.08824417045679225 + "ADS_sca_1_OUT"."Feature_5" * 0.4793823607635913 + "ADS_sca_1_OUT"."Feature_6" * 0.08998214645492984 + "ADS_sca_1_OUT"."Feature_7" * -0.18326301068911208 + "ADS_sca_1_OUT"."Feature_8" * 0.09856418200051932 + "ADS_sca_1_OUT"."Feature_9" * 0.04616348150064367 + "ADS_sca_1_OUT"."Feature_10" * 0.42777912036010746 + "ADS_sca_1_OUT"."Feature_11" * 0.3005689288221394 + "ADS_sca_1_OUT"."Feature_12" * -0.37482955126669193 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * 0.04300395631166038 + "ADS_sca_1_OUT"."Feature_1" * -0.02875212611151597 + "ADS_sca_1_OUT"."Feature_2" * 0.02223188515780241 + "ADS_sca_1_OUT"."Feature_3" * 0.7435684786227807 + "ADS_sca_1_OUT"."Feature_4" * -0.1834288143499854 + "ADS_sca_1_OUT"."Feature_5" * -0.07107783038498264 + "ADS_sca_1_OUT"."Feature_6" * -0.1682770489309431 + "ADS_sca_1_OUT"."Feature_7" * 0.14991701697987567 + "ADS_sca_1_OUT"."Feature_8" * 0.19696674860202626 + "ADS_sca_1_OUT"."Feature_9" * 0.1420113329297506 + "ADS_sca_1_OUT"."Feature_10" * 0.4646548460967998 + "ADS_sca_1_OUT"."Feature_11" * 0.255520747968419 + "ADS_sca_1_OUT"."Feature_12" * -0.11952854639999652 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * -0.3767232718011799 + "ADS_sca_1_OUT"."Feature_1" * -0.29207806001032416 + "ADS_sca_1_OUT"."Feature_2" * -0.01942601421821086 + "ADS_sca_1_OUT"."Feature_3" * 0.10887824454350792 + "ADS_sca_1_OUT"."Feature_4" * -0.10146416318885716 + "ADS_sca_1_OUT"."Feature_5" * 0.057934635009180835 + "ADS_sca_1_OUT"."Feature_6" * -0.10809395127298303 + "ADS_sca_1_OUT"."Feature_7" * 0.032878444909013 + "ADS_sca_1_OUT"."Feature_8" * -0.09390581030770888 + "ADS_sca_1_OUT"."Feature_9" * -0.12972376055449672 + "ADS_sca_1_OUT"."Feature_10" * 0.2572802499128157 + "ADS_sca_1_OUT"."Feature_11" * -0.7965340188449787 + "ADS_sca_1_OUT"."Feature_12" * -0.08840431527675782 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.7320645629415989 + "ADS_sca_1_OUT"."Feature_1" * -0.3159393337538693 + "ADS_sca_1_OUT"."Feature_2" * -0.3373999976989149 + "ADS_sca_1_OUT"."Feature_3" * 0.0931540519768708 + "ADS_sca_1_OUT"."Feature_4" * -0.2259561892558596 + "ADS_sca_1_OUT"."Feature_5" * 0.04114489763402434 + "ADS_sca_1_OUT"."Feature_6" * 0.08761501939857337 + "ADS_sca_1_OUT"."Feature_7" * -0.08894297135254832 + "ADS_sca_1_OUT"."Feature_8" * -0.17352234917240772 + "ADS_sca_1_OUT"."Feature_9" * -0.3494997544996276 + "ADS_sca_1_OUT"."Feature_10" * 0.023466306336306118 + "ADS_sca_1_OUT"."Feature_11" * -0.11741140060045532 + "ADS_sca_1_OUT"."Feature_12" * 0.08255206116222752 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" < -0.0925685018) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" < 0.589400411) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC1" < 3.25801754) THEN 5 ELSE 6 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 3 AS nid, 8.96071434 AS "Estimator" FROM DUAL UNION ALL SELECT 4 AS nid, 14.5580645 AS "Estimator" FROM DUAL UNION ALL SELECT 5 AS nid, 7.34190464 AS "Estimator" FROM DUAL UNION ALL SELECT 6 AS nid, 4.51692343 AS "Estimator" FROM DUAL) "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."Estimator" AS "Estimator" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"XGB_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."Estimator" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC6" < -0.890575528) THEN CASE WHEN ("ADS_pre_1_OUT"."PC5" < 0.12106476) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC6" < 0.835895896) THEN 5 ELSE 6 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."Estimator" AS "Estimator" 
FROM (SELECT 3 AS nid, 4.1841321 AS "Estimator" FROM DUAL UNION ALL SELECT 4 AS nid, 2.28718829 AS "Estimator" FROM DUAL UNION ALL SELECT 5 AS nid, 5.77468348 AS "Estimator" FROM DUAL UNION ALL SELECT 6 AS nid, 2.68898296 AS "Estimator" FROM DUAL) "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."Estimator" AS "Estimator" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"XGB_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."Estimator" AS "Estimator" 
FROM "DT_Output_1"), 
"XGB_0" AS 
(SELECT "XGB_esu_0"."KEY" AS "KEY", "XGB_esu_0"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_Model_0"."KEY" AS "KEY", CAST("XGB_Model_0"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "XGB_Model_0" UNION ALL SELECT "XGB_Model_1"."KEY" AS "KEY", CAST("XGB_Model_1"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "XGB_Model_1") "XGB_esu_0"), 
"XGB" AS 
(SELECT "XGBbig_esu"."KEY" AS "KEY", "XGBbig_esu"."Estimator" AS "Estimator" 
FROM (SELECT "XGB_0"."KEY" AS "KEY", CAST("XGB_0"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM "XGB_0") "XGBbig_esu"), 
"XGB_sum" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Estimator" AS BINARY_DOUBLE) AS "Estimator" 
FROM (SELECT "XGB"."KEY" AS "KEY", sum("XGB"."Estimator") AS "Estimator" 
FROM "XGB" GROUP BY "XGB"."KEY") "T")
 SELECT "XGB_sum"."KEY" AS "KEY", "XGB_sum"."Estimator" + 0.5 AS "Estimator" 
FROM "XGB_sum"