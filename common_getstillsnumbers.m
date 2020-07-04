function ThisNumFrames = common_getstillsnumbers(ClipNum)
%
%

NumberOfFramesInEachMovie = [
    1,1332;
    2,1484;
    3,1155;
    4,1601;
    5,2099;
    6,1109;
    7,1016;
    8,1406;
    9,1249;
    10,1128;
    11,1241;
    12,1317;
    13,1484;
    14,1130;
    15,3663;
    16,3535;
    17,4217;
    18,10097;
    19,6200; % Phil estimated #frames for TRUK19 and HALO20 based on drucevan_01_1_raw.iscan92 on 29MAR2006
    20,3124; % ditto
    21,3834;
    22,7141;
    23,3215;
    24,1988;
    25,4043;
    26,2043;
    27,667;
    28,3100;
    29,4034;
    30,3345;
    31,1425;
    32,610;
    33,1320;
    34,1527;
    35,772;
    36,3199;
    37,493;
    38,1091;
    39,470;
    40,276;
    41,1157;
    42,758;
    43,581;
    44,379;
    45,848;
    46,173;
    47,364;
    48,919;
    49,684;
    50,625;
    51,478;
    52,674;
    53,885;
    54,1273;
    55,956;
    56,815;
    57,505;
    58,521;
    59,645;
    60,737;
    61,1512;
    62,975;
    63,777;
    64,496;
    65,447;
    66,733;
    67,178;
    68,1150;
    69,1669;
    70,1078;
    71,1375;
    72,900;
    73,1128;
    74,986;
    75,2207;
    76,1529;
    77,1324;
    78,646;
    79,650;
    80,1849;
    81,922;
    82,791;
    83,791;
    84,301;
    85,301;
    86,922;
    87,922;
    88,971;
    89,971;
    90,1066;
    91,1066;
    92,821;
    93,821;
    94,856;
    95,856;
    96,64;%LFIT
    97,40;%LFIT
    98,0;%NONE
    99,0;%NONE
    100,0;%NONE
    101,NaN;
    102,NaN;
    103,NaN;
    104,NaN;
    105,NaN;
    106,633;
    107,491;
    108,446;
    109,700;
    110,652;
    111,715;
    112,532;
    113,545;
    114,806;
    115,882;
    116,564;
    117,661;
    118,539;
    119,428;
    120,590;
    121,511;
    122,691;
    123,712;
    124,635;
    125,1304;
    126,1474;
    127,708;
    128,649;
    129,690;
    130,2222;
    131,5478;
    132,698;
    133,686;
    134,574;
    135,296;
    136,659;
    137,578;
    138,430;
    139,591;
    140,662;
    141,756;
    142,800;
    143,600;
    144,602;
    145,456;
    146,541;
    147,627;
    148,791;
    149,448;
    150,531;
    151,355;
    152,701;
    153,530;
    154,665;
    155,625;
    156,617;
    157,802;
    158,564;
    159,652;
    160,562;
    161,726;
    162,617;
    163,645;
    164,732;
    165,429;
    166,748;
    167,776;
    168,560;
    169,285;
    170,438;
    171,458;
    172,742;
    173,1041;
    174,713;
    175,285;%VIMO
    176,301;%VIMO
    177,301;%VIMO
    178,300;%VIMO
    183,252;%FMRI
    184,252;%FMRI
    185,202;%FMRI
    186,202;%FMRI
    187,141;%FMRI
    
    %% The following changes (movies 188-214) were made by Warren on 2007-07-15.
    %% There may be movie number conflicts, either with 188 (FMRI and TV24), or
    %% with 189-194 (GRID vs PSOL and CLSE).
    
    188,2505;
    189,951;
    190,453;
    191,1174;
    192,1981;
    193,1248;
    194,1122;
    195,1056;
    196,666;
    197,3309;
    198,1274;
    199,517;
    200,2262;
    201,3630;
    202,912;
    203,2031;
    204,858;
    205,1839;
    206,1290;
    207,627;
    208,2082;
    209,2733;
    210,1995;
    211,895;
    212,999;
    213,13373;
    214,6870;
    
    %    189,3326;%first GRID
    %    190,1800;%second GRID
    %    191,1800;%copy of second GRID
    %    192,1800;
    %    193,1800;
    %    194,1800;
    
    219,252;%FMRI
    220,252;%FMRI
    221,202;%FMRI
    222,202;%FMRI
    223,141;%FMRI
    224,257;%FMRI
    225,257;%FMRI
    226,141;%FMRI
    
    227,240; %start AVSN Movies
    228,240;
    229,240;
    230,240;
    231,240;
    232,240;
    233,240;
    234,240;
    235,240;
    236,240;
    237,240;
    238,240;
    239,240;
    240,240;
    241,240;
    242,240;
    243,240;
    244,240;
    245,240;
    246,240;
    247,240;
    248,240;
    249,240;
    250,240;
    251,240;
    252,240;
    253,240;
    254,240;
    255,240;
    256,240;
    257,240;
    258,240;
    259,240;
    260,240;
    261,240;
    262,240;
    263,240;
    264,240;
    265,240;
    266,240;
    267,240;
    268,240;
    269,240;
    270,240;
    271,240;
    272,240;
    273,240;
    274,240;
    275,240;
    276,240;
    277,240;
    278,240;
    279,240;
    280,240;
    281,240;
    282,240;
    283,240;
    284,240;
    285,240;
    286,240;
    287,240;
    288,240;
    289,240;
    290,240;
    291,240;
    292,240;
    293,240;
    294,240;
    295,240;
    296,240;
    297,240;
    298,240;
    299,240;
    300,240;
    301,240;
    302,240;
    303,240;
    304,240;
    305,240;
    306,240;
    307,240;
    308,240;
    309,240;
    310,240;
    311,240;
    312,240;
    313,240;
    314,240;
    315,240;
    316,240;
    317,240;
    318,240; %End AVSN Movies
    
    
    319,208;
    320,208;
    321,208;
    322,208;
    323,208;
    324,178;
    325,178;
    326,141;%FMRI
    327,141;%FMRI
    328,140;%FMRI
    329,140;%FMRI
    
    330,971;
    331,971;
    332,971;
    333,971;%ANIM revised 2008-07
    334,240; %AVSN new 2009-2-2 (by Jessie)
    
    335,1682; %PEER added by Peter 2009-08
    336,380;
    337,1232;
    338,1273;
    339,1577;
    340,2006;
    341,1551;
    342,991;
    343,1893;
    344,999;
    345,2692;
    346,1370;
    347,829;
    348,2679;
    349,1743;
    350,433;
    351,1707;
    352,1868;
    353,953; %end PEER added by Peter 2009-08
    
    354,791; %ANIM clips for infants added by Sarah 06/01/09
    355,791;
    356,922;
    357,922;
    358,971;
    359,971;
    360,1066;
    361,1066;
    362,821;
    363,821;
    364,300;
    365,300;
    366,300;
    367,300;
    368,300;
    369,300;
    370,300;
    371,300;
    372,300;
    373,300;
    374,300;
    375,300;
    376,300;
    377,300;
    378,300;
    379,300;
    380,300;
    381,300;
    382,300;
    383,300; % end of new ANIM clips
    
    419,3193; % added by caitlin and sarah 09/03/09, willy wonka

    424,1713;
    425,1713;
    426,1887;
    427,1887;
    428,1792;
    429,1792;
    430,1988;
    431,1988;
    432, 1762; % added 2014-12-12 by robin
    433, 1762; % added 2014-12-12 by robin
    
    
	434,240; % Start new AVSN clips, added 2009-11-20 by Jessie
	435,240;
	436,240;
	437,240;
	438,240;
	439,240;
	440,240;
	441,240;
	442,240;
	443,240;
	444,240;
	445,240;
	446,240;
	447,240;
	448,240;
	449,240;
	450,240;
	451,240;
	452,240;
	453,240;
	454,240;
	455,240;
	456,240;
	457,240;
	458,240;
	459,240;
	460,240;
	461,240; % End new AVSN clips
    
							 500,680; %Start new MONK clips, added 080510 by JB
							 501,436;
							 502,441;
							 503,1002;
							 504,395;
							 505,411;
							 506,1088;
							 507,351;
							 508,1173;
							 514,406;
							 515,636;
							 516,770;
							 517,981;
							 518,1158;
							 519,535;
							 520,1596;
							 521,5448;
							 522,5564;
							 523,1104;
							 524,2263;
							 525,815;
							 526,1204;
							 527,1508;
							 528,1356;
							 529,1176;
							 530,1209;
							 531,903;
							 532,1874;
							 533,441;
							 534,2041;
							 535,1322;
							 536,456;
							 537,1503;
							 538,1503;
							 539,903;
							 540,902;
							 541,756;
							 542,201;
							 543,705;
							 544,546;
							 545,1176; %End new MONK clips    
							 
							 546,1091; %Flip CARE - JB 032211
							 547,470;
							 548,276;
							 549,1157;
							 550,758;
							 551, 581;
							 552, 379;
							 553, 848;
							 554, 173;
							 555, 364;
							 556, 919;
							 557, 684;
							 558, 625;
							 559, 478;
							 
							 560,446; % start AVSN Dynamic Clips added by Andrea 2011-3-17
							 561,446;
							 562,446;
							 563,446;
							 564,446;
							 565,277;
							 566,277;
							 567,769;
							 568,769;
							 569,708;
							 570,708;
							 571,718;
							 572,718;
							 573,664;
							 574,664;
							 575,548;
							 576,548;
							 577,586;
							 578,586;
							 579,445;
							 580,445;
							 581,628;
							 582,628;
							 583,683;
							 584,683;
							 585,511;
							 586,511;
							 587,532;
							 588,532;
							 589,788;
							 590,788;
							 591,716;
							 592,716;
							 593,597;
							 594,597;
							 595,511;
							 596,511;
							 597,532;
							 598,532;
							 599,788;
							 600,788;
							 601,716;
							 602,716;
							 603,597;
							 604,597; % end AVSN Dynamic Clips
							 
							 %Parr Monkey Movies ADDED BY SH 9/6/2012

	605,301;
606,301;
607,301;
608,301;
609,301;
610,301;
611,301;
612,301;
613,301;
614,301;
615,301;
616,301;
617,301;
618,301;
619,301;
620,301;
621,301;
622,301;
623,301;
624,301;
625,301;
626,301;
627,301;
628,301;
629,301;
630,301;
631,301;
632,301;
633,301;
634,301;
635,301;
636,301;
637,301;
638,301;
639,301;
640,301;
641,301;
642,301;
643,301;
644,301;
645,301;
646,301;
647,301;
648,301;
649,301;
650,301;
651,301;
652,301;
653,301;
654,301;
655,301;
656,301;
657,301;
658,301;
659,301;
660,301;
661,301;
662,301;
663,301;
664,301;

670,601;
674,556;
675,601;
677,601;
686,601;
690,601;
698,601;
701,601;

707,333;
716,602;
718,391;
719,601;
720,526;
721,601;
727,602;
733,601;
747,600;
749,601;
752,981;
761,603;
764,601;
765,601;
768,601;
770,481;
773,602;
775,601;
783,601;
787,601;
791,601;
802,605;
803,241;
804,241;
805,241;
806,241;
807,241;
808,241;
809,241;
810,241;
811,241;
813,241;
814,241;
815,241;
816,241;
829,301;
830,301;
831,301;
832,301;
833,301;
849,301;
850,301;
851,301;
879,301;
880,301;
881,301;
889,301;
890,301;
892,301;
						 
893,301;
929,301;
930,301;
931,301;
							 
							 
							 
939,301;
940,301;
941,301;
942,301;
943,301;
1073,301;
							 
							 
973,301;
    
							 
					
1000,151;
1001,151;
							 
							 
1002,151;
							 
1069,301;
1070,301;
1072,301;
1073,301;
1119,151;
1120,151;
1121,151;
1129,301;
1130,301;
1131,301;
1189,301;
1190,301;
1191,301;
1249,301;
1250,301;
1251,301;

1309,301;							
1310,301;
1311,301;

1375,301;							
1376,301;
1377,301;

1411,301;							
1412,301;
1413,301;

1476,300; %Start BLNK movies (1476-1487 = INST, 1488 = RESP, 1489-1514 = BLNK)
1477,300;
1478,300;
1479,300;
1480,300;
1481,300;
1482,300;
1483,300;
1484,300;
1485,300;
1486,300;
1487,300; 
1488,300;
1489,3480;
1490,3576;
1491,3588;
1492,3592;
1493,3594;
1494,2996;
1495,3596;
1496,4192;
1497,4792;
1498,2695;
1499,2996;
1500,3296;
1501,3596;
1502,3480;
1503,3576;
1504,3588;
1505,3592;
1506,3594;
1507,2996;
1508,3596;
1509,4192;
1510,4792;
1511,2696;
1512,2996;
1513,3296;
1514,3596; %End BLNK movies



9000,300; %beginning of repeated INST and RESP movies
9001,300;
9002,300;
9003,300;
9004,300;
9005,300;
9006,300;
9007,300;
9008,300;
9009,300;
9010,300;
9011,300;
9012,300;
9013,300;
9014,300;
9015,300;
9016,300;
9017,300;
9018,300;
9019,300;
9020,300;
9021,300;
9022,300;
9023,300;
9024,300;
9025,300; %end of repeated INST and RESP movies

9026,86; %start of CRSM movies (all the same! just place holders...)
9027,86;
9028,86;
9029,86;
9030,86;
9031,86;
9032,86;
9033,86;
9034,86;
9035,86;
9036,86;
9037,86;
9038,86;
9039,86;
9040,86;
9041,86;
9042,86;
9043,86;
9044,86;
9045,86;
9046,86;
9047,86;
9048,86;
9049,86;
9050,86;
9051,86;
9052,86;
9053,86;
9054,86;
9055,86;
9056,86;
9057,86;
9058,86;
9059,86;
9060,86;
9061,86;
9062,86;
9063,86;
9064,86;
9065,86;
9066,86;
9067,86;
9068,86;
9069,86;%end of CRSM movies
							 
			 
							 
							 999,0;%NONE
							 9997,100;%DEMO
							 9998,100;%DEMO
							 9999,100;%DEMO
							 ];


%NumberOfFramesInEachMovie(:,1)=[];
%ThisNumFrames = NumberOfFramesInEachMovie(ClipNum);

FindThisIdx=find(NumberOfFramesInEachMovie(:,1)==ClipNum);
ThisNumFrames = NumberOfFramesInEachMovie(FindThisIdx,2);
