/*******************************************************************************
File:			"FIFOBIT.h"

Author:			David Ledger

Brief:			The FIFOBIT structure is used to store the incoming bits in a
                circular array.
				
Copyright (c) 2016 David Ledger. All rights reserved.
*******************************************************************************/

#ifndef FIFOBIT_H
#define FIFOBIT_H

#include "Types.h"


typedef struct FIFOBIT FIFOBIT;
typedef struct FIFOBIT * const FIFOBITPtr;

//------------------------------------------------------------------------------
// FIFO structure
struct FIFOBIT
{
  UINT16 	mEnd;
  UINT8Ptr  mBuffer;
  UINT16    mLength;
};

//------------------------------------------------------------------------------
// FIFOBIT_Init
// 
// Initialize the FIFOBIT
// Input:
//   FIFOBIT is a pointer to a FIFOBIT struct to initialize
// Output:
//   none
// Conditions:
//  Memory is avaliable and FIFOBIT isn't nullptr, FIFOBIT size>0
void FIFOBIT_Init(FIFOBITPtr pInput, UINT8Ptr pBuffer, UINT16 pLength);

//------------------------------------------------------------------------------
// FIFOBIT_Put
// 
// Enter one bit into the FIFOBIT
// Input:
//   FIFO is a  pointer to a FIFOBIT struct where data is to be stored
//   data is a byte of data to store in the FIFOBIT buffer
// Output:
//   TRUE if data is properly saved
// Conditions:
//   Assumes that FIFOBIT has been called
bool FIFOBIT_Put(FIFOBITPtr pInput, UINT8 pData); 

//------------------------------------------------------------------------------
// FIFOBIT_Get
// 
// Remove one bit from the FIFOBIT
// Input:
//   FIFO is a  pointer to a FIFOBIT struct with data to be retrieved
//   dataPtr is a pointer to a memory location to place the retrieved byte
// Output:
//   TRUE if the operation was successful and the data is valid
// Conditions:
//   Assumes that FIFOBIT_Init has been called
bool FIFOBIT_Get(FIFOBITPtr pInput, UINT8Ptr pOutput);

//------------------------------------------------------------------------------
// FIFOBIT_Empty
// 
// Remove one bit from the FIFOBIT
// Input:
//   FIFO is a  pointer to a FIFOBIT struct with data to be retrieved
// Output:
//   TRUE if FIFOBIT is empty
// Conditions:
//   Assumes that FIFOBIT_Empty has been called
inline bool FIFOBIT_Empty(FIFOBITPtr pInput);

//------------------------------------------------------------------------------
// FIFOBIT_Full
// 
// Indicates whether FIFOBIT is full
// Input:
//   FIFOBIT is a  pointer to a FIFOBIT struct with data to be retrieved
// Output:
//   TRUE if FIFOBIT is empty
// Conditions:
//   Assumes that FIFOBIT_Init has been called
inline bool FIFOBIT_Full(FIFOBITPtr pInput);
#endif