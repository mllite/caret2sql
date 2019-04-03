-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_svmLinear_pca
-- Dataset : BreastCancer
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 14.07771208791209) / 3.5490515005403798 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 19.03905494505495) / 4.166878656652379 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 91.66178021978024) / 24.53094385251417 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 650.9676923076922) / 356.0943508808365 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE) - 0.09642184615384616) / 0.01421344742747642 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE) - 0.1044161318681319) / 0.053462476960143265 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE) - 0.08826232681318681) / 0.08200216346057157 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE) - 0.0485164) / 0.03941645600907594 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE) - 0.1815885714285714) / 0.02782064728498547 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE) - 0.0629403076923077) / 0.007027080900659396 AS "Feature_9", (CAST("ADS"."Feature_10" AS DOUBLE) - 0.4099173626373626) / 0.2915245412208004 AS "Feature_10", (CAST("ADS"."Feature_11" AS DOUBLE) - 1.217069450549451) / 0.5369800521839988 AS "Feature_11", (CAST("ADS"."Feature_12" AS DOUBLE) - 2.9052490109890114) / 2.144852707447646 AS "Feature_12", (CAST("ADS"."Feature_13" AS DOUBLE) - 40.87988571428571) / 48.2778362287006 AS "Feature_13", (CAST("ADS"."Feature_14" AS DOUBLE) - 0.0070559714285714295) / 0.002866803723188527 AS "Feature_14", (CAST("ADS"."Feature_15" AS DOUBLE) - 0.02556783076923077) / 0.01796676819246774 AS "Feature_15", (CAST("ADS"."Feature_16" AS DOUBLE) - 0.031999256263736266) / 0.03169979081746389 AS "Feature_16", (CAST("ADS"."Feature_17" AS DOUBLE) - 0.01197236923076923) / 0.006399041370931476 AS "Feature_17", (CAST("ADS"."Feature_18" AS DOUBLE) - 0.0208962) / 0.008592357424589265 AS "Feature_18", (CAST("ADS"."Feature_19" AS DOUBLE) - 0.003846551868131868) / 0.0027466275188339 AS "Feature_19", (CAST("ADS"."Feature_20" AS DOUBLE) - 16.17776483516484) / 4.822761469227882 AS "Feature_20", (CAST("ADS"."Feature_21" AS DOUBLE) - 25.26505494505495) / 5.929844025113361 AS "Feature_21", (CAST("ADS"."Feature_22" AS DOUBLE) - 106.68156043956041) / 33.740956745431944 AS "Feature_22", (CAST("ADS"."Feature_23" AS DOUBLE) - 870.863956043956) / 567.6191564029466 AS "Feature_23", (CAST("ADS"."Feature_24" AS DOUBLE) - 0.1318275604395604) / 0.02277324683369087 AS "Feature_24", (CAST("ADS"."Feature_25" AS DOUBLE) - 0.2499180659340659) / 0.1526367614098782 AS "Feature_25", (CAST("ADS"."Feature_26" AS DOUBLE) - 0.2654615934065934) / 0.2071534531545495 AS "Feature_26", (CAST("ADS"."Feature_27" AS DOUBLE) - 0.1134879802197802) / 0.06645447985497112 AS "Feature_27", (CAST("ADS"."Feature_28" AS DOUBLE) - 0.2897881318681318) / 0.06227317635385585 AS "Feature_28", (CAST("ADS"."Feature_29" AS DOUBLE) - 0.08364145054945055) / 0.01708392968253732 AS "Feature_29" 
FROM "BreastCancer" AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.21768343094223108 + "ADS_sca_1_OUT"."Feature_1" * -0.10393262184047268 + "ADS_sca_1_OUT"."Feature_2" * -0.2265164944329179 + "ADS_sca_1_OUT"."Feature_3" * -0.21993736711575185 + "ADS_sca_1_OUT"."Feature_4" * -0.14268833980412854 + "ADS_sca_1_OUT"."Feature_5" * -0.24024798670573505 + "ADS_sca_1_OUT"."Feature_6" * -0.257355901686626 + "ADS_sca_1_OUT"."Feature_7" * -0.2597680750587679 + "ADS_sca_1_OUT"."Feature_8" * -0.13868620385317515 + "ADS_sca_1_OUT"."Feature_9" * -0.06712190195264113 + "ADS_sca_1_OUT"."Feature_10" * -0.2069150720147228 + "ADS_sca_1_OUT"."Feature_11" * -0.03305717760079786 + "ADS_sca_1_OUT"."Feature_12" * -0.212828518237874 + "ADS_sca_1_OUT"."Feature_13" * -0.2013439160056293 + "ADS_sca_1_OUT"."Feature_14" * -0.02049865164066569 + "ADS_sca_1_OUT"."Feature_15" * -0.1750181653895911 + "ADS_sca_1_OUT"."Feature_16" * -0.1519078637342155 + "ADS_sca_1_OUT"."Feature_17" * -0.1865203607950731 + "ADS_sca_1_OUT"."Feature_18" * -0.053039357385151385 + "ADS_sca_1_OUT"."Feature_19" * -0.10231665221046024 + "ADS_sca_1_OUT"."Feature_20" * -0.226956028801125 + "ADS_sca_1_OUT"."Feature_21" * -0.10317017778958812 + "ADS_sca_1_OUT"."Feature_22" * -0.23602999862163965 + "ADS_sca_1_OUT"."Feature_23" * -0.2240006176535796 + "ADS_sca_1_OUT"."Feature_24" * -0.12717220549829955 + "ADS_sca_1_OUT"."Feature_25" * -0.21222759880468806 + "ADS_sca_1_OUT"."Feature_26" * -0.22758988828313426 + "ADS_sca_1_OUT"."Feature_27" * -0.2490125441701701 + "ADS_sca_1_OUT"."Feature_28" * -0.11944032522919835 + "ADS_sca_1_OUT"."Feature_29" * -0.13166419338876287 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.2388263496095884 + "ADS_sca_1_OUT"."Feature_1" * 0.05323416968015016 + "ADS_sca_1_OUT"."Feature_2" * 0.21941449489711815 + "ADS_sca_1_OUT"."Feature_3" * 0.2342171388843593 + "ADS_sca_1_OUT"."Feature_4" * -0.17925865624129375 + "ADS_sca_1_OUT"."Feature_5" * -0.14316495439683485 + "ADS_sca_1_OUT"."Feature_6" * -0.06042147680146465 + "ADS_sca_1_OUT"."Feature_7" * 0.03722975887665922 + "ADS_sca_1_OUT"."Feature_8" * -0.19462120663415455 + "ADS_sca_1_OUT"."Feature_9" * -0.3731777815015735 + "ADS_sca_1_OUT"."Feature_10" * 0.0948169433203506 + "ADS_sca_1_OUT"."Feature_11" * -0.10262087159564362 + "ADS_sca_1_OUT"."Feature_12" * 0.08014049234060505 + "ADS_sca_1_OUT"."Feature_13" * 0.14683589434398536 + "ADS_sca_1_OUT"."Feature_14" * -0.21665542062253368 + "ADS_sca_1_OUT"."Feature_15" * -0.22633882980546735 + "ADS_sca_1_OUT"."Feature_16" * -0.2013330897413932 + "ADS_sca_1_OUT"."Feature_17" * -0.13744139199061656 + "ADS_sca_1_OUT"."Feature_18" * -0.1851008068283944 + "ADS_sca_1_OUT"."Feature_19" * -0.2787797373414811 + "ADS_sca_1_OUT"."Feature_20" * 0.22285850281808672 + "ADS_sca_1_OUT"."Feature_21" * 0.04796372561185864 + "ADS_sca_1_OUT"."Feature_22" * 0.20144532663199727 + "ADS_sca_1_OUT"."Feature_23" * 0.22117900125773696 + "ADS_sca_1_OUT"."Feature_24" * -0.16388533650733236 + "ADS_sca_1_OUT"."Feature_25" * -0.12771851864859946 + "ADS_sca_1_OUT"."Feature_26" * -0.0920845205598406 + "ADS_sca_1_OUT"."Feature_27" * 0.01180363799025717 + "ADS_sca_1_OUT"."Feature_28" * -0.13218791158615573 + "ADS_sca_1_OUT"."Feature_29" * -0.272971048775739 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.005390218995132989 + "ADS_sca_1_OUT"."Feature_1" * 0.07559188324769446 + "ADS_sca_1_OUT"."Feature_2" * -0.006630034456413209 + "ADS_sca_1_OUT"."Feature_3" * 0.03307539547257528 + "ADS_sca_1_OUT"."Feature_4" * -0.11408606276317496 + "ADS_sca_1_OUT"."Feature_5" * -0.08243204451061603 + "ADS_sca_1_OUT"."Feature_6" * -0.0034631546527687713 + "ADS_sca_1_OUT"."Feature_7" * -0.025369092650600944 + "ADS_sca_1_OUT"."Feature_8" * -0.03545304892446201 + "ADS_sca_1_OUT"."Feature_9" * -0.033460358570260834 + "ADS_sca_1_OUT"."Feature_10" * 0.2702606607101766 + "ADS_sca_1_OUT"."Feature_11" * 0.38895800748244913 + "ADS_sca_1_OUT"."Feature_12" * 0.265539009843534 + "ADS_sca_1_OUT"."Feature_13" * 0.22087996051915645 + "ADS_sca_1_OUT"."Feature_14" * 0.30083207092269965 + "ADS_sca_1_OUT"."Feature_15" * 0.14870995945035803 + "ADS_sca_1_OUT"."Feature_16" * 0.15617929564803443 + "ADS_sca_1_OUT"."Feature_17" * 0.20527006718186183 + "ADS_sca_1_OUT"."Feature_18" * 0.2727509234513494 + "ADS_sca_1_OUT"."Feature_19" * 0.20491559570513843 + "ADS_sca_1_OUT"."Feature_20" * -0.04651017214243354 + "ADS_sca_1_OUT"."Feature_21" * -0.030620841495121995 + "ADS_sca_1_OUT"."Feature_22" * -0.04908306111118616 + "ADS_sca_1_OUT"."Feature_23" * -0.009372073109054205 + "ADS_sca_1_OUT"."Feature_24" * -0.2716162372345253 + "ADS_sca_1_OUT"."Feature_25" * -0.2404036986894661 + "ADS_sca_1_OUT"."Feature_26" * -0.17728088382408685 + "ADS_sca_1_OUT"."Feature_27" * -0.1759158149922438 + "ADS_sca_1_OUT"."Feature_28" * -0.2741603341993864 + "ADS_sca_1_OUT"."Feature_29" * -0.23752113369727115 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.032221335163821266 + "ADS_sca_1_OUT"."Feature_1" * -0.5981813597757002 + "ADS_sca_1_OUT"."Feature_2" * 0.03274684636104511 + "ADS_sca_1_OUT"."Feature_3" * 0.051633089886458795 + "ADS_sca_1_OUT"."Feature_4" * 0.1894886130432605 + "ADS_sca_1_OUT"."Feature_5" * 0.025213175765623888 + "ADS_sca_1_OUT"."Feature_6" * 0.020686309537882627 + "ADS_sca_1_OUT"."Feature_7" * 0.06556536720486286 + "ADS_sca_1_OUT"."Feature_8" * 0.07581347598658743 + "ADS_sca_1_OUT"."Feature_9" * 0.039784025514564836 + "ADS_sca_1_OUT"."Feature_10" * 0.12103267182656124 + "ADS_sca_1_OUT"."Feature_11" * -0.3253456701348236 + "ADS_sca_1_OUT"."Feature_12" * 0.10403160451161235 + "ADS_sca_1_OUT"."Feature_13" * 0.13096113686887037 + "ADS_sca_1_OUT"."Feature_14" * 0.08529767241873171 + "ADS_sca_1_OUT"."Feature_15" * -0.05050256477826615 + "ADS_sca_1_OUT"."Feature_16" * -0.013858636956129685 + "ADS_sca_1_OUT"."Feature_17" * 0.051636470783270175 + "ADS_sca_1_OUT"."Feature_18" * 0.07845623611137836 + "ADS_sca_1_OUT"."Feature_19" * -0.01800224834117843 + "ADS_sca_1_OUT"."Feature_20" * 0.01340810356608377 + "ADS_sca_1_OUT"."Feature_21" * -0.6255117301896479 + "ADS_sca_1_OUT"."Feature_22" * 0.008890529878086695 + "ADS_sca_1_OUT"."Feature_23" * 0.03206575052269575 + "ADS_sca_1_OUT"."Feature_24" * 0.06218614198553856 + "ADS_sca_1_OUT"."Feature_25" * -0.10208562087194813 + "ADS_sca_1_OUT"."Feature_26" * -0.07404407884842225 + "ADS_sca_1_OUT"."Feature_27" * -0.001759497416926437 + "ADS_sca_1_OUT"."Feature_28" * -0.020695280701914644 + "ADS_sca_1_OUT"."Feature_29" * -0.09172275305484348 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * -0.03583586526438166 + "ADS_sca_1_OUT"."Feature_1" * 0.10668556494546105 + "ADS_sca_1_OUT"."Feature_2" * -0.03580063384563657 + "ADS_sca_1_OUT"."Feature_3" * -0.01186523434650828 + "ADS_sca_1_OUT"."Feature_4" * 0.3472926626357166 + "ADS_sca_1_OUT"."Feature_5" * -0.01279638595762936 + "ADS_sca_1_OUT"."Feature_6" * -0.09686339610083955 + "ADS_sca_1_OUT"."Feature_7" * 0.030262925273250155 + "ADS_sca_1_OUT"."Feature_8" * 0.2919734843378978 + "ADS_sca_1_OUT"."Feature_9" * 0.024129207305013743 + "ADS_sca_1_OUT"."Feature_10" * 0.13199923484872902 + "ADS_sca_1_OUT"."Feature_11" * 0.21157425482633896 + "ADS_sca_1_OUT"."Feature_12" * 0.10248820501553313 + "ADS_sca_1_OUT"."Feature_13" * 0.10874553311679416 + "ADS_sca_1_OUT"."Feature_14" * 0.2544812741423084 + "ADS_sca_1_OUT"."Feature_15" * -0.2746684061050128 + "ADS_sca_1_OUT"."Feature_16" * -0.3540979971305165 + "ADS_sca_1_OUT"."Feature_17" * -0.19847452634975313 + "ADS_sca_1_OUT"."Feature_18" * 0.24138551945384004 + "ADS_sca_1_OUT"."Feature_19" * -0.27461076869519324 + "ADS_sca_1_OUT"."Feature_20" * 0.00438970711748895 + "ADS_sca_1_OUT"."Feature_21" * 0.15304890309187444 + "ADS_sca_1_OUT"."Feature_22" * -0.0062975700081063036 + "ADS_sca_1_OUT"."Feature_23" * 0.02449023484088534 + "ADS_sca_1_OUT"."Feature_24" * 0.3212354882834555 + "ADS_sca_1_OUT"."Feature_25" * -0.10048955127484832 + "ADS_sca_1_OUT"."Feature_26" * -0.18301792369043487 + "ADS_sca_1_OUT"."Feature_27" * -0.04092825303637145 + "ADS_sca_1_OUT"."Feature_28" * 0.25478475230789854 + "ADS_sca_1_OUT"."Feature_29" * -0.09149620178238 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.02578277051115795 + "ADS_sca_1_OUT"."Feature_1" * -0.03488683150504261 + "ADS_sca_1_OUT"."Feature_2" * 0.02337879624440808 + "ADS_sca_1_OUT"."Feature_3" * 5.311632734197533e-05 + "ADS_sca_1_OUT"."Feature_4" * -0.2831599190004263 + "ADS_sca_1_OUT"."Feature_5" * -0.0182359166955445 + "ADS_sca_1_OUT"."Feature_6" * -0.00606493341165939 + "ADS_sca_1_OUT"."Feature_7" * -0.04670696605311275 + "ADS_sca_1_OUT"."Feature_8" * 0.3517020411433183 + "ADS_sca_1_OUT"."Feature_9" * -0.1269409741371922 + "ADS_sca_1_OUT"."Feature_10" * -0.044449703384920235 + "ADS_sca_1_OUT"."Feature_11" * -0.05130045078703252 + "ADS_sca_1_OUT"."Feature_12" * -0.015070584315048681 + "ADS_sca_1_OUT"."Feature_13" * -0.06214481224260445 + "ADS_sca_1_OUT"."Feature_14" * -0.300750288327894 + "ADS_sca_1_OUT"."Feature_15" * 0.05383577001601851 + "ADS_sca_1_OUT"."Feature_16" * 0.07247828206101359 + "ADS_sca_1_OUT"."Feature_17" * -0.0041762502813039925 + "ADS_sca_1_OUT"."Feature_18" * 0.4992859784606968 + "ADS_sca_1_OUT"."Feature_19" * -0.05341104577876922 + "ADS_sca_1_OUT"."Feature_20" * 0.004227623567498342 + "ADS_sca_1_OUT"."Feature_21" * -0.04884501480701089 + "ADS_sca_1_OUT"."Feature_22" * 0.01367243473013742 + "ADS_sca_1_OUT"."Feature_23" * -0.025887660162104482 + "ADS_sca_1_OUT"."Feature_24" * -0.3595690657677812 + "ADS_sca_1_OUT"."Feature_25" * 0.03179116825393049 + "ADS_sca_1_OUT"."Feature_26" * 0.02848854626295261 + "ADS_sca_1_OUT"."Feature_27" * -0.024367902666235317 + "ADS_sca_1_OUT"."Feature_28" * 0.5192968623188767 + "ADS_sca_1_OUT"."Feature_29" * -0.1046011433247024 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * -0.12457908312011272 + "ADS_sca_1_OUT"."Feature_1" * 0.043675631031051536 + "ADS_sca_1_OUT"."Feature_2" * -0.11727029149412173 + "ADS_sca_1_OUT"."Feature_3" * -0.0486941022474712 + "ADS_sca_1_OUT"."Feature_4" * -0.17248329424325504 + "ADS_sca_1_OUT"."Feature_5" * -0.01162088057329262 + "ADS_sca_1_OUT"."Feature_6" * -0.1260478446835378 + "ADS_sca_1_OUT"."Feature_7" * -0.19103591169799236 + "ADS_sca_1_OUT"."Feature_8" * -0.07463523147781233 + "ADS_sca_1_OUT"."Feature_9" * 0.25365336934237714 + "ADS_sca_1_OUT"."Feature_10" * 0.31534600516947087 + "ADS_sca_1_OUT"."Feature_11" * -0.20406041132463007 + "ADS_sca_1_OUT"."Feature_12" * 0.3129999653561438 + "ADS_sca_1_OUT"."Feature_13" * 0.36739957495731773 + "ADS_sca_1_OUT"."Feature_14" * -0.168697058125119 + "ADS_sca_1_OUT"."Feature_15" * 0.03886218090385512 + "ADS_sca_1_OUT"."Feature_16" * -0.17964511528914745 + "ADS_sca_1_OUT"."Feature_17" * -0.3603043202671293 + "ADS_sca_1_OUT"."Feature_18" * -0.04631020413416123 + "ADS_sca_1_OUT"."Feature_19" * 0.19111982295929997 + "ADS_sca_1_OUT"."Feature_20" * -0.0005144819631284318 + "ADS_sca_1_OUT"."Feature_21" * 0.030363622992810892 + "ADS_sca_1_OUT"."Feature_22" * 0.008358940593792955 + "ADS_sca_1_OUT"."Feature_23" * 0.0811779959920401 + "ADS_sca_1_OUT"."Feature_24" * -0.08858951896614652 + "ADS_sca_1_OUT"."Feature_25" * 0.13376257671354125 + "ADS_sca_1_OUT"."Feature_26" * -0.0655332998308909 + "ADS_sca_1_OUT"."Feature_27" * -0.1772937084691342 + "ADS_sca_1_OUT"."Feature_28" * 0.06513011232874036 + "ADS_sca_1_OUT"."Feature_29" * 0.369067836821968 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
kernel_input_with_scaling AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", (CAST("ADS_pre_1_OUT"."PC1" AS DOUBLE) - 8.704880528242299e-17) / 3.6571335993045286 AS "PC1", (CAST("ADS_pre_1_OUT"."PC2" AS DOUBLE) - -3.2818680618040336e-17) / 2.3591365793397814 AS "PC2", (CAST("ADS_pre_1_OUT"."PC3" AS DOUBLE) - -3.06348353278436e-16) / 1.686675375547316 AS "PC3", (CAST("ADS_pre_1_OUT"."PC4" AS DOUBLE) - 3.114495840715283e-16) / 1.4054243811611793 AS "PC4", (CAST("ADS_pre_1_OUT"."PC5" AS DOUBLE) - 2.5424564773404244e-16) / 1.3188140320957162 AS "PC5", (CAST("ADS_pre_1_OUT"."PC6" AS DOUBLE) - -8.041491770396223e-17) / 1.0859571430268642 AS "PC6", (CAST("ADS_pre_1_OUT"."PC7" AS DOUBLE) - -1.425752068299531e-16) / 0.8079076178617359 AS "PC7" 
FROM "ADS_pre_1_OUT"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6 
FROM (SELECT 0 AS sv_idx, 0.4895417485626831 AS dual_coeff, 0.3808977603836143 AS sv_0, -0.1219769770338502 AS sv_1, 0.3248266407187077 AS sv_2, 0.3287523840650991 AS sv_3, 1.9795502625127273 AS sv_4, 1.358451581540342 AS sv_5, -0.9094144876719203 AS sv_6 UNION ALL SELECT 1 AS sv_idx, 0.32034642310057265 AS dual_coeff, 0.042068435279101785 AS sv_0, -0.4350861375751444 AS sv_1, -0.4605833035076733 AS sv_2, 0.40092383805284537 AS sv_3, 0.5461023111264293 AS sv_4, -1.2511765585010695 AS sv_5, 0.5779356644223648 AS sv_6 UNION ALL SELECT 2 AS sv_idx, -1.0 AS dual_coeff, -0.37439190992788735 AS sv_0, -0.869293840078185 AS sv_1, -1.143419347660787 AS sv_2, -0.1203788869785164 AS sv_3, -0.12637747055167678 AS sv_4, 0.478427187818223 AS sv_5, -0.00911858665505399 AS sv_6 UNION ALL SELECT 3 AS sv_idx, 1.0 AS dual_coeff, 0.01998966669888145 AS sv_0, 0.0995139246516208 AS sv_1, -1.036377619840809 AS sv_2, 0.9523127534773896 AS sv_3, -0.41415130255699195 AS sv_4, 0.7257117132318291 AS sv_5, -0.2754998933634482 AS sv_6 UNION ALL SELECT 4 AS sv_idx, -1.0 AS dual_coeff, 0.2198768759398512 AS sv_0, 1.4903960183101077 AS sv_1, 0.1747915341946119 AS sv_2, -0.9626714542155204 AS sv_3, 0.20641727809462945 AS sv_4, -0.3865871121719849 AS sv_5, -0.3161431965629477 AS sv_6 UNION ALL SELECT 5 AS sv_idx, -1.0 AS dual_coeff, 0.06863450692008881 AS sv_0, 0.10747027904244913 AS sv_1, -1.9646844773125527 AS sv_2, -0.833899672754239 AS sv_3, 0.09962708716100196 AS sv_4, 0.08624136364354006 AS sv_5, 0.4516196609625223 AS sv_6 UNION ALL SELECT 6 AS sv_idx, 1.0 AS dual_coeff, 0.3087466518809184 AS sv_0, 0.8653956129555231 AS sv_1, -0.7317538787790797 AS sv_2, 0.9582009660347952 AS sv_3, -0.4638171264427085 AS sv_4, 0.3103018635026118 AS sv_5, -0.6951945627741181 AS sv_6 UNION ALL SELECT 7 AS sv_idx, 1.0 AS dual_coeff, 0.4158408189748293 AS sv_0, 0.4773815601474736 AS sv_1, -0.7686586790384664 AS sv_2, 0.3874188986307853 AS sv_3, 0.25179371342062845 AS sv_4, 1.4315461504390175 AS sv_5, -0.10677616130114415 AS sv_6 UNION ALL SELECT 8 AS sv_idx, 1.0 AS dual_coeff, 0.413482935024424 AS sv_0, 0.5325827703095835 AS sv_1, -0.18013380935112253 AS sv_2, -1.1638141789704812 AS sv_3, -0.005385476368528124 AS sv_4, 0.4967566532175814 AS sv_5, -0.8571320981599679 AS sv_6 UNION ALL SELECT 9 AS sv_idx, -1.0 AS dual_coeff, 0.2768342488876477 AS sv_0, 1.3470197619526831 AS sv_1, 2.5810871292205326 AS sv_2, -0.4343009178917236 AS sv_3, 0.3382168948054317 AS sv_4, -1.4823006582785327 AS sv_5, 1.0438835849649288 AS sv_6 UNION ALL SELECT 10 AS sv_idx, 1.0 AS dual_coeff, -0.3890941618211083 AS sv_0, -0.5254088485221454 AS sv_1, 0.2767921097511413 AS sv_2, 1.283630984164636 AS sv_3, -0.09297344401331326 AS sv_4, -0.4590918347354506 AS sv_5, -1.6904035480289936 AS sv_6 UNION ALL SELECT 11 AS sv_idx, 1.0 AS dual_coeff, 0.19564753029988333 AS sv_0, 1.30099995876813 AS sv_1, 0.919386074149533 AS sv_2, -0.81857811680126 AS sv_3, -0.6084714944516146 AS sv_4, 1.1183668292022466 AS sv_5, -0.5431860022029356 AS sv_6 UNION ALL SELECT 12 AS sv_idx, 0.5874343736480301 AS dual_coeff, 0.2273470811030777 AS sv_0, 0.5427343399424 AS sv_1, 0.1264606224989267 AS sv_2, 1.6805322646122227 AS sv_3, 0.59338658976747 AS sv_4, 0.8645413327905282 AS sv_5, -0.8792834323926214 AS sv_6 UNION ALL SELECT 13 AS sv_idx, 1.0 AS dual_coeff, -0.5514352083713154 AS sv_0, -0.9732068916216648 AS sv_1, 0.6048623440177722 AS sv_2, 1.209026400922539 AS sv_3, -0.25841243928165886 AS sv_4, 0.04533113464234969 AS sv_5, 0.24867887349707066 AS sv_6 UNION ALL SELECT 14 AS sv_idx, -1.0 AS dual_coeff, 0.13684627191903334 AS sv_0, 0.5586131177951265 AS sv_1, 0.6062178077971809 AS sv_2, -1.1229161753422132 AS sv_3, 0.004115750293561029 AS sv_4, -0.5555519130596924 AS sv_5, -1.4992596631254491 AS sv_6 UNION ALL SELECT 15 AS sv_idx, 1.0 AS dual_coeff, 0.20182325482052746 AS sv_0, 0.9130893877725844 AS sv_1, 0.21555233533018242 AS sv_2, 0.024439683220315832 AS sv_3, 0.09762640451975436 AS sv_4, -0.7965765585686286 AS sv_5, -1.2416197285222335 AS sv_6 UNION ALL SELECT 16 AS sv_idx, -1.0 AS dual_coeff, 0.17654750313161618 AS sv_0, 0.9205571964216834 AS sv_1, -0.8009953501332252 AS sv_2, -0.8523501930121375 AS sv_3, -0.07877901813313945 AS sv_4, -0.593170308763841 AS sv_5, -0.19290817110081745 AS sv_6 UNION ALL SELECT 17 AS sv_idx, -1.0 AS dual_coeff, 0.6379535450413997 AS sv_0, 0.3201914332404364 AS sv_1, 1.1898733767741245 AS sv_2, 0.01906936231074719 AS sv_3, 0.3255051610532279 AS sv_4, -0.9947902126976018 AS sv_5, 0.16175249765505129 AS sv_6 UNION ALL SELECT 18 AS sv_idx, 0.3770686777748509 AS dual_coeff, 0.1308968800247428 AS sv_0, 0.43959999443494746 AS sv_1, -0.2152187096519731 AS sv_2, -0.5641790872433311 AS sv_3, -1.0230920277797817 AS sv_4, -0.08710569833784165 AS sv_5, 0.19870415853902856 AS sv_6 UNION ALL SELECT 19 AS sv_idx, -1.0 AS dual_coeff, -0.6725810692248985 AS sv_0, -1.9853369429052592 AS sv_1, -0.7827372760399915 AS sv_2, 0.27654078929492965 AS sv_3, 1.6985148444524787 AS sv_4, 4.668480528220858 AS sv_5, -0.5214375164670557 AS sv_6 UNION ALL SELECT 20 AS sv_idx, 1.0 AS dual_coeff, -0.08644603935783278 AS sv_0, -0.060013070930214366 AS sv_1, -0.7124105658126536 AS sv_2, 0.5526262281102156 AS sv_3, -0.6274882556763677 AS sv_4, 0.5031790452274313 AS sv_5, 0.16459903058674114 AS sv_6 UNION ALL SELECT 21 AS sv_idx, 1.0 AS dual_coeff, -0.056796938804398074 AS sv_0, 0.21194678802771366 AS sv_1, -0.2827085922305112 AS sv_2, -1.21632123751218 AS sv_3, -0.5337872751534919 AS sv_4, 1.0750651103623354 AS sv_5, 0.2697677977753574 AS sv_6 UNION ALL SELECT 22 AS sv_idx, -0.07632124826023809 AS dual_coeff, -0.4900068294910592 AS sv_0, 0.15924503811024054 AS sv_1, -1.0963748927942747 AS sv_2, 0.6030741850433977 AS sv_3, -0.9400878574238658 AS sv_4, -0.11026842499105753 AS sv_5, -0.6511798761790775 AS sv_6 UNION ALL SELECT 23 AS sv_idx, -0.38350648510668733 AS dual_coeff, 0.1963783449280456 AS sv_0, 1.0879244779400656 AS sv_1, -1.1525818051065426 AS sv_2, -0.4643214273707413 AS sv_3, -0.14025117462393555 AS sv_4, 2.9553201548752153 AS sv_5, 0.7044663642714833 AS sv_6 UNION ALL SELECT 24 AS sv_idx, 1.0 AS dual_coeff, -0.29412695607151074 AS sv_0, -0.42890686140421214 AS sv_1, -0.42648976626377166 AS sv_2, -1.4308858465020196 AS sv_3, -0.6304843467441428 AS sv_4, 0.32681401635722634 AS sv_5, 0.7156177007041943 AS sv_6 UNION ALL SELECT 25 AS sv_idx, -1.0 AS dual_coeff, 0.21094112877908094 AS sv_0, 1.1392695244356097 AS sv_1, -0.24507640308317524 AS sv_2, -1.3285002898079694 AS sv_3, -0.07921068239675726 AS sv_4, 0.08003286308088611 AS sv_5, 0.8185267821362655 AS sv_6 UNION ALL SELECT 26 AS sv_idx, -1.0 AS dual_coeff, -0.17986591832101131 AS sv_0, -0.06545877319373963 AS sv_1, 0.9559863327458856 AS sv_2, -0.8031662737736579 AS sv_3, 0.52282079626935 AS sv_4, 0.5253189296857064 AS sv_5, -2.080095472043933 AS sv_6 UNION ALL SELECT 27 AS sv_idx, -1.0 AS dual_coeff, -0.21990751150946136 AS sv_0, -0.3313881078936636 AS sv_1, -1.672952216257452 AS sv_2, -0.33101010174900003 AS sv_3, -0.57089283514789 AS sv_4, -0.964428250501744 AS sv_5, -0.1560853031938695 AS sv_6 UNION ALL SELECT 28 AS sv_idx, 1.0 AS dual_coeff, 0.4816493466746479 AS sv_0, 0.6590758948345599 AS sv_1, 0.569826174983434 AS sv_2, -2.9158360677924153 AS sv_3, 0.468005055268756 AS sv_4, -1.1729824144672159 AS sv_5, 0.20540312832479865 AS sv_6 UNION ALL SELECT 29 AS sv_idx, 1.0 AS dual_coeff, 0.22377951472743884 AS sv_0, 0.006775392223259951 AS sv_1, -1.6887842461020113 AS sv_2, 0.08583916169607135 AS sv_3, 0.4758662452435449 AS sv_4, -0.32345967820671706 AS sv_5, 0.0649174736076755 AS sv_6 UNION ALL SELECT 30 AS sv_idx, -1.0 AS dual_coeff, -0.8830073127998438 AS sv_0, -1.6708590898403557 AS sv_1, -1.786182461927593 AS sv_2, 0.8870535703066466 AS sv_3, 0.0282796793892225 AS sv_4, -2.077856296338806 AS sv_5, 0.4516176615158336 AS sv_6 UNION ALL SELECT 31 AS sv_idx, 1.0 AS dual_coeff, 0.11282214484555934 AS sv_0, 0.08268868971409343 AS sv_1, 0.6009638780302171 AS sv_2, -1.564633119807378 AS sv_3, -0.07704226137024085 AS sv_4, -0.9488965242440583 AS sv_5, -0.1609474968758314 AS sv_6 UNION ALL SELECT 32 AS sv_idx, 1.0 AS dual_coeff, 0.12445669454290273 AS sv_0, -0.012977110194606284 AS sv_1, -0.6215606169657172 AS sv_2, -0.29544813512603507 AS sv_3, -0.06119766269486119 AS sv_4, -0.6712649704515071 AS sv_5, -1.486029185086761 AS sv_6 UNION ALL SELECT 33 AS sv_idx, -1.0 AS dual_coeff, 0.5109679840964495 AS sv_0, 1.3484527722632793 AS sv_1, -0.5579298934079119 AS sv_2, -0.9112064486946864 AS sv_3, -0.6228426357695528 AS sv_4, 0.2906538444375012 AS sv_5, 0.006224796607678658 AS sv_6 UNION ALL SELECT 34 AS sv_idx, 1.0 AS dual_coeff, 0.10401091136225817 AS sv_0, 0.3698915111524516 AS sv_1, -0.6544504625858196 AS sv_2, -0.18029122654940716 AS sv_3, -0.16825499126226628 AS sv_4, 0.21416570359967874 AS sv_5, -0.26219485173014256 AS sv_6 UNION ALL SELECT 35 AS sv_idx, -1.0 AS dual_coeff, -0.7216930826405907 AS sv_0, -0.6168628939186149 AS sv_1, -0.24110684136147206 AS sv_2, -0.5051210133811561 AS sv_3, -0.7609874890361517 AS sv_4, 0.0055047456839214005 AS sv_5, -1.0284700576118337 AS sv_6 UNION ALL SELECT 36 AS sv_idx, 1.0 AS dual_coeff, -0.12327362231017233 AS sv_0, -1.4967105233288058 AS sv_1, 0.0005262524231174072 AS sv_2, -1.0871440017865823 AS sv_3, 1.6326546486483695 AS sv_4, -2.177990668768637 AS sv_5, -0.7084855665346976 AS sv_6 UNION ALL SELECT 37 AS sv_idx, 1.0 AS dual_coeff, -0.10675943307080506 AS sv_0, -0.8340573152423357 AS sv_1, -1.2962740961011614 AS sv_2, -0.8807408789182389 AS sv_3, 0.23063032945958545 AS sv_4, 1.0242856657602286 AS sv_5, 1.2523941251962447 AS sv_6 UNION ALL SELECT 38 AS sv_idx, 1.0 AS dual_coeff, 0.16140856193442227 AS sv_0, 0.4779404853646083 AS sv_1, 0.7913544221083287 AS sv_2, -2.93475948947975 AS sv_3, -0.7644953471460612 AS sv_4, -1.2755385158333505 AS sv_5, -0.3062366929812602 AS sv_6 UNION ALL SELECT 39 AS sv_idx, -1.0 AS dual_coeff, -0.07643431292769788 AS sv_0, 0.24069235215703805 AS sv_1, 0.3117202294169115 AS sv_2, -0.15463754536400906 AS sv_3, -0.25091267027124003 AS sv_4, -0.10286013041421818 AS sv_5, -1.94641128876297 AS sv_6 UNION ALL SELECT 40 AS sv_idx, -1.0 AS dual_coeff, -0.13090837861809776 AS sv_0, -0.1304730132021902 AS sv_1, -0.6636207408972019 AS sv_2, 0.7377922145279717 AS sv_3, 0.24737712135722906 AS sv_4, -0.07615047486936799 AS sv_5, -0.6234539656486778 AS sv_6 UNION ALL SELECT 41 AS sv_idx, -1.0 AS dual_coeff, -0.5843162310412913 AS sv_0, -0.4566051808706473 AS sv_1, 0.9523005975768578 AS sv_2, 0.21741692709657945 AS sv_3, 0.6976826735613527 AS sv_4, 0.0374533987763264 AS sv_5, -1.0218321366751064 AS sv_6 UNION ALL SELECT 42 AS sv_idx, -0.3586892449914601 AS dual_coeff, -0.4615814889154256 AS sv_0, 0.666406511212673 AS sv_1, 0.013018517595469984 AS sv_2, 1.2639165989289836 AS sv_3, -0.5608757959664471 AS sv_4, 0.018117877097489254 AS sv_5, 0.13213754658634844 AS sv_6 UNION ALL SELECT 43 AS sv_idx, -0.9558742447277516 AS dual_coeff, 0.16007796742492414 AS sv_0, 0.4223119734238546 AS sv_1, -1.2399945176376002 AS sv_2, -1.6130388228573318 AS sv_3, 0.4973315667908851 AS sv_4, 0.12819400072904538 AS sv_5, 0.11819788059681352 AS sv_6 UNION ALL SELECT 44 AS sv_idx, -1.0 AS dual_coeff, -0.19409909286610927 AS sv_0, -0.14556118183970915 AS sv_1, -1.6244186785003956 AS sv_2, -0.6138950148069894 AS sv_3, 0.08478804417452283 AS sv_4, -1.0095686023859467 AS sv_5, -0.012405318384189195 AS sv_6 UNION ALL SELECT 45 AS sv_idx, -1.0 AS dual_coeff, -0.3452101242598257 AS sv_0, 1.0426060263517811 AS sv_1, 1.4327972961576751 AS sv_2, -0.2956848897761945 AS sv_3, -1.60838847929643 AS sv_4, 1.0673710551797964 AS sv_5, -0.015445778900834756 AS sv_6) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + 0.69087893136574 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * (kernel_input_with_scaling."PC1" * "SV_data".sv_0 + kernel_input_with_scaling."PC2" * "SV_data".sv_1 + kernel_input_with_scaling."PC3" * "SV_data".sv_2 + kernel_input_with_scaling."PC4" * "SV_data".sv_3 + kernel_input_with_scaling."PC5" * "SV_data".sv_4 + kernel_input_with_scaling."PC6" * "SV_data".sv_5 + kernel_input_with_scaling."PC7" * "SV_data".sv_6) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", -kernel_dp.dot_product AS "Score_0", kernel_dp.dot_product AS "Score_1", CAST(NULL AS DOUBLE) AS "Proba_0", CAST(NULL AS DOUBLE) AS "Proba_1", CAST(NULL AS DOUBLE) AS "LogProba_0", CAST(NULL AS DOUBLE) AS "LogProba_1", CASE WHEN (kernel_dp.dot_product > 0.0) THEN 1 ELSE 0 END AS "Decision", CAST(NULL AS DOUBLE) AS "DecisionProba" 
FROM kernel_dp