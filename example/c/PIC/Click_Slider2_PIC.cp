#line 1 "D:/Clicks_git/S/Slider_2_Click/SW/example/c/PIC/Click_Slider2_PIC.c"
#line 1 "d:/clicks_git/s/slider_2_click/sw/example/c/pic/click_slider2_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 1 "d:/clicks_git/s/slider_2_click/sw/example/c/pic/click_slider2_config.h"
#line 1 "d:/clicks_git/s/slider_2_click/sw/example/c/pic/click_slider2_types.h"
#line 1 "d:/clicks_git/s/slider_2_click/sw/library/__slider2_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 57 "d:/clicks_git/s/slider_2_click/sw/library/__slider2_driver.h"
extern const uint8_t _SLIDER2_DEVICE_ENABLE;
extern const uint8_t _SLIDER2_DEVICE_DISABLE;

extern const uint8_t _SLIDER2_MAX_VOLTAGE_2_048V;
extern const uint8_t _SLIDER2_MAX_VOLTAGE_4_096V;
#line 80 "d:/clicks_git/s/slider_2_click/sw/library/__slider2_driver.h"
void slider2_gpioDriverInit( const uint8_t*  gpioObj);




void slider2_enable(uint8_t state);

void slider2_setReference(uint8_t ref);
#line 30 "D:/Clicks_git/S/Slider_2_Click/SW/example/c/PIC/Click_Slider2_PIC.c"
uint32_t sliderValue;
char demoText[ 100 ];

void systemInit()
{
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_OUTPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
 mikrobus_logInit( _LOG_USBUART, 9600 );
 mikrobus_logWrite("--- System Init ---", _LOG_LINE);
 Delay_ms( 100 );
}

void applicationInit()
{
 slider2_gpioDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO );
 slider2_enable(_SLIDER2_DEVICE_ENABLE);
 slider2_setReference(_SLIDER2_MAX_VOLTAGE_4_096V);





 Delay_100ms();
}

void applicationTask()
{
 sliderValue = ADC_Read(0);

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
