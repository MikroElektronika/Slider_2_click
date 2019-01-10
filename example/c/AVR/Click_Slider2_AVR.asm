
_systemInit:

;Click_Slider2_AVR.c,33 :: 		void systemInit()
;Click_Slider2_AVR.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 6
	MOV        R3, R27
	CLR        R2
	CALL       _mikrobus_gpioInit+0
;Click_Slider2_AVR.c,36 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	CLR        R2
	CALL       _mikrobus_gpioInit+0
;Click_Slider2_AVR.c,37 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	LDI        R27, 128
	MOV        R3, R27
	LDI        R27, 37
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOV        R6, R27
	LDI        R27, 16
	MOV        R2, R27
	CALL       _mikrobus_logInit+0
;Click_Slider2_AVR.c,38 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr1_Click_Slider2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_Click_Slider2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Slider2_AVR.c,39 :: 		Delay_ms( 100 );
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_systemInit0:
	DEC        R16
	BRNE       L_systemInit0
	DEC        R17
	BRNE       L_systemInit0
	DEC        R18
	BRNE       L_systemInit0
;Click_Slider2_AVR.c,40 :: 		}
L_end_systemInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _systemInit

_applicationInit:

;Click_Slider2_AVR.c,42 :: 		void applicationInit()
;Click_Slider2_AVR.c,44 :: 		slider2_gpioDriverInit( (T_SLIDER2_P)&_MIKROBUS1_GPIO );
	PUSH       R2
	PUSH       R3
	LDI        R27, #lo_addr(__MIKROBUS1_GPIO+0)
	MOV        R2, R27
	LDI        R27, hi_addr(__MIKROBUS1_GPIO+0)
	MOV        R3, R27
	CALL       _slider2_gpioDriverInit+0
;Click_Slider2_AVR.c,45 :: 		slider2_enable(_SLIDER2_DEVICE_ENABLE);
	LDI        R27, __SLIDER2_DEVICE_ENABLE
	MOV        R2, R27
	CALL       _slider2_enable+0
;Click_Slider2_AVR.c,46 :: 		slider2_setReference(_SLIDER2_MAX_VOLTAGE_4_096V);
	LDI        R27, __SLIDER2_MAX_VOLTAGE_4_096V
	MOV        R2, R27
	CALL       _slider2_setReference+0
;Click_Slider2_AVR.c,51 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Click_Slider2_AVR.c,53 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;Click_Slider2_AVR.c,54 :: 		}
L_end_applicationInit:
	POP        R3
	POP        R2
	RET
; end of _applicationInit

_applicationTask:

;Click_Slider2_AVR.c,56 :: 		void applicationTask()
;Click_Slider2_AVR.c,58 :: 		sliderValue = ADC_Read(7);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 7
	MOV        R2, R27
	CALL       _ADC_Read+0
	STS        _sliderValue+0, R16
	STS        _sliderValue+1, R17
	LDI        R27, 0
	STS        _sliderValue+2, R27
	STS        _sliderValue+3, R27
;Click_Slider2_AVR.c,60 :: 		WordToHex(sliderValue, demoText);
	LDI        R27, #lo_addr(_demoText+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_demoText+0)
	MOV        R5, R27
	LDS        R2, _sliderValue+0
	LDS        R3, _sliderValue+1
	CALL       _WordToHex+0
;Click_Slider2_AVR.c,61 :: 		mikrobus_logWrite(" Slider value : 0x", _LOG_TEXT);
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr2_Click_Slider2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_Click_Slider2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Slider2_AVR.c,62 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(_demoText+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_demoText+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_Slider2_AVR.c,63 :: 		Delay_ms( 500 );
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_applicationTask2:
	DEC        R16
	BRNE       L_applicationTask2
	DEC        R17
	BRNE       L_applicationTask2
	DEC        R18
	BRNE       L_applicationTask2
	NOP
;Click_Slider2_AVR.c,64 :: 		}
L_end_applicationTask:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationTask

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Click_Slider2_AVR.c,66 :: 		void main()
;Click_Slider2_AVR.c,68 :: 		systemInit();
	CALL       _systemInit+0
;Click_Slider2_AVR.c,69 :: 		applicationInit();
	CALL       _applicationInit+0
;Click_Slider2_AVR.c,71 :: 		while (1)
L_main4:
;Click_Slider2_AVR.c,73 :: 		applicationTask();
	CALL       _applicationTask+0
;Click_Slider2_AVR.c,74 :: 		}
	JMP        L_main4
;Click_Slider2_AVR.c,75 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
