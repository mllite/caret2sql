-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet_pca
-- Dataset : boston
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 3.3936090099009895) / 8.010536728867239 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - 12.113861386138614) / 24.217647441147463 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 10.983613861386141) / 6.826200750364282 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 0.07178217821782178) / 0.2584469594478702 AS [Feature_3], (CAST([ADS].[Feature_4] AS FLOAT(53)) - 0.5541153465346534) / 0.1181544189262098 AS [Feature_4], (CAST([ADS].[Feature_5] AS FLOAT(53)) - 6.299148514851484) / 0.7069171793669617 AS [Feature_5], (CAST([ADS].[Feature_6] AS FLOAT(53)) - 67.85049504950496) / 28.14225428392539 AS [Feature_6], (CAST([ADS].[Feature_7] AS FLOAT(53)) - 3.8198420792079206) / 2.0959683176629325 AS [Feature_7], (CAST([ADS].[Feature_8] AS FLOAT(53)) - 9.559405940594061) / 8.73962685484057 AS [Feature_8], (CAST([ADS].[Feature_9] AS FLOAT(53)) - 405.8019801980198) / 169.99638120813233 AS [Feature_9], (CAST([ADS].[Feature_10] AS FLOAT(53)) - 18.409158415841585) / 2.169479311043464 AS [Feature_10], (CAST([ADS].[Feature_11] AS FLOAT(53)) - 358.3797277227722) / 90.75931171894922 AS [Feature_11], (CAST([ADS].[Feature_12] AS FLOAT(53)) - 12.626584158415842) / 7.176826037708456 AS [Feature_12] 
FROM boston AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * 0.25022067888868665 + [ADS_sca_1_OUT].[Feature_1] * -0.25765762216632226 + [ADS_sca_1_OUT].[Feature_2] * 0.3491428172111632 + [ADS_sca_1_OUT].[Feature_3] * 0.01094773991121527 + [ADS_sca_1_OUT].[Feature_4] * 0.34170294050212857 + [ADS_sca_1_OUT].[Feature_5] * -0.18342485606154985 + [ADS_sca_1_OUT].[Feature_6] * 0.3129084082735513 + [ADS_sca_1_OUT].[Feature_7] * -0.3220310104224693 + [ADS_sca_1_OUT].[Feature_8] * 0.3210957066290012 + [ADS_sca_1_OUT].[Feature_9] * 0.3372514741075172 + [ADS_sca_1_OUT].[Feature_10] * 0.2041002866212432 + [ADS_sca_1_OUT].[Feature_11] * -0.20483878453228935 + [ADS_sca_1_OUT].[Feature_12] * 0.3106501513197035 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * -0.33389249833500073 + [ADS_sca_1_OUT].[Feature_1] * -0.3461278969103596 + [ADS_sca_1_OUT].[Feature_2] * 0.08741121935217115 + [ADS_sca_1_OUT].[Feature_3] * 0.4245155851940165 + [ADS_sca_1_OUT].[Feature_4] * 0.2112937184640132 + [ADS_sca_1_OUT].[Feature_5] * 0.0574342949321771 + [ADS_sca_1_OUT].[Feature_6] * 0.3143514152302056 + [ADS_sca_1_OUT].[Feature_7] * -0.33832121905897383 + [ADS_sca_1_OUT].[Feature_8] * -0.3093926550229444 + [ADS_sca_1_OUT].[Feature_9] * -0.27803257944665394 + [ADS_sca_1_OUT].[Feature_10] * -0.28693120813154377 + [ADS_sca_1_OUT].[Feature_11] * 0.2527117523816798 + [ADS_sca_1_OUT].[Feature_12] * -0.020410873762011308 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * 0.19608688758362933 + [ADS_sca_1_OUT].[Feature_1] * 0.2469257706594379 + [ADS_sca_1_OUT].[Feature_2] * -0.02294168584923974 + [ADS_sca_1_OUT].[Feature_3] * 0.2950722382634112 + [ADS_sca_1_OUT].[Feature_4] * 0.14475391738768567 + [ADS_sca_1_OUT].[Feature_5] * 0.6390828425216293 + [ADS_sca_1_OUT].[Feature_6] * 0.04637333835457555 + [ADS_sca_1_OUT].[Feature_7] * -0.10318310122143892 + [ADS_sca_1_OUT].[Feature_8] * 0.2497932777479205 + [ADS_sca_1_OUT].[Feature_9] * 0.18494382558800715 + [ADS_sca_1_OUT].[Feature_10] * -0.3548131264402329 + [ADS_sca_1_OUT].[Feature_11] * -0.2684239315694441 + [ADS_sca_1_OUT].[Feature_12] * -0.2761542549039 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * -0.07043882717757964 + [ADS_sca_1_OUT].[Feature_1] * -0.3664439770890674 + [ADS_sca_1_OUT].[Feature_2] * 0.0055058786745181285 + [ADS_sca_1_OUT].[Feature_3] * -0.3946776597336387 + [ADS_sca_1_OUT].[Feature_4] * -0.08824417045679225 + [ADS_sca_1_OUT].[Feature_5] * 0.4793823607635913 + [ADS_sca_1_OUT].[Feature_6] * 0.08998214645492984 + [ADS_sca_1_OUT].[Feature_7] * -0.18326301068911208 + [ADS_sca_1_OUT].[Feature_8] * 0.09856418200051932 + [ADS_sca_1_OUT].[Feature_9] * 0.04616348150064367 + [ADS_sca_1_OUT].[Feature_10] * 0.42777912036010746 + [ADS_sca_1_OUT].[Feature_11] * 0.3005689288221394 + [ADS_sca_1_OUT].[Feature_12] * -0.37482955126669193 AS [PC4], [ADS_sca_1_OUT].[Feature_0] * 0.04300395631166038 + [ADS_sca_1_OUT].[Feature_1] * -0.02875212611151597 + [ADS_sca_1_OUT].[Feature_2] * 0.02223188515780241 + [ADS_sca_1_OUT].[Feature_3] * 0.7435684786227807 + [ADS_sca_1_OUT].[Feature_4] * -0.1834288143499854 + [ADS_sca_1_OUT].[Feature_5] * -0.07107783038498264 + [ADS_sca_1_OUT].[Feature_6] * -0.1682770489309431 + [ADS_sca_1_OUT].[Feature_7] * 0.14991701697987567 + [ADS_sca_1_OUT].[Feature_8] * 0.19696674860202626 + [ADS_sca_1_OUT].[Feature_9] * 0.1420113329297506 + [ADS_sca_1_OUT].[Feature_10] * 0.4646548460967998 + [ADS_sca_1_OUT].[Feature_11] * 0.255520747968419 + [ADS_sca_1_OUT].[Feature_12] * -0.11952854639999652 AS [PC5], [ADS_sca_1_OUT].[Feature_0] * -0.3767232718011799 + [ADS_sca_1_OUT].[Feature_1] * -0.29207806001032416 + [ADS_sca_1_OUT].[Feature_2] * -0.01942601421821086 + [ADS_sca_1_OUT].[Feature_3] * 0.10887824454350792 + [ADS_sca_1_OUT].[Feature_4] * -0.10146416318885716 + [ADS_sca_1_OUT].[Feature_5] * 0.057934635009180835 + [ADS_sca_1_OUT].[Feature_6] * -0.10809395127298303 + [ADS_sca_1_OUT].[Feature_7] * 0.032878444909013 + [ADS_sca_1_OUT].[Feature_8] * -0.09390581030770888 + [ADS_sca_1_OUT].[Feature_9] * -0.12972376055449672 + [ADS_sca_1_OUT].[Feature_10] * 0.2572802499128157 + [ADS_sca_1_OUT].[Feature_11] * -0.7965340188449787 + [ADS_sca_1_OUT].[Feature_12] * -0.08840431527675782 AS [PC6], [ADS_sca_1_OUT].[Feature_0] * 0.7320645629415989 + [ADS_sca_1_OUT].[Feature_1] * -0.3159393337538693 + [ADS_sca_1_OUT].[Feature_2] * -0.3373999976989149 + [ADS_sca_1_OUT].[Feature_3] * 0.0931540519768708 + [ADS_sca_1_OUT].[Feature_4] * -0.2259561892558596 + [ADS_sca_1_OUT].[Feature_5] * 0.04114489763402434 + [ADS_sca_1_OUT].[Feature_6] * 0.08761501939857337 + [ADS_sca_1_OUT].[Feature_7] * -0.08894297135254832 + [ADS_sca_1_OUT].[Feature_8] * -0.17352234917240772 + [ADS_sca_1_OUT].[Feature_9] * -0.3494997544996276 + [ADS_sca_1_OUT].[Feature_10] * 0.023466306336306118 + [ADS_sca_1_OUT].[Feature_11] * -0.11741140060045532 + [ADS_sca_1_OUT].[Feature_12] * 0.08255206116222752 AS [PC7] 
FROM [ADS_sca_1_OUT]), 
[IL] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CAST([ADS_pre_1_OUT].[PC1] AS FLOAT(53)) AS [PC1], CAST([ADS_pre_1_OUT].[PC2] AS FLOAT(53)) AS [PC2], CAST([ADS_pre_1_OUT].[PC3] AS FLOAT(53)) AS [PC3], CAST([ADS_pre_1_OUT].[PC4] AS FLOAT(53)) AS [PC4], CAST([ADS_pre_1_OUT].[PC5] AS FLOAT(53)) AS [PC5], CAST([ADS_pre_1_OUT].[PC6] AS FLOAT(53)) AS [PC6], CAST([ADS_pre_1_OUT].[PC7] AS FLOAT(53)) AS [PC7] 
FROM [ADS_pre_1_OUT]), 
[HL_BA_1] AS 
(SELECT [IL].[KEY] AS [KEY], 0.08598288 * [IL].[PC1] + -1.324625 * [IL].[PC2] + 2.090709 * [IL].[PC3] + 1.644428 * [IL].[PC4] + 3.409261 * [IL].[PC5] + 1.157609 * [IL].[PC6] + -5.499177 * [IL].[PC7] + -3.1913 AS [NEUR_1_1], -0.9829555 * [IL].[PC1] + -5.435506 * [IL].[PC2] + 16.95758 * [IL].[PC3] + 16.66513 * [IL].[PC4] + 7.690579 * [IL].[PC5] + -0.8787472 * [IL].[PC6] + 8.703445 * [IL].[PC7] + -26.46233 AS [NEUR_1_2], -1.709237 * [IL].[PC1] + 1.32686 * [IL].[PC2] + 0.02946337 * [IL].[PC3] + 0.4887807 * [IL].[PC4] + -2.056733 * [IL].[PC5] + -0.4009525 * [IL].[PC6] + -0.6041722 * [IL].[PC7] + -2.936301 AS [NEUR_1_3], -1.656295 * [IL].[PC1] + -3.838209 * [IL].[PC2] + 4.030491 * [IL].[PC3] + 10.04539 * [IL].[PC4] + 1.633063 * [IL].[PC5] + -1.029449 * [IL].[PC6] + -1.008098 * [IL].[PC7] + -3.753186 AS [NEUR_1_4], -0.4952459 * [IL].[PC1] + 5.276985 * [IL].[PC2] + 0.8873883 * [IL].[PC3] + -0.9555647 * [IL].[PC4] + 1.480192 * [IL].[PC5] + -0.4812775 * [IL].[PC6] + 4.064521 * [IL].[PC7] + -9.143788 AS [NEUR_1_5], -2.937029 * [IL].[PC1] + 1.485168 * [IL].[PC2] + 1.710888 * [IL].[PC3] + 1.624034 * [IL].[PC4] + -2.219737 * [IL].[PC5] + 3.306336 * [IL].[PC6] + -5.271966 * [IL].[PC7] + -9.822009 AS [NEUR_1_6], 0.04346218 * [IL].[PC1] + 3.155304 * [IL].[PC2] + -4.307349 * [IL].[PC3] + -1.785372 * [IL].[PC4] + 1.609685 * [IL].[PC5] + -0.8793664 * [IL].[PC6] + -0.06742823 * [IL].[PC7] + 4.773466 AS [NEUR_1_7], -2.30525 * [IL].[PC1] + -2.474005 * [IL].[PC2] + -1.047797 * [IL].[PC3] + 10.97416 * [IL].[PC4] + -3.869697 * [IL].[PC5] + 10.03499 * [IL].[PC6] + 8.878503 * [IL].[PC7] + 5.182205 AS [NEUR_1_8], 3.098075 * [IL].[PC1] + -2.091624 * [IL].[PC2] + 1.576952 * [IL].[PC3] + -12.59009 * [IL].[PC4] + -4.700706 * [IL].[PC5] + 8.530452 * [IL].[PC6] + -7.435172 * [IL].[PC7] + 10.71436 AS [NEUR_1_9], -0.1074842 * [IL].[PC1] + 9.293717 * [IL].[PC2] + 7.159443 * [IL].[PC3] + -11.36631 * [IL].[PC4] + 17.98112 * [IL].[PC5] + 6.477119 * [IL].[PC6] + 3.394625 * [IL].[PC7] + 14.57575 AS [NEUR_1_10], 1.368781 * [IL].[PC1] + -1.644752 * [IL].[PC2] + -4.892033 * [IL].[PC3] + -15.92922 * [IL].[PC4] + -6.398233 * [IL].[PC5] + 1.435304 * [IL].[PC6] + -18.18978 * [IL].[PC7] + 8.307748 AS [NEUR_1_11], -1.756946 * [IL].[PC1] + -0.9436709 * [IL].[PC2] + -3.60548 * [IL].[PC3] + 1.391999 * [IL].[PC4] + -1.352262 * [IL].[PC5] + 3.304787 * [IL].[PC6] + -1.26919 * [IL].[PC7] + 7.532421 AS [NEUR_1_12] 
FROM [IL]), 
[HL_1_logistic] AS 
(SELECT [HL_BA_1].[KEY] AS [KEY], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_1]) THEN -[HL_BA_1].[NEUR_1_1] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_1]) THEN -[HL_BA_1].[NEUR_1_1] ELSE -100.0 END END)) AS [NEUR_1_1], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_2]) THEN -[HL_BA_1].[NEUR_1_2] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_2]) THEN -[HL_BA_1].[NEUR_1_2] ELSE -100.0 END END)) AS [NEUR_1_2], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_3]) THEN -[HL_BA_1].[NEUR_1_3] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_3]) THEN -[HL_BA_1].[NEUR_1_3] ELSE -100.0 END END)) AS [NEUR_1_3], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_4]) THEN -[HL_BA_1].[NEUR_1_4] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_4]) THEN -[HL_BA_1].[NEUR_1_4] ELSE -100.0 END END)) AS [NEUR_1_4], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_5]) THEN -[HL_BA_1].[NEUR_1_5] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_5]) THEN -[HL_BA_1].[NEUR_1_5] ELSE -100.0 END END)) AS [NEUR_1_5], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_6]) THEN -[HL_BA_1].[NEUR_1_6] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_6]) THEN -[HL_BA_1].[NEUR_1_6] ELSE -100.0 END END)) AS [NEUR_1_6], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_7]) THEN -[HL_BA_1].[NEUR_1_7] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_7]) THEN -[HL_BA_1].[NEUR_1_7] ELSE -100.0 END END)) AS [NEUR_1_7], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_8]) THEN -[HL_BA_1].[NEUR_1_8] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_8]) THEN -[HL_BA_1].[NEUR_1_8] ELSE -100.0 END END)) AS [NEUR_1_8], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_9]) THEN -[HL_BA_1].[NEUR_1_9] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_9]) THEN -[HL_BA_1].[NEUR_1_9] ELSE -100.0 END END)) AS [NEUR_1_9], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_10]) THEN -[HL_BA_1].[NEUR_1_10] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_10]) THEN -[HL_BA_1].[NEUR_1_10] ELSE -100.0 END END)) AS [NEUR_1_10], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_11]) THEN -[HL_BA_1].[NEUR_1_11] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_11]) THEN -[HL_BA_1].[NEUR_1_11] ELSE -100.0 END END)) AS [NEUR_1_11], 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_12]) THEN -[HL_BA_1].[NEUR_1_12] ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -[HL_BA_1].[NEUR_1_12]) THEN -[HL_BA_1].[NEUR_1_12] ELSE -100.0 END END)) AS [NEUR_1_12] 
FROM [HL_BA_1]), 
[HL_1_logistic_1] AS 
(SELECT [HL_1_logistic].[KEY] AS [KEY], [HL_1_logistic].[NEUR_1_1] AS [NEUR_1_1], [HL_1_logistic].[NEUR_1_2] AS [NEUR_1_2], [HL_1_logistic].[NEUR_1_3] AS [NEUR_1_3], [HL_1_logistic].[NEUR_1_4] AS [NEUR_1_4], [HL_1_logistic].[NEUR_1_5] AS [NEUR_1_5], [HL_1_logistic].[NEUR_1_6] AS [NEUR_1_6], [HL_1_logistic].[NEUR_1_7] AS [NEUR_1_7], [HL_1_logistic].[NEUR_1_8] AS [NEUR_1_8], [HL_1_logistic].[NEUR_1_9] AS [NEUR_1_9], [HL_1_logistic].[NEUR_1_10] AS [NEUR_1_10], [HL_1_logistic].[NEUR_1_11] AS [NEUR_1_11], [HL_1_logistic].[NEUR_1_12] AS [NEUR_1_12] 
FROM [HL_1_logistic]), 
[OL_BA] AS 
(SELECT [HL_1_logistic_1].[KEY] AS [KEY], 5.531068 * [HL_1_logistic_1].[NEUR_1_1] + 12.0853 * [HL_1_logistic_1].[NEUR_1_2] + 8.42358 * [HL_1_logistic_1].[NEUR_1_3] + 3.133584 * [HL_1_logistic_1].[NEUR_1_4] + 6.768311 * [HL_1_logistic_1].[NEUR_1_5] + 17.05877 * [HL_1_logistic_1].[NEUR_1_6] + 10.57051 * [HL_1_logistic_1].[NEUR_1_7] + 4.267468 * [HL_1_logistic_1].[NEUR_1_8] + 6.725341 * [HL_1_logistic_1].[NEUR_1_9] + 21.0527 * [HL_1_logistic_1].[NEUR_1_10] + -5.641374 * [HL_1_logistic_1].[NEUR_1_11] + 2.335194 * [HL_1_logistic_1].[NEUR_1_12] + -21.35714 AS [NEUR_2_1] 
FROM [HL_1_logistic_1]), 
[OL_identity] AS 
(SELECT [OL_BA].[KEY] AS [KEY], [OL_BA].[NEUR_2_1] AS [NEUR_2_1] 
FROM [OL_BA]), 
[OL_identity_1] AS 
(SELECT [OL_identity].[KEY] AS [KEY], [OL_identity].[NEUR_2_1] AS [NEUR_2_1] 
FROM [OL_identity])
 SELECT [OL_identity_1].[KEY] AS [KEY], [OL_identity_1].[NEUR_2_1] AS [Estimator] 
FROM [OL_identity_1]