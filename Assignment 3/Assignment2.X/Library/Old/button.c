/*******************************************************************************
File:					"button.c"
Author:					David Ledger  (SN: 11209069)
Last Modified:			29/05/14
Brief:					The functions manipulate the structure Button to manage debouncing
Copyright (c) 2014 David Ledger. All rights reserved.
*******************************************************************************/

#include "button.h"

//------------------------------------------------------------------------------
//	Initialises a button.
//Input:
//	Button is a pointer to the button to initialise.
//  pThreshold is the number of check periods to wait for debouncing.
//Output: 
//	None
//Conditions: 
//	Button isn't nullptr, threshold >0 and pFunction isn't nullptr
void Button_Init(Button * pButton, UINT16 pThreshold, void (*pFunction)(void))
{
  if(pThreshold == 0)
	  	  pThreshold = 1;
  pButton->mState     = 0;
  pButton->mCount     = 0;
  pButton->mThreshold = pThreshold;
  pButton->mFunction  = pFunction;
}

//------------------------------------------------------------------------------
//Button_Update:
// 	pButton is a pointer to the button to initialise.
//	pIncrement time that has elapsed since the last update.
//	pPinState is the current pin state.
//Output: 
//	bTRUE if successful.
//Conds:  
//	None.
BOOL Button_Update(Button * pButton, UINT8 pIncrement, UINT8 pPinState)
{
  if(pPinState == 1 || pPinState == 0)
  {
    if (pButton->mState == pPinState)
    {
    	//If the increment is greater than the ongoing count set
    	// mCount to zero as it cannot go negitive
      if(pIncrement > pButton->mCount)
      	pButton->mCount =   0;
      else
      	pButton->mCount -=  pIncrement;
    }
    
    //Ensures that the increment won't cause overflow
    else if(pButton->mCount + pIncrement > pButton->mCount)
    {
    	//Increment positively because pin is starting to weight its opposite state
      pButton->mCount += pIncrement;
      if(pButton->mCount >= pButton->mThreshold)
      {
      	//The mCount has reached its  threashold value and therefore 
        pButton->mState = pPinState;
        pButton->mCount = 0;
        
        //Run the function assigned in the initialisation on rising edge of debounced button press
        if(!pButton->mState)
       	 	pButton->mFunction();
        return bTRUE;
      }
    }
  }
  return bFALSE;
}
