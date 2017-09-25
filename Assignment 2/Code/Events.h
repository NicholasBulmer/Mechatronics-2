/* 
 * File:   Events.h
 * Author: User
 *
 * Created on 28 February 2017, 3:13 PM
 */
#ifndef EVENTS_H
#define	EVENTS_H

#include "Types.h"

typedef void (*EventFunction)(UINT8);
extern  UINT8  i, j, u;

void Event_ADCSequenceComplete(UINT8 pLength);
void Event_USBRecieve(UINT8 pLength);
void Event_TestButton(UINT8 pState);
void Event_DIPSwitch(UINT8 pState);
void Event_HMI_DIPSwitch(UINT8 pState);
void Event_HMI_LeftButton(UINT8 pState);
void Event_HMI_RightButton(UINT8 pState);
void Event_HMI_UpButton(UINT8 pState);
void Event_HMI_DownButton(UINT8 pState);
void Event_NULL(UINT8 pState);

#endif	/* EVENTS_H */

