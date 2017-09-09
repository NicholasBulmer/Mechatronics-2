/* 
 * File:   Config.h
 * Author: David Ledger
 *
 * Created on 28 February 2017, 3:21 PM
 */
#ifndef CONFIG_H
#define	CONFIG_H
#define VERSION     "1.0"
#define COMPILEDATE __DATE__

//#define     PRODUCTION
//#define     ISR_NOBLOCK
//#define     ISR_SPI
//#define     ISR_I2C
////////////////////////////////////////////////////////////////////////////////
#define ENABLEMOTOR

//#define     ADCTEST
#ifdef ADCTEST
    #define ADCISR  
#endif
////////////////////////////////////////////////////////////////////////////////
#define     CONSOLE_BUFFERED
#define     DEBOUNCE            2
////////////////////////////////////////////////////////////////////////////////
//#define     HMI_RENDER_DELAY    100 //us
////////////////////////////////////////////////////////////////////////////////
#ifdef ISR_SPI
    #define SPI_FILLBUFFER
    #define SPI_BUFFERSIZE 64 //    64/8 = 8

    #if SPI_BUFFERSIZE >= 64
        #define HMI_LOOPING_FIFO
    #endif
#endif
////////////////////////////////////////////////////////////////////////////////
//The address of the module
#define	MXK_MOTOR   0b1000
#define MXK_IMU     0b0100
#define MXK_FPGA    0b0010
#define MXK_HMI     0b0001
////////////////////////////////////////////////////////////////////////////////
#endif	/* CONFIG_H */

