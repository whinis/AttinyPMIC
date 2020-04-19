EESchema Schematic File Version 4
LIBS:PMIC-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
L MCU_Microchip_ATtiny:ATtiny10-TS U2
U 1 1 5E8F1EF9
P 6600 3500
F 0 "U2" H 6070 3546 50  0000 R CNN
F 1 "ATtiny10-TS" H 6070 3455 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 6600 3500 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8127-AVR-8-bit-Microcontroller-ATtiny4-ATtiny5-ATtiny9-ATtiny10_Datasheet.pdf" H 6600 3500 50  0001 C CNN
	1    6600 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 2700 6600 2700
Wire Wire Line
	6600 2700 6600 2900
Wire Wire Line
	5100 2800 5100 2700
Wire Wire Line
	5100 2700 4800 2700
Wire Wire Line
	5500 3100 5500 3200
Wire Wire Line
	5500 4100 6600 4100
Wire Wire Line
	7200 3200 7500 3200
Wire Wire Line
	7200 3300 7500 3300
Wire Wire Line
	7200 3400 7500 3400
Text Label 6600 2700 0    50   ~ 0
SW2v5
Text Label 5600 4100 0    50   ~ 0
GND
Text Label 7500 3300 0    50   ~ 0
SW
Text Label 4800 2700 2    50   ~ 0
VIN
Text Label 7500 3200 0    50   ~ 0
LDO_EN
Text Label 7500 3400 0    50   ~ 0
SW_INT
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5E8F3CC0
P 4100 3200
F 0 "J1" H 4018 2875 50  0000 C CNN
F 1 "Conn_01x03" H 4018 2966 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4100 3200 50  0001 C CNN
F 3 "~" H 4100 3200 50  0001 C CNN
	1    4100 3200
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5E8F441F
P 4100 3900
F 0 "J2" H 4018 3575 50  0000 C CNN
F 1 "Conn_01x03" H 4018 3666 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4100 3900 50  0001 C CNN
F 3 "~" H 4100 3900 50  0001 C CNN
	1    4100 3900
	-1   0    0    1   
$EndComp
Text Label 4450 3300 0    50   ~ 0
VIN
Wire Wire Line
	4300 3300 4450 3300
Wire Wire Line
	4300 3200 4450 3200
Wire Wire Line
	4300 3100 4450 3100
Wire Wire Line
	4300 3800 4450 3800
Wire Wire Line
	4300 3900 4450 3900
Wire Wire Line
	4300 4000 4450 4000
Text Label 4450 3200 0    50   ~ 0
GND
Text Label 4450 3900 0    50   ~ 0
GND
Text Label 4450 3100 0    50   ~ 0
SW
Text Label 4450 3800 0    50   ~ 0
LDO_EN
Text Label 4450 4000 0    50   ~ 0
SW_INT
$Comp
L Regulator_Linear:TCR3UM18ALF U1
U 1 1 5E9C5DA1
P 5500 2800
F 0 "U1" H 5500 3167 50  0000 C CNN
F 1 "TCR3UM18ALF" H 5500 3076 50  0000 C CNN
F 2 "Package_DFN_QFN:UDFN-4_1x1mm_P0.65mm" H 5700 2450 50  0001 C CNN
F 3 "" H 5500 2800 50  0001 C CNN
F 4 "TCR3UM18ALFCT-ND" H 5500 2800 50  0001 C CNN "Digikey"
	1    5500 2800
	1    0    0    -1  
$EndComp
Connection ~ 5100 2700
Wire Wire Line
	5500 3200 5700 3200
Wire Wire Line
	5700 3200 5700 3100
Connection ~ 5500 3200
Wire Wire Line
	5500 3200 5500 4100
$EndSCHEMATC
