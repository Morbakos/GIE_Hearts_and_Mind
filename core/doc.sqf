private _MainCategory = localize "str_3den_display3den_menubar_helpdoc_text";
player createDiarySubject [_MainCategory, _MainCategory];

// Prisonniers
player createDiaryRecord [_MainCategory, ["Gestion des prisonniers", "Capturer, soigner et remettre des prisonniers ennemis à l'officier de police militaire vous permettra de gagner plus rapidement en réputation qu'en éliminant les hostiles. Laissez simplement les prisonniers dans la court de la prison puis parlez à l'officier."]];

//Headless and Data base
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_DOC_HEADLESS_TITLE", localize "STR_BTC_HAM_DOC_HEADLESS_TEXT"]];

//Chemical warfare
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_DOC_CHEMICALWARFARE_TITLE", localize "STR_BTC_HAM_DOC_CHEMICALWARFARE_TEXT"]];

//Spectrum devices
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_DOC_SPECTRUMDEVICES_TITLE", localize "STR_BTC_HAM_DOC_SPECTRUMDEVICES_TEXT"]];

//Vehicles
player createDiaryRecord [_MainCategory, [localize "str_a3_cfghints_command_vehicles1", localize "STR_BTC_HAM_DOC_VEHICLES_TEXT"]];

//Side Mission
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_DOC_SIDEMISSION_TITLE", localize "STR_BTC_HAM_DOC_SIDEMISSION_TEXT"]];

//Respawn position
player createDiaryRecord [_MainCategory, [localize "str_a3_cfgvehicles_modulerespawnposition_f_0", localize "STR_BTC_HAM_DOC_FOB_TEXT"]];

//Sling loading
player createDiaryRecord [_MainCategory, [localize "STR_A3_SlingLoad1", localize "STR_BTC_HAM_DOC_SLING_TEXT"]];

//Logistic point
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_MSQM_MRK_LOGPOINT", localize "STR_BTC_HAM_DOC_LOGISTICP_TEXT"]];

//Logistic
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_ACTION_LOC_MAIN", localize "STR_BTC_HAM_DOC_LOGISTIC_TEXT"]];

//Hideout
player createDiaryRecord [_MainCategory, [localize "str_a3_campaign_b_m03_marker02", localize "STR_BTC_HAM_DOC_HIDEOUT_TEXT"]];

//IED
player createDiaryRecord [_MainCategory, ["IED", localize "STR_BTC_HAM_DOC_IED_TEXT"]];

//Intel
player createDiaryRecord [_MainCategory, [localize "str_a3_mdl_category_intel", localize "STR_BTC_HAM_DOC_INTEL_TEXT"]];

//Reputation
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_DOC_REPUTATION_TITLE", localize "STR_BTC_HAM_DOC_REPUTATION_TEXT"]];

//Orders
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_ACTION_ORDERS_MAIN", localize "STR_BTC_HAM_DOC_ORDERS_TEXT"]];

//Traffic
player createDiaryRecord [_MainCategory, [localize "STR_BTC_HAM_DOC_TRAFFIC_TITLE", localize "STR_BTC_HAM_DOC_TRAFFIC_TEXT"]];

//Version
player createDiaryRecord [_MainCategory, [localize "STR_A3_FM_Welcome4",
        format (["<img image='\A3\ui_f\data\igui\cfg\simpleTasks\types\download_ca.paa' width='20' height='20'/> Version %1.%2.%3 <img image='\A3\ui_f\data\igui\cfg\simpleTasks\types\download_ca.paa' width='20' height='20'/> <br/><br/> <img image='\a3\missions_f_orange\Data\Img\orange_overview_ca.paa' width='355' height='200'/>"] + btc_version)
    ]
];
