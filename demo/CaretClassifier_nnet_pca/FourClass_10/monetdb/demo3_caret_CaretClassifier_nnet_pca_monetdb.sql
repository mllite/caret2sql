-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet_pca
-- Dataset : FourClass_10
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - -0.003903374463034224) / 0.985685974308334 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 0.6152232215702326) / 1.398851036008891 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.04279623691429167) / 1.5057087871323842 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 0.770981955890407) / 2.3480777416797296 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE) - -0.43300733624893323) / 1.4118274472656485 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE) - -0.04249569657940362) / 0.961839508883184 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE) - -0.29809080119845444) / 1.0234297313191445 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE) - 0.14672241507251668) / 1.610898315451602 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE) - 0.01746942384662041) / 1.1559772136551034 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE) - 0.11507331415602873) / 0.975205386360447 AS "Feature_9" 
FROM "FourClass_10" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.04932772619908273 + "ADS_sca_1_OUT"."Feature_1" * -0.30424192738374856 + "ADS_sca_1_OUT"."Feature_2" * -0.3679687561849888 + "ADS_sca_1_OUT"."Feature_3" * -0.5380769831115797 + "ADS_sca_1_OUT"."Feature_4" * 0.10802988742400396 + "ADS_sca_1_OUT"."Feature_5" * 0.13910407016754714 + "ADS_sca_1_OUT"."Feature_6" * 0.5384086347891889 + "ADS_sca_1_OUT"."Feature_7" * -0.3713071820395216 + "ADS_sca_1_OUT"."Feature_8" * 0.0483137135579316 + "ADS_sca_1_OUT"."Feature_9" * 0.13772539520944088 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.4566046379002287 + "ADS_sca_1_OUT"."Feature_1" * 0.22867203934764516 + "ADS_sca_1_OUT"."Feature_2" * -0.2673956790968541 + "ADS_sca_1_OUT"."Feature_3" * 0.01671202428135116 + "ADS_sca_1_OUT"."Feature_4" * -0.7163497555230034 + "ADS_sca_1_OUT"."Feature_5" * 0.3501083253113648 + "ADS_sca_1_OUT"."Feature_6" * -0.02365108420686553 + "ADS_sca_1_OUT"."Feature_7" * -0.15293556467571348 + "ADS_sca_1_OUT"."Feature_8" * -0.04278465473081572 + "ADS_sca_1_OUT"."Feature_9" * -0.07700365586043896 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.4595639307438372 + "ADS_sca_1_OUT"."Feature_1" * 0.3158880900516212 + "ADS_sca_1_OUT"."Feature_2" * -0.23051961282840416 + "ADS_sca_1_OUT"."Feature_3" * -0.0044376721269756845 + "ADS_sca_1_OUT"."Feature_4" * -0.16274384812665132 + "ADS_sca_1_OUT"."Feature_5" * -0.27453767262313855 + "ADS_sca_1_OUT"."Feature_6" * 0.06030524407436345 + "ADS_sca_1_OUT"."Feature_7" * -0.14174903890838467 + "ADS_sca_1_OUT"."Feature_8" * -0.7115147418569482 + "ADS_sca_1_OUT"."Feature_9" * -0.06338366606522455 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.12741284788275034 + "ADS_sca_1_OUT"."Feature_1" * 0.08549541136134871 + "ADS_sca_1_OUT"."Feature_2" * -0.3821190712444285 + "ADS_sca_1_OUT"."Feature_3" * -0.10433262844841386 + "ADS_sca_1_OUT"."Feature_4" * 0.08250986211203802 + "ADS_sca_1_OUT"."Feature_5" * -0.36296260084226667 + "ADS_sca_1_OUT"."Feature_6" * 0.10962886388759648 + "ADS_sca_1_OUT"."Feature_7" * 0.2426374781882909 + "ADS_sca_1_OUT"."Feature_8" * 0.2287736877363014 + "ADS_sca_1_OUT"."Feature_9" * -0.7468451366164522 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.5052628362580355 + "ADS_sca_1_OUT"."Feature_1" * 0.5459531848285842 + "ADS_sca_1_OUT"."Feature_2" * -0.22747468245471705 + "ADS_sca_1_OUT"."Feature_3" * 0.10502795983753949 + "ADS_sca_1_OUT"."Feature_4" * 0.09502215073405063 + "ADS_sca_1_OUT"."Feature_5" * 0.36269377695620797 + "ADS_sca_1_OUT"."Feature_6" * 0.0045813170830969465 + "ADS_sca_1_OUT"."Feature_7" * -0.05707137281293255 + "ADS_sca_1_OUT"."Feature_8" * 0.4879473635061551 + "ADS_sca_1_OUT"."Feature_9" * 0.04384333678041198 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * -0.364462956028093 + "ADS_sca_1_OUT"."Feature_1" * -0.4012918066249357 + "ADS_sca_1_OUT"."Feature_2" * 0.1851889259404308 + "ADS_sca_1_OUT"."Feature_3" * -0.03041929320097767 + "ADS_sca_1_OUT"."Feature_4" * -0.1029513075574872 + "ADS_sca_1_OUT"."Feature_5" * 0.5811919009803136 + "ADS_sca_1_OUT"."Feature_6" * -0.060907389766695234 + "ADS_sca_1_OUT"."Feature_7" * 0.12041134521888586 + "ADS_sca_1_OUT"."Feature_8" * -0.186159059340367 + "ADS_sca_1_OUT"."Feature_9" * -0.5192923770633756 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.20119583886282807 + "ADS_sca_1_OUT"."Feature_1" * 0.0677442703839704 + "ADS_sca_1_OUT"."Feature_2" * -0.41277620208310173 + "ADS_sca_1_OUT"."Feature_3" * -0.019873248265688318 + "ADS_sca_1_OUT"."Feature_4" * 0.327357356668028 + "ADS_sca_1_OUT"."Feature_5" * 0.3399166161542765 + "ADS_sca_1_OUT"."Feature_6" * 0.007401751370061409 + "ADS_sca_1_OUT"."Feature_7" * 0.6352452099253666 + "ADS_sca_1_OUT"."Feature_8" * -0.3190683902934043 + "ADS_sca_1_OUT"."Feature_9" * 0.23674831363349555 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"IL" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE) AS "PC4", CAST("ADS_pre_1_OUT"."PC5" AS DOUBLE) AS "PC5", CAST("ADS_pre_1_OUT"."PC6" AS DOUBLE) AS "PC6", CAST("ADS_pre_1_OUT"."PC7" AS DOUBLE) AS "PC7" 
FROM "ADS_pre_1_OUT"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", 3.271517 * "IL"."PC1" + 3.94154 * "IL"."PC2" + -2.056423 * "IL"."PC3" + -0.7834155 * "IL"."PC4" + -1.559365 * "IL"."PC5" + -5.476583 * "IL"."PC6" + 2.287041 * "IL"."PC7" + 0.1300699 AS "NEUR_1_1", 2.952255 * "IL"."PC1" + -0.4737196 * "IL"."PC2" + 2.189816 * "IL"."PC3" + -0.457862 * "IL"."PC4" + 0.1307643 * "IL"."PC5" + -1.456618 * "IL"."PC6" + -0.3455686 * "IL"."PC7" + -2.28108 AS "NEUR_1_2", 3.633019 * "IL"."PC1" + -4.744603 * "IL"."PC2" + -2.332573 * "IL"."PC3" + -0.24866 * "IL"."PC4" + 1.139223 * "IL"."PC5" + -0.8830002 * "IL"."PC6" + 0.7994456 * "IL"."PC7" + -1.167361 AS "NEUR_1_3", -3.282225 * "IL"."PC1" + 1.537436 * "IL"."PC2" + 1.458659 * "IL"."PC3" + -0.6310278 * "IL"."PC4" + 1.268629 * "IL"."PC5" + -0.7992967 * "IL"."PC6" + -3.368858 * "IL"."PC7" + 1.392236 AS "NEUR_1_4", -5.114473 * "IL"."PC1" + 1.747099 * "IL"."PC2" + 1.477566 * "IL"."PC3" + -1.809661 * "IL"."PC4" + 2.446017 * "IL"."PC5" + -1.670461 * "IL"."PC6" + -1.926628 * "IL"."PC7" + 1.763383 AS "NEUR_1_5", -3.497426 * "IL"."PC1" + -1.717001 * "IL"."PC2" + -1.934277 * "IL"."PC3" + 0.05154823 * "IL"."PC4" + -0.7369322 * "IL"."PC5" + -3.500772 * "IL"."PC6" + 1.184616 * "IL"."PC7" + 4.100849 AS "NEUR_1_6", -2.916885 * "IL"."PC1" + 0.4045272 * "IL"."PC2" + 1.733662 * "IL"."PC3" + -3.270408 * "IL"."PC4" + -0.03977264 * "IL"."PC5" + -2.646267 * "IL"."PC6" + -1.876717 * "IL"."PC7" + -1.843486 AS "NEUR_1_7", -1.8611 * "IL"."PC1" + -3.697265 * "IL"."PC2" + -2.582285 * "IL"."PC3" + 0.7030837 * "IL"."PC4" + -4.053042 * "IL"."PC5" + 3.670547 * "IL"."PC6" + 3.169731 * "IL"."PC7" + 2.639335 AS "NEUR_1_8", 3.401389 * "IL"."PC1" + -1.303353 * "IL"."PC2" + -2.936595 * "IL"."PC3" + 2.340419 * "IL"."PC4" + -3.646012 * "IL"."PC5" + -0.9754626 * "IL"."PC6" + -0.7973337 * "IL"."PC7" + -2.445929 AS "NEUR_1_9", 2.537346 * "IL"."PC1" + -0.2285243 * "IL"."PC2" + 2.386411 * "IL"."PC3" + 0.5712637 * "IL"."PC4" + -0.5657938 * "IL"."PC5" + 0.3649467 * "IL"."PC6" + -0.7937462 * "IL"."PC7" + 5.124795 AS "NEUR_1_10", 2.828325 * "IL"."PC1" + 2.51725 * "IL"."PC2" + -0.2280456 * "IL"."PC3" + -1.85624 * "IL"."PC4" + -1.470719 * "IL"."PC5" + -3.820276 * "IL"."PC6" + 0.6439755 * "IL"."PC7" + -1.796346 AS "NEUR_1_11", -1.05623 * "IL"."PC1" + 1.245537 * "IL"."PC2" + -0.3420816 * "IL"."PC3" + 0.09900161 * "IL"."PC4" + -4.600844 * "IL"."PC5" + -3.268343 * "IL"."PC6" + 2.748877 * "IL"."PC7" + -0.376999 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_1") THEN -"HL_BA_1"."NEUR_1_1" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_1") THEN -"HL_BA_1"."NEUR_1_1" ELSE -100.0 END END)) AS "NEUR_1_1", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_2") THEN -"HL_BA_1"."NEUR_1_2" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_2") THEN -"HL_BA_1"."NEUR_1_2" ELSE -100.0 END END)) AS "NEUR_1_2", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_3") THEN -"HL_BA_1"."NEUR_1_3" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_3") THEN -"HL_BA_1"."NEUR_1_3" ELSE -100.0 END END)) AS "NEUR_1_3", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_4") THEN -"HL_BA_1"."NEUR_1_4" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_4") THEN -"HL_BA_1"."NEUR_1_4" ELSE -100.0 END END)) AS "NEUR_1_4", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_5") THEN -"HL_BA_1"."NEUR_1_5" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_5") THEN -"HL_BA_1"."NEUR_1_5" ELSE -100.0 END END)) AS "NEUR_1_5", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_6") THEN -"HL_BA_1"."NEUR_1_6" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_6") THEN -"HL_BA_1"."NEUR_1_6" ELSE -100.0 END END)) AS "NEUR_1_6", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_7") THEN -"HL_BA_1"."NEUR_1_7" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_7") THEN -"HL_BA_1"."NEUR_1_7" ELSE -100.0 END END)) AS "NEUR_1_7", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_8") THEN -"HL_BA_1"."NEUR_1_8" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_8") THEN -"HL_BA_1"."NEUR_1_8" ELSE -100.0 END END)) AS "NEUR_1_8", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_9") THEN -"HL_BA_1"."NEUR_1_9" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_9") THEN -"HL_BA_1"."NEUR_1_9" ELSE -100.0 END END)) AS "NEUR_1_9", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_10") THEN -"HL_BA_1"."NEUR_1_10" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_10") THEN -"HL_BA_1"."NEUR_1_10" ELSE -100.0 END END)) AS "NEUR_1_10", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_11") THEN -"HL_BA_1"."NEUR_1_11" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_11") THEN -"HL_BA_1"."NEUR_1_11" ELSE -100.0 END END)) AS "NEUR_1_11", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_12") THEN -"HL_BA_1"."NEUR_1_12" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_12") THEN -"HL_BA_1"."NEUR_1_12" ELSE -100.0 END END)) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -1.881092 * "HL_1_logistic_1"."NEUR_1_1" + -0.4373117 * "HL_1_logistic_1"."NEUR_1_2" + 1.47519 * "HL_1_logistic_1"."NEUR_1_3" + -5.617877 * "HL_1_logistic_1"."NEUR_1_4" + -9.530714 * "HL_1_logistic_1"."NEUR_1_5" + 6.819065 * "HL_1_logistic_1"."NEUR_1_6" + -1.957233 * "HL_1_logistic_1"."NEUR_1_7" + 3.382762 * "HL_1_logistic_1"."NEUR_1_8" + 3.071371 * "HL_1_logistic_1"."NEUR_1_9" + 3.117154 * "HL_1_logistic_1"."NEUR_1_10" + -3.911859 * "HL_1_logistic_1"."NEUR_1_11" + 1.215687 * "HL_1_logistic_1"."NEUR_1_12" + -0.3795404 AS "NEUR_2_1", -5.540421 * "HL_1_logistic_1"."NEUR_1_1" + -4.915686 * "HL_1_logistic_1"."NEUR_1_2" + 4.076585 * "HL_1_logistic_1"."NEUR_1_3" + -0.6942354 * "HL_1_logistic_1"."NEUR_1_4" + 1.87288 * "HL_1_logistic_1"."NEUR_1_5" + 5.017748 * "HL_1_logistic_1"."NEUR_1_6" + -1.494261 * "HL_1_logistic_1"."NEUR_1_7" + -2.616243 * "HL_1_logistic_1"."NEUR_1_8" + -4.00823 * "HL_1_logistic_1"."NEUR_1_9" + 4.105472 * "HL_1_logistic_1"."NEUR_1_10" + -3.923664 * "HL_1_logistic_1"."NEUR_1_11" + 8.406063 * "HL_1_logistic_1"."NEUR_1_12" + -3.504372 AS "NEUR_2_2", 8.703522 * "HL_1_logistic_1"."NEUR_1_1" + 0.7880439 * "HL_1_logistic_1"."NEUR_1_2" + 3.055484 * "HL_1_logistic_1"."NEUR_1_3" + 5.553754 * "HL_1_logistic_1"."NEUR_1_4" + 3.159072 * "HL_1_logistic_1"."NEUR_1_5" + -8.184375 * "HL_1_logistic_1"."NEUR_1_6" + -4.332666 * "HL_1_logistic_1"."NEUR_1_7" + 5.717706 * "HL_1_logistic_1"."NEUR_1_8" + 4.712673 * "HL_1_logistic_1"."NEUR_1_9" + -7.845909 * "HL_1_logistic_1"."NEUR_1_10" + 1.403478 * "HL_1_logistic_1"."NEUR_1_11" + -2.568162 * "HL_1_logistic_1"."NEUR_1_12" + 0.3456548 AS "NEUR_2_3", -0.7959668 * "HL_1_logistic_1"."NEUR_1_1" + 4.807547 * "HL_1_logistic_1"."NEUR_1_2" + -8.477301 * "HL_1_logistic_1"."NEUR_1_3" + 0.8750159 * "HL_1_logistic_1"."NEUR_1_4" + 4.305524 * "HL_1_logistic_1"."NEUR_1_5" + -3.708555 * "HL_1_logistic_1"."NEUR_1_6" + 7.712067 * "HL_1_logistic_1"."NEUR_1_7" + -6.383457 * "HL_1_logistic_1"."NEUR_1_8" + -4.02655 * "HL_1_logistic_1"."NEUR_1_9" + 1.172868 * "HL_1_logistic_1"."NEUR_1_10" + 6.310612 * "HL_1_logistic_1"."NEUR_1_11" + -6.840255 * "HL_1_logistic_1"."NEUR_1_12" + 3.628785 AS "NEUR_2_4" 
FROM "HL_1_logistic_1"), 
"OL_softmax" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1", "OL_BA"."NEUR_2_2" AS "NEUR_2_2", "OL_BA"."NEUR_2_3" AS "NEUR_2_3", "OL_BA"."NEUR_2_4" AS "NEUR_2_4" 
FROM "OL_BA"), 
"OL_softmax_1" AS 
(SELECT "OL_softmax"."KEY" AS "KEY", "OL_softmax"."NEUR_2_1" AS "NEUR_2_1", "OL_softmax"."NEUR_2_2" AS "NEUR_2_2", "OL_softmax"."NEUR_2_3" AS "NEUR_2_3", "OL_softmax"."NEUR_2_4" AS "NEUR_2_4" 
FROM "OL_softmax"), 
orig_cte AS 
(SELECT "OL_softmax_1"."KEY" AS "KEY", "OL_softmax_1"."NEUR_2_1" AS "Score_0", "OL_softmax_1"."NEUR_2_2" AS "Score_1", "OL_softmax_1"."NEUR_2_3" AS "Score_2", "OL_softmax_1"."NEUR_2_4" AS "Score_3", CAST(NULL AS DOUBLE) AS "Proba_0", CAST(NULL AS DOUBLE) AS "Proba_1", CAST(NULL AS DOUBLE) AS "Proba_2", CAST(NULL AS DOUBLE) AS "Proba_3", CAST(NULL AS DOUBLE) AS "LogProba_0", CAST(NULL AS DOUBLE) AS "LogProba_1", CAST(NULL AS DOUBLE) AS "LogProba_2", CAST(NULL AS DOUBLE) AS "LogProba_3", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
FROM "OL_softmax_1"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS class, orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS class, orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(CASE WHEN (-100.0 <= score_max."Score_0" - score_max."max_Score") THEN score_max."Score_0" - score_max."max_Score" ELSE -100.0 END) AS "exp_delta_Score_0", exp(CASE WHEN (-100.0 <= score_max."Score_1" - score_max."max_Score") THEN score_max."Score_1" - score_max."max_Score" ELSE -100.0 END) AS "exp_delta_Score_1", exp(CASE WHEN (-100.0 <= score_max."Score_2" - score_max."max_Score") THEN score_max."Score_2" - score_max."max_Score" ELSE -100.0 END) AS "exp_delta_Score_2", exp(CASE WHEN (-100.0 <= score_max."Score_3" - score_max."max_Score") THEN score_max."Score_3" - score_max."max_Score" ELSE -100.0 END) AS "exp_delta_Score_3" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu.class AS class, soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS class, score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS class, score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 2 AS class, score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 3 AS class, score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Score_2" AS "Score_2", score_soft_max_deltas."Score_3" AS "Score_3", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."Proba_2" AS "Proba_2", score_soft_max_deltas."Proba_3" AS "Proba_3", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."LogProba_2" AS "LogProba_2", score_soft_max_deltas."LogProba_3" AS "LogProba_3", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score_3", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1", soft_max_comp."SoftProba_2" AS "SoftProba_2", soft_max_comp."SoftProba_3" AS "SoftProba_3" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max.class) AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1", score_soft_max."exp_delta_Score_2" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_2", score_soft_max."exp_delta_Score_3" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_3" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE) AS "Score_0", CAST(NULL AS DOUBLE) AS "Score_1", CAST(NULL AS DOUBLE) AS "Score_2", CAST(NULL AS DOUBLE) AS "Score_3", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", arg_max_cte."SoftProba_2" AS "Proba_2", arg_max_cte."SoftProba_3" AS "Proba_3", log(CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > 1e-100) THEN arg_max_cte."SoftProba_0" ELSE 1e-100 END) AS "LogProba_0", log(CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > 1e-100) THEN arg_max_cte."SoftProba_1" ELSE 1e-100 END) AS "LogProba_1", log(CASE WHEN (arg_max_cte."SoftProba_2" IS NULL OR arg_max_cte."SoftProba_2" > 1e-100) THEN arg_max_cte."SoftProba_2" ELSE 1e-100 END) AS "LogProba_2", log(CASE WHEN (arg_max_cte."SoftProba_3" IS NULL OR arg_max_cte."SoftProba_3" > 1e-100) THEN arg_max_cte."SoftProba_3" ELSE 1e-100 END) AS "LogProba_3", arg_max_cte."arg_max_Score" AS "Decision", CASE WHEN (arg_max_cte."SoftProba_0" <= CASE WHEN (arg_max_cte."SoftProba_1" <= CASE WHEN (arg_max_cte."SoftProba_2" <= arg_max_cte."SoftProba_3") THEN arg_max_cte."SoftProba_3" ELSE arg_max_cte."SoftProba_2" END) THEN CASE WHEN (arg_max_cte."SoftProba_2" <= arg_max_cte."SoftProba_3") THEN arg_max_cte."SoftProba_3" ELSE arg_max_cte."SoftProba_2" END ELSE arg_max_cte."SoftProba_1" END) THEN CASE WHEN (arg_max_cte."SoftProba_1" <= CASE WHEN (arg_max_cte."SoftProba_2" <= arg_max_cte."SoftProba_3") THEN arg_max_cte."SoftProba_3" ELSE arg_max_cte."SoftProba_2" END) THEN CASE WHEN (arg_max_cte."SoftProba_2" <= arg_max_cte."SoftProba_3") THEN arg_max_cte."SoftProba_3" ELSE arg_max_cte."SoftProba_2" END ELSE arg_max_cte."SoftProba_1" END ELSE arg_max_cte."SoftProba_0" END AS "DecisionProba" 
FROM arg_max_cte