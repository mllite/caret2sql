-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmPoly_pca
-- Dataset : freidman1
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 0.5629846484809589) / 0.2600015884118536 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 0.4560644242337592) / 0.2896884193099619 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 0.4711381748147476) / 0.3128833495879441 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 0.5339680200945178) / 0.2844030958277151 AS "Feature_3", (CAST("ADS"."Feature_4" AS FLOAT) - 0.478093626237387) / 0.2879458120111227 AS "Feature_4", (CAST("ADS"."Feature_5" AS FLOAT) - 0.5682849224172328) / 0.2995521696075025 AS "Feature_5", (CAST("ADS"."Feature_6" AS FLOAT) - 0.4791437471428049) / 0.2752572650336402 AS "Feature_6", (CAST("ADS"."Feature_7" AS FLOAT) - 0.4594152477223208) / 0.2890235713417702 AS "Feature_7", (CAST("ADS"."Feature_8" AS FLOAT) - 0.4901106996809652) / 0.2808092486405501 AS "Feature_8", (CAST("ADS"."Feature_9" AS FLOAT) - 0.5378806933707535) / 0.297685615548656 AS "Feature_9" 
FROM freidman1 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.01078044206398687 + "ADS_sca_1_OUT"."Feature_1" * 0.20275672425035265 + "ADS_sca_1_OUT"."Feature_2" * -0.3032095959115069 + "ADS_sca_1_OUT"."Feature_3" * 0.28036946451509137 + "ADS_sca_1_OUT"."Feature_4" * -0.456472170133784 + "ADS_sca_1_OUT"."Feature_5" * 0.36405052299186 + "ADS_sca_1_OUT"."Feature_6" * -0.4779398415021841 + "ADS_sca_1_OUT"."Feature_7" * -0.2499537237134235 + "ADS_sca_1_OUT"."Feature_8" * -0.08553249751289721 + "ADS_sca_1_OUT"."Feature_9" * -0.38614972165398104 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * -0.2486501060343723 + "ADS_sca_1_OUT"."Feature_1" * 0.18538688464371286 + "ADS_sca_1_OUT"."Feature_2" * -0.2340911061275425 + "ADS_sca_1_OUT"."Feature_3" * -0.5312215967757172 + "ADS_sca_1_OUT"."Feature_4" * -0.034157117099708666 + "ADS_sca_1_OUT"."Feature_5" * -0.11403009160110295 + "ADS_sca_1_OUT"."Feature_6" * 0.03913846092020175 + "ADS_sca_1_OUT"."Feature_7" * -0.3193281863661248 + "ADS_sca_1_OUT"."Feature_8" * 0.6497321497824414 + "ADS_sca_1_OUT"."Feature_9" * -0.16427431415508242 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.529444486853135 + "ADS_sca_1_OUT"."Feature_1" * -0.042432305775754416 + "ADS_sca_1_OUT"."Feature_2" * -0.467456082445249 + "ADS_sca_1_OUT"."Feature_3" * -0.12113349070226218 + "ADS_sca_1_OUT"."Feature_4" * 0.3516615435966041 + "ADS_sca_1_OUT"."Feature_5" * 0.05456396920784263 + "ADS_sca_1_OUT"."Feature_6" * -0.0169721401066592 + "ADS_sca_1_OUT"."Feature_7" * 0.44796273797836184 + "ADS_sca_1_OUT"."Feature_8" * 0.09951231655089274 + "ADS_sca_1_OUT"."Feature_9" * -0.3836601176822301 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.18967062357660877 + "ADS_sca_1_OUT"."Feature_1" * -0.6739997429415825 + "ADS_sca_1_OUT"."Feature_2" * -0.05142756480300252 + "ADS_sca_1_OUT"."Feature_3" * -0.4240887569157897 + "ADS_sca_1_OUT"."Feature_4" * -0.1753617554170441 + "ADS_sca_1_OUT"."Feature_5" * -0.23730999119190946 + "ADS_sca_1_OUT"."Feature_6" * -0.3492917073303225 + "ADS_sca_1_OUT"."Feature_7" * -0.24015917199949824 + "ADS_sca_1_OUT"."Feature_8" * -0.24578721855897134 + "ADS_sca_1_OUT"."Feature_9" * 0.009647497508173676 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * 0.22360120393586685 + "ADS_sca_1_OUT"."Feature_1" * -0.27882706563202 + "ADS_sca_1_OUT"."Feature_2" * 0.3325159145316829 + "ADS_sca_1_OUT"."Feature_3" * 0.03231293124673378 + "ADS_sca_1_OUT"."Feature_4" * 0.31176328828301664 + "ADS_sca_1_OUT"."Feature_5" * 0.5846343873278481 + "ADS_sca_1_OUT"."Feature_6" * 0.2256344434749018 + "ADS_sca_1_OUT"."Feature_7" * -0.4544239404125063 + "ADS_sca_1_OUT"."Feature_8" * 0.13999262235747426 + "ADS_sca_1_OUT"."Feature_9" * -0.21128970950531886 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.3346351973554642 + "ADS_sca_1_OUT"."Feature_1" * 0.0673786411182812 + "ADS_sca_1_OUT"."Feature_2" * 0.2578168786971707 + "ADS_sca_1_OUT"."Feature_3" * 0.1264276445937259 + "ADS_sca_1_OUT"."Feature_4" * -0.40729831882959366 + "ADS_sca_1_OUT"."Feature_5" * -0.455689833219327 + "ADS_sca_1_OUT"."Feature_6" * 0.4311593109248494 + "ADS_sca_1_OUT"."Feature_7" * -0.10623939522740035 + "ADS_sca_1_OUT"."Feature_8" * 0.004192902519120928 + "ADS_sca_1_OUT"."Feature_9" * -0.4798729265184412 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.5345631681819778 + "ADS_sca_1_OUT"."Feature_1" * 0.2916209104051029 + "ADS_sca_1_OUT"."Feature_2" * 0.4273963159452305 + "ADS_sca_1_OUT"."Feature_3" * -0.2195301363042834 + "ADS_sca_1_OUT"."Feature_4" * -0.235065733216965 + "ADS_sca_1_OUT"."Feature_5" * 0.1295961010443568 + "ADS_sca_1_OUT"."Feature_6" * -0.3373404838354823 + "ADS_sca_1_OUT"."Feature_7" * 0.1550843553371763 + "ADS_sca_1_OUT"."Feature_8" * 0.2854751024551945 + "ADS_sca_1_OUT"."Feature_9" * 0.3270191591377724 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
kernel_input_with_scaling AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", (CAST("ADS_pre_1_OUT"."PC1" AS FLOAT) - 3.2439329000766285e-17) / 1.1941894754743634 AS "PC1", (CAST("ADS_pre_1_OUT"."PC2" AS FLOAT) - 4.544975507059234e-17) / 1.1123169990398427 AS "PC2", (CAST("ADS_pre_1_OUT"."PC3" AS FLOAT) - -1.4033912920652373e-16) / 1.0850858325957429 AS "PC3", (CAST("ADS_pre_1_OUT"."PC4" AS FLOAT) - 6.930220286527345e-17) / 1.0589594585137008 AS "PC4", (CAST("ADS_pre_1_OUT"."PC5" AS FLOAT) - -3.478120569333498e-17) / 1.03223647126387 AS "PC5", (CAST("ADS_pre_1_OUT"."PC6" AS FLOAT) - -1.4068607390171902e-16) / 1.003050973244894 AS "PC6", (CAST("ADS_pre_1_OUT"."PC7" AS FLOAT) - -3.937822290467352e-17) / 0.96475222170333 AS "PC7" 
FROM "ADS_pre_1_OUT"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3, "Values".sv_4 AS sv_4, "Values".sv_5 AS sv_5, "Values".sv_6 AS sv_6 
FROM (SELECT 0 AS sv_idx, 0.5 AS dual_coeff, -0.175837183944768 AS sv_0, 0.5237851729897542 AS sv_1, -0.6870602047386257 AS sv_2, 1.7257013295850012 AS sv_3, 0.5208876386744026 AS sv_4, 0.7366958467635893 AS sv_5, 1.014590875197422 AS sv_6 UNION ALL SELECT 1 AS sv_idx, 0.5 AS dual_coeff, -1.2721077637580085 AS sv_0, -1.7006094116020685 AS sv_1, 1.0516394431882874 AS sv_2, -0.782128421119258 AS sv_3, 1.3018061680145232 AS sv_4, 0.3500415184863976 AS sv_5, 0.4130881904422538 AS sv_6 UNION ALL SELECT 2 AS sv_idx, -0.5 AS dual_coeff, -0.03151034133335855 AS sv_0, -0.6525031959394012 AS sv_1, 0.03837325881912749 AS sv_2, -1.0851692223611555 AS sv_3, 0.6095928544695711 AS sv_4, 0.09648415013174566 AS sv_5, -1.7999713232597248 AS sv_6 UNION ALL SELECT 3 AS sv_idx, -0.5 AS dual_coeff, 1.914990790797652 AS sv_0, -0.910238717016132 AS sv_1, 0.4979239662105344 AS sv_2, -0.4459044163544241 AS sv_3, -0.9538417245091788 AS sv_4, 2.1868665483117575 AS sv_5, -0.04617103406047536 AS sv_6 UNION ALL SELECT 4 AS sv_idx, -0.5 AS dual_coeff, -1.077134890163915 AS sv_0, 0.1818134772146093 AS sv_1, 0.4601804469430362 AS sv_2, -1.4602716544820913 AS sv_3, -0.7973254984831443 AS sv_4, -0.2452510348002465 AS sv_5, 1.8640306249466416 AS sv_6 UNION ALL SELECT 5 AS sv_idx, -0.5 AS dual_coeff, 0.7126086695753416 AS sv_0, -0.7741199474349516 AS sv_1, -0.9876560719833538 AS sv_2, 0.3473362823263149 AS sv_3, 0.98162273378922 AS sv_4, 0.2408766286454309 AS sv_5, -3.603023995567488 AS sv_6 UNION ALL SELECT 6 AS sv_idx, 0.5 AS dual_coeff, 0.6028964919098406 AS sv_0, 0.09577744244380076 AS sv_1, -0.5540833625723378 AS sv_2, -1.078357330020433 AS sv_3, -1.7815006355851504 AS sv_4, 0.7163721226589358 AS sv_5, 0.670481169657627 AS sv_6 UNION ALL SELECT 7 AS sv_idx, 0.5 AS dual_coeff, 0.6636431385102048 AS sv_0, 0.8232081608593182 AS sv_1, -0.26197990669193344 AS sv_2, 1.6703669056930803 AS sv_3, -0.9810710077539884 AS sv_4, 0.998843317285136 AS sv_5, -1.745556276564541 AS sv_6 UNION ALL SELECT 8 AS sv_idx, -0.5 AS dual_coeff, 1.0699058245447923 AS sv_0, 0.15514583484683267 AS sv_1, 0.13776145824626063 AS sv_2, 1.0608862014839917 AS sv_3, 0.9392440139175584 AS sv_4, 1.000938990993899 AS sv_5, 0.1714147384566014 AS sv_6 UNION ALL SELECT 9 AS sv_idx, 0.5 AS dual_coeff, 0.13359550965124073 AS sv_0, 1.6153647359939265 AS sv_1, -0.5668264250437866 AS sv_2, 0.7140908968655442 AS sv_3, 0.09912156480417128 AS sv_4, 0.9610522659747952 AS sv_5, 0.7203467798484632 AS sv_6 UNION ALL SELECT 10 AS sv_idx, 0.5 AS dual_coeff, 1.1590534610125118 AS sv_0, 1.7541771047211454 AS sv_1, 0.5029546985109581 AS sv_2, -1.22022770268132 AS sv_3, 0.8227998449843877 AS sv_4, -1.054767791183482 AS sv_5, -0.43425341510421006 AS sv_6 UNION ALL SELECT 11 AS sv_idx, -0.5 AS dual_coeff, 0.5602547636690809 AS sv_0, -0.5856259179818459 AS sv_1, -0.22094898947533953 AS sv_2, -0.5868076418368988 AS sv_3, 1.1943140158159278 AS sv_4, 1.528967194330761 AS sv_5, 0.09787693087286237 AS sv_6 UNION ALL SELECT 12 AS sv_idx, -0.5 AS dual_coeff, 0.8209943722303846 AS sv_0, 0.8506847622872316 AS sv_1, -2.6778809240802564 AS sv_2, -1.6147174596115252 AS sv_3, 0.9244982499229936 AS sv_4, -0.12693715203382885 AS sv_5, 0.22487225170953773 AS sv_6 UNION ALL SELECT 13 AS sv_idx, 0.16446795507046705 AS dual_coeff, 2.275452110076134 AS sv_0, 0.8656506057074995 AS sv_1, 1.0181531434168547 AS sv_2, -1.6937680542023705 AS sv_3, -0.34590807183773464 AS sv_4, 0.5236023964839402 AS sv_5, 0.6170296615707928 AS sv_6 UNION ALL SELECT 14 AS sv_idx, 0.5 AS dual_coeff, -0.3360297010929231 AS sv_0, -1.1776283780298558 AS sv_1, 0.35639288734309765 AS sv_2, -1.3341119875491014 AS sv_3, 0.15459176726128243 AS sv_4, -1.1385436202831725 AS sv_5, 0.09209525777306184 AS sv_6 UNION ALL SELECT 15 AS sv_idx, -0.5 AS dual_coeff, -1.437679481343333 AS sv_0, 0.20545655090830278 AS sv_1, 1.3990327235414215 AS sv_2, -0.3147218124306673 AS sv_3, 1.4458985539608804 AS sv_4, -0.3181554378823197 AS sv_5, 0.2414656987223526 AS sv_6 UNION ALL SELECT 16 AS sv_idx, -0.5 AS dual_coeff, 0.4963455271890193 AS sv_0, -0.7899187257439974 AS sv_1, -0.484936024826999 AS sv_2, 1.2371571439119284 AS sv_3, 1.4590746032999915 AS sv_4, -1.3964559735268611 AS sv_5, 0.4980894874904195 AS sv_6 UNION ALL SELECT 17 AS sv_idx, 0.5 AS dual_coeff, -1.9605481527466644 AS sv_0, 0.474711108916601 AS sv_1, -0.001115779516968401 AS sv_2, -1.0827249903107956 AS sv_3, -0.053526230690894905 AS sv_4, 0.8532368439768144 AS sv_5, 0.22437139890611185 AS sv_6 UNION ALL SELECT 18 AS sv_idx, -0.5 AS dual_coeff, -0.3473138315384012 AS sv_0, 1.355667000305525 AS sv_1, 1.2006269613936158 AS sv_2, 0.9194054621352568 AS sv_3, 1.8958279613192304 AS sv_4, 0.6110221827679039 AS sv_5, -0.17099620454367384 AS sv_6 UNION ALL SELECT 19 AS sv_idx, -0.5 AS dual_coeff, 0.22932116338805214 AS sv_0, -1.6577736979605477 AS sv_1, 0.8618775927606547 AS sv_2, 0.4627969033517396 AS sv_3, 1.5798562376153291 AS sv_4, 1.0342043455807863 AS sv_5, -0.7324641980768269 AS sv_6 UNION ALL SELECT 20 AS sv_idx, 0.013680817876545159 AS dual_coeff, 0.24236153856772996 AS sv_0, 1.2990893192648583 AS sv_1, 0.4900770578186938 AS sv_2, -0.4574458742842362 AS sv_3, 0.2891422762720589 AS sv_4, 0.23676364509501774 AS sv_5, 0.35464731879876554 AS sv_6 UNION ALL SELECT 21 AS sv_idx, -0.1337607640640773 AS dual_coeff, 1.8581134354930144 AS sv_0, 0.9636794225698394 AS sv_1, -0.25345356088738574 AS sv_2, -0.4969104551725861 AS sv_3, -0.6668767142981372 AS sv_4, 0.1496608112651144 AS sv_5, -1.211396902303544 AS sv_6 UNION ALL SELECT 22 AS sv_idx, -0.5 AS dual_coeff, 0.8122202233961493 AS sv_0, -0.5041387490254026 AS sv_1, -1.0682575495125168 AS sv_2, 1.3861480369417472 AS sv_3, 0.7150478339989133 AS sv_4, 0.4460618940078615 AS sv_5, 1.057635647037542 AS sv_6 UNION ALL SELECT 23 AS sv_idx, -0.5 AS dual_coeff, 1.39992284007585 AS sv_0, 0.6660003864686967 AS sv_1, 2.0010966925011378 AS sv_2, -1.4228524569378138 AS sv_3, 0.02041571325773952 AS sv_4, 0.30308411357239423 AS sv_5, 0.4379837120176756 AS sv_6 UNION ALL SELECT 24 AS sv_idx, 0.5 AS dual_coeff, -1.1273313668674558 AS sv_0, 0.455730896818399 AS sv_1, -0.7232960778959163 AS sv_2, -1.846679129997636 AS sv_3, 0.1505002698669166 AS sv_4, -0.8762099465703126 AS sv_5, 0.32538175238939504 AS sv_6 UNION ALL SELECT 25 AS sv_idx, -0.5 AS dual_coeff, -0.7053498472232594 AS sv_0, 1.1246458830140602 AS sv_1, -1.1321636292648676 AS sv_2, -0.3985102857672245 AS sv_3, 0.3948849248884788 AS sv_4, -1.0445478322701995 AS sv_5, -1.03648786831805 AS sv_6 UNION ALL SELECT 26 AS sv_idx, 0.5 AS dual_coeff, 0.04197565439537177 AS sv_0, -0.37089616670000436 AS sv_1, 1.0778983837778238 AS sv_2, -1.512550428118935 AS sv_3, -0.3039500579083165 AS sv_4, 0.7201361149839234 AS sv_5, -0.7527089797359 AS sv_6 UNION ALL SELECT 27 AS sv_idx, -0.5 AS dual_coeff, -1.0982828857320928 AS sv_0, -1.4227705885151953 AS sv_1, 1.127803195685868 AS sv_2, 1.4635871798453317 AS sv_3, -0.4033161738357511 AS sv_4, -0.3434634497118666 AS sv_5, -1.0558482889395282 AS sv_6 UNION ALL SELECT 28 AS sv_idx, 0.5 AS dual_coeff, 0.3385947010161397 AS sv_0, -0.1782372620116811 AS sv_1, 1.1063801979311279 AS sv_2, -0.034592551347391 AS sv_3, -1.3545322583792283 AS sv_4, -2.456079147398849 AS sv_5, 0.06307007177282783 AS sv_6 UNION ALL SELECT 29 AS sv_idx, 0.5 AS dual_coeff, -0.5139304505706279 AS sv_0, -0.6476879775437864 AS sv_1, 0.7608319110265902 AS sv_2, -2.00620839449585 AS sv_3, 1.1387307870668555 AS sv_4, -0.6131514581446061 AS sv_5, 0.7008826945975547 AS sv_6 UNION ALL SELECT 30 AS sv_idx, 0.5 AS dual_coeff, 0.9924774334302486 AS sv_0, -0.6634707170572129 AS sv_1, 0.9857105704984758 AS sv_2, 0.34941043795418203 AS sv_3, 0.9559793289160576 AS sv_4, -0.695880512402509 AS sv_5, -0.8006965242132461 AS sv_6 UNION ALL SELECT 31 AS sv_idx, -0.5 AS dual_coeff, -0.9379280347622512 AS sv_0, -1.379436954657784 AS sv_1, -0.337585590424307 AS sv_2, -0.4380915103848316 AS sv_3, 0.003746200343190365 AS sv_4, -1.1982440069808848 AS sv_5, -0.42034359388652 AS sv_6 UNION ALL SELECT 32 AS sv_idx, 0.08537665916809642 AS dual_coeff, -0.3339729680080777 AS sv_0, -1.424479509900812 AS sv_1, -0.598769078662017 AS sv_2, 1.4082186450879415 AS sv_3, 0.7009176117370391 AS sv_4, -1.739189355532343 AS sv_5, 1.2656419286383704 AS sv_6 UNION ALL SELECT 33 AS sv_idx, 0.5 AS dual_coeff, 0.11634585431513735 AS sv_0, 0.4527854764313882 AS sv_1, 0.6327319595657321 AS sv_2, 0.37277905275565054 AS sv_3, 1.6709417531664703 AS sv_4, 0.7803439612918218 AS sv_5, 1.1384171845064877 AS sv_6 UNION ALL SELECT 34 AS sv_idx, 0.5 AS dual_coeff, 0.7363240712293294 AS sv_0, 0.7325735757456988 AS sv_1, -0.30741350134159223 AS sv_2, 0.688929386016903 AS sv_3, 0.8865857169114085 AS sv_4, -1.907742144055522 AS sv_5, 0.20747148988690597 AS sv_6 UNION ALL SELECT 35 AS sv_idx, 0.5 AS dual_coeff, -1.1998336685415163 AS sv_0, 1.1973157497393627 AS sv_1, 0.017801935454427698 AS sv_2, 0.2413852697712852 AS sv_3, -1.4937080347772955 AS sv_4, -0.9492760202595244 AS sv_5, -0.7805785188674123 AS sv_6 UNION ALL SELECT 36 AS sv_idx, 0.5 AS dual_coeff, 2.6861267372218567 AS sv_0, -0.62346420718251 AS sv_1, 0.5197776491360417 AS sv_2, 1.062427333597135 AS sv_3, 0.03691872324563952 AS sv_4, 0.5795156663229653 AS sv_5, -0.5042584758908616 AS sv_6 UNION ALL SELECT 37 AS sv_idx, 0.5 AS dual_coeff, -1.205561283654126 AS sv_0, 1.2608531033441055 AS sv_1, 0.9840783886138984 AS sv_2, -0.7099751248009388 AS sv_3, 0.8728743360464705 AS sv_4, 0.7859416397592635 AS sv_5, -0.806900312040896 AS sv_6 UNION ALL SELECT 38 AS sv_idx, 0.5 AS dual_coeff, -0.13583632282707506 AS sv_0, -2.162915257097472 AS sv_1, -0.5901976342608584 AS sv_2, -0.5066851167998901 AS sv_3, -0.6382421919471333 AS sv_4, 1.2010897852916345 AS sv_5, 0.2166230938740544 AS sv_6 UNION ALL SELECT 39 AS sv_idx, 0.5 AS dual_coeff, 0.5445405496244146 AS sv_0, -1.4760230162011638 AS sv_1, 1.5206309636337858 AS sv_2, -0.3645488462484287 AS sv_3, -1.91504405751036 AS sv_4, 0.5959952738601397 AS sv_5, -0.436001480379296 AS sv_6 UNION ALL SELECT 40 AS sv_idx, -0.5 AS dual_coeff, 1.749607873514794 AS sv_0, -0.21926462750583886 AS sv_1, -1.8711003437430695 AS sv_2, 0.749890602095161 AS sv_3, 0.1676077007521274 AS sv_4, -1.3376491761729885 AS sv_5, -0.7377947753242688 AS sv_6 UNION ALL SELECT 41 AS sv_idx, -0.2708958225734122 AS dual_coeff, 0.3952543547965119 AS sv_0, -0.6850602790044648 AS sv_1, -1.1769802872045378 AS sv_2, -0.8738427812632634 AS sv_3, -1.0568001172056383 AS sv_4, -0.3506551846993213 AS sv_5, 1.1212433751603383 AS sv_6 UNION ALL SELECT 42 AS sv_idx, 0.5 AS dual_coeff, -0.6063504008013401 AS sv_0, 0.11309587080129625 AS sv_1, 1.0068023121256409 AS sv_2, 0.37367968229046533 AS sv_3, 0.7568802176421517 AS sv_4, -1.9772576076240835 AS sv_5, -0.6452697476855953 AS sv_6 UNION ALL SELECT 43 AS sv_idx, -0.5 AS dual_coeff, 0.2905876177805948 AS sv_0, -0.13563078109966278 AS sv_1, 1.9115652518127904 AS sv_2, 0.04809835718537971 AS sv_3, 0.2774727739112665 AS sv_4, -0.4173096679385492 AS sv_5, 0.14733861179263136 AS sv_6 UNION ALL SELECT 44 AS sv_idx, 0.39294964162603213 AS dual_coeff, 0.36448969528583824 AS sv_0, 0.007119816785399639 AS sv_1, 0.5480796912654903 AS sv_2, 0.6668336890140703 AS sv_3, 0.1355798907892521 AS sv_4, -1.663977708750097 AS sv_5, -1.3645594273808856 AS sv_6 UNION ALL SELECT 45 AS sv_idx, -0.5 AS dual_coeff, -0.6783829501580912 AS sv_0, 2.2223624697057938 AS sv_1, -0.7088004038392376 AS sv_2, -0.526441877034702 AS sv_3, 0.8623771279901093 AS sv_4, -0.7094672114312242 AS sv_5, 0.1079699595707403 AS sv_6 UNION ALL SELECT 46 AS sv_idx, -0.5 AS dual_coeff, 0.22263127154408613 AS sv_0, 1.018983911149147 AS sv_1, 0.17531317816990685 AS sv_2, 1.525010360286473 AS sv_3, -0.5783678816371631 AS sv_4, 0.5794142726408311 AS sv_5, 1.222427164627264 AS sv_6 UNION ALL SELECT 47 AS sv_idx, 0.5 AS dual_coeff, 0.4494624189709525 AS sv_0, -1.2885650018727837 AS sv_1, -1.4435494116682495 AS sv_2, -0.10228222529202773 AS sv_3, -0.431017447084968 AS sv_4, 0.4082807324236635 AS sv_5, 1.471233982221011 AS sv_6 UNION ALL SELECT 48 AS sv_idx, -0.5 AS dual_coeff, 0.5919958974303561 AS sv_0, -0.15377948413618175 AS sv_1, -1.4153844366626651 AS sv_2, -1.3473666985367112 AS sv_3, -0.35713324800985097 AS sv_4, -1.7859968699341169 AS sv_5, 0.3568102610978999 AS sv_6 UNION ALL SELECT 49 AS sv_idx, -0.3450936743627753 AS dual_coeff, 1.0176596415914296 AS sv_0, 1.7609918567055332 AS sv_1, 0.8528173940665308 AS sv_2, -0.3585057526461127 AS sv_3, -1.14579448787443 AS sv_4, -0.10750042685399183 AS sv_5, 0.9270587219870992 AS sv_6 UNION ALL SELECT 50 AS sv_idx, -0.5 AS dual_coeff, -1.8366468197088837 AS sv_0, -0.5681613887435212 AS sv_1, 0.9133371246049272 AS sv_2, 0.8896955529798598 AS sv_3, -0.5970991319875151 AS sv_4, 1.0621054965590047 AS sv_5, -0.029868739151388664 AS sv_6 UNION ALL SELECT 51 AS sv_idx, -0.5 AS dual_coeff, -1.0679056821446018 AS sv_0, -0.7892678729449103 AS sv_1, -1.2020550632791285 AS sv_2, 0.55055396533212 AS sv_3, -0.6161907916640356 AS sv_4, -0.5849770554095813 AS sv_5, -0.676424383044816 AS sv_6 UNION ALL SELECT 52 AS sv_idx, 0.5 AS dual_coeff, -1.4458305360809125 AS sv_0, 1.1662584695231593 AS sv_1, -0.726922768801678 AS sv_2, -0.945029103708895 AS sv_3, -0.8855212888414026 AS sv_4, -0.13374542314196994 AS sv_5, -1.4259659630688926 AS sv_6 UNION ALL SELECT 53 AS sv_idx, -0.5 AS dual_coeff, -1.163322393559155 AS sv_0, 1.2418598914687586 AS sv_1, -0.1414262758013427 AS sv_2, 0.33619355178641813 AS sv_3, -1.236994999278008 AS sv_4, -0.7649645383918251 AS sv_5, 1.2128003615428815 AS sv_6 UNION ALL SELECT 54 AS sv_idx, 0.5 AS dual_coeff, 0.6617247471856041 AS sv_0, 0.2940159699044543 AS sv_1, 0.65367554110063 AS sv_2, 1.02833625485095 AS sv_3, 0.017682445224451962 AS sv_4, -1.8442615427016769 AS sv_5, 1.0787272452672865 AS sv_6 UNION ALL SELECT 55 AS sv_idx, -0.5 AS dual_coeff, -0.6780685642424761 AS sv_0, 1.7666604967809847 AS sv_1, -1.1410686402384127 AS sv_2, 0.5705720131708362 AS sv_3, 0.20336414605857264 AS sv_4, 1.8748393747274703 AS sv_5, -0.632940425661296 AS sv_6 UNION ALL SELECT 56 AS sv_idx, -0.5 AS dual_coeff, 0.3714815474934543 AS sv_0, -0.8424494045363699 AS sv_1, -0.039042799343459285 AS sv_2, 1.0523398265625035 AS sv_3, -0.09235379416349361 AS sv_4, -0.11676131392379102 AS sv_5, 0.3939081472671184 AS sv_6 UNION ALL SELECT 57 AS sv_idx, 0.5 AS dual_coeff, 0.7844190625517166 AS sv_0, 1.349868264130601 AS sv_1, 0.14402260482144122 AS sv_2, -0.337054773209272 AS sv_3, 1.1389634304094747 AS sv_4, 1.518118884214951 AS sv_5, 1.143237362574411 AS sv_6 UNION ALL SELECT 58 AS sv_idx, -0.5 AS dual_coeff, -1.0236829098493763 AS sv_0, -1.075939968176924 AS sv_1, -1.3295405813498569 AS sv_2, -0.551073700995507 AS sv_3, -1.0988445928664867 AS sv_4, 0.25264961882387 AS sv_5, -0.8121940378943283 AS sv_6 UNION ALL SELECT 59 AS sv_idx, 0.5 AS dual_coeff, -1.2784242720634615 AS sv_0, -0.8215632929161626 AS sv_1, -0.26945451193270226 AS sv_2, -0.5891283688133873 AS sv_3, 2.3805283749215183 AS sv_4, 0.4344023415333169 AS sv_5, -0.646865876615252 AS sv_6 UNION ALL SELECT 60 AS sv_idx, 0.09327518725912376 AS dual_coeff, 0.7393348652527787 AS sv_0, -1.0042269375937023 AS sv_1, 0.4067668122939188 AS sv_2, 0.4582175970930547 AS sv_3, -0.8347515809215041 AS sv_4, -0.7522855764770869 AS sv_5, 0.006429328822398261 AS sv_6 UNION ALL SELECT 61 AS sv_idx, 0.5 AS dual_coeff, 0.8405375198635981 AS sv_0, -1.1516174918016466 AS sv_1, -1.7819078287289785 AS sv_2, -1.456200704273774 AS sv_3, 0.9004711534353432 AS sv_4, -0.1878891027426936 AS sv_5, 0.3981661169513606 AS sv_6 UNION ALL SELECT 62 AS sv_idx, -0.5 AS dual_coeff, -1.0444838730036845 AS sv_0, -0.05569984575106907 AS sv_1, 0.40511338689193693 AS sv_2, 1.8899762413564676 AS sv_3, 0.40082048292397987 AS sv_4, -0.044203292482913034 AS sv_5, 2.0426208945064657 AS sv_6 UNION ALL SELECT 63 AS sv_idx, -0.5 AS dual_coeff, -0.6300492836040893 AS sv_0, 1.420919087302764 AS sv_1, -0.8703539058299876 AS sv_2, 0.3251899985843376 AS sv_3, 0.1225444125726176 AS sv_4, -0.31738293182780425 AS sv_5, -1.2170786526560382 AS sv_6 UNION ALL SELECT 64 AS sv_idx, -0.5 AS dual_coeff, -0.4525504732646203 AS sv_0, -0.10417743869819905 AS sv_1, 0.21649476336783993 AS sv_2, 2.0176276785226404 AS sv_3, -0.8366475642919987 AS sv_4, -0.2946332379049836 AS sv_5, 0.6745866084291209 AS sv_6 UNION ALL SELECT 65 AS sv_idx, -0.5 AS dual_coeff, 0.17961325612545112 AS sv_0, 0.9786327684981428 AS sv_1, 1.9661913606577344 AS sv_2, -0.02250406372530255 AS sv_3, -1.0182108187495948 AS sv_4, -0.4080811769859278 AS sv_5, 1.3105259551035675 AS sv_6 UNION ALL SELECT 66 AS sv_idx, 0.5 AS dual_coeff, 0.025432932614705 AS sv_0, -1.2833244728476407 AS sv_1, 0.059788843722163365 AS sv_2, 0.6215427215824412 AS sv_3, -2.1801089285326722 AS sv_4, 0.4873346470918671 AS sv_5, 2.095786870125064 AS sv_6 UNION ALL SELECT 67 AS sv_idx, -0.5 AS dual_coeff, 0.2389384973638131 AS sv_0, 0.15595853866164136 AS sv_1, 0.8466027831026502 AS sv_2, 0.4266227753642993 AS sv_3, -0.7125038390311031 AS sv_4, -2.0324688791535483 AS sv_5, -0.9465677062911296 AS sv_6 UNION ALL SELECT 68 AS sv_idx, 0.5 AS dual_coeff, -0.7260039395424054 AS sv_0, -0.399896097909077 AS sv_1, 0.6302222379210938 AS sv_2, 0.6337400790718914 AS sv_3, -0.07920380185257164 AS sv_4, 0.32687293819757374 AS sv_5, -1.4035328856860205 AS sv_6 UNION ALL SELECT 69 AS sv_idx, 0.5 AS dual_coeff, -0.1078830741947109 AS sv_0, -1.1404251225939834 AS sv_1, -2.1564756658804995 AS sv_2, 0.850485125004977 AS sv_3, 0.6122974593370639 AS sv_4, 1.0657687488565823 AS sv_5, 0.5636534700973945 AS sv_6 UNION ALL SELECT 70 AS sv_idx, 0.5 AS dual_coeff, 0.7228294704026064 AS sv_0, 0.25231947803865196 AS sv_1, 0.8432639593669683 AS sv_2, 0.3105443143309408 AS sv_3, 1.3631726648908975 AS sv_4, 1.6546541785094795 AS sv_5, -0.4593096446840924 AS sv_6 UNION ALL SELECT 71 AS sv_idx, 0.5 AS dual_coeff, 0.8177039774788133 AS sv_0, 0.17960302964658856 AS sv_1, -1.1098451006811287 AS sv_2, -0.05129399972187459 AS sv_3, 0.9741587291796334 AS sv_4, -0.11924892183458112 AS sv_5, 0.5066258853526614 AS sv_6) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS FLOAT)) + 0.0153275350577964 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * power(0.1 * (kernel_input_with_scaling."PC1" * "SV_data".sv_0 + kernel_input_with_scaling."PC2" * "SV_data".sv_1 + kernel_input_with_scaling."PC3" * "SV_data".sv_2 + kernel_input_with_scaling."PC4" * "SV_data".sv_3 + kernel_input_with_scaling."PC5" * "SV_data".sv_4 + kernel_input_with_scaling."PC6" * "SV_data".sv_5 + kernel_input_with_scaling."PC7" * "SV_data".sv_6) + 1.0, 1.0) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", 15.3537633818605 + 5.0131713754064915 * kernel_dp.dot_product AS "Estimator" 
FROM kernel_dp