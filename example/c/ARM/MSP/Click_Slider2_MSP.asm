_systemInit:
;Click_Slider2_MSP.c,33 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Slider2_MSP.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #6
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Slider2_MSP.c,36 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Slider2_MSP.c,37 :: 		mikrobus_logInit( _MIKROBUS2, 9600 );
MOVW	R1, #9600
MOVS	R0, #1
BL	_mikrobus_logInit+0
;Click_Slider2_MSP.c,38 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_Slider2_MSP+0)
MOVT	R0, #hi_addr(?lstr1_Click_Slider2_MSP+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_Slider2_MSP.c,39 :: 		Delay_ms( 100 );
MOVW	R7, #20349
MOVT	R7, #18
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_Slider2_MSP.c,40 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_Slider2_MSP.c,42 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Slider2_MSP.c,44 :: 		slider2_gpioDriverInit( (T_SLIDER2_P)&_MIKROBUS1_GPIO );
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_slider2_gpioDriverInit+0
;Click_Slider2_MSP.c,45 :: 		slider2_enable(_SLIDER2_DEVICE_ENABLE);
MOVS	R0, __SLIDER2_DEVICE_ENABLE
BL	_slider2_enable+0
;Click_Slider2_MSP.c,46 :: 		slider2_setReference(_SLIDER2_MAX_VOLTAGE_2_048V);
MOVS	R0, __SLIDER2_MAX_VOLTAGE_2_048V
BL	_slider2_setReference+0
;Click_Slider2_MSP.c,49 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_15);
MOV	R0, #32768
BL	_ADC_Set_Input_Channel+0
;Click_Slider2_MSP.c,50 :: 		ADC_Init();
BL	_ADC_Init+0
;Click_Slider2_MSP.c,52 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_Slider2_MSP.c,53 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_Slider2_MSP.c,55 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Slider2_MSP.c,57 :: 		sliderValue = ADC_Read(15);
MOVS	R0, #15
BL	_ADC_Read+0
MOVW	R1, #lo_addr(_sliderValue+0)
MOVT	R1, #hi_addr(_sliderValue+0)
STR	R0, [R1, #0]
;Click_Slider2_MSP.c,59 :: 		WordToHex(sliderValue, demoText);
MOV	R0, R1
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_WordToHex+0
;Click_Slider2_MSP.c,60 :: 		mikrobus_logWrite(" Slider value : 0x", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr2_Click_Slider2_MSP+0)
MOVT	R0, #hi_addr(?lstr2_Click_Slider2_MSP+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_Slider2_MSP.c,61 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_Slider2_MSP.c,62 :: 		Delay_ms( 500 );
MOVW	R7, #36221
MOVT	R7, #91
NOP
NOP
L_applicationTask2:
SUBS	R7, R7, #1
BNE	L_applicationTask2
NOP
NOP
NOP
;Click_Slider2_MSP.c,63 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_Slider2_MSP.c,65 :: 		void main()
;Click_Slider2_MSP.c,67 :: 		systemInit();
BL	_systemInit+0
;Click_Slider2_MSP.c,68 :: 		applicationInit();
BL	_applicationInit+0
;Click_Slider2_MSP.c,70 :: 		while (1)
L_main4:
;Click_Slider2_MSP.c,72 :: 		applicationTask();
BL	_applicationTask+0
;Click_Slider2_MSP.c,73 :: 		}
IT	AL
BAL	L_main4
;Click_Slider2_MSP.c,74 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
