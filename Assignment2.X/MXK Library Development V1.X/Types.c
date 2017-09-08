#include "Types.h"
////////////////////////////////////////////////////////////////////////////////////
static const UINT8 MASKS[] = \
{0, 0b1, 0b11, 0b111, 0b1111, 0b11111, 0b111111, 0b1111111, 0b11111111};
////////////////////////////////////////////////////////////////////////////////////
inline void CopyBytes(PTR pSource, PTR pDestination, UINT16 pCount)
{
    int i;
    UINT8Ptr Dest;

    ifzero(pCount)	    return;
    ifnull(pSource)	    return;
    ifnull(pDestination)    return;

    //Copy all bytes
    for (i = 0; i < pCount; i++)
    {
	Dest = (UINT8Ptr)pDestination + i;
	*Dest = *((UINT8Ptr)pSource + i);
    }
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void Byte_Init(BytePtr pInput)
{
	pInput->mBits = (bits)0x00;
}
////////////////////////////////////////////////////////////////////////////////////
void Byte_SetBit(BytePtr pInput, UINT8 pBit, UINT8 pValue)
{
	pValue &= 0b1;
	pInput->mBits &= ~(0b1 << pBit);
	pInput->mBits |= pValue << pBit;
}
UINT8 Byte_GetBit(BytePtr pInput, UINT8 pBit)
{
	UINT8 Output = pInput->mBits;

	Output >>= pBit;
	Output &= 0b1;
	return Output;
}
////////////////////////////////////////////////////////////////////////////////////
inline void Byte_SetZone(BytePtr pInput, UINT8 pMax, UINT8 pChunk, UINT8 pChunkSize, UINT8 pValue)
{
	UINT8 MASK = MASKS[pChunkSize];
	UINT8 Offset = 0;

	while (pChunk >= pMax)
	{
		pChunk -= pMax;
		Offset += 1;
	}
	pChunk *= pChunkSize;
	pChunk += Offset;

	pValue &= MASK;
	pInput->mBits &= ~(MASK << pChunk);
	pInput->mBits |= pValue << pChunk;
}
inline UINT8 Byte_GetZone(BytePtr pInput, UINT8 pMax, UINT8 pChunk, UINT8 pChunkSize)
{
	UINT8 Output = pInput->mBits;
	UINT8 MASK = MASKS[pChunkSize];
	UINT8 Offset = 0;

	while (pChunk >= pMax)
	{
		pChunk -= pMax;
		Offset += 1;
	}
	pChunk *= pChunkSize;
	pChunk += Offset;

	Output >>= pChunk;
	Output &= MASK;
	return Output;
}
////////////////////////////////////////////////////////////////////////////////////
void Byte_SetPair(BytePtr pInput, UINT8 pPair, UINT8 pValue)
{
	Byte_SetZone(pInput, 4, pPair, 2, pValue);
}
UINT8 Byte_GetPair(BytePtr pInput, UINT8 pPair)
{
	return Byte_GetZone(pInput, 4, pPair, 2);
}
////////////////////////////////////////////////////////////////////////////////////
void Byte_SetTriple(BytePtr pInput, UINT8 pTriple, UINT8 pValue)
{
	Byte_SetZone(pInput, 2, pTriple, 3, pValue);
}
UINT8 Byte_GetTriple(BytePtr pInput, UINT8 pTriple)
{
	return Byte_GetZone(pInput, 2, pTriple, 3);
}
////////////////////////////////////////////////////////////////////////////////////
void Byte_SetQuad(BytePtr pInput, UINT8 pQuad, UINT8 pValue)
{
	Byte_SetZone(pInput, 2, pQuad, 4, pValue);
}
UINT8 Byte_GetQuad(BytePtr pInput, UINT8 pQuad)
{
	return Byte_GetZone(pInput, 2, pQuad, 4);
}
////////////////////////////////////////////////////////////////////////////////////
void Byte_SetPort(BytePtr pInput, UINT8 pValue)
{
	pInput->mBits = (pValue & 0xFF);
}
UINT8 Byte_GetPort(BytePtr pInput)
{
	return pInput->mBits & 0xFF;
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void Word_Init(Word* pInput)
{
    //Return if the pointer doesn't go anywhere
    ifnull(pInput)  return;
    
    //Clear the bits for the word
    pInput->mBits = 0x00;
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetBit(Word* pInput, UINT8 pBit, UINT8 pValue)
{
    if (pBit >= 8)
	Byte_SetBit(&(pInput->MS_Byte), pBit - 8, pValue);	//The MSB
    else
	Byte_SetBit(&(pInput->LS_Byte), pBit, pValue);		//The LSB
}
UINT8 Word_GetBit(Word* pInput, UINT8 pBit)
{
    if (pBit >= 8)
	return Byte_GetBit(&(pInput->MS_Byte), pBit - 8);	//The MSB
    else
	return Byte_GetBit(&(pInput->LS_Byte), pBit);		//The LSB
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetPair(Word* pInput, UINT8 pPair, UINT8 pValue)
{
    if (pPair >= 4)
	Byte_SetPair(&(pInput->MS_Byte), pPair - 4, pValue);//The MSB
    else
	Byte_SetPair(&(pInput->LS_Byte), pPair, pValue);	//The LSB
}
UINT8 Word_GetPair(Word* pInput, UINT8 pPair)
{
    if (pPair >= 4)
	return Byte_GetPair(&(pInput->MS_Byte), pPair - 4);	//The MSB
    else
	return Byte_GetPair(&(pInput->LS_Byte), pPair);		//The LSB
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetQuad(Word* pInput, UINT8 pQuad, UINT8 pValue)
{
    if (pQuad >= 2)
	Byte_SetQuad(&(pInput->MS_Byte), pQuad - 2, pValue);//The MSB
    else
	Byte_SetQuad(&(pInput->LS_Byte), pQuad, pValue);	//The LSB
}
UINT8 Word_GetQuad(Word* pInput, UINT8 pQuad)
{
    if (pQuad >= 2)
	return Byte_GetQuad(&(pInput->MS_Byte), pQuad - 2);	//The MSB
    else
	return Byte_GetQuad(&(pInput->LS_Byte), pQuad);		//The LSB
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetByte(Word* pInput, UINT8 pByte, UINT8 pValue)
{
    if (pByte >= 1)
	pInput->MS_Byte.mBits = (UINT8)pValue;			//The MSB
    else
	pInput->LS_Byte.mBits = (UINT8)pValue;			//The LSB
}
UINT8 Word_GetByte(Word* pInput, UINT8 pByte)
{
    if (pByte >= 1)
	return pInput->MS_Byte.mBits;				//The MSB
    else
	return pInput->LS_Byte.mBits;				//The LSB
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetWord(Word* pInput, UINT16 pValue)
{
    pInput->mBits = (UINT16)pValue;
}
UINT16 Word_GetWord(Word* pInput)
{
    return pInput->mBits;
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void PortProperty_Init(PortPropertyPtr pInput, ePinDrive pPinDrive[8])
{
	UINT8 Index;

	//Set all bits of the port to be reserved
	Word_SetWord(&(pInput->mType), 0xFFFF);

	//Configure bits as per the pin functions in the parameters
	for (Index = 0; Index < 8; Index++)
		Word_SetPair(&(pInput->mType), Index, (UINT8)pPinDrive[Index]);
}
////////////////////////////////////////////////////////////////////////////////////
ePinError PortProperty_Valid(PortPropertyPtr pInput, ePinDrive pPinDrive, UINT8 pPin)
{
	ePinDrive Pair;
	const ePinError Errors[4][4] =
	{
	//PROP		IN	eHL							eLow							eHigh						eNone	
	/*eHL  */	{	ePinErrorNone,				ePinErrorCannotDriveHigh,		ePinErrorCannotDriveLow,	ePinErrorNone			},
	/*eLow */	{	ePinErrorCannotDriveHigh,	ePinErrorNone,					ePinErrorCannotDriveHigh,	ePinErrorNone			},
	/*eHigh*/	{	ePinErrorCannotDriveLow,	ePinErrorCannotDriveLow,		ePinErrorNone,				ePinErrorNone			},
	/*eNone*/	{	ePinErrorCannotDrive,		ePinErrorCannotDrive,			ePinErrorCannotDrive,		ePinErrorNone			}
	};
	
	Pair = (ePinDrive)Word_GetPair(&(pInput->mType), pPin);
	
	if (pPinDrive < 4 && Pair < 4)
		return Errors[pPinDrive][Pair];

	return ePinErrorState;
}
////////////////////////////////////////////////////////////////////////////////////