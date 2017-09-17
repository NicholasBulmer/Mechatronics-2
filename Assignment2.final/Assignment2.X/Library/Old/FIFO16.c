/*******************************************************************************
File:		"FIFO.c"

Author:		David Ledger

Brief:		The FIFO structure is used to store the bytes in a circular array.
				
Copyright (c) 2016 David Ledger. All rights reserved.
*******************************************************************************/

#include "FIFO16.h"

//------------------------------------------------------------------------------
// FIFO16_Init
// Initialize the FIFO
// Input:
//   FIFO is a pointer to a FIFO struct to initialize
// Output:
//   none
// Conditions:
//  Memory is avaliable and FIFO isn't nullptr, FIFO size>0
void FIFO16_Init(FIFO16Ptr pInput, UINT16Ptr pBuffer, UINT16 pLength)
{
    pInput->mLength = 0;	//This is the buffer length
    pInput->mBuffer = 0;
    pInput->mItems = 0;
    ////////////////////////////////////////////////////////////////////////////
    if (pBuffer == 0)
	return;
    if (pLength == 0)
	return;
    if (pInput == 0)
	return;
    
    ////////////////////////////////////////////////////////////////////////////
    pInput->mStart  = 0;
    pInput->mEnd    = 0;	//Declares there to be no data in buffer
    pInput->mLength = pLength;	//This is the buffer length
    pInput->mBuffer = pBuffer;
}

//------------------------------------------------------------------------------
// FIFO16_Put
// Enter one character into the FIFO
// Input:
//   FIFO is a  pointer to a FIFO struct where data is to be stored
//   data is a byte of data to store in the FIFO buffer
// Output:
//   TRUE if data is properly saved
// Conditions:
//   Assumes that FIFO16_Init has been called
bool FIFO16_Put(FIFO16Ptr pInput, CUINT16 pData)
{
  if (FIFO16_Full(pInput))
      return false;

    //The index of the array is looped around to zero, the modulo ensures this.
    pInput->mBuffer[pInput->mEnd++] = pData;
    pInput->mItems++;
    
    //Number of bytes in fifo increase when a byte is added 	 	
    if (pInput->mEnd >= pInput->mLength)
      pInput->mEnd = 0;
    
    return true;
}

//------------------------------------------------------------------------------
// FIFO16_Get
// Remove one character from the FIFO
// Input:
//   FIFO is a  pointer to a FIFO struct with data to be retrieved
//   dataPtr is a pointer to a memory location to place the retrieved byte
// Output:
//   TRUE if the operation was successful and the data is valid
// Conditions:
//   Assumes that FIFO16_Init has been called
bool FIFO16_Get(FIFO16Ptr pInput, UINT16Ptr pOutput)
{
    if (FIFO16_Empty(pInput))
	return false;
    
    //Sets the data at the address of dataPtr to the buffer start item
    *pOutput = pInput->mBuffer[pInput->mStart++];
    pInput->mItems--;
    
    //One item was requested, one item is removed
    if (pInput->mStart >= pInput->mLength)
	pInput->mStart = 0;
   
    return true;
}

//------------------------------------------------------------------------------
// FIFO16_Empty
// 
// Indicates whether FIFO is empty
// Input:
//   FIFO is a  pointer to a FIFO struct with data to be retrieved
// Output:
//   TRUE if fifo is empty
// Conditions:
//   Assumes that FIFO16_Init has been called
inline bool FIFO16_Empty(FIFO16Ptr pInput)
{
    return (pInput->mItems == 0);
}

//------------------------------------------------------------------------------
// FIFO16_Full
// 
// Indicates whether FIFO is full
// Input:
//   FIFO is a  pointer to a FIFO struct with data to be retrieved
// Output:
//   TRUE if fifo is empty
// Conditions:
//   Assumes that FIFO16_Init has been called
inline bool FIFO16_Full(FIFO16Ptr pInput)
{
    return (pInput->mItems == pInput->mLength);
}