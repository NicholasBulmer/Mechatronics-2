#include "FIFOBIT.h"
//   none
// Conditions:
//  Memory is avaliable and FIFOBIT isn't nullptr, FIFOBIT size>0
void FIFOBIT_Init(FIFOBITPtr pInput, UINT8Ptr pBuffer, UINT16 pLength)
{
    pInput->mLength = pLength * 8;
    pInput->mBuffer = pBuffer;
    pInput->mEnd    = 0;

    for (UINT16 i = 0; i < pLength; i++)
        pBuffer[i] = 0;
}

inline void FIFOBIT_Shift(FIFOBITPtr pInput)
{
    static UINT8	a = 0;
    static UINT8	LBIT = 0;
    static UINT8	CUR = 0;
    static UINT8	LIM = 0;
    LBIT = 0;
    LIM = pInput->mLength>>3;
    for (a = 0; a < LIM; a++)
    {
        CUR = pInput->mBuffer[a];
        pInput->mBuffer[a] <<= 1;
        pInput->mBuffer[a] |= LBIT;
        LBIT = (0b10000000 & CUR)?1:0;
    }
    pInput->mEnd ++;
}

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
bool FIFOBIT_Put(FIFOBITPtr pInput, UINT8 pData)
{
    if (FIFOBIT_Full(pInput))
        return false;

    FIFOBIT_Shift(pInput);
    *pInput->mBuffer |= (pData&1);

    return true;
}

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
bool FIFOBIT_Get(FIFOBITPtr pInput, UINT8Ptr pOutput)
{
    if (FIFOBIT_Empty(pInput))
        return false;

    UINT8 mend = pInput->mEnd ;
    UINT8 i = mend >> 3;    //Gets which byte it is in
    UINT8 b = mend - (UINT8)(i << 3);	    //Gets which bit it is in

    b--;
    *pOutput = (pInput->mBuffer[i] >> b) & 1;

    if (pInput->mEnd)
        pInput->mEnd --;

    return true;
}

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
inline bool FIFOBIT_Empty(FIFOBITPtr pInput)
{
    return (pInput->mEnd == 0);
}

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
inline bool FIFOBIT_Full(FIFOBITPtr pInput)
{
    return (pInput->mEnd == pInput->mLength - 1);
}
