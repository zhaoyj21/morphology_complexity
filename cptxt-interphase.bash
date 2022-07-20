#!/bin/bash
for n in 3 4 5 19 52 54 55 64 65 69 70 74 78 79 80 83 84 85 90 100 104 110 113 114 124 125 129 130 134 135 144 145 148 159 160 163 165 173 174 175 184 185 199 200 223 224 233 234 235 263 265 268 269 282 284 285 292 294 295 305 310 314 323 325 330 344 345 354 355 370 389 398 405 415 425 450 462 463 464 465 504 505 522 523 533 535 549 564 570 579 584 593 623 629 630 638 650 659 660 685 698 699 700 704 705 714 749 760 775 804 805 810 824 825 835 850 853 855 879 880 883 895 900 905 954 955 961 962 963 964 965 966 967 969 971 976 981 987 988 989 990 991 992 993 994 995 996 997 999 1001 1002 1006 1007 1016 1017 1018 1019 1020 1022 1023 1024 1025 1027 1028 1029 1037 1041 1047 1048 1049 1050 1052 1053 1054 1055 1059 1067 1071 1078 1080 1084 1085 1089 1090 1094 1095 1099 1100 1104 1105 1109 1110 1114 1115 1119 1120 1124 1125 1129 1130 1134 1135 1139 1140 1144 1145 1149 1150 1154 1155 1159 1160 1164 1165 1169 1170 1174 1175 1179 1180 1184 1185 1189 1190 1194 1195 1199 1200 1204 1205 1209 1210 1214 1215 1219 1220 1224 1225 1229 1230 1234 1235 1239 1240 1243 1244 1245 1249 1250 1254 1255 1259 1260 1264 1265 1269 1270 1274 1275 1279 1280 1284 1285 1289 1290 1294 1295 1299 1300 1304 1305 1309 1310 1314 1315 1319 1320 1324 1325 1329 1330 1334 1335 1339 1340 1344 1345 1349 1350 1354 1355 1359 1360 1364 1365 1369 1370 1374 1375 1379 1380 1384 1385 1389 1390 1394 1395 1399 1400 1404 1405 1408 1409 1410 1414 1415 1419 1420 1424 1425 1429 1430 1433 1434 1435 1439 1440 1444 1445 1449 1450 1454 1455 1459 1460 1464 1465 1468 1469 1470 1474 1475 1478 1479 1480 1483 1484 1485 1489 1490 1494 1495 1499 1500 1504 1505 1509 1510 1514 1515 1519 1520 1524 1525 1528 1529 1530 1534 1535 1539 1540 1544 1545 1549 1550 1554 1555 1559 1560 1564 1565 1569 1570 1574 1575 1579 1580 1584 1585 1589 1590 1594 1595 1598 1599 1600 1604 1605 1609 1610 1614 1615 1619 1620 1624 1625 1629 1630 1634 1635 1639 1640 1644 1645 1649 1650 1654 1655 1658 1659 1660 1664 1665 1669 1670 1674 1675 1679 1680 1684 1685 1689 1690 1694 1695 1699 1700 1703 1704 1705 1709 1710 1714 1715 1719 1720 1724 1725 1729 1730 1734 1735 1739 1740 1744 1745 1749 1750 1754 1755 1759 1760 1764 1765 1769 1770 1774 1775 1779 1780 1783 1784 1785 1789 1790 1793 1794 1795 1799 1800 1804 1805 1809 1810 1814 1815 1819 1820 1824 1825 1829 1830 1834 1835 1839 1840 1844 1845 1849 1850 1854 1855 1859 1860 1864 1865 1869 1870 1874 1875 1879 1880 1884 1885 1889 1890 1894 1895 1899 1900 1904 1905 1909 1910 1914 1915 1919 1920 1924 1925 1929 1930 1934 1935 1940 1944 1945 1949 1950 1954 1955 1959 1960 1963 1964 1965 1969 1970 1973 1974 1975 1979 1980 1984 1985 1989 1990 1994 1995 1999 2000 2004 2005 2009 2010 2014 2015 2018 2019 2020 2024 2025 2029 2030 2033 2034 2035 2039 2040 2043 2044 2045 2048 2049 2050 2053 2054 2055 2058 2059 2060 2063 2064 2065 2068 2069 2070 2073 2074 2075 2078 2079 2080 2083 2084 2085 2088 2089 2090 2093 2094 2095 2098 2099 2100 2103 2104 2105 2108 2109 2110 2113 2114 2115 2118 2119 2120 2123 2124 2125 2128 2129 2130 2133 2134 2135 2138 2139 2140 2143 2144 2145 2148 2149 2150 2153 2154 2155 2158 2159 2160 2194 2195 2196 2205 2206 2207 2208 2242 2243 2244 2253 2254 2255 2278 2279 2280 2289 2290 2291 2292 2300 2301 2302 2303 2304 2313 2314 2315 2316 2323 2324 2325 2326 2327 2328 2335 2336 2337 2338 2339 2340 2347 2348 2349 2350 2351 2352 2359 2360 2361 2362 2363 2364 2372 2373 2374 2375 2376 2383 2384 2385 2386 2387 2388 2395 2396 2397 2398 2399 2400 2406 2407 2408 2409 2410 2411 2412 2419 2420 2421 2422 2423 2424 2432 2433 2434 2435 2436 2443 2444 2445 2446 2447 2448 2455 2456 2457 2458 2459 2460 2466 2467 2468 2469 2470 2471 2472 2479 2480 2481 2482 2483 2484


do
    cp  /data/home/zhaoyj/01ML/LF/TXT/$n.txt      /data/home/zhaoyj/01ML/owndata_2/interphase/interphase_$n.txt
done