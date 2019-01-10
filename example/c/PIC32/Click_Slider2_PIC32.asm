_systemInit:
;Click_Slider2_PIC32.c,33 :: 		void systemInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Click_Slider2_PIC32.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
MOVZ	R27, R0, R0
ORI	R26, R0, 6
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;Click_Slider2_PIC32.c,36 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVZ	R27, R0, R0
ORI	R26, R0, 2
MOVZ	R25, R0, R0
JAL	_mikrobus_gpioInit+0
NOP	
;Click_Slider2_PIC32.c,37 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
ORI	R26, R0, 9600
ORI	R25, R0, 32
JAL	_mikrobus_logInit+0
NOP	
;Click_Slider2_PIC32.c,38 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr1_Click_Slider2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr1_Click_Slider2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Slider2_PIC32.c,39 :: 		Delay_ms( 100 );
LUI	R24, 40
ORI	R24, R24, 45226
L_systemInit0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_systemInit0
NOP	
;Click_Slider2_PIC32.c,40 :: 		}
L_end_systemInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _systemInit
_applicationInit:
;Click_Slider2_PIC32.c,42 :: 		void applicationInit()
ADDIU	SP, SP, -8
SW	RA, 0(SP)
;Click_Slider2_PIC32.c,44 :: 		slider2_gpioDriverInit( (T_SLIDER2_P)&_MIKROBUS1_GPIO );
SW	R25, 4(SP)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_slider2_gpioDriverInit+0
NOP	
;Click_Slider2_PIC32.c,45 :: 		slider2_enable(_SLIDER2_DEVICE_ENABLE);
ORI	R25, R0, __SLIDER2_DEVICE_ENABLE
JAL	_slider2_enable+0
NOP	
;Click_Slider2_PIC32.c,46 :: 		slider2_setReference(_SLIDER2_MAX_VOLTAGE_4_096V);
ORI	R25, R0, __SLIDER2_MAX_VOLTAGE_4_096V
JAL	_slider2_setReference+0
NOP	
;Click_Slider2_PIC32.c,49 :: 		ADC1_Init();
JAL	_ADC1_Init+0
NOP	
;Click_Slider2_PIC32.c,51 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;Click_Slider2_PIC32.c,52 :: 		}
L_end_applicationInit:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _applicationInit
_applicationTask:
;Click_Slider2_PIC32.c,54 :: 		void applicationTask()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_Slider2_PIC32.c,56 :: 		sliderValue = ADC1_Read(8);
SW	R25, 4(SP)
SW	R26, 8(SP)
ORI	R25, R0, 8
JAL	_ADC1_Read+0
NOP	
ANDI	R2, R2, 65535
SW	R2, Offset(_sliderValue+0)(GP)
;Click_Slider2_PIC32.c,58 :: 		WordToHex(sliderValue, demoText);
LUI	R26, hi_addr(_demoText+0)
ORI	R26, R26, lo_addr(_demoText+0)
LW	R25, Offset(_sliderValue+0)(GP)
JAL	_WordToHex+0
NOP	
;Click_Slider2_PIC32.c,59 :: 		mikrobus_logWrite(" Slider value : 0x", _LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr2_Click_Slider2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr2_Click_Slider2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Slider2_PIC32.c,60 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(_demoText+0)
ORI	R25, R25, lo_addr(_demoText+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_Slider2_PIC32.c,61 :: 		Delay_ms( 500 );
LUI	R24, 203
ORI	R24, R24, 29524
L_applicationTask2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_applicationTask2
NOP	
NOP	
NOP	
;Click_Slider2_PIC32.c,62 :: 		}
L_end_applicationTask:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _applicationTask
_main:
;Click_Slider2_PIC32.c,64 :: 		void main()
;Click_Slider2_PIC32.c,66 :: 		systemInit();
JAL	_systemInit+0
NOP	
;Click_Slider2_PIC32.c,67 :: 		applicationInit();
JAL	_applicationInit+0
NOP	
;Click_Slider2_PIC32.c,69 :: 		while (1)
L_main4:
;Click_Slider2_PIC32.c,71 :: 		applicationTask();
JAL	_applicationTask+0
NOP	
;Click_Slider2_PIC32.c,72 :: 		}
J	L_main4
NOP	
;Click_Slider2_PIC32.c,73 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
