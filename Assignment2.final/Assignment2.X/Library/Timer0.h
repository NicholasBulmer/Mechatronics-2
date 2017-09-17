/* 
 * File:   Timer0.h
 * Author: David Ledger
 *
 * Created on 29 November 2016, 1:28 PM
 */

#ifndef TIMER0_H
#define	TIMER0_H
#include <xc.h>
#include "Types.h"

#define TIMER0_ISR_CONDITION ((INTCONbits.TMR0IF) && (INTCONbits.TMR0IE))

void Timer0_Init(UINT32 pFrequency);
void Timer0_Clear();

void Timer0_Start(Function pFunction);
void Timer0_ISR();
void Timer0_Stop();
void Timer0_Restart();

#endif	/* TIMER0_H */