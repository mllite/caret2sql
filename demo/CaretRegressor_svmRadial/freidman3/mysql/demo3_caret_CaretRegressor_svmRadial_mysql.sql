-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmRadial
-- Dataset : freidman3
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 43.791281222074) / 26.1998878150635 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - 945.96728330844) / 464.3666952541536 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS `Feature_3` 
FROM freidman3 AS `ADS`), 
`SV_data` AS 
(SELECT `Values`.sv_idx AS sv_idx, `Values`.dual_coeff AS dual_coeff, `Values`.sv_0 AS sv_0, `Values`.sv_1 AS sv_1, `Values`.sv_2 AS sv_2, `Values`.sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, 0.047131024267634485 AS dual_coeff, 0.4044696634344845 AS sv_0, 1.5110797542243983 AS sv_1, 0.12386776664604855 AS sv_2, -0.9833606242368756 AS sv_3 UNION ALL SELECT 1 AS sv_idx, 0.1426212741399645 AS dual_coeff, -0.8865856472136858 AS sv_0, 1.5547163128658457 AS sv_1, -0.1419040874747908 AS sv_2, 0.3983320807747219 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -1.0 AS dual_coeff, -0.12782307796584916 AS sv_0, -0.8503971026347199 AS sv_1, -1.6859904237278465 AS sv_2, -0.5050895326574296 AS sv_3 UNION ALL SELECT 3 AS sv_idx, 0.04958528580901041 AS dual_coeff, 0.31840371025453573 AS sv_0, -0.10495927837339684 AS sv_1, 0.7315545896033409 AS sv_2, 1.3278271178405927 AS sv_3 UNION ALL SELECT 4 AS sv_idx, 0.09108630595747824 AS dual_coeff, 0.1871421187807054 AS sv_0, 1.5468120391557871 AS sv_1, -0.7518480444237882 AS sv_2, -0.4874496037207571 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 0.01847189527607993 AS dual_coeff, 0.7107389141967823 AS sv_0, 0.1826723751377262 AS sv_1, 0.622604979874454 AS sv_2, 1.379215021055077 AS sv_3 UNION ALL SELECT 6 AS sv_idx, 0.1259044068506703 AS dual_coeff, -0.061452150015480836 AS sv_0, 0.3774517898163364 AS sv_1, 0.8031840175318876 AS sv_2, 0.30220624018005193 AS sv_3 UNION ALL SELECT 7 AS sv_idx, -0.8730284045990044 AS dual_coeff, -0.21152729584795463 AS sv_0, -1.7444439677525907 AS sv_1, 0.4004397884124832 AS sv_2, -1.280761716963789 AS sv_3 UNION ALL SELECT 8 AS sv_idx, 0.16395851881132786 AS dual_coeff, 0.041766113433661996 AS sv_0, 1.4674056735783634 AS sv_1, 1.0087784473355752 AS sv_2, 1.268788761557724 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 0.1985103357034675 AS dual_coeff, -0.040434821565860604 AS sv_0, 0.33316647170492614 AS sv_1, 1.5163784337439192 AS sv_2, -1.0779792006390798 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -1.0 AS dual_coeff, 0.2606505517419123 AS sv_0, -1.1491857713604607 AS sv_1, -1.460611402459679 AS sv_2, -1.052479326928032 AS sv_3 UNION ALL SELECT 11 AS sv_idx, 0.09318089864853189 AS dual_coeff, -1.3271083980674663 AS sv_0, -0.9681552144848872 AS sv_1, -0.36931753289215297 AS sv_2, 0.7762082793822555 AS sv_3 UNION ALL SELECT 12 AS sv_idx, 0.5506914367630956 AS dual_coeff, 1.4775762028043449 AS sv_0, -0.9271264867595896 AS sv_1, 0.009704247466632536 AS sv_2, -0.4375335070800741 AS sv_3 UNION ALL SELECT 13 AS sv_idx, -0.8757395727913606 AS dual_coeff, 2.1441062194703595 AS sv_0, -1.5860201052988994 AS sv_1, 0.887640633884356 AS sv_2, -1.4027307340509194 AS sv_3 UNION ALL SELECT 14 AS sv_idx, 0.3822966853759609 AS dual_coeff, -1.4312471633180324 AS sv_0, 0.5463310590653604 AS sv_1, 0.9349066509232152 AS sv_2, -0.20997937151655952 AS sv_3 UNION ALL SELECT 15 AS sv_idx, -1.0 AS dual_coeff, 0.7297966940855642 AS sv_0, -1.0546257130717192 AS sv_1, -1.6324213800380483 AS sv_2, 1.2758491111612755 AS sv_3 UNION ALL SELECT 16 AS sv_idx, -1.0 AS dual_coeff, -0.18411878423931247 AS sv_0, 0.4670017978456244 AS sv_1, -1.7720973589464624 AS sv_2, 0.2072268552988088 AS sv_3 UNION ALL SELECT 17 AS sv_idx, 0.06573310494470841 AS dual_coeff, -1.066080005073543 AS sv_0, -0.011203810899701985 AS sv_1, 0.1577150425811925 AS sv_2, 1.3577338073650969 AS sv_3 UNION ALL SELECT 18 AS sv_idx, 0.004484589254296689 AS dual_coeff, 0.6826754233314936 AS sv_0, -0.27216796886072964 AS sv_1, -1.161707552508324 AS sv_2, 0.7552985898220035 AS sv_3 UNION ALL SELECT 19 AS sv_idx, -1.0 AS dual_coeff, -1.1235642146527816 AS sv_0, 1.6831962197372268 AS sv_1, -1.7985020645272318 AS sv_2, -0.8477663172082077 AS sv_3 UNION ALL SELECT 20 AS sv_idx, -0.37420079769624487 AS dual_coeff, 1.6667800581458547 AS sv_0, -0.6183101662033021 AS sv_1, -0.7810149971816369 AS sv_2, -0.767384669273583 AS sv_3 UNION ALL SELECT 21 AS sv_idx, 0.4903809990837117 AS dual_coeff, -1.4593802161589065 AS sv_0, 0.7018378149519552 AS sv_1, -0.9101131840730574 AS sv_2, -1.2754210367439045 AS sv_3 UNION ALL SELECT 22 AS sv_idx, 0.3475629050931541 AS dual_coeff, -0.13407363073193884 AS sv_0, -1.2484766986547693 AS sv_1, 1.5947158390479141 AS sv_2, -1.4497212689408288 AS sv_3 UNION ALL SELECT 23 AS sv_idx, 0.43295220421515046 AS dual_coeff, -1.6669124897856253 AS sv_0, -0.8313958413955534 AS sv_1, 1.5909574525996735 AS sv_2, 0.72424156579339 AS sv_3 UNION ALL SELECT 24 AS sv_idx, 0.014422636656344048 AS dual_coeff, 1.093352025970274 AS sv_0, 0.37879673097191136 AS sv_1, 1.4295314017838043 AS sv_2, 0.09299261931469872 AS sv_3 UNION ALL SELECT 25 AS sv_idx, 0.2269673490396749 AS dual_coeff, 0.6411220484196439 AS sv_0, 1.1281510018558745 AS sv_1, 0.26693740474024635 AS sv_2, -1.2298826895146424 AS sv_3 UNION ALL SELECT 26 AS sv_idx, 0.319879517277242 AS dual_coeff, -1.2956953232218467 AS sv_0, 1.4987717050067189 AS sv_1, 0.6045319069288795 AS sv_2, -0.049480778656289616 AS sv_3 UNION ALL SELECT 27 AS sv_idx, 0.22934222692070466 AS dual_coeff, -0.3277555483076999 AS sv_0, 1.6444901489977306 AS sv_1, 0.025372893232512884 AS sv_2, -0.7554856825861698 AS sv_3 UNION ALL SELECT 28 AS sv_idx, 0.4519475007540892 AS dual_coeff, -0.706431594106171 AS sv_0, -0.9086748464408037 AS sv_1, 0.403260314283118 AS sv_2, -0.7506058198149691 AS sv_3 UNION ALL SELECT 29 AS sv_idx, -0.8209767202640984 AS dual_coeff, 2.010032312501274 AS sv_0, 0.09530861930129075 AS sv_1, -1.1913671710570366 AS sv_2, -1.618815287158773 AS sv_3 UNION ALL SELECT 30 AS sv_idx, 0.239199012014776 AS dual_coeff, 0.9946938352219382 AS sv_0, 1.4926969396282823 AS sv_1, -0.3469838908117189 AS sv_2, 0.4282157274143781 AS sv_3 UNION ALL SELECT 31 AS sv_idx, 0.4225349055924569 AS dual_coeff, -0.1743166818336495 AS sv_0, 1.1501017450587885 AS sv_1, 1.5363842711868212 AS sv_2, 1.551694080146041 AS sv_3 UNION ALL SELECT 32 AS sv_idx, 0.0012040308685201519 AS dual_coeff, 0.4817765801022509 AS sv_0, -1.2711686162379985 AS sv_1, 1.0632281967706563 AS sv_2, 1.1966669970792532 AS sv_3 UNION ALL SELECT 33 AS sv_idx, -0.5257481048790918 AS dual_coeff, 0.21406979439593113 AS sv_0, -1.5118055059174604 AS sv_1, -0.4015281963864979 AS sv_2, -0.039017517211154665 AS sv_3 UNION ALL SELECT 34 AS sv_idx, -0.7526149548200076 AS dual_coeff, 1.815625146237454 AS sv_0, -1.384316192930798 AS sv_1, 0.09691754614914039 AS sv_2, -0.8002898195560286 AS sv_3 UNION ALL SELECT 35 AS sv_idx, 0.009053056934630795 AS dual_coeff, 0.06939440587871522 AS sv_0, 0.6598021530180682 AS sv_1, 0.7397966688562451 AS sv_2, -1.4580455298122348 AS sv_3 UNION ALL SELECT 36 AS sv_idx, 0.2958752585434493 AS dual_coeff, -0.5000185056309808 AS sv_0, 0.6748373765105417 AS sv_1, -0.9220970631704556 AS sv_2, -0.08831240284391073 AS sv_3 UNION ALL SELECT 37 AS sv_idx, 0.10153462165145939 AS dual_coeff, 1.3325437335818797 AS sv_0, -0.1327888137316275 AS sv_1, 1.1097257527218722 AS sv_2, 0.8620713355322227 AS sv_3 UNION ALL SELECT 38 AS sv_idx, 0.19049924138479174 AS dual_coeff, -0.5952690272098226 AS sv_0, 1.534871416711849 AS sv_1, 0.3571820351748573 AS sv_2, 0.7883259704629011 AS sv_3 UNION ALL SELECT 39 AS sv_idx, -0.3858795772700389 AS dual_coeff, 1.3150556162964542 AS sv_0, -0.5059581919472076 AS sv_1, -1.0661972420808348 AS sv_2, 1.1270305001877208 AS sv_3 UNION ALL SELECT 40 AS sv_idx, 0.6628494734718064 AS dual_coeff, -1.2164497979438718 AS sv_0, 1.503310417535894 AS sv_1, -1.665981445490253 AS sv_2, -1.3456333509575589 AS sv_3 UNION ALL SELECT 41 AS sv_idx, -0.09580504617020164 AS dual_coeff, 0.9598310145490558 AS sv_0, -0.7961729965939714 AS sv_1, -0.9966868722889398 AS sv_2, 0.5325838215197826 AS sv_3 UNION ALL SELECT 42 AS sv_idx, 0.02416333321745339 AS dual_coeff, -0.008120044849170525 AS sv_0, 1.5461995199793308 AS sv_1, -0.39686978766106656 AS sv_2, -0.9878565201234888 AS sv_3 UNION ALL SELECT 43 AS sv_idx, 0.025415158069031867 AS dual_coeff, -0.65853839397246 AS sv_0, 0.4734713679176543 AS sv_1, 0.18031379770736736 AS sv_2, -1.168839753970359 AS sv_3 UNION ALL SELECT 44 AS sv_idx, 0.3806021441294375 AS dual_coeff, -0.0265344430722154 AS sv_0, -0.0283631248134526 AS sv_1, -0.739570601711903 AS sv_2, 0.16082809124136166 AS sv_3 UNION ALL SELECT 45 AS sv_idx, 0.16155583182488584 AS dual_coeff, -0.9894374348380393 AS sv_0, 1.1628195030168447 AS sv_1, -1.6348530109335948 AS sv_2, 0.06543940945798173 AS sv_3 UNION ALL SELECT 46 AS sv_idx, 0.4625894815096396 AS dual_coeff, -1.3445193007126655 AS sv_0, 0.476367891619324 AS sv_1, -1.0814171294453323 AS sv_2, 1.4174747937922738 AS sv_3 UNION ALL SELECT 47 AS sv_idx, 0.02745963241098681 AS dual_coeff, 0.2999722381446317 AS sv_0, -0.14070775481167647 AS sv_1, 0.12191963065926638 AS sv_2, 1.0898134566857745 AS sv_3 UNION ALL SELECT 48 AS sv_idx, -0.6196168836671114 AS dual_coeff, 1.248222153817392 AS sv_0, -1.563630716242603 AS sv_1, 0.8019197781960634 AS sv_2, 0.18477273030127928 AS sv_3 UNION ALL SELECT 49 AS sv_idx, -0.5875128775667448 AS dual_coeff, -0.08429331712502665 AS sv_0, -1.0999319759856232 AS sv_1, -1.4761017015390492 AS sv_2, -1.1829469095899825 AS sv_3 UNION ALL SELECT 50 AS sv_idx, 0.35581966787059294 AS dual_coeff, -1.6658117660425134 AS sv_0, -1.467078414584683 AS sv_1, -0.113981723147617 AS sv_2, 0.8450224213755827 AS sv_3 UNION ALL SELECT 51 AS sv_idx, 0.37828142159178874 AS dual_coeff, -1.6140966135148043 AS sv_0, -1.7643768278128538 AS sv_1, -0.6526951695405658 AS sv_2, 1.1878103980702412 AS sv_3 UNION ALL SELECT 52 AS sv_idx, 0.12810554662356152 AS dual_coeff, 0.9844415585345324 AS sv_0, -0.001260824801652486 AS sv_1, 0.8996658839265234 AS sv_2, 1.4677508300650692 AS sv_3 UNION ALL SELECT 53 AS sv_idx, -0.8501554559117989 AS dual_coeff, -1.0603027345726208 AS sv_0, -0.7477287119197084 AS sv_1, -1.6186493290430493 AS sv_2, 1.2695784995912052 AS sv_3 UNION ALL SELECT 54 AS sv_idx, 0.025930561131644443 AS dual_coeff, -1.306038787142802 AS sv_0, 0.2266223683034748 AS sv_1, 0.3037839265673539 AS sv_2, 0.7057290276196071 AS sv_3 UNION ALL SELECT 55 AS sv_idx, 0.2857931524738576 AS dual_coeff, -1.5606416440353499 AS sv_0, 0.3056175491951754 AS sv_1, -0.341654714080915 AS sv_2, 1.2672600790629271 AS sv_3 UNION ALL SELECT 56 AS sv_idx, 0.2671037315395514 AS dual_coeff, 1.75577554800642 AS sv_0, 0.962684681824095 AS sv_1, 1.0869930076042431 AS sv_2, 1.0379200088920848 AS sv_3 UNION ALL SELECT 57 AS sv_idx, 0.012899238103310857 AS dual_coeff, 0.977145951082381 AS sv_0, -1.505543173467996 AS sv_1, 1.3851794474085446 AS sv_2, -0.16142774484821756 AS sv_3 UNION ALL SELECT 58 AS sv_idx, 0.33446502344983503 AS dual_coeff, 1.3069659327192833 AS sv_0, 0.1863010691495513 AS sv_1, 1.5113442172696083 AS sv_2, -1.5876587304789196 AS sv_3 UNION ALL SELECT 59 AS sv_idx, 0.4344987146788457 AS dual_coeff, 0.16613621334490802 AS sv_0, -0.3981922001971783 AS sv_1, -0.7654272731239506 AS sv_2, -1.6133263333529493 AS sv_3 UNION ALL SELECT 60 AS sv_idx, 0.1607121677422245 AS dual_coeff, -0.42108445214179907 AS sv_0, -0.7956179870088257 AS sv_1, 0.8882620716406048 AS sv_2, 0.4675929961430876 AS sv_3 UNION ALL SELECT 61 AS sv_idx, 0.3286642104067334 AS dual_coeff, -1.6042453407535435 AS sv_0, -0.26487689620125343 AS sv_1, 1.3528981281701018 AS sv_2, 1.1669888744725379 AS sv_3 UNION ALL SELECT 62 AS sv_idx, 0.37272852024166975 AS dual_coeff, -0.917278251770317 AS sv_0, -1.4509035319107564 AS sv_1, -0.2786390833534205 AS sv_2, -1.3827993897154927 AS sv_3 UNION ALL SELECT 63 AS sv_idx, 0.32272950732223243 AS dual_coeff, 1.3477086249535588 AS sv_0, 0.795308777919337 AS sv_1, 1.5593635512024997 AS sv_2, -0.07389069627856555 AS sv_3 UNION ALL SELECT 64 AS sv_idx, 0.19086344422175394 AS dual_coeff, -0.33584226456881233 AS sv_0, -0.5694885143919526 AS sv_1, 0.28146542960356485 AS sv_2, 1.567207446356592 AS sv_3 UNION ALL SELECT 65 AS sv_idx, 0.2060716563656592 AS dual_coeff, -0.379139513858032 AS sv_0, 0.21256401016685286 AS sv_1, 0.751116144040438 AS sv_2, -1.5580393682099034 AS sv_3 UNION ALL SELECT 66 AS sv_idx, 0.11951777851778295 AS dual_coeff, -0.3774886879153139 AS sv_0, 0.09160188642436172 AS sv_1, 1.4845066754343577 AS sv_2, -1.076465022258961 AS sv_3 UNION ALL SELECT 67 AS sv_idx, 0.3854477708890352 AS dual_coeff, -0.983380385417142 AS sv_0, -0.18235220597772892 AS sv_1, -1.4685459931960436 AS sv_2, 0.2129505388767858 AS sv_3) AS `Values`), 
kernel_dp AS 
(SELECT t.`KEY` AS `KEY`, t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv.`KEY` AS `KEY`, sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + -0.0183602981781796 AS dot_product 
FROM (SELECT kernel_input_with_scaling.`KEY` AS `KEY`, `SV_data`.dual_coeff * exp(least(100.0, greatest(-100.0, -1.0 * (power(kernel_input_with_scaling.`Feature_0` - `SV_data`.sv_0, 2) + power(kernel_input_with_scaling.`Feature_1` - `SV_data`.sv_1, 2) + power(kernel_input_with_scaling.`Feature_2` - `SV_data`.sv_2, 2) + power(kernel_input_with_scaling.`Feature_3` - `SV_data`.sv_3, 2))))) AS dot_prod1 
FROM kernel_input_with_scaling, `SV_data`) AS full_join_data_sv GROUP BY full_join_data_sv.`KEY`) AS t)
 SELECT kernel_dp.`KEY` AS `KEY`, 1.3612342030259188 + 0.2740412358892127 * kernel_dp.dot_product AS `Estimator` 
FROM kernel_dp