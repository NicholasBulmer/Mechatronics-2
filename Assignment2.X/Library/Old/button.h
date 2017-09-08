/*******************************************************************************
File:						"button.h"

Author:					David Ledger  (SN: 11209069)
Last Modified:	29/05/14

Brief:					The functions manipulate the structure Button to manage debouncing

Requirements:		Modcon Unit with USB multilink interface for programming
								Modcon USB link for serial packet->Commands
								Modcon PC interface software
				
Copyright (c) 2014 David Ledger. All rights reserved.
*******************************************************************************/

#ifndef BUTTON_H
#define BUTTON_H

#include "mytypes.h"    // Additional types


typedef struct
{
    UINT8   mState;
    UINT8   mCount;
    UINT16   mThreshold;
    void    (*mFunction)(void);
} Button;

//------------------------------------------------------------------------------
//Button_Init
//	Initialises a button.
//Input:
//	Button is a pointer to the button to initialise.
//  pThreshold is the number of check periods to wait for debouncing.
//Output: 
//	None
//Conditions: 
//	Button isn't nullptr, threshold >0 and pFunction isn't nullptr
void Button_Init(Button * pButton, UINT16 pThreshold, void (*pFunction)(void));

//------------------------------------------------------------------------------
//Button_Update:
// 	pButton is a pointer to the button to initialise.
//	pIncrement time that has elapsed since the last update.
//	pPinState is the current pin state.
//Output: 
//	bTRUE if successful.
//Conds:  
//	None.
BOOL Button_Update(Button * pButton, UINT8 pIncrement, UINT8 pPinState);

#endif
