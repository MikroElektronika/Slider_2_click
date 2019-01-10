![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# Slider2 Click

- **CIC Prefix**  : SLIDER2
- **Author**      : Katarina Perendic
- **Verison**     : 1.0.0
- **Date**        : okt 2018.

---

### Software Support

We provide a library for the Slider2 Click on our [LibStock](https://libstock.mikroe.com/projects/view/2613/slider-2-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The library contains functions to enable or disable the chip and sets the maximum output voltage reference.

Key functions :

- ``` void slider2_enable(uint8_t state) ``` - Function for enable or disable device
- ``` void slider2_setReference(uint8_t ref) ``` - Function for set max output voltage 

**Examples Description**

The application is composed of three sections :

- System Initialization - Sets CS pin and PWM pin as OUTPUT
- Application Initialization - Initialization driver init and ADC init
- Application Task - (code snippet) - Read Slider data value and this data logs to USBUART every 500ms.


```.c
void applicationTask()
{
    sliderValue = ADC1_Read(4);
    
    WordToHex(sliderValue, demoText);
    mikrobus_logWrite(" Slider value : 0x", _LOG_TEXT);
    mikrobus_logWrite(demoText, _LOG_LINE);
    Delay_ms( 500 );
}
```

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2613/slider-2-click) page.

Other mikroE Libraries used in the example:

- ADC

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
