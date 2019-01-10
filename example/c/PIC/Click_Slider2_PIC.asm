
_systemInit:

;Click_Slider2_PIC.c,33 :: 		void systemInit()
;Click_Slider2_PIC.c,35 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
	CLRF        FARG_mikrobus_gpioInit_bus+0 
	MOVLW       6
	MOVWF       FARG_mikrobus_gpioInit_pin+0 
	CLRF        FARG_mikrobus_gpioInit_direction+0 
	CALL        _mikrobus_gpioInit+0, 0
;Click_Slider2_PIC.c,36 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
	CLRF        FARG_mikrobus_gpioInit_bus+0 
	MOVLW       2
	MOVWF       FARG_mikrobus_gpioInit_pin+0 
	CLRF        FARG_mikrobus_gpioInit_direction+0 
	CALL        _mikrobus_gpioInit+0, 0
;Click_Slider2_PIC.c,37 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	MOVLW       16
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       128
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       37
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Click_Slider2_PIC.c,38 :: 		mikrobus_logWrite("--- System Init ---", _LOG_LINE);
	MOVLW       ?lstr1_Click_Slider2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr1_Click_Slider2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Slider2_PIC.c,39 :: 		Delay_ms( 100 );
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_systemInit0:
	DECFSZ      R13, 1, 1
	BRA         L_systemInit0
	DECFSZ      R12, 1, 1
	BRA         L_systemInit0
	DECFSZ      R11, 1, 1
	BRA         L_systemInit0
	NOP
;Click_Slider2_PIC.c,40 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_applicationInit:

;Click_Slider2_PIC.c,42 :: 		void applicationInit()
;Click_Slider2_PIC.c,44 :: 		slider2_gpioDriverInit( (T_SLIDER2_P)&_MIKROBUS1_GPIO );
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_slider2_gpioDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_slider2_gpioDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_slider2_gpioDriverInit_gpioObj+2 
	CALL        _slider2_gpioDriverInit+0, 0
;Click_Slider2_PIC.c,45 :: 		slider2_enable(_SLIDER2_DEVICE_ENABLE);
	MOVLW       __SLIDER2_DEVICE_ENABLE
	MOVWF       FARG_slider2_enable_state+0 
	CALL        _slider2_enable+0, 0
;Click_Slider2_PIC.c,46 :: 		slider2_setReference(_SLIDER2_MAX_VOLTAGE_4_096V);
	MOVLW       __SLIDER2_MAX_VOLTAGE_4_096V
	MOVWF       FARG_slider2_setReference_ref+0 
	CALL        _slider2_setReference+0, 0
;Click_Slider2_PIC.c,52 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;Click_Slider2_PIC.c,53 :: 		}
L_end_applicationInit:
	RETURN      0
; end of _applicationInit

_applicationTask:

;Click_Slider2_PIC.c,55 :: 		void applicationTask()
;Click_Slider2_PIC.c,57 :: 		sliderValue = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _sliderValue+0 
	MOVF        R1, 0 
	MOVWF       _sliderValue+1 
	MOVLW       0
	MOVWF       _sliderValue+2 
	MOVWF       _sliderValue+3 
;Click_Slider2_PIC.c,59 :: 		WordToHex(sliderValue, demoText);
	MOVF        _sliderValue+0, 0 
	MOVWF       FARG_WordToHex_input+0 
	MOVF        _sliderValue+1, 0 
	MOVWF       FARG_WordToHex_input+1 
	MOVLW       _demoText+0
	MOVWF       FARG_WordToHex_output+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_WordToHex_output+1 
	CALL        _WordToHex+0, 0
;Click_Slider2_PIC.c,60 :: 		mikrobus_logWrite(" Slider value : 0x", _LOG_TEXT);
	MOVLW       ?lstr2_Click_Slider2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr2_Click_Slider2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Slider2_PIC.c,61 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVLW       _demoText+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_Slider2_PIC.c,62 :: 		Delay_ms( 500 );
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_applicationTask1:
	DECFSZ      R13, 1, 1
	BRA         L_applicationTask1
	DECFSZ      R12, 1, 1
	BRA         L_applicationTask1
	DECFSZ      R11, 1, 1
	BRA         L_applicationTask1
;Click_Slider2_PIC.c,63 :: 		}
L_end_applicationTask:
	RETURN      0
; end of _applicationTask

_main:

;Click_Slider2_PIC.c,65 :: 		void main()
;Click_Slider2_PIC.c,67 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_Slider2_PIC.c,68 :: 		applicationInit();
	CALL        _applicationInit+0, 0
;Click_Slider2_PIC.c,70 :: 		while (1)
L_main2:
;Click_Slider2_PIC.c,72 :: 		applicationTask();
	CALL        _applicationTask+0, 0
;Click_Slider2_PIC.c,73 :: 		}
	GOTO        L_main2
;Click_Slider2_PIC.c,74 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
