-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree
-- Dataset : digits
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_33" <= 8.0) THEN CASE WHEN ("ADS"."Feature_26" <= 0.0) THEN CASE WHEN ("ADS"."Feature_43" <= 2.0) THEN 4 ELSE CASE WHEN ("ADS"."Feature_38" <= 0.0) THEN 6 ELSE 7 END END ELSE CASE WHEN ("ADS"."Feature_21" <= 0.0) THEN CASE WHEN ("ADS"."Feature_42" <= 9.0) THEN CASE WHEN ("ADS"."Feature_5" <= 2.0) THEN CASE WHEN ("ADS"."Feature_37" <= 1.0) THEN CASE WHEN ("ADS"."Feature_13" <= 0.0) THEN CASE WHEN ("ADS"."Feature_9" <= 2.0) THEN 14 ELSE 15 END ELSE 16 END ELSE CASE WHEN ("ADS"."Feature_43" <= 15.0) THEN CASE WHEN ("ADS"."Feature_62" <= 13.0) THEN 19 ELSE 20 END ELSE 21 END END ELSE CASE WHEN ("ADS"."Feature_18" <= 11.0) THEN 23 ELSE 24 END END ELSE CASE WHEN ("ADS"."Feature_9" <= 1.0) THEN CASE WHEN ("ADS"."Feature_30" <= 2.0) THEN CASE WHEN ("ADS"."Feature_20" <= 8.0) THEN CASE WHEN ("ADS"."Feature_30" <= 0.0) THEN 29 ELSE 30 END ELSE 31 END ELSE 32 END ELSE 33 END END ELSE CASE WHEN ("ADS"."Feature_28" <= 0.0) THEN CASE WHEN ("ADS"."Feature_6" <= 0.0) THEN CASE WHEN ("ADS"."Feature_36" <= 0.0) THEN CASE WHEN ("ADS"."Feature_59" <= 10.0) THEN 38 ELSE 39 END ELSE 40 END ELSE 41 END ELSE CASE WHEN ("ADS"."Feature_36" <= 8.0) THEN CASE WHEN ("ADS"."Feature_42" <= 5.0) THEN CASE WHEN ("ADS"."Feature_21" <= 5.0) THEN 45 ELSE CASE WHEN ("ADS"."Feature_43" <= 1.0) THEN CASE WHEN ("ADS"."Feature_29" <= 10.0) THEN 48 ELSE CASE WHEN ("ADS"."Feature_10" <= 5.0) THEN 50 ELSE CASE WHEN ("ADS"."Feature_21" <= 11.0) THEN 52 ELSE 53 END END END ELSE 54 END END ELSE CASE WHEN ("ADS"."Feature_29" <= 9.0) THEN CASE WHEN ("ADS"."Feature_54" <= 0.0) THEN 57 ELSE 58 END ELSE 59 END END ELSE CASE WHEN ("ADS"."Feature_60" <= 7.0) THEN CASE WHEN ("ADS"."Feature_53" <= 5.0) THEN CASE WHEN ("ADS"."Feature_1" <= 0.0) THEN CASE WHEN ("ADS"."Feature_4" <= 7.0) THEN 64 ELSE CASE WHEN ("ADS"."Feature_17" <= 5.0) THEN CASE WHEN ("ADS"."Feature_19" <= 10.0) THEN CASE WHEN ("ADS"."Feature_25" <= 4.0) THEN CASE WHEN ("ADS"."Feature_17" <= 1.0) THEN 69 ELSE 70 END ELSE 71 END ELSE 72 END ELSE 73 END END ELSE 74 END ELSE 75 END ELSE CASE WHEN ("ADS"."Feature_10" <= 8.0) THEN CASE WHEN ("ADS"."Feature_20" <= 14.0) THEN CASE WHEN ("ADS"."Feature_50" <= 4.0) THEN CASE WHEN ("ADS"."Feature_5" <= 11.0) THEN CASE WHEN ("ADS"."Feature_37" <= 13.0) THEN 81 ELSE 82 END ELSE 83 END ELSE 84 END ELSE CASE WHEN ("ADS"."Feature_41" <= 2.0) THEN CASE WHEN ("ADS"."Feature_30" <= 0.0) THEN 87 ELSE 88 END ELSE 89 END END ELSE CASE WHEN ("ADS"."Feature_43" <= 15.0) THEN CASE WHEN ("ADS"."Feature_62" <= 9.0) THEN CASE WHEN ("ADS"."Feature_33" <= 0.0) THEN CASE WHEN ("ADS"."Feature_43" <= 3.0) THEN CASE WHEN ("ADS"."Feature_42" <= 5.0) THEN CASE WHEN ("ADS"."Feature_26" <= 8.0) THEN 96 ELSE 97 END ELSE 98 END ELSE CASE WHEN ("ADS"."Feature_38" <= 0.0) THEN CASE WHEN ("ADS"."Feature_18" <= 9.0) THEN 101 ELSE CASE WHEN ("ADS"."Feature_27" <= 7.0) THEN 103 ELSE 104 END END ELSE 105 END END ELSE 106 END ELSE 107 END ELSE CASE WHEN ("ADS"."Feature_44" <= 9.0) THEN 109 ELSE 110 END END END END END END END END ELSE CASE WHEN ("ADS"."Feature_54" <= 2.0) THEN CASE WHEN ("ADS"."Feature_26" <= 11.0) THEN 113 ELSE CASE WHEN ("ADS"."Feature_2" <= 1.0) THEN 115 ELSE 116 END END ELSE 117 END END AS node_id_2 
FROM digits AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."P_2" AS "P_2", "Values"."P_3" AS "P_3", "Values"."P_4" AS "P_4", "Values"."P_5" AS "P_5", "Values"."P_6" AS "P_6", "Values"."P_7" AS "P_7", "Values"."P_8" AS "P_8", "Values"."P_9" AS "P_9", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 4 AS nid, 0.0 AS "P_0", 0.018691588785046703 AS "P_1", 0.04672897196261681 AS "P_2", 0.8785046728971962 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.009345794392523362 AS "P_7", 0.009345794392523362 AS "P_8", 0.037383177570093504 AS "P_9", 3 AS "D", 0.8785046728971962 AS "DP" UNION ALL SELECT 6 AS nid, 0.0 AS "P_0", 0.14406779661016914 AS "P_1", 0.6949152542372886 AS "P_2", 0.04237288135593224 AS "P_3", 0.0 AS "P_4", 0.00847457627118645 AS "P_5", 0.0 AS "P_6", 0.00847457627118645 AS "P_7", 0.1016949152542371 AS "P_8", 0.0 AS "P_9", 2 AS "D", 0.6949152542372886 AS "DP" UNION ALL SELECT 7 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.05263157894736841 AS "P_2", 0.026315789473684206 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.026315789473684206 AS "P_6", 0.8947368421052633 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 7 AS "D", 0.8947368421052633 AS "DP" UNION ALL SELECT 14 AS nid, 0.0 AS "P_0", 0.9285714285714286 AS "P_1", 0.07142857142857137 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 1 AS "D", 0.9285714285714286 AS "DP" UNION ALL SELECT 15 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 1.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 2 AS "D", 1.0 AS "DP" UNION ALL SELECT 16 AS nid, 0.0 AS "P_0", 0.4285714285714286 AS "P_1", 0.2857142857142857 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.2857142857142857 AS "P_8", 0.0 AS "P_9", 1 AS "D", 0.4285714285714286 AS "DP" UNION ALL SELECT 19 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.5 AS "P_3", 0.25 AS "P_4", 0.1875 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0625 AS "P_9", 3 AS "D", 0.5 AS "DP" UNION ALL SELECT 20 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 21 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.4444444444444445 AS "P_6", 0.4444444444444445 AS "P_7", 0.11111111111111112 AS "P_8", 0.0 AS "P_9", 6 AS "D", 0.4444444444444445 AS "DP" UNION ALL SELECT 23 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.111111111111111 AS "P_3", 0.0 AS "P_4", 0.888888888888889 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 5 AS "D", 0.888888888888889 AS "DP" UNION ALL SELECT 24 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.00909090909090909 AS "P_4", 0.990909090909091 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 5 AS "D", 0.990909090909091 AS "DP" UNION ALL SELECT 29 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 1.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 6 AS "D", 1.0 AS "DP" UNION ALL SELECT 30 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.125 AS "P_5", 0.875 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 6 AS "D", 0.875 AS "DP" UNION ALL SELECT 31 AS nid, 0.0 AS "P_0", 0.875 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.125 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 1 AS "D", 0.875 AS "DP" UNION ALL SELECT 32 AS nid, 0.125 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.875 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 4 AS "D", 0.875 AS "DP" UNION ALL SELECT 33 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.888888888888889 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.111111111111111 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 2 AS "D", 0.888888888888889 AS "DP" UNION ALL SELECT 38 AS nid, 0.9090909090909091 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.09090909090909091 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 0 AS "D", 0.9090909090909091 AS "DP" UNION ALL SELECT 39 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 0 AS "D", 1.0 AS "DP" UNION ALL SELECT 40 AS nid, 0.5 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.125 AS "P_3", 0.25 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.125 AS "P_9", 0 AS "D", 0.5 AS "DP" UNION ALL SELECT 41 AS nid, 0.571428571428571 AS "P_0", 0.142857142857143 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.285714285714286 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 0 AS "D", 0.571428571428571 AS "DP" UNION ALL SELECT 45 AS nid, 0.0 AS "P_0", 0.07692307692307691 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.8461538461538463 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.07692307692307691 AS "P_9", 5 AS "D", 0.8461538461538463 AS "DP" UNION ALL SELECT 48 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.2 AS "P_3", 0.0 AS "P_4", 0.1 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.7 AS "P_9", 9 AS "D", 0.7 AS "DP" UNION ALL SELECT 50 AS nid, 0.0 AS "P_0", 0.466666666666667 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.533333333333333 AS "P_9", 9 AS "D", 0.533333333333333 AS "DP" UNION ALL SELECT 52 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.07692307692307691 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.9230769230769231 AS "P_9", 9 AS "D", 0.9230769230769231 AS "DP" UNION ALL SELECT 53 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 1.0 AS "P_9", 9 AS "D", 1.0 AS "DP" UNION ALL SELECT 54 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.11111111111111112 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.33333333333333337 AS "P_7", 0.22222222222222224 AS "P_8", 0.33333333333333337 AS "P_9", 7 AS "D", 0.33333333333333337 AS "DP" UNION ALL SELECT 57 AS nid, 0.0 AS "P_0", 0.21052631578947392 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.052631578947368376 AS "P_7", 0.7368421052631576 AS "P_8", 0.0 AS "P_9", 8 AS "D", 0.7368421052631576 AS "DP" UNION ALL SELECT 58 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.625 AS "P_2", 0.25 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.125 AS "P_8", 0.0 AS "P_9", 2 AS "D", 0.625 AS "DP" UNION ALL SELECT 59 AS nid, 0.5555555555555557 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.11111111111111092 AS "P_4", 0.055555555555555566 AS "P_5", 0.16666666666666688 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.11111111111111092 AS "P_9", 0 AS "D", 0.5555555555555557 AS "DP" UNION ALL SELECT 64 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.7 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.1 AS "P_7", 0.0 AS "P_8", 0.2 AS "P_9", 4 AS "D", 0.7 AS "DP" UNION ALL SELECT 69 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.9841269841269841 AS "P_7", 0.015873015873015903 AS "P_8", 0.0 AS "P_9", 7 AS "D", 0.9841269841269841 AS "DP" UNION ALL SELECT 70 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.714285714285714 AS "P_7", 0.0 AS "P_8", 0.285714285714286 AS "P_9", 7 AS "D", 0.714285714285714 AS "DP" UNION ALL SELECT 71 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.285714285714286 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.714285714285714 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 7 AS "D", 0.714285714285714 AS "DP" UNION ALL SELECT 72 AS nid, 0.0 AS "P_0", 0.4285714285714286 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.2857142857142857 AS "P_7", 0.2857142857142857 AS "P_8", 0.0 AS "P_9", 1 AS "D", 0.4285714285714286 AS "DP" UNION ALL SELECT 73 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.285714285714286 AS "P_7", 0.0 AS "P_8", 0.714285714285714 AS "P_9", 9 AS "D", 0.714285714285714 AS "DP" UNION ALL SELECT 74 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.142857142857143 AS "P_5", 0.0 AS "P_6", 0.714285714285714 AS "P_7", 0.142857142857143 AS "P_8", 0.0 AS "P_9", 7 AS "D", 0.714285714285714 AS "DP" UNION ALL SELECT 75 AS nid, 0.0 AS "P_0", 0.125 AS "P_1", 0.5 AS "P_2", 0.125 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.25 AS "P_8", 0.0 AS "P_9", 2 AS "D", 0.5 AS "DP" UNION ALL SELECT 81 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.875 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.125 AS "P_8", 0.0 AS "P_9", 4 AS "D", 0.875 AS "DP" UNION ALL SELECT 82 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 1.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 4 AS "D", 1.0 AS "DP" UNION ALL SELECT 83 AS nid, 0.0 AS "P_0", 0.2 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.4 AS "P_7", 0.1 AS "P_8", 0.3 AS "P_9", 7 AS "D", 0.4 AS "DP" UNION ALL SELECT 84 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.125 AS "P_2", 0.0625 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0625 AS "P_6", 0.0 AS "P_7", 0.75 AS "P_8", 0.0 AS "P_9", 8 AS "D", 0.75 AS "DP" UNION ALL SELECT 87 AS nid, 0.0 AS "P_0", 0.9827586206896552 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.017241379310344803 AS "P_8", 0.0 AS "P_9", 1 AS "D", 0.9827586206896552 AS "DP" UNION ALL SELECT 88 AS nid, 0.0 AS "P_0", 0.875 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.125 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 1 AS "D", 0.875 AS "DP" UNION ALL SELECT 89 AS nid, 0.0 AS "P_0", 0.2 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.8 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 4 AS "D", 0.8 AS "DP" UNION ALL SELECT 96 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.9545454545454546 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.04545454545454548 AS "P_9", 3 AS "D", 0.9545454545454546 AS "DP" UNION ALL SELECT 97 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.05555555555555559 AS "P_5", 0.0 AS "P_6", 0.05555555555555559 AS "P_7", 0.0 AS "P_8", 0.8888888888888887 AS "P_9", 9 AS "D", 0.8888888888888887 AS "DP" UNION ALL SELECT 98 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.111111111111111 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.777777777777778 AS "P_8", 0.111111111111111 AS "P_9", 8 AS "D", 0.777777777777778 AS "DP" UNION ALL SELECT 101 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.125 AS "P_2", 0.5 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.375 AS "P_8", 0.0 AS "P_9", 3 AS "D", 0.5 AS "DP" UNION ALL SELECT 103 AS nid, 0.0 AS "P_0", 0.125 AS "P_1", 0.375 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.5 AS "P_8", 0.0 AS "P_9", 8 AS "D", 0.5 AS "DP" UNION ALL SELECT 104 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 1.0 AS "P_8", 0.0 AS "P_9", 8 AS "D", 1.0 AS "DP" UNION ALL SELECT 105 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.1 AS "P_7", 0.9 AS "P_8", 0.0 AS "P_9", 8 AS "D", 0.9 AS "DP" UNION ALL SELECT 106 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.125 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.5 AS "P_8", 0.375 AS "P_9", 8 AS "D", 0.5 AS "DP" UNION ALL SELECT 107 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.8333333333333334 AS "P_2", 0.11111111111111105 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.05555555555555563 AS "P_8", 0.0 AS "P_9", 2 AS "D", 0.8333333333333334 AS "DP" UNION ALL SELECT 109 AS nid, 0.0 AS "P_0", 0.285714285714286 AS "P_1", 0.714285714285714 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 2 AS "D", 0.714285714285714 AS "DP" UNION ALL SELECT 110 AS nid, 0.0 AS "P_0", 0.769230769230769 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.230769230769231 AS "P_8", 0.0 AS "P_9", 1 AS "D", 0.769230769230769 AS "DP" UNION ALL SELECT 113 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.3 AS "P_4", 0.1 AS "P_5", 0.0 AS "P_6", 0.6 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 7 AS "D", 0.6 AS "DP" UNION ALL SELECT 115 AS nid, 0.0 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 1.0 AS "P_4", 0.0 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 4 AS "D", 1.0 AS "DP" UNION ALL SELECT 116 AS nid, 0.142857142857143 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.571428571428571 AS "P_4", 0.285714285714286 AS "P_5", 0.0 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 4 AS "D", 0.571428571428571 AS "DP" UNION ALL SELECT 117 AS nid, 0.7 AS "P_0", 0.0 AS "P_1", 0.0 AS "P_2", 0.0 AS "P_3", 0.0 AS "P_4", 0.0 AS "P_5", 0.3 AS "P_6", 0.0 AS "P_7", 0.0 AS "P_8", 0.0 AS "P_9", 0 AS "D", 0.7 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."P_2" AS "P_2", "DT_node_data"."P_3" AS "P_3", "DT_node_data"."P_4" AS "P_4", "DT_node_data"."P_5" AS "P_5", "DT_node_data"."P_6" AS "P_6", "DT_node_data"."P_7" AS "P_7", "DT_node_data"."P_8" AS "P_8", "DT_node_data"."P_9" AS "P_9", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", CAST(NULL AS DOUBLE) AS "Score_2", CAST(NULL AS DOUBLE) AS "Score_3", CAST(NULL AS DOUBLE) AS "Score_4", CAST(NULL AS DOUBLE) AS "Score_5", CAST(NULL AS DOUBLE) AS "Score_6", CAST(NULL AS DOUBLE) AS "Score_7", CAST(NULL AS DOUBLE) AS "Score_8", CAST(NULL AS DOUBLE) AS "Score_9", "DT_Output"."P_0" AS "Proba_0", "DT_Output"."P_1" AS "Proba_1", "DT_Output"."P_2" AS "Proba_2", "DT_Output"."P_3" AS "Proba_3", "DT_Output"."P_4" AS "Proba_4", "DT_Output"."P_5" AS "Proba_5", "DT_Output"."P_6" AS "Proba_6", "DT_Output"."P_7" AS "Proba_7", "DT_Output"."P_8" AS "Proba_8", "DT_Output"."P_9" AS "Proba_9", log(CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 1e-100) THEN "DT_Output"."P_0" ELSE 1e-100 END) AS "LogProba_0", log(CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 1e-100) THEN "DT_Output"."P_1" ELSE 1e-100 END) AS "LogProba_1", log(CASE WHEN ("DT_Output"."P_2" IS NULL OR "DT_Output"."P_2" > 1e-100) THEN "DT_Output"."P_2" ELSE 1e-100 END) AS "LogProba_2", log(CASE WHEN ("DT_Output"."P_3" IS NULL OR "DT_Output"."P_3" > 1e-100) THEN "DT_Output"."P_3" ELSE 1e-100 END) AS "LogProba_3", log(CASE WHEN ("DT_Output"."P_4" IS NULL OR "DT_Output"."P_4" > 1e-100) THEN "DT_Output"."P_4" ELSE 1e-100 END) AS "LogProba_4", log(CASE WHEN ("DT_Output"."P_5" IS NULL OR "DT_Output"."P_5" > 1e-100) THEN "DT_Output"."P_5" ELSE 1e-100 END) AS "LogProba_5", log(CASE WHEN ("DT_Output"."P_6" IS NULL OR "DT_Output"."P_6" > 1e-100) THEN "DT_Output"."P_6" ELSE 1e-100 END) AS "LogProba_6", log(CASE WHEN ("DT_Output"."P_7" IS NULL OR "DT_Output"."P_7" > 1e-100) THEN "DT_Output"."P_7" ELSE 1e-100 END) AS "LogProba_7", log(CASE WHEN ("DT_Output"."P_8" IS NULL OR "DT_Output"."P_8" > 1e-100) THEN "DT_Output"."P_8" ELSE 1e-100 END) AS "LogProba_8", log(CASE WHEN ("DT_Output"."P_9" IS NULL OR "DT_Output"."P_9" > 1e-100) THEN "DT_Output"."P_9" ELSE 1e-100 END) AS "LogProba_9", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"