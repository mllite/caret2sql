-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmPoly_pca
-- Dataset : RandomReg_10
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 0.1668094729813739) / 1.03547567419981 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - -0.1635127199444346) / 0.9978373487111776 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 0.19149292241003152) / 0.9379956714934372 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 0.05838484475305535) / 1.092422041481253 AS [Feature_3], (CAST([ADS].[Feature_4] AS FLOAT(53)) - -0.09933205162122273) / 1.081168997121092 AS [Feature_4], (CAST([ADS].[Feature_5] AS FLOAT(53)) - 0.21293121660488026) / 0.9417116446342017 AS [Feature_5], (CAST([ADS].[Feature_6] AS FLOAT(53)) - 0.0478655686900296) / 1.1435269275597653 AS [Feature_6], (CAST([ADS].[Feature_7] AS FLOAT(53)) - 0.05078698959084227) / 0.9786817421858578 AS [Feature_7], (CAST([ADS].[Feature_8] AS FLOAT(53)) - -0.19131992259081876) / 1.1488000469275086 AS [Feature_8], (CAST([ADS].[Feature_9] AS FLOAT(53)) - 0.1994040567747336) / 0.8878119561240071 AS [Feature_9] 
FROM [RandomReg_10] AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * 0.1456841447657754 + [ADS_sca_1_OUT].[Feature_1] * 0.01052326111479696 + [ADS_sca_1_OUT].[Feature_2] * 0.06914860134209275 + [ADS_sca_1_OUT].[Feature_3] * 0.395081446850409 + [ADS_sca_1_OUT].[Feature_4] * 0.5653788508678024 + [ADS_sca_1_OUT].[Feature_5] * -0.4234978636491337 + [ADS_sca_1_OUT].[Feature_6] * -0.13347391731421338 + [ADS_sca_1_OUT].[Feature_7] * 0.5073597310574229 + [ADS_sca_1_OUT].[Feature_8] * 0.17681881915451916 + [ADS_sca_1_OUT].[Feature_9] * 0.11089070562205412 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * -0.28606729371603284 + [ADS_sca_1_OUT].[Feature_1] * -0.1416224223949325 + [ADS_sca_1_OUT].[Feature_2] * -0.21284760934172509 + [ADS_sca_1_OUT].[Feature_3] * -0.2570681745801655 + [ADS_sca_1_OUT].[Feature_4] * 0.22505517518455515 + [ADS_sca_1_OUT].[Feature_5] * -0.01568473246748345 + [ADS_sca_1_OUT].[Feature_6] * -0.5725136264722785 + [ADS_sca_1_OUT].[Feature_7] * -0.08820208123478704 + [ADS_sca_1_OUT].[Feature_8] * -0.3605522366090105 + [ADS_sca_1_OUT].[Feature_9] * 0.5198800093216087 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * 0.3393859060808712 + [ADS_sca_1_OUT].[Feature_1] * 0.4706204946180642 + [ADS_sca_1_OUT].[Feature_2] * 0.4682237189969609 + [ADS_sca_1_OUT].[Feature_3] * -0.24873660011955734 + [ADS_sca_1_OUT].[Feature_4] * 0.30955843893203433 + [ADS_sca_1_OUT].[Feature_5] * 0.27598076274469385 + [ADS_sca_1_OUT].[Feature_6] * -0.3878587432228167 + [ADS_sca_1_OUT].[Feature_7] * -0.1713140961495792 + [ADS_sca_1_OUT].[Feature_8] * 0.041332656018300086 + [ADS_sca_1_OUT].[Feature_9] * -0.16954966329100976 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * 0.38499125608277135 + [ADS_sca_1_OUT].[Feature_1] * -0.4892407072526046 + [ADS_sca_1_OUT].[Feature_2] * 0.4525070336744841 + [ADS_sca_1_OUT].[Feature_3] * -0.11446163468336185 + [ADS_sca_1_OUT].[Feature_4] * -0.08228589793601762 + [ADS_sca_1_OUT].[Feature_5] * 0.05835205758419686 + [ADS_sca_1_OUT].[Feature_6] * 0.13193485154948764 + [ADS_sca_1_OUT].[Feature_7] * 0.2747942471701797 + [ADS_sca_1_OUT].[Feature_8] * -0.535971424967745 + [ADS_sca_1_OUT].[Feature_9] * 0.06481665241973472 AS [PC4], [ADS_sca_1_OUT].[Feature_0] * -0.4241318059513543 + [ADS_sca_1_OUT].[Feature_1] * -0.12904202328161374 + [ADS_sca_1_OUT].[Feature_2] * 0.4375442860931951 + [ADS_sca_1_OUT].[Feature_3] * 0.3534858161601103 + [ADS_sca_1_OUT].[Feature_4] * 0.14097295746133154 + [ADS_sca_1_OUT].[Feature_5] * 0.5320793223160138 + [ADS_sca_1_OUT].[Feature_6] * 0.15027430836617292 + [ADS_sca_1_OUT].[Feature_7] * -0.03078935335662195 + [ADS_sca_1_OUT].[Feature_8] * 0.20609808144469807 + [ADS_sca_1_OUT].[Feature_9] * 0.3436198360204909 AS [PC5], [ADS_sca_1_OUT].[Feature_0] * 0.16994011109828247 + [ADS_sca_1_OUT].[Feature_1] * 0.33484071907765084 + [ADS_sca_1_OUT].[Feature_2] * 0.10471628928699762 + [ADS_sca_1_OUT].[Feature_3] * 0.5541013299742117 + [ADS_sca_1_OUT].[Feature_4] * -0.14490660804802982 + [ADS_sca_1_OUT].[Feature_5] * -0.26123038722761205 + [ADS_sca_1_OUT].[Feature_6] * 0.06579599409431937 + [ADS_sca_1_OUT].[Feature_7] * -0.4582634526572295 + [ADS_sca_1_OUT].[Feature_8] * -0.4058380481420916 + [ADS_sca_1_OUT].[Feature_9] * 0.26968500124997136 AS [PC6], [ADS_sca_1_OUT].[Feature_0] * 0.4370347300341415 + [ADS_sca_1_OUT].[Feature_1] * 0.3004814913700811 + [ADS_sca_1_OUT].[Feature_2] * -0.29942592437311427 + [ADS_sca_1_OUT].[Feature_3] * -0.04148829060270187 + [ADS_sca_1_OUT].[Feature_4] * -0.2386399066951679 + [ADS_sca_1_OUT].[Feature_5] * 0.3468575401295237 + [ADS_sca_1_OUT].[Feature_6] * 0.08868221205015787 + [ADS_sca_1_OUT].[Feature_7] * 0.35236441046927025 + [ADS_sca_1_OUT].[Feature_8] * 0.13869954974668547 + [ADS_sca_1_OUT].[Feature_9] * 0.5466373750783862 AS [PC7] 
FROM [ADS_sca_1_OUT]), 
kernel_input_with_scaling AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], (CAST([ADS_pre_1_OUT].[PC1] AS FLOAT(53)) - 2.8059152223924856e-17) / 1.2183161423321345 AS [PC1], (CAST([ADS_pre_1_OUT].[PC2] AS FLOAT(53)) - -3.9204750557075837e-17) / 1.1729289252998751 AS [PC2], (CAST([ADS_pre_1_OUT].[PC3] AS FLOAT(53)) - 3.2439329000766285e-17) / 1.0966961554807313 AS [PC3], (CAST([ADS_pre_1_OUT].[PC4] AS FLOAT(53)) - -5.551115123125783e-18) / 1.0557355527422476 AS [PC4], (CAST([ADS_pre_1_OUT].[PC5] AS FLOAT(53)) - 6.418476861114187e-18) / 1.0121222572510105 AS [PC5], (CAST([ADS_pre_1_OUT].[PC6] AS FLOAT(53)) - 2.168404344971009e-17) / 0.9541525798832736 AS [PC6], (CAST([ADS_pre_1_OUT].[PC7] AS FLOAT(53)) - -7.45931094670027e-18) / 0.9341751570843612 AS [PC7] 
FROM [ADS_pre_1_OUT]), 
[SV_data] AS 
(SELECT [Values].sv_idx AS sv_idx, [Values].dual_coeff AS dual_coeff, [Values].sv_0 AS sv_0, [Values].sv_1 AS sv_1, [Values].sv_2 AS sv_2, [Values].sv_3 AS sv_3, [Values].sv_4 AS sv_4, [Values].sv_5 AS sv_5, [Values].sv_6 AS sv_6 
FROM (SELECT 0 AS sv_idx, 1.0 AS dual_coeff, -0.035829190930322184 AS sv_0, 0.4114207932694111 AS sv_1, -0.38018277426975694 AS sv_2, -0.07635224536355187 AS sv_3, -1.5296782398635365 AS sv_4, -0.08189179451207101 AS sv_5, 0.3366128336146829 AS sv_6 UNION ALL SELECT 1 AS sv_idx, -1.0 AS dual_coeff, -0.33310251042705274 AS sv_0, 0.22911037209038865 AS sv_1, -1.5058490709065075 AS sv_2, -0.6295459303014749 AS sv_3, -0.43331137181439244 AS sv_4, 0.7378408372953155 AS sv_5, 1.1811736926282634 AS sv_6 UNION ALL SELECT 2 AS sv_idx, -0.374600024076258 AS dual_coeff, 1.2774785751552808 AS sv_0, 0.4884026629214616 AS sv_1, -1.1748249536304667 AS sv_2, -1.0542267359540207 AS sv_3, -0.8253444368088778 AS sv_4, 1.4604134706087677 AS sv_5, 0.4844212451082641 AS sv_6 UNION ALL SELECT 3 AS sv_idx, 1.0 AS dual_coeff, 0.008123139914006374 AS sv_0, -0.5867875312495568 AS sv_1, 1.3526415594384253 AS sv_2, -0.36349479388738304 AS sv_3, 1.1577324770404624 AS sv_4, 0.7318062023483372 AS sv_5, -0.7391867963984557 AS sv_6 UNION ALL SELECT 4 AS sv_idx, -1.0 AS dual_coeff, -2.8083462007954747 AS sv_0, -1.3702823008368836 AS sv_1, 1.2062659280557066 AS sv_2, -0.07969387890066425 AS sv_3, -1.6301875317232373 AS sv_4, -0.7147633465667506 AS sv_5, -0.793471277534331 AS sv_6 UNION ALL SELECT 5 AS sv_idx, 1.0 AS dual_coeff, -0.4601624741762564 AS sv_0, -0.1078625338517372 AS sv_1, 0.4342908530301029 AS sv_2, -1.4730103911881292 AS sv_3, 0.2360788061812528 AS sv_4, -1.3135226746307067 AS sv_5, -1.1288280927789083 AS sv_6 UNION ALL SELECT 6 AS sv_idx, 0.552837988155141 AS dual_coeff, -0.04064362860339246 AS sv_0, 0.8757393195290726 AS sv_1, 0.7545507344868538 AS sv_2, 1.845991081858016 AS sv_3, 0.6539318221305377 AS sv_4, 1.7590041800210496 AS sv_5, 0.9726870116078036 AS sv_6 UNION ALL SELECT 7 AS sv_idx, 1.0 AS dual_coeff, 1.5885299433901054 AS sv_0, -1.3796049312708003 AS sv_1, -0.1727164462575611 AS sv_2, 0.8657768677016947 AS sv_3, -0.406641636139394 AS sv_4, 1.932310696234722 AS sv_5, 0.6910945523203091 AS sv_6 UNION ALL SELECT 8 AS sv_idx, 1.0 AS dual_coeff, 0.6503846826691447 AS sv_0, 1.8342640131710644 AS sv_1, -0.9153388993710142 AS sv_2, -0.09083370354439024 AS sv_3, 0.2768964101201869 AS sv_4, -0.047141818824170165 AS sv_5, -1.2379822357875208 AS sv_6 UNION ALL SELECT 9 AS sv_idx, -0.02621214637366294 AS dual_coeff, -0.6823049737766838 AS sv_0, 0.4682798177006573 AS sv_1, -0.8382819225182836 AS sv_2, -1.8958547174605564 AS sv_3, 0.7629513157770406 AS sv_4, 0.5812219988418028 AS sv_5, 0.43423515141163027 AS sv_6 UNION ALL SELECT 10 AS sv_idx, -0.26826918866597416 AS dual_coeff, -0.6906051873116443 AS sv_0, 0.9795346483402546 AS sv_1, -1.5922574102199678 AS sv_2, -0.4603687593464879 AS sv_3, -1.4276444442325296 AS sv_4, -0.8686237798119203 AS sv_5, -0.36046521776847823 AS sv_6 UNION ALL SELECT 11 AS sv_idx, 1.0 AS dual_coeff, -0.4359477612396838 AS sv_0, -0.2337754559990255 AS sv_1, 1.0203342332878655 AS sv_2, 0.0045831721450922645 AS sv_3, -0.03218708528444152 AS sv_4, 0.6440901476808808 AS sv_5, 0.04994582649661688 AS sv_6 UNION ALL SELECT 12 AS sv_idx, -1.0 AS dual_coeff, 0.32905114106467853 AS sv_0, 0.25399646530272857 AS sv_1, -0.3783464133971821 AS sv_2, 0.1793548539995798 AS sv_3, -1.6291119234274183 AS sv_4, 1.0427272917352708 AS sv_5, 1.435200267527545 AS sv_6 UNION ALL SELECT 13 AS sv_idx, 1.0 AS dual_coeff, 2.247478456316325 AS sv_0, 0.04433630134045455 AS sv_1, 1.1711908243311955 AS sv_2, -0.6398605266345656 AS sv_3, -0.36832886081904953 AS sv_4, -0.4251023934203007 AS sv_5, -0.05010673879074993 AS sv_6 UNION ALL SELECT 14 AS sv_idx, -1.0 AS dual_coeff, 2.0504317868698574 AS sv_0, -1.253557886258721 AS sv_1, -0.16083124686603453 AS sv_2, 1.2202380195294855 AS sv_3, -0.1566966326187023 AS sv_4, -1.0180123244944215 AS sv_5, -1.105601469066969 AS sv_6 UNION ALL SELECT 15 AS sv_idx, 1.0 AS dual_coeff, 0.8183215899624041 AS sv_0, 0.5526678411398748 AS sv_1, 0.99449289910987 AS sv_2, 0.8161151166131392 AS sv_3, 1.515284162549229 AS sv_4, 1.53575014616597 AS sv_5, -0.3688412313287871 AS sv_6 UNION ALL SELECT 16 AS sv_idx, 1.0 AS dual_coeff, -0.9324251889795226 AS sv_0, -0.3678406444427885 AS sv_1, -0.24373889681149835 AS sv_2, -0.7647667285214099 AS sv_3, 0.4931101466959056 AS sv_4, -1.116773775409177 AS sv_5, -0.5542283664843295 AS sv_6 UNION ALL SELECT 17 AS sv_idx, 1.0 AS dual_coeff, -0.33852504098100134 AS sv_0, -1.4591255430481795 AS sv_1, -0.003946083040119378 AS sv_2, -0.19159593247461465 AS sv_3, 0.4788147990370861 AS sv_4, 0.9261893238243188 AS sv_5, 0.042125164792968385 AS sv_6 UNION ALL SELECT 18 AS sv_idx, -0.41094801790159813 AS dual_coeff, 0.37268881862931214 AS sv_0, -0.7199330706935076 AS sv_1, 0.3004194308850701 AS sv_2, -1.1697030211053037 AS sv_3, -0.8839180847171016 AS sv_4, -1.6917475791729475 AS sv_5, 2.5228823090999297 AS sv_6 UNION ALL SELECT 19 AS sv_idx, -1.0 AS dual_coeff, -0.02240809390467004 AS sv_0, 0.8279625333247665 AS sv_1, 0.39781575764596816 AS sv_2, 1.0214670990697319 AS sv_3, -0.009165228496474435 AS sv_4, -1.1888855415994333 AS sv_5, 0.08254196773737425 AS sv_6 UNION ALL SELECT 20 AS sv_idx, -1.0 AS dual_coeff, -1.2770762306507748 AS sv_0, -0.6835670397386718 AS sv_1, -0.9980980087527213 AS sv_2, -0.28321429909985124 AS sv_3, -0.33813462339892814 AS sv_4, 0.4218458467344428 AS sv_5, -1.6155611744875125 AS sv_6 UNION ALL SELECT 21 AS sv_idx, -1.0 AS dual_coeff, -1.1852928697966767 AS sv_0, -1.4367786827967246 AS sv_1, -0.197660262797068 AS sv_2, -0.4904794662696375 AS sv_3, 0.323533867411034 AS sv_4, -0.12937549607458426 AS sv_5, -0.7276247878538947 AS sv_6 UNION ALL SELECT 22 AS sv_idx, -0.36310512744054707 AS dual_coeff, -0.272923081733289 AS sv_0, 0.9033993476451844 AS sv_1, 1.2559917581013484 AS sv_2, 0.17096953278443966 AS sv_3, -0.8770914483630372 AS sv_4, 1.1493853502934266 AS sv_5, 1.505759713765114 AS sv_6 UNION ALL SELECT 23 AS sv_idx, -1.0 AS dual_coeff, 0.2390038988256528 AS sv_0, 2.5440016140029966 AS sv_1, 0.7084306354021757 AS sv_2, 1.0138684534365487 AS sv_3, 0.41622102321477683 AS sv_4, 1.3638264520672903 AS sv_5, -0.13619477425624613 AS sv_6 UNION ALL SELECT 24 AS sv_idx, 1.0 AS dual_coeff, -1.0229277072118144 AS sv_0, -1.1776148652350904 AS sv_1, -0.16181706601805568 AS sv_2, -0.9422147093441648 AS sv_3, 0.5658408477144296 AS sv_4, 2.2818490558310307 AS sv_5, 0.03430942261462504 AS sv_6 UNION ALL SELECT 25 AS sv_idx, -0.9000207255021726 AS dual_coeff, 0.5146990578000297 AS sv_0, -2.279311523887261 AS sv_1, 2.1990052131487237 AS sv_2, -0.4234219689140626 AS sv_3, 0.8653223254203727 AS sv_4, -0.44763022542166 AS sv_5, -1.2882670022899216 AS sv_6 UNION ALL SELECT 26 AS sv_idx, 1.0 AS dual_coeff, -0.9649868959803416 AS sv_0, -0.03897020977462964 AS sv_1, 0.8772389345933056 AS sv_2, -1.6852583363639233 AS sv_3, -0.08818597748918502 AS sv_4, -0.5730358993005925 AS sv_5, -1.0753824298004016 AS sv_6 UNION ALL SELECT 27 AS sv_idx, -1.0 AS dual_coeff, -0.23137839238923694 AS sv_0, 1.4422458631111397 AS sv_1, -0.6801741834004557 AS sv_2, -0.9522883509754138 AS sv_3, 0.9244143299500513 AS sv_4, 1.6178115230133914 AS sv_5, -0.7898564092200512 AS sv_6 UNION ALL SELECT 28 AS sv_idx, -1.0 AS dual_coeff, -0.05340347133487051 AS sv_0, 0.2746568111298269 AS sv_1, -0.8191908982104584 AS sv_2, 1.5642240509961904 AS sv_3, 0.9996376857189864 AS sv_4, 0.6132820585425938 AS sv_5, 0.6555394418249642 AS sv_6 UNION ALL SELECT 29 AS sv_idx, -1.0 AS dual_coeff, 1.8098882189252468 AS sv_0, 2.204533912203654 AS sv_1, -0.5350149746703837 AS sv_2, -0.6398006247037379 AS sv_3, -0.9386850420952838 AS sv_4, -0.6683073224593878 AS sv_5, -0.6957306737317236 AS sv_6 UNION ALL SELECT 30 AS sv_idx, -0.2704332025328109 AS dual_coeff, 0.3592879324889863 AS sv_0, 1.0837012022805517 AS sv_1, 0.871963323178341 AS sv_2, 1.423157077737908 AS sv_3, -0.01174491869383152 AS sv_4, -0.15288400715896866 AS sv_5, -0.21065824973103395 AS sv_6 UNION ALL SELECT 31 AS sv_idx, 1.0 AS dual_coeff, 2.080789673522354 AS sv_0, -0.7598447598737686 AS sv_1, 1.1480126551283472 AS sv_2, 1.56932084456603 AS sv_3, -0.39572788089600563 AS sv_4, -1.0592296003312984 AS sv_5, 2.104043924559317 AS sv_6 UNION ALL SELECT 32 AS sv_idx, 1.0 AS dual_coeff, -0.15422113727296446 AS sv_0, 0.6840740128577724 AS sv_1, 2.1157557579024355 AS sv_2, -0.25494193775248486 AS sv_3, 0.604959092323863 AS sv_4, 0.9033762401107976 AS sv_5, 0.3348173747189842 AS sv_6 UNION ALL SELECT 33 AS sv_idx, -1.0 AS dual_coeff, 0.06365130558882337 AS sv_0, 0.8926839069198845 AS sv_1, 0.17913199764593432 AS sv_2, -0.9639574194824944 AS sv_3, -0.8422891606303 AS sv_4, -0.3538964195787285 AS sv_5, -0.757866908174299 AS sv_6 UNION ALL SELECT 34 AS sv_idx, 1.0 AS dual_coeff, -0.726625954624375 AS sv_0, 1.8936600024128285 AS sv_1, -0.8202272610913318 AS sv_2, -0.1657013355361045 AS sv_3, -1.216610617214807 AS sv_4, 0.08878873694590804 AS sv_5, 0.19864553975131466 AS sv_6 UNION ALL SELECT 35 AS sv_idx, -1.0 AS dual_coeff, 0.7538013175782748 AS sv_0, 0.7486944316103799 AS sv_1, 1.8353576245122931 AS sv_2, -0.9314181580784066 AS sv_3, 0.6681735179604783 AS sv_4, 0.4606786970349301 AS sv_5, 0.10475695387084406 AS sv_6 UNION ALL SELECT 36 AS sv_idx, -1.0 AS dual_coeff, 0.797806565201509 AS sv_0, 1.1758576669175684 AS sv_1, 1.7544857872193995 AS sv_2, -0.5788117387942888 AS sv_3, -1.0615549466896967 AS sv_4, 0.7225359001593155 AS sv_5, -0.8415997090103055 AS sv_6 UNION ALL SELECT 37 AS sv_idx, 1.0 AS dual_coeff, 0.5802166030456097 AS sv_0, -0.5066332231359117 AS sv_1, -0.6510780406025709 AS sv_2, -0.896954641490887 AS sv_3, -2.0482832025383093 AS sv_4, -0.027578627018833467 AS sv_5, 0.8831389347989176 AS sv_6 UNION ALL SELECT 38 AS sv_idx, -1.0 AS dual_coeff, -0.6114656575968913 AS sv_0, -1.3831880567350583 AS sv_1, -0.7776956100106203 AS sv_2, -0.11057203525792693 AS sv_3, -0.22990244870524615 AS sv_4, -0.0286201149436314 AS sv_5, 0.2624997307131689 AS sv_6 UNION ALL SELECT 39 AS sv_idx, 1.0 AS dual_coeff, 1.0578324213501888 AS sv_0, 0.3945121806724137 AS sv_1, 0.472570777384832 AS sv_2, 0.549475559590354 AS sv_3, 1.3335825352706223 AS sv_4, -3.129436452006989 AS sv_5, 0.309892376571615 AS sv_6 UNION ALL SELECT 40 AS sv_idx, 0.06075044433788309 AS dual_coeff, -1.1426239396004738 AS sv_0, -1.2437357730782976 AS sv_1, -0.7430872498935158 AS sv_2, 2.6352670650746366 AS sv_3, 0.5515063941696202 AS sv_4, -1.0392030043238492 AS sv_5, 0.05990297356536783 AS sv_6) AS [Values]), 
kernel_dp AS 
(SELECT t.[KEY] AS [KEY], t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.[KEY] AS [KEY], sum(CAST(full_join_data_sv.dot_prod1 AS FLOAT(53))) + -0.00133570651652242 AS dot_product 
FROM (SELECT kernel_input_with_scaling.[KEY] AS [KEY], [SV_data].dual_coeff * power(CAST(0.1 * (kernel_input_with_scaling.[PC1] * [SV_data].sv_0 + kernel_input_with_scaling.[PC2] * [SV_data].sv_1 + kernel_input_with_scaling.[PC3] * [SV_data].sv_2 + kernel_input_with_scaling.[PC4] * [SV_data].sv_3 + kernel_input_with_scaling.[PC5] * [SV_data].sv_4 + kernel_input_with_scaling.[PC6] * [SV_data].sv_5 + kernel_input_with_scaling.[PC7] * [SV_data].sv_6) + 1.0 AS FLOAT(53)), 1.0) AS dot_prod1 
FROM kernel_input_with_scaling, [SV_data]) AS full_join_data_sv GROUP BY full_join_data_sv.[KEY]) AS t)
 SELECT kernel_dp.[KEY] AS [KEY], 26.405852730652423 + 212.6549441322689 * kernel_dp.dot_product AS [Estimator] 
FROM kernel_dp