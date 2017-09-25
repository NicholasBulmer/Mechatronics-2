/* 
 * File:   Functions.h
 * Author: User
 *
 * Created on 28 February 2017, 3:31 PM
 */
#ifndef FUNCTIONS_H
#define	FUNCTIONS_H
#include "Config.h"
#include "Types.h"
#include "Events.h"
#include "MXK.h"

extern UINT8        i, j, u;
extern Button	TestButton;
extern Button	DIPSwitch;

void FunctInitButton();
void FunctInitIMU();
void FunctInitMotor();
void FunctInitLCD();
void FunctInitADC();
void FunctInitHMI();
void FunctInitUSB();

void FunctUSB();
void FunctButton();
void FunctIMU();
void FunctMotor();
void FunctHMI();
void FunctADC();

#endif	/* FUNCTIONS_H */

