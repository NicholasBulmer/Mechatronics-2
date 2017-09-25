/*******************************************************************************
File:			"FIFO.h"

Author:			David Ledger

Brief:			The FIFO structure is used to store the incoming bytes in a
                circular array.
				
Copyright (c) 2016 David Ledger. All rights reserved.
*******************************************************************************/

#ifndef FIFO16_H
#define FIFO16_H

#include "Types.h"


typedef struct FIFO16 FIFO16;
typedef struct FIFO16 * const FIFO16Ptr;

//------------------------------------------------------------------------------
// FIFO structure
struct FIFO16
{
  UINT16    mStart;
  UINT16    mLength;
  UINT16    mItems;
  UINT16 	mEnd;
  UINT16Ptr  mBuffer;
};


//------------------------------------------------------------------------------
// FIFO16_Init
// 
// Initialize the FIFO
// Input:
//   FIFO is a pointer to a FIFO struct to initialize
// Output:
//   none
// Conditions:
//  Memory is avaliable and FIFO isn't nullptr, FIFO size>0
void FIFO16_Init(FIFO16Ptr pInput, UINT16Ptr pBuffer, UINT16 pLength);

//------------------------------------------------------------------------------
// FIFO16_Put
// 
// Enter one character into the FIFO
// Input:
//   FIFO is a  pointer to a FIFO struct where data is to be stored
//   data is a byte of data to store in the FIFO buffer
// Output:
//   TRUE if data is properly saved
// Conditions:
//   Assumes that FIFO16_Init has been called
bool FIFO16_Put(FIFO16Ptr pInput, CUINT16 pData); 

//------------------------------------------------------------------------------
// FIFO16_Get
// 
// Remove one character from the FIFO
// Input:
//   FIFO is a  pointer to a FIFO struct with data to be retrieved
//   dataPtr is a pointer to a memory location to place the retrieved byte
// Output:
//   TRUE if the operation was successful and the data is valid
// Conditions:
//   Assumes that FIFO16_Init has been called
bool FIFO16_Get(FIFO16Ptr pInput, UINT16Ptr pOutput);

//------------------------------------------------------------------------------
// FIFO16_Empty
// 
// Remove one character from the FIFO
// Input:
//   FIFO is a  pointer to a FIFO struct with data to be retrieved
// Output:
//   TRUE if fifo is empty
// Conditions:
//   Assumes that FIFO16_Empty has been called
inline bool FIFO16_Empty(FIFO16Ptr pInput);

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
inline bool FIFO16_Full(FIFO16Ptr pInput);
#endif