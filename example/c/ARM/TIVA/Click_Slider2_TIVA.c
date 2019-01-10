/*
Example for Slider2 Click

    Date          : okt 2018.
    Author        : Katarina Perendic

Test configuration TIVA :
    
    MCU              : TM4C129XNCZAD
    Dev. Board       : EasyMx PRO v7 for TIVA ARM
    ARM Compiler ver : v6.0.0.0

---

Description :

The application is composed of three sections :

- System Initialization - Sets CS pin and PWM pin as OUTPUT
- Application Initialization - Initialization driver init and ADC init
- Application Task - (code snippet) - Read Slider data value and this data logs to USBUART every 500ms.

*/

#include "Click_Slider2_types.h"
#include "Click_Slider2_config.h"

 

uint32_t sliderValue;
char demoText[ 100 ];

void systemInit()
{
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
    mikrobus_logInit( _LOG_USBUART_A, 9600 );
    mikrobus_logWrite("--- System Init ---", _LOG_LINE);
    Delay_ms( 100 );
}

void applicationInit()
{
    slider2_gpioDriverInit( (T_SLIDER2_P)&_MIKROBUS1_GPIO );
    slider2_enable(_SLIDER2_DEVICE_ENABLE);
    slider2_setReference(_SLIDER2_MAX_VOLTAGE_4_096V);
    
// ADC INIT
    ADC_Set_Input_Channel(_ADC_CHANNEL_9);
    ADC0_Init();
    
    Delay_100ms();
}

void applicationTask()
{
    sliderValue = ADC0_Get_Sample(9);
    
    WordToHex(sliderValue, demoText);
    mikrobus_logWrite(" Slider value : 0x", _LOG_TEXT);
    mikrobus_logWrite(demoText, _LOG_LINE);
    Delay_ms( 500 );
}

void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
        applicationTask();
    }
}