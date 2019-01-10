
_systemInit:

;Click_Slider2_DSPIC.c,33 :: 		void systemInit()
;Click_Slider2_DSPIC.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CLR	W12
	MOV.B	#6, W11
	CLR	W10
	CALL	_mikrobus_gpioInit
;Click_Slider2_DSPIC.c,36 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
	CLR	W12
	MOV.B	#2, W11
	CLR	W10
	CALL	_mikrobus_gpioInit
;Click_Slider2_DSPIC.c,37 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
	MOV	#9600, W11
	MOV	#0, W12
	MOV.B	#32, W10
	CALL	_mikrobus_logInit
;Click_Slider2_DSPIC.c,38 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr1_Click_Slider2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Slider2_DSPIC.c,39 :: 		Delay_ms( 100 );
	MOV	#3, W8
	MOV	#2261, W7
L_systemInit0:
	DEC	W7
	BRA NZ	L_systemInit0
	DEC	W8
	BRA NZ	L_systemInit0
;Click_Slider2_DSPIC.c,40 :: 		}
L_end_systemInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _systemInit

_applicationInit:

;Click_Slider2_DSPIC.c,42 :: 		void applicationInit()
;Click_Slider2_DSPIC.c,44 :: 		slider2_gpioDriverInit( (T_SLIDER2_P)&_MIKROBUS1_GPIO );
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(__MIKROBUS1_GPIO), W10
	CALL	_slider2_gpioDriverInit
;Click_Slider2_DSPIC.c,45 :: 		slider2_enable(_SLIDER2_DEVICE_ENABLE);
	MOV.B	#__SLIDER2_DEVICE_ENABLE, W10
	CALL	_slider2_enable
;Click_Slider2_DSPIC.c,46 :: 		slider2_setReference(_SLIDER2_MAX_VOLTAGE_4_096V);
	MOV.B	#__SLIDER2_MAX_VOLTAGE_4_096V, W10
	CALL	_slider2_setReference
;Click_Slider2_DSPIC.c,50 :: 		ADC1_Init_Advanced(_ADC_12bit, _ADC_INTERNAL_VREFL | _ADC_INTERNAL_VREFH);
	CLR	W11
	MOV	#1, W10
	CALL	_ADC1_Init_Advanced
;Click_Slider2_DSPIC.c,53 :: 		Delay_100ms();
	CALL	_Delay_100ms
;Click_Slider2_DSPIC.c,54 :: 		}
L_end_applicationInit:
	POP	W11
	POP	W10
	RETURN
; end of _applicationInit

_applicationTask:

;Click_Slider2_DSPIC.c,56 :: 		void applicationTask()
;Click_Slider2_DSPIC.c,58 :: 		sliderValue = ADC1_Read(8);
	PUSH	W10
	PUSH	W11
	MOV	#8, W10
	CALL	_ADC1_Read
	CLR	W1
	MOV	W0, _sliderValue
	MOV	W1, _sliderValue+2
;Click_Slider2_DSPIC.c,60 :: 		WordToHex(sliderValue, demoText);
	MOV	#lo_addr(_demoText), W11
	MOV	_sliderValue, W10
	CALL	_WordToHex
;Click_Slider2_DSPIC.c,61 :: 		mikrobus_logWrite(" Slider value : 0x", _LOG_TEXT);
	MOV.B	#1, W11
	MOV	#lo_addr(?lstr2_Click_Slider2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_Slider2_DSPIC.c,62 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(_demoText), W10
	CALL	_mikrobus_logWrite
;Click_Slider2_DSPIC.c,63 :: 		Delay_ms( 500 );
	MOV	#11, W8
	MOV	#11309, W7
L_applicationTask2:
	DEC	W7
	BRA NZ	L_applicationTask2
	DEC	W8
	BRA NZ	L_applicationTask2
;Click_Slider2_DSPIC.c,64 :: 		}
L_end_applicationTask:
	POP	W11
	POP	W10
	RETURN
; end of _applicationTask

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;Click_Slider2_DSPIC.c,66 :: 		void main()
;Click_Slider2_DSPIC.c,68 :: 		systemInit();
	CALL	_systemInit
;Click_Slider2_DSPIC.c,69 :: 		applicationInit();
	CALL	_applicationInit
;Click_Slider2_DSPIC.c,71 :: 		while (1)
L_main4:
;Click_Slider2_DSPIC.c,73 :: 		applicationTask();
	CALL	_applicationTask
;Click_Slider2_DSPIC.c,74 :: 		}
	GOTO	L_main4
;Click_Slider2_DSPIC.c,75 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
