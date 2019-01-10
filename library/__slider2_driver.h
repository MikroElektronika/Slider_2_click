/*
    __slider2_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __slider2_driver.h
@brief    Slider2 Driver
@mainpage Slider2 Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   SLIDER2
@brief      Slider2 Click Driver
@{

| Global Library Prefix | **SLIDER2** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **okt 2018.**      |
| Developer             | **Katarina Perendic**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _SLIDER2_H_
#define _SLIDER2_H_

/** 
 * @macro T_SLIDER2_P
 * @brief Driver Abstract type 
 */
#define T_SLIDER2_P    const uint8_t*

/** @defgroup SLIDER2_COMPILE Compilation Config */              /** @{ */

//  #define   __SLIDER2_DRV_SPI__                            /**<     @macro __SLIDER2_DRV_SPI__  @brief SPI driver selector */
//  #define   __SLIDER2_DRV_I2C__                            /**<     @macro __SLIDER2_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __SLIDER2_DRV_UART__                           /**<     @macro __SLIDER2_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup SLIDER2_VAR Variables */                           /** @{ */

extern const uint8_t _SLIDER2_DEVICE_ENABLE;
extern const uint8_t _SLIDER2_DEVICE_DISABLE;

extern const uint8_t _SLIDER2_MAX_VOLTAGE_2_048V;
extern const uint8_t _SLIDER2_MAX_VOLTAGE_4_096V;
                                                                       /** @} */
#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup SLIDER2_INIT Driver Initialization */              /** @{ */

#ifdef   __SLIDER2_DRV_SPI__
void slider2_spiDriverInit(T_SLIDER2_P gpioObj, T_SLIDER2_P spiObj);
#endif
#ifdef   __SLIDER2_DRV_I2C__
void slider2_i2cDriverInit(T_SLIDER2_P gpioObj, T_SLIDER2_P i2cObj, uint8_t slave);
#endif
#ifdef   __SLIDER2_DRV_UART__
void slider2_uartDriverInit(T_SLIDER2_P gpioObj, T_SLIDER2_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void slider2_gpioDriverInit(T_SLIDER2_P gpioObj);
                                                                       /** @} */
/** @defgroup SLIDER2_FUNC Driver Functions */                   /** @{ */


void slider2_enable(uint8_t state);

void slider2_setReference(uint8_t ref);


                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_Slider2_STM.c
    @example Click_Slider2_TIVA.c
    @example Click_Slider2_CEC.c
    @example Click_Slider2_KINETIS.c
    @example Click_Slider2_MSP.c
    @example Click_Slider2_PIC.c
    @example Click_Slider2_PIC32.c
    @example Click_Slider2_DSPIC.c
    @example Click_Slider2_AVR.c
    @example Click_Slider2_FT90x.c
    @example Click_Slider2_STM.mbas
    @example Click_Slider2_TIVA.mbas
    @example Click_Slider2_CEC.mbas
    @example Click_Slider2_KINETIS.mbas
    @example Click_Slider2_MSP.mbas
    @example Click_Slider2_PIC.mbas
    @example Click_Slider2_PIC32.mbas
    @example Click_Slider2_DSPIC.mbas
    @example Click_Slider2_AVR.mbas
    @example Click_Slider2_FT90x.mbas
    @example Click_Slider2_STM.mpas
    @example Click_Slider2_TIVA.mpas
    @example Click_Slider2_CEC.mpas
    @example Click_Slider2_KINETIS.mpas
    @example Click_Slider2_MSP.mpas
    @example Click_Slider2_PIC.mpas
    @example Click_Slider2_PIC32.mpas
    @example Click_Slider2_DSPIC.mpas
    @example Click_Slider2_AVR.mpas
    @example Click_Slider2_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __slider2_driver.h

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */