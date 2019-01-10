_systemInit:
;Click_Slider2_FT90x.c,33 :: 		void systemInit()
;Click_Slider2_FT90x.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
LDK.L	R2, #0
LDK.L	R1, #6
LDK.L	R0, #0
CALL	_mikrobus_gpioInit+0
;Click_Slider2_FT90x.c,36 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
LDK.L	R2, #0
LDK.L	R1, #2
LDK.L	R0, #0
CALL	_mikrobus_gpioInit+0
;Click_Slider2_FT90x.c,37 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
LDK.L	R1, #9600
LDK.L	R0, #16
CALL	_mikrobus_logInit+0
;Click_Slider2_FT90x.c,38 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
LDK.L	R0, #?lstr1_Click_Slider2_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_Slider2_FT90x.c,39 :: 		Delay_ms( 100 );
LPM.L	R28, #3333331
NOP	
L_systemInit0:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_systemInit0
JMP	$+8
	#3333331
NOP	
NOP	
;Click_Slider2_FT90x.c,40 :: 		}
L_end_systemInit:
RETURN	
; end of _systemInit
_applicationInit:
;Click_Slider2_FT90x.c,42 :: 		void applicationInit()
;Click_Slider2_FT90x.c,44 :: 		slider2_gpioDriverInit( (T_SLIDER2_P)&_MIKROBUS1_GPIO );
LDK.L	R0, #__MIKROBUS1_GPIO+0
CALL	_slider2_gpioDriverInit+0
;Click_Slider2_FT90x.c,45 :: 		slider2_enable(_SLIDER2_DEVICE_ENABLE);
LDK.L	R0, __SLIDER2_DEVICE_ENABLE
CALL	_slider2_enable+0
;Click_Slider2_FT90x.c,46 :: 		slider2_setReference(_SLIDER2_MAX_VOLTAGE_2_048V);
LDK.L	R0, __SLIDER2_MAX_VOLTAGE_2_048V
CALL	_slider2_setReference+0
;Click_Slider2_FT90x.c,50 :: 		Delay_100ms();
CALL	_Delay_100ms+0
;Click_Slider2_FT90x.c,51 :: 		}
L_end_applicationInit:
RETURN	
; end of _applicationInit
_applicationTask:
;Click_Slider2_FT90x.c,53 :: 		void applicationTask()
;Click_Slider2_FT90x.c,55 :: 		sliderValue = ADC_Read(4);
LDK.L	R0, #4
CALL	_ADC_Read+0
STA.L	_sliderValue+0, R0
;Click_Slider2_FT90x.c,57 :: 		WordToHex(sliderValue, demoText);
LDA.S	R0, _sliderValue+0
LDK.L	R1, #_demoText+0
CALL	_WordToHex+0
;Click_Slider2_FT90x.c,58 :: 		mikrobus_logWrite(" Slider value : 0x", _LOG_TEXT);
LDK.L	R0, #?lstr2_Click_Slider2_FT90x+0
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_Slider2_FT90x.c,59 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
LDK.L	R1, #2
LDK.L	R0, #_demoText+0
CALL	_mikrobus_logWrite+0
;Click_Slider2_FT90x.c,60 :: 		Delay_ms( 500 );
LPM.L	R28, #16666665
NOP	
L_applicationTask2:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_applicationTask2
JMP	$+8
	#16666665
;Click_Slider2_FT90x.c,61 :: 		}
L_end_applicationTask:
RETURN	
; end of _applicationTask
_main:
;Click_Slider2_FT90x.c,63 :: 		void main()
LDK.L	SP, #43605
;Click_Slider2_FT90x.c,65 :: 		systemInit();
CALL	_systemInit+0
;Click_Slider2_FT90x.c,66 :: 		applicationInit();
CALL	_applicationInit+0
;Click_Slider2_FT90x.c,68 :: 		while (1)
L_main4:
;Click_Slider2_FT90x.c,70 :: 		applicationTask();
CALL	_applicationTask+0
;Click_Slider2_FT90x.c,71 :: 		}
JMP	L_main4
;Click_Slider2_FT90x.c,72 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
