-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet_pca
-- Dataset : BreastCancer
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 14.07771208791209) / 3.5490515005403798 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 19.03905494505495) / 4.166878656652379 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 91.66178021978024) / 24.53094385251417 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 650.9676923076922) / 356.0943508808365 AS "Feature_3", (CAST("ADS"."Feature_4" AS FLOAT) - 0.09642184615384616) / 0.01421344742747642 AS "Feature_4", (CAST("ADS"."Feature_5" AS FLOAT) - 0.1044161318681319) / 0.053462476960143265 AS "Feature_5", (CAST("ADS"."Feature_6" AS FLOAT) - 0.08826232681318681) / 0.08200216346057157 AS "Feature_6", (CAST("ADS"."Feature_7" AS FLOAT) - 0.0485164) / 0.03941645600907594 AS "Feature_7", (CAST("ADS"."Feature_8" AS FLOAT) - 0.1815885714285714) / 0.02782064728498547 AS "Feature_8", (CAST("ADS"."Feature_9" AS FLOAT) - 0.0629403076923077) / 0.007027080900659396 AS "Feature_9", (CAST("ADS"."Feature_10" AS FLOAT) - 0.4099173626373626) / 0.2915245412208004 AS "Feature_10", (CAST("ADS"."Feature_11" AS FLOAT) - 1.217069450549451) / 0.5369800521839988 AS "Feature_11", (CAST("ADS"."Feature_12" AS FLOAT) - 2.9052490109890114) / 2.144852707447646 AS "Feature_12", (CAST("ADS"."Feature_13" AS FLOAT) - 40.87988571428571) / 48.2778362287006 AS "Feature_13", (CAST("ADS"."Feature_14" AS FLOAT) - 0.0070559714285714295) / 0.002866803723188527 AS "Feature_14", (CAST("ADS"."Feature_15" AS FLOAT) - 0.02556783076923077) / 0.01796676819246774 AS "Feature_15", (CAST("ADS"."Feature_16" AS FLOAT) - 0.031999256263736266) / 0.03169979081746389 AS "Feature_16", (CAST("ADS"."Feature_17" AS FLOAT) - 0.01197236923076923) / 0.006399041370931476 AS "Feature_17", (CAST("ADS"."Feature_18" AS FLOAT) - 0.0208962) / 0.008592357424589265 AS "Feature_18", (CAST("ADS"."Feature_19" AS FLOAT) - 0.003846551868131868) / 0.0027466275188339 AS "Feature_19", (CAST("ADS"."Feature_20" AS FLOAT) - 16.17776483516484) / 4.822761469227882 AS "Feature_20", (CAST("ADS"."Feature_21" AS FLOAT) - 25.26505494505495) / 5.929844025113361 AS "Feature_21", (CAST("ADS"."Feature_22" AS FLOAT) - 106.68156043956041) / 33.740956745431944 AS "Feature_22", (CAST("ADS"."Feature_23" AS FLOAT) - 870.863956043956) / 567.6191564029466 AS "Feature_23", (CAST("ADS"."Feature_24" AS FLOAT) - 0.1318275604395604) / 0.02277324683369087 AS "Feature_24", (CAST("ADS"."Feature_25" AS FLOAT) - 0.2499180659340659) / 0.1526367614098782 AS "Feature_25", (CAST("ADS"."Feature_26" AS FLOAT) - 0.2654615934065934) / 0.2071534531545495 AS "Feature_26", (CAST("ADS"."Feature_27" AS FLOAT) - 0.1134879802197802) / 0.06645447985497112 AS "Feature_27", (CAST("ADS"."Feature_28" AS FLOAT) - 0.2897881318681318) / 0.06227317635385585 AS "Feature_28", (CAST("ADS"."Feature_29" AS FLOAT) - 0.08364145054945055) / 0.01708392968253732 AS "Feature_29" 
FROM "BreastCancer" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.21768343094223108 + "ADS_sca_1_OUT"."Feature_1" * -0.10393262184047268 + "ADS_sca_1_OUT"."Feature_2" * -0.2265164944329179 + "ADS_sca_1_OUT"."Feature_3" * -0.21993736711575185 + "ADS_sca_1_OUT"."Feature_4" * -0.14268833980412854 + "ADS_sca_1_OUT"."Feature_5" * -0.24024798670573505 + "ADS_sca_1_OUT"."Feature_6" * -0.257355901686626 + "ADS_sca_1_OUT"."Feature_7" * -0.2597680750587679 + "ADS_sca_1_OUT"."Feature_8" * -0.13868620385317515 + "ADS_sca_1_OUT"."Feature_9" * -0.06712190195264113 + "ADS_sca_1_OUT"."Feature_10" * -0.2069150720147228 + "ADS_sca_1_OUT"."Feature_11" * -0.03305717760079786 + "ADS_sca_1_OUT"."Feature_12" * -0.212828518237874 + "ADS_sca_1_OUT"."Feature_13" * -0.2013439160056293 + "ADS_sca_1_OUT"."Feature_14" * -0.02049865164066569 + "ADS_sca_1_OUT"."Feature_15" * -0.1750181653895911 + "ADS_sca_1_OUT"."Feature_16" * -0.1519078637342155 + "ADS_sca_1_OUT"."Feature_17" * -0.1865203607950731 + "ADS_sca_1_OUT"."Feature_18" * -0.053039357385151385 + "ADS_sca_1_OUT"."Feature_19" * -0.10231665221046024 + "ADS_sca_1_OUT"."Feature_20" * -0.226956028801125 + "ADS_sca_1_OUT"."Feature_21" * -0.10317017778958812 + "ADS_sca_1_OUT"."Feature_22" * -0.23602999862163965 + "ADS_sca_1_OUT"."Feature_23" * -0.2240006176535796 + "ADS_sca_1_OUT"."Feature_24" * -0.12717220549829955 + "ADS_sca_1_OUT"."Feature_25" * -0.21222759880468806 + "ADS_sca_1_OUT"."Feature_26" * -0.22758988828313426 + "ADS_sca_1_OUT"."Feature_27" * -0.2490125441701701 + "ADS_sca_1_OUT"."Feature_28" * -0.11944032522919835 + "ADS_sca_1_OUT"."Feature_29" * -0.13166419338876287 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.2388263496095884 + "ADS_sca_1_OUT"."Feature_1" * 0.05323416968015016 + "ADS_sca_1_OUT"."Feature_2" * 0.21941449489711815 + "ADS_sca_1_OUT"."Feature_3" * 0.2342171388843593 + "ADS_sca_1_OUT"."Feature_4" * -0.17925865624129375 + "ADS_sca_1_OUT"."Feature_5" * -0.14316495439683485 + "ADS_sca_1_OUT"."Feature_6" * -0.06042147680146465 + "ADS_sca_1_OUT"."Feature_7" * 0.03722975887665922 + "ADS_sca_1_OUT"."Feature_8" * -0.19462120663415455 + "ADS_sca_1_OUT"."Feature_9" * -0.3731777815015735 + "ADS_sca_1_OUT"."Feature_10" * 0.0948169433203506 + "ADS_sca_1_OUT"."Feature_11" * -0.10262087159564362 + "ADS_sca_1_OUT"."Feature_12" * 0.08014049234060505 + "ADS_sca_1_OUT"."Feature_13" * 0.14683589434398536 + "ADS_sca_1_OUT"."Feature_14" * -0.21665542062253368 + "ADS_sca_1_OUT"."Feature_15" * -0.22633882980546735 + "ADS_sca_1_OUT"."Feature_16" * -0.2013330897413932 + "ADS_sca_1_OUT"."Feature_17" * -0.13744139199061656 + "ADS_sca_1_OUT"."Feature_18" * -0.1851008068283944 + "ADS_sca_1_OUT"."Feature_19" * -0.2787797373414811 + "ADS_sca_1_OUT"."Feature_20" * 0.22285850281808672 + "ADS_sca_1_OUT"."Feature_21" * 0.04796372561185864 + "ADS_sca_1_OUT"."Feature_22" * 0.20144532663199727 + "ADS_sca_1_OUT"."Feature_23" * 0.22117900125773696 + "ADS_sca_1_OUT"."Feature_24" * -0.16388533650733236 + "ADS_sca_1_OUT"."Feature_25" * -0.12771851864859946 + "ADS_sca_1_OUT"."Feature_26" * -0.0920845205598406 + "ADS_sca_1_OUT"."Feature_27" * 0.01180363799025717 + "ADS_sca_1_OUT"."Feature_28" * -0.13218791158615573 + "ADS_sca_1_OUT"."Feature_29" * -0.272971048775739 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.005390218995132989 + "ADS_sca_1_OUT"."Feature_1" * 0.07559188324769446 + "ADS_sca_1_OUT"."Feature_2" * -0.006630034456413209 + "ADS_sca_1_OUT"."Feature_3" * 0.03307539547257528 + "ADS_sca_1_OUT"."Feature_4" * -0.11408606276317496 + "ADS_sca_1_OUT"."Feature_5" * -0.08243204451061603 + "ADS_sca_1_OUT"."Feature_6" * -0.0034631546527687713 + "ADS_sca_1_OUT"."Feature_7" * -0.025369092650600944 + "ADS_sca_1_OUT"."Feature_8" * -0.03545304892446201 + "ADS_sca_1_OUT"."Feature_9" * -0.033460358570260834 + "ADS_sca_1_OUT"."Feature_10" * 0.2702606607101766 + "ADS_sca_1_OUT"."Feature_11" * 0.38895800748244913 + "ADS_sca_1_OUT"."Feature_12" * 0.265539009843534 + "ADS_sca_1_OUT"."Feature_13" * 0.22087996051915645 + "ADS_sca_1_OUT"."Feature_14" * 0.30083207092269965 + "ADS_sca_1_OUT"."Feature_15" * 0.14870995945035803 + "ADS_sca_1_OUT"."Feature_16" * 0.15617929564803443 + "ADS_sca_1_OUT"."Feature_17" * 0.20527006718186183 + "ADS_sca_1_OUT"."Feature_18" * 0.2727509234513494 + "ADS_sca_1_OUT"."Feature_19" * 0.20491559570513843 + "ADS_sca_1_OUT"."Feature_20" * -0.04651017214243354 + "ADS_sca_1_OUT"."Feature_21" * -0.030620841495121995 + "ADS_sca_1_OUT"."Feature_22" * -0.04908306111118616 + "ADS_sca_1_OUT"."Feature_23" * -0.009372073109054205 + "ADS_sca_1_OUT"."Feature_24" * -0.2716162372345253 + "ADS_sca_1_OUT"."Feature_25" * -0.2404036986894661 + "ADS_sca_1_OUT"."Feature_26" * -0.17728088382408685 + "ADS_sca_1_OUT"."Feature_27" * -0.1759158149922438 + "ADS_sca_1_OUT"."Feature_28" * -0.2741603341993864 + "ADS_sca_1_OUT"."Feature_29" * -0.23752113369727115 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.032221335163821266 + "ADS_sca_1_OUT"."Feature_1" * -0.5981813597757002 + "ADS_sca_1_OUT"."Feature_2" * 0.03274684636104511 + "ADS_sca_1_OUT"."Feature_3" * 0.051633089886458795 + "ADS_sca_1_OUT"."Feature_4" * 0.1894886130432605 + "ADS_sca_1_OUT"."Feature_5" * 0.025213175765623888 + "ADS_sca_1_OUT"."Feature_6" * 0.020686309537882627 + "ADS_sca_1_OUT"."Feature_7" * 0.06556536720486286 + "ADS_sca_1_OUT"."Feature_8" * 0.07581347598658743 + "ADS_sca_1_OUT"."Feature_9" * 0.039784025514564836 + "ADS_sca_1_OUT"."Feature_10" * 0.12103267182656124 + "ADS_sca_1_OUT"."Feature_11" * -0.3253456701348236 + "ADS_sca_1_OUT"."Feature_12" * 0.10403160451161235 + "ADS_sca_1_OUT"."Feature_13" * 0.13096113686887037 + "ADS_sca_1_OUT"."Feature_14" * 0.08529767241873171 + "ADS_sca_1_OUT"."Feature_15" * -0.05050256477826615 + "ADS_sca_1_OUT"."Feature_16" * -0.013858636956129685 + "ADS_sca_1_OUT"."Feature_17" * 0.051636470783270175 + "ADS_sca_1_OUT"."Feature_18" * 0.07845623611137836 + "ADS_sca_1_OUT"."Feature_19" * -0.01800224834117843 + "ADS_sca_1_OUT"."Feature_20" * 0.01340810356608377 + "ADS_sca_1_OUT"."Feature_21" * -0.6255117301896479 + "ADS_sca_1_OUT"."Feature_22" * 0.008890529878086695 + "ADS_sca_1_OUT"."Feature_23" * 0.03206575052269575 + "ADS_sca_1_OUT"."Feature_24" * 0.06218614198553856 + "ADS_sca_1_OUT"."Feature_25" * -0.10208562087194813 + "ADS_sca_1_OUT"."Feature_26" * -0.07404407884842225 + "ADS_sca_1_OUT"."Feature_27" * -0.001759497416926437 + "ADS_sca_1_OUT"."Feature_28" * -0.020695280701914644 + "ADS_sca_1_OUT"."Feature_29" * -0.09172275305484348 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.03583586526438166 + "ADS_sca_1_OUT"."Feature_1" * 0.10668556494546105 + "ADS_sca_1_OUT"."Feature_2" * -0.03580063384563657 + "ADS_sca_1_OUT"."Feature_3" * -0.01186523434650828 + "ADS_sca_1_OUT"."Feature_4" * 0.3472926626357166 + "ADS_sca_1_OUT"."Feature_5" * -0.01279638595762936 + "ADS_sca_1_OUT"."Feature_6" * -0.09686339610083955 + "ADS_sca_1_OUT"."Feature_7" * 0.030262925273250155 + "ADS_sca_1_OUT"."Feature_8" * 0.2919734843378978 + "ADS_sca_1_OUT"."Feature_9" * 0.024129207305013743 + "ADS_sca_1_OUT"."Feature_10" * 0.13199923484872902 + "ADS_sca_1_OUT"."Feature_11" * 0.21157425482633896 + "ADS_sca_1_OUT"."Feature_12" * 0.10248820501553313 + "ADS_sca_1_OUT"."Feature_13" * 0.10874553311679416 + "ADS_sca_1_OUT"."Feature_14" * 0.2544812741423084 + "ADS_sca_1_OUT"."Feature_15" * -0.2746684061050128 + "ADS_sca_1_OUT"."Feature_16" * -0.3540979971305165 + "ADS_sca_1_OUT"."Feature_17" * -0.19847452634975313 + "ADS_sca_1_OUT"."Feature_18" * 0.24138551945384004 + "ADS_sca_1_OUT"."Feature_19" * -0.27461076869519324 + "ADS_sca_1_OUT"."Feature_20" * 0.00438970711748895 + "ADS_sca_1_OUT"."Feature_21" * 0.15304890309187444 + "ADS_sca_1_OUT"."Feature_22" * -0.0062975700081063036 + "ADS_sca_1_OUT"."Feature_23" * 0.02449023484088534 + "ADS_sca_1_OUT"."Feature_24" * 0.3212354882834555 + "ADS_sca_1_OUT"."Feature_25" * -0.10048955127484832 + "ADS_sca_1_OUT"."Feature_26" * -0.18301792369043487 + "ADS_sca_1_OUT"."Feature_27" * -0.04092825303637145 + "ADS_sca_1_OUT"."Feature_28" * 0.25478475230789854 + "ADS_sca_1_OUT"."Feature_29" * -0.09149620178238 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.02578277051115795 + "ADS_sca_1_OUT"."Feature_1" * -0.03488683150504261 + "ADS_sca_1_OUT"."Feature_2" * 0.02337879624440808 + "ADS_sca_1_OUT"."Feature_3" * 5.311632734197533e-05 + "ADS_sca_1_OUT"."Feature_4" * -0.2831599190004263 + "ADS_sca_1_OUT"."Feature_5" * -0.0182359166955445 + "ADS_sca_1_OUT"."Feature_6" * -0.00606493341165939 + "ADS_sca_1_OUT"."Feature_7" * -0.04670696605311275 + "ADS_sca_1_OUT"."Feature_8" * 0.3517020411433183 + "ADS_sca_1_OUT"."Feature_9" * -0.1269409741371922 + "ADS_sca_1_OUT"."Feature_10" * -0.044449703384920235 + "ADS_sca_1_OUT"."Feature_11" * -0.05130045078703252 + "ADS_sca_1_OUT"."Feature_12" * -0.015070584315048681 + "ADS_sca_1_OUT"."Feature_13" * -0.06214481224260445 + "ADS_sca_1_OUT"."Feature_14" * -0.300750288327894 + "ADS_sca_1_OUT"."Feature_15" * 0.05383577001601851 + "ADS_sca_1_OUT"."Feature_16" * 0.07247828206101359 + "ADS_sca_1_OUT"."Feature_17" * -0.0041762502813039925 + "ADS_sca_1_OUT"."Feature_18" * 0.4992859784606968 + "ADS_sca_1_OUT"."Feature_19" * -0.05341104577876922 + "ADS_sca_1_OUT"."Feature_20" * 0.004227623567498342 + "ADS_sca_1_OUT"."Feature_21" * -0.04884501480701089 + "ADS_sca_1_OUT"."Feature_22" * 0.01367243473013742 + "ADS_sca_1_OUT"."Feature_23" * -0.025887660162104482 + "ADS_sca_1_OUT"."Feature_24" * -0.3595690657677812 + "ADS_sca_1_OUT"."Feature_25" * 0.03179116825393049 + "ADS_sca_1_OUT"."Feature_26" * 0.02848854626295261 + "ADS_sca_1_OUT"."Feature_27" * -0.024367902666235317 + "ADS_sca_1_OUT"."Feature_28" * 0.5192968623188767 + "ADS_sca_1_OUT"."Feature_29" * -0.1046011433247024 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * -0.12457908312011272 + "ADS_sca_1_OUT"."Feature_1" * 0.043675631031051536 + "ADS_sca_1_OUT"."Feature_2" * -0.11727029149412173 + "ADS_sca_1_OUT"."Feature_3" * -0.0486941022474712 + "ADS_sca_1_OUT"."Feature_4" * -0.17248329424325504 + "ADS_sca_1_OUT"."Feature_5" * -0.01162088057329262 + "ADS_sca_1_OUT"."Feature_6" * -0.1260478446835378 + "ADS_sca_1_OUT"."Feature_7" * -0.19103591169799236 + "ADS_sca_1_OUT"."Feature_8" * -0.07463523147781233 + "ADS_sca_1_OUT"."Feature_9" * 0.25365336934237714 + "ADS_sca_1_OUT"."Feature_10" * 0.31534600516947087 + "ADS_sca_1_OUT"."Feature_11" * -0.20406041132463007 + "ADS_sca_1_OUT"."Feature_12" * 0.3129999653561438 + "ADS_sca_1_OUT"."Feature_13" * 0.36739957495731773 + "ADS_sca_1_OUT"."Feature_14" * -0.168697058125119 + "ADS_sca_1_OUT"."Feature_15" * 0.03886218090385512 + "ADS_sca_1_OUT"."Feature_16" * -0.17964511528914745 + "ADS_sca_1_OUT"."Feature_17" * -0.3603043202671293 + "ADS_sca_1_OUT"."Feature_18" * -0.04631020413416123 + "ADS_sca_1_OUT"."Feature_19" * 0.19111982295929997 + "ADS_sca_1_OUT"."Feature_20" * -0.0005144819631284318 + "ADS_sca_1_OUT"."Feature_21" * 0.030363622992810892 + "ADS_sca_1_OUT"."Feature_22" * 0.008358940593792955 + "ADS_sca_1_OUT"."Feature_23" * 0.0811779959920401 + "ADS_sca_1_OUT"."Feature_24" * -0.08858951896614652 + "ADS_sca_1_OUT"."Feature_25" * 0.13376257671354125 + "ADS_sca_1_OUT"."Feature_26" * -0.0655332998308909 + "ADS_sca_1_OUT"."Feature_27" * -0.1772937084691342 + "ADS_sca_1_OUT"."Feature_28" * 0.06513011232874036 + "ADS_sca_1_OUT"."Feature_29" * 0.369067836821968 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"IL" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CAST("ADS_pre_1_OUT"."PC1" AS FLOAT) AS "PC1", CAST("ADS_pre_1_OUT"."PC2" AS FLOAT) AS "PC2", CAST("ADS_pre_1_OUT"."PC3" AS FLOAT) AS "PC3", CAST("ADS_pre_1_OUT"."PC4" AS FLOAT) AS "PC4", CAST("ADS_pre_1_OUT"."PC5" AS FLOAT) AS "PC5", CAST("ADS_pre_1_OUT"."PC6" AS FLOAT) AS "PC6", CAST("ADS_pre_1_OUT"."PC7" AS FLOAT) AS "PC7" 
FROM "ADS_pre_1_OUT"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -1.083443 * "IL"."PC1" + 2.385921 * "IL"."PC2" + 0.6475425 * "IL"."PC3" + -0.7015752 * "IL"."PC4" + -2.975503 * "IL"."PC5" + 1.857975 * "IL"."PC6" + -2.552139 * "IL"."PC7" + -0.1065612 AS "NEUR_1_1", 3.034577 * "IL"."PC1" + -1.256317 * "IL"."PC2" + 3.619379 * "IL"."PC3" + 2.521396 * "IL"."PC4" + -1.146236 * "IL"."PC5" + -1.905922 * "IL"."PC6" + 2.907861 * "IL"."PC7" + 2.400727 AS "NEUR_1_2", 0.4700911 * "IL"."PC1" + -2.726871 * "IL"."PC2" + -2.227945 * "IL"."PC3" + -1.302462 * "IL"."PC4" + -0.9465342 * "IL"."PC5" + -1.521719 * "IL"."PC6" + 0.395228 * "IL"."PC7" + 0.7422929 AS "NEUR_1_3", -2.402428 * "IL"."PC1" + 2.189565 * "IL"."PC2" + -1.890896 * "IL"."PC3" + 1.243751 * "IL"."PC4" + -1.135595 * "IL"."PC5" + 0.3736103 * "IL"."PC6" + 2.28033 * "IL"."PC7" + -2.569413 AS "NEUR_1_4", 0.3067571 * "IL"."PC1" + 3.799644 * "IL"."PC2" + 0.4900807 * "IL"."PC3" + -0.03984529 * "IL"."PC4" + -1.393125 * "IL"."PC5" + -1.790446 * "IL"."PC6" + 0.1652169 * "IL"."PC7" + -2.528633 AS "NEUR_1_5", -2.86446 * "IL"."PC1" + -1.991071 * "IL"."PC2" + 4.075113 * "IL"."PC3" + 3.812179 * "IL"."PC4" + 1.88588 * "IL"."PC5" + 0.4457774 * "IL"."PC6" + 1.443404 * "IL"."PC7" + 2.570304 AS "NEUR_1_6", -0.6410708 * "IL"."PC1" + 1.08405 * "IL"."PC2" + -0.6139577 * "IL"."PC3" + -1.348643 * "IL"."PC4" + 1.863619 * "IL"."PC5" + -3.79948 * "IL"."PC6" + 1.099895 * "IL"."PC7" + 0.2524841 AS "NEUR_1_7", 2.825841 * "IL"."PC1" + -0.02453914 * "IL"."PC2" + 1.137998 * "IL"."PC3" + 1.503095 * "IL"."PC4" + -0.02633937 * "IL"."PC5" + -1.80945 * "IL"."PC6" + 3.911387 * "IL"."PC7" + 2.562592 AS "NEUR_1_8", -3.564071 * "IL"."PC1" + 3.121039 * "IL"."PC2" + -0.5839175 * "IL"."PC3" + -0.0579588 * "IL"."PC4" + 1.372507 * "IL"."PC5" + -0.2852742 * "IL"."PC6" + -0.6174742 * "IL"."PC7" + -0.5078329 AS "NEUR_1_9", -0.1052161 * "IL"."PC1" + -0.4878738 * "IL"."PC2" + 3.197191 * "IL"."PC3" + -0.6687152 * "IL"."PC4" + 0.3848127 * "IL"."PC5" + -0.998108 * "IL"."PC6" + -0.1773052 * "IL"."PC7" + 2.834269 AS "NEUR_1_10", -2.16329 * "IL"."PC1" + 3.547706 * "IL"."PC2" + 1.552519 * "IL"."PC3" + -1.238909 * "IL"."PC4" + 0.4832301 * "IL"."PC5" + -3.047929 * "IL"."PC6" + 1.794129 * "IL"."PC7" + -1.605222 AS "NEUR_1_11", 3.646113 * "IL"."PC1" + -1.480942 * "IL"."PC2" + 1.854157 * "IL"."PC3" + 2.158409 * "IL"."PC4" + -1.770367 * "IL"."PC5" + -1.05296 * "IL"."PC6" + 3.499874 * "IL"."PC7" + 4.680832 AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", 1.0 / (1.0 + exp(min(100.0, max(-100.0, -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", 4.501181 * "HL_1_logistic_1"."NEUR_1_1" + 8.071195 * "HL_1_logistic_1"."NEUR_1_2" + 4.176203 * "HL_1_logistic_1"."NEUR_1_3" + -5.339706 * "HL_1_logistic_1"."NEUR_1_4" + -5.10702 * "HL_1_logistic_1"."NEUR_1_5" + -14.10384 * "HL_1_logistic_1"."NEUR_1_6" + -6.478231 * "HL_1_logistic_1"."NEUR_1_7" + 5.960348 * "HL_1_logistic_1"."NEUR_1_8" + -4.254732 * "HL_1_logistic_1"."NEUR_1_9" + 4.314255 * "HL_1_logistic_1"."NEUR_1_10" + -8.1712 * "HL_1_logistic_1"."NEUR_1_11" + 8.155388 * "HL_1_logistic_1"."NEUR_1_12" + 0.7562315 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_softmax" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_softmax_1" AS 
(SELECT "OL_softmax"."KEY" AS "KEY", "OL_softmax"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_softmax"), 
orig_cte AS 
(SELECT "OL_softmax_1"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", CAST(NULL AS FLOAT) AS "Score_1", 1.0 - "OL_softmax_1"."NEUR_2_1" AS "Proba_0", "OL_softmax_1"."NEUR_2_1" AS "Proba_1", CAST(NULL AS FLOAT) AS "LogProba_0", CAST(NULL AS FLOAT) AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
FROM "OL_softmax_1"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte