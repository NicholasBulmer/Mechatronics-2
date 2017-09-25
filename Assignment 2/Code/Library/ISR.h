
/* 
 * File:   Interrupts.h
 * Author: David Ledger
 *
 * Created on 28 February 2017, 3:55 PM
 */

#ifndef INTERRUPTS_H
#define	INTERRUPTS_H
#include <xc.h>
#include "Config.h"
#include "Timer0.h"


extern bool Timer0_ISR_Enterable;

void            ISR_Disable();
void            ISR_Enable();
void interrupt  ISR_Function();

#endif	/* INTERRUPTS_H */

