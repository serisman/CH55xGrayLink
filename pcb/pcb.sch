EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR06
U 1 1 5AF4F2D9
P 3800 4100
F 0 "#PWR06" H 3800 3850 50  0001 C CNN
F 1 "GND" H 3800 3950 50  0000 C CNN
F 2 "" H 3800 4100 50  0001 C CNN
F 3 "" H 3800 4100 50  0001 C CNN
	1    3800 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5AF4F9F3
P 4200 4100
F 0 "#PWR010" H 4200 3850 50  0001 C CNN
F 1 "GND" H 4200 3950 50  0000 C CNN
F 2 "" H 4200 4100 50  0001 C CNN
F 3 "" H 4200 4100 50  0001 C CNN
	1    4200 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR011
U 1 1 5AF500C6
P 3800 3800
F 0 "#PWR011" H 3800 3650 50  0001 C CNN
F 1 "+3.3V" H 3800 3940 50  0000 C CNN
F 2 "" H 3800 3800 50  0001 C CNN
F 3 "" H 3800 3800 50  0001 C CNN
	1    3800 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5AF513AF
P 3850 3350
F 0 "#PWR013" H 3850 3100 50  0001 C CNN
F 1 "GND" H 3850 3200 50  0000 C CNN
F 2 "" H 3850 3350 50  0001 C CNN
F 3 "" H 3850 3350 50  0001 C CNN
	1    3850 3350
	1    0    0    -1  
$EndComp
$Comp
L CH55x:CH55xG U1
U 1 1 5EC5B577
P 5150 3150
F 0 "U1" H 5150 3765 50  0000 C CNN
F 1 "CH55xG" H 5150 3674 50  0000 C CNN
F 2 "project modules:SOIC-16_3.9x9.9mm_P1.27mm" H 5150 3150 50  0001 C CNN
F 3 "" H 5150 3150 50  0001 C CNN
	1    5150 3150
	1    0    0    -1  
$EndComp
Text Label 5700 2800 0    60   ~ 0
+3V3
Text Label 5700 3000 0    60   ~ 0
GND
Text Label 5700 2900 0    60   ~ 0
+5V
Text Label 4600 3200 2    60   ~ 0
RING
Text Label 5700 3100 0    50   ~ 0
UD-
Text Label 5700 3200 0    50   ~ 0
UD+
Text Label 4150 2950 0    50   ~ 0
UD+
Text Label 4150 3050 0    50   ~ 0
UD-
$Comp
L power:+5V #PWR05
U 1 1 5AF4F25B
P 4200 3800
F 0 "#PWR05" H 4200 3650 50  0001 C CNN
F 1 "+5V" H 4200 3940 50  0000 C CNN
F 2 "" H 4200 3800 50  0001 C CNN
F 3 "" H 4200 3800 50  0001 C CNN
	1    4200 3800
	1    0    0    -1  
$EndComp
Text Label 5350 3950 0    50   ~ 0
UD+
Text Label 4850 3950 2    60   ~ 0
+3V3
$Comp
L power:+5V #PWR01
U 1 1 5AF4E65D
P 4250 2650
F 0 "#PWR01" H 4250 2500 50  0001 C CNN
F 1 "+5V" H 4250 2790 50  0000 C CNN
F 2 "" H 4250 2650 50  0001 C CNN
F 3 "" H 4250 2650 50  0001 C CNN
	1    4250 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5EC689BE
P 5000 3950
F 0 "R1" V 4900 3950 50  0000 C CNN
F 1 "12k" V 5000 3950 50  0000 C CNN
F 2 "project modules:R_0805" V 4930 3950 50  0001 C CNN
F 3 "~" H 5000 3950 50  0001 C CNN
	1    5000 3950
	0    1    -1   0   
$EndComp
$Comp
L Device:C C1
U 1 1 5EC6F7AA
P 4200 3950
F 0 "C1" H 4225 4050 50  0000 L CNN
F 1 "100n" H 4225 3850 50  0000 L CNN
F 2 "project modules:C_0805" H 4238 3800 50  0001 C CNN
F 3 "" H 4200 3950 50  0001 C CNN
	1    4200 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5AF4EA88
P 3800 3950
F 0 "C2" H 3825 4050 50  0000 L CNN
F 1 "100n" H 3825 3850 50  0000 L CNN
F 2 "project modules:C_0805" H 3838 3800 50  0001 C CNN
F 3 "" H 3800 3950 50  0001 C CNN
	1    3800 3950
	1    0    0    -1  
$EndComp
Text Label 4600 2900 2    60   ~ 0
TIP
NoConn ~ 5700 3300
NoConn ~ 5700 3400
NoConn ~ 5700 3500
NoConn ~ 4600 3300
NoConn ~ 4600 3400
NoConn ~ 4600 3500
NoConn ~ 4600 3000
NoConn ~ 4600 3100
NoConn ~ 4600 2800
$Comp
L Connector:USB_A J1
U 1 1 617DEB30
P 3850 2950
F 0 "J1" H 3850 3400 50  0000 C CNN
F 1 "USB_A" H 3850 3300 50  0000 C CNN
F 2 "project modules:USB_A_Horizontal_C319178" H 4000 2900 50  0001 C CNN
F 3 " ~" H 4000 2900 50  0001 C CNN
	1    3850 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2750 4250 2750
Wire Wire Line
	4250 2750 4250 2650
Wire Wire Line
	3750 3350 3850 3350
Connection ~ 3850 3350
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 617E49F7
P 6550 3150
F 0 "J2" H 6550 2950 50  0000 C CNN
F 1 "TRS" V 6650 3150 50  0000 C CNN
F 2 "project modules:PinHeader_1x03_P2.54mm_Horizontal" H 6550 3150 50  0001 C CNN
F 3 "~" H 6550 3150 50  0001 C CNN
	1    6550 3150
	1    0    0    1   
$EndComp
Text Label 6350 3250 2    60   ~ 0
GND
Text Label 6350 3050 2    60   ~ 0
TIP
Text Label 6350 3150 2    60   ~ 0
RING
$Comp
L Device:Jumper_NC_Small JP1
U 1 1 617E78F2
P 5250 3950
F 0 "JP1" H 5250 4050 50  0000 C CNN
F 1 "PROG" H 5250 3850 50  0000 C CNN
F 2 "project modules:Jumper_P1.27mm" H 5250 3950 50  0001 C CNN
F 3 "~" H 5250 3950 50  0001 C CNN
	1    5250 3950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
