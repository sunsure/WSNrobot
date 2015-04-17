function exampleCallingfixMTSPwaypointsforTwoRobotCase(waypoints,nRobots)
% waypoints position needs to be given;
% number of robots need to be mentioned;
waypoints=[              0         0
    1.5666    0.6141
    2.3415    1.7018
    2.5978    2.3467
    1.0287    2.2551
    2.3498    2.9911
    3.3855    4.8906
    4.7695    6.7555
    6.8351    9.0446
    7.8666    9.6395
    7.3280   10.4516
    9.1954   10.2322
   10.3905    8.0013
    8.9001    7.6432
    6.7422    5.2761
    4.5798    3.1806
    2.4076    1.2928
         0         0
  -10.0906   -9.4392
   -7.1065  -10.1383
   -7.4857   -9.0418
  -10.0559   -7.8263
   -9.7435   -6.9776
   -7.8462   -5.4912
   -6.1200   -4.2623
   -4.5079   -3.2495
   -2.9643   -2.2900
   -2.4789   -1.2889
   -0.5165   -1.3443
   -1.2427   -2.6482
   -2.3566   -2.6838
   -2.6102   -2.9429
   -2.3299   -2.9325
   -2.0364   -2.6117
         0         0
    3.3343   -6.8655
    3.2098   -8.1217
    4.1656   -5.1963
    2.9698   -3.7578
    1.5139   -2.6404
    1.7391   -1.3785
    2.4741   -1.8954
    5.0216   -3.6436
    7.0758   -3.6681
    7.7119   -2.8270
    8.0457   -2.8861
    8.6455   -4.2876
    7.9913   -6.6198
    6.3069   -5.6286
    6.3090   -8.0032
    8.3885   -8.4409
         0         0
   -7.4700    3.1829
   -6.6460    4.2976
   -5.1608    4.2399
   -8.7772    4.3214
   -8.1437    6.9970
   -7.9433    8.5667
   -5.6096    7.5246
   -6.4260    5.8560
   -4.6018    5.7769
   -4.3059    8.7033
   -2.9616    8.2505
   -3.7351    7.2497
   -1.3935    2.7478
   -3.1153    4.0119
   -3.2768    2.1892
   -1.6303    1.2664];
% waypoints=[         0         0
%     0.2864    1.5964
%     1.1320    2.9581
%     3.3177    5.0719
%     5.3626    7.1116
%     7.3387    9.1177
%     7.4437   10.4831
%     8.8483    9.8147
%    10.3993    9.9322
%    10.4140    7.6449
%     8.9158    7.7503
%     6.8809    6.0761
%     4.8311    4.4549
%     2.7465    2.9202
%     2.1293    1.8927
%     2.4187    0.9538
%     1.2593    0.5237
%          0         0
%    -1.2921    2.6098
%    -3.0837    4.2248
%    -4.7255    5.5846
%    -4.0611    7.1279
%    -3.0227    8.1657
%    -4.3742    8.8037
%    -5.7378    7.3682
%    -7.8562    8.6780
%    -8.2812    7.2050
%    -8.9600    4.2684
%    -7.6776    3.3268
%    -6.6597    4.4287
%    -6.6565    5.8905
%    -5.0285    3.8940
%    -3.3468    2.4064
%    -1.9273    1.1041
%          0         0
%     1.3110   -2.5730
%     2.8536   -3.6045
%     4.1251   -5.1270
%     3.4833   -6.9587
%     3.1700   -8.3324
%     6.2655   -8.0768
%     8.4669   -8.6407
%     8.1339   -7.0638
%     8.5739   -4.7441
%     8.5928   -3.1657
%     7.3271   -2.9564
%     6.9044   -4.3002
%     6.2544   -5.7536
%     5.0195   -3.6430
%     2.5008   -2.1246
%     1.8014   -1.0351
%          0         0
%    -1.7885   -0.6485
%    -3.2054   -1.6096
%    -5.3909   -3.4101
%    -7.5726   -5.1958
%    -9.7523   -6.9760
%   -10.0971   -8.4723
%   -10.1052  -10.0603
%    -7.2138  -10.2570
%    -7.1892   -9.1092
%    -4.9983   -6.2174
%    -2.7966   -3.3341
%    -1.5626   -3.1474
%    -2.6383   -2.5304
%    -1.8550   -1.7943
%    -0.7569   -2.2087
%     0.0064   -1.1506];
nRobots=4;

fixMTSPwaypoints(waypoints,nRobots)

end