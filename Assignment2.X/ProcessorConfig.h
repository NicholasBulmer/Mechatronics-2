/* 
 * File:   PIC_CONFIG.h
 * Author: David Ledger
 *
 * Created on 27 March 2017, 11:31 AM
 */

#ifndef PIC_CONFIG_H
#define	PIC_CONFIG_H

#ifdef	__cplusplus
extern "C" {
#endif
    
////////////////////////////////////////////////////////////////////////////////
//  DON'T CHANGE, DON'T TOUCH, DONT READ, DON'T PLACE CURSOR HERE
//  CHANGING ANY OF THESE WILL BREAK THE BOOTLOADER
#pragma config XINST    = OFF   	// Extended instruction set
#pragma config STVREN   = ON      	// Stack overflow reset
#pragma config PLLDIV   = 3         // (12 MHz crystal used on this board)
#pragma config WDTEN    = OFF      	// Watch Dog Timer (WDT)
#pragma config CPUDIV   = OSC1      // OSC1 = divide by 1 mode
#pragma config IESO     = OFF      	// Internal External (clock) Switchover
#pragma config FCMEN    = OFF      	// Fail Safe Clock Monitor
#pragma config FOSC     = HSPLL     // Firmware must also set OSCTUNE<PLLEN> to start PLL!
#pragma config WDTPS    = 32768		
#pragma config MSSPMSK  = MSK5
#pragma config CCP2MX   = DEFAULT
//  END PARANOID WARNING
////////////////////////////////////////////////////////////////////////////////

#ifdef	__cplusplus
}
#endif

#endif	/* PIC_CONFIG_H */

