#include "Types.h"
////////////////////////////////////////////////////////////////////////////////////
static const UINT8 MASKS[] = \
{0, 0x1, 0x3, 0x7, 0xF, 0x1F, 0x3F, 0x7F, 0xFF};
////////////////////////////////////////////////////////////////////////////////////
void CopyBytes(PTR pSource, PTR pDestination, UINT16 pCount)
{
    UINT16 i;
    UINT8Ptr Dest;

    ifzero(pCount)	    return;
    ifnull(pSource)	    return;
    ifnull(pDestination)    return;

    //Copy all bytes
    for (i = 0; i < pCount; i++)
    {
	Dest = (UINT8Ptr)pDestination + i;
	*Dest = *(UINT8Ptr)((UINT16)pSource + i);
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
	pValue &= 1;
	pInput->mBits &= ~(1 << pBit);
	pInput->mBits |= pValue << pBit;
}
UINT8 Byte_GetBit(BytePtr pInput, UINT8 pBit)
{
	UINT8 Output = pInput->mBits;

	Output >>= pBit;
	Output &= 1;
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
void Byte_SetByte(BytePtr pInput, UINT8 pValue)
{
	pInput->mBits = (pValue & 0xFF);
}
UINT8 Byte_GetByte(BytePtr pInput)
{
	return pInput->mBits & 0xFF;
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void Word_Init(WordPtr pInput)
{
    //Return if the pointer doesn't go anywhere
    ifnull(pInput)  
	    return;
    
    //Clear the bits for the word
    pInput->mBits = 0x00;
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetBit(WordPtr pInput, UINT8 pBit, UINT8 pValue)
{
    if (pBit >= 8)
	Byte_SetBit(&(pInput->MS_Byte), pBit - 8, pValue);	//The MSB
    else
	Byte_SetBit(&(pInput->LS_Byte), pBit, pValue);		//The LSB
}
UINT8 Word_GetBit(WordPtr pInput, UINT8 pBit)
{
    if (pBit >= 8)
	return Byte_GetBit(&(pInput->MS_Byte), pBit - 8);	//The MSB
    else
	return Byte_GetBit(&(pInput->LS_Byte), pBit);		//The LSB
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetPair(WordPtr pInput, UINT8 pPair, UINT8 pValue)
{
    if (pPair >= 4)
	Byte_SetPair(&(pInput->MS_Byte), pPair - 4, pValue);//The MSB
    else
	Byte_SetPair(&(pInput->LS_Byte), pPair, pValue);	//The LSB
}
UINT8 Word_GetPair(WordPtr pInput, UINT8 pPair)
{
    if (pPair >= 4)
	return Byte_GetPair(&(pInput->MS_Byte), pPair - 4);	//The MSB
    else
	return Byte_GetPair(&(pInput->LS_Byte), pPair);		//The LSB
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetQuad(WordPtr pInput, UINT8 pQuad, UINT8 pValue)
{
    if (pQuad >= 2)
	Byte_SetQuad(&(pInput->MS_Byte), pQuad - 2, pValue);//The MSB
    else
	Byte_SetQuad(&(pInput->LS_Byte), pQuad, pValue);	//The LSB
}
UINT8 Word_GetQuad(WordPtr pInput, UINT8 pQuad)
{
    if (pQuad >= 2)
	return Byte_GetQuad(&(pInput->MS_Byte), pQuad - 2);	//The MSB
    else
	return Byte_GetQuad(&(pInput->LS_Byte), pQuad);		//The LSB
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetByte(WordPtr pInput, UINT8 pByte, UINT8 pValue)
{
    if (pByte >= 1)
	pInput->MS_Byte.mBits = (UINT8)pValue;			//The MSB
    else
	pInput->LS_Byte.mBits = (UINT8)pValue;			//The LSB
}
UINT8 Word_GetByte(WordPtr pInput, UINT8 pByte)
{
    if (pByte >= 1)
	return pInput->MS_Byte.mBits;				//The MSB
    else
	return pInput->LS_Byte.mBits;				//The LSB
}
////////////////////////////////////////////////////////////////////////////////////
void Word_SetWord(WordPtr pInput, UINT16 pValue)
{
    pInput->mBits = (UINT16)pValue;
}
UINT16 Word_GetWord(WordPtr pInput)
{
    return pInput->mBits;
}
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void PortProperty_Init(PortPropertyPtr pInput, ePinDrive pPinDrive[])
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
	/*eHL  */	{	ePinErrorNone,			ePinErrorCannotDriveHigh,		ePinErrorCannotDriveLow,	ePinErrorNone			},
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
void delay_ms(UINT16 ms) 
{
    volatile unsigned long u;
    while (ms--) 
    {
        /* Inner loop takes about 10 cycles per iteration + 4 cycles setup. */
        for (u = 0; u < LOOPS_PER_MS; u++) {
            /* Prevent this loop from being optimized away. */
	    #asm
            nop;
	    #endasm
        }
    }
    u = 0x8008;
}
void delay_us(UINT16 us) {
    unsigned long u;
    while (us--) {
        /* Inner loop takes about 10 cycles per iteration + 4 cycles setup. */
        for (u = 0; u < LOOPS_PER_US; u++) {
            /* Prevent this loop from being optimized away. */
	    #asm
            nop;
	    #endasm
        }
    }
}
static char zero = '0';
static char a = 'a';
static char A = 'A';
char	ToLower(char pCHR)
{
    if (('A' <= pCHR) && (pCHR <= 'Z'))
	    return (pCHR - A) + a;

    return pCHR;
}
char	ToUpper(char pCHR)
{
    if (('a' <= pCHR) && (pCHR <= 'z'))
	    return (pCHR - a) + A;

    return pCHR;
}
UINT8 ToSegment(char pCHR)
{
    switch(pCHR)
    {
	case	'0':	return e0;
	case	'1':	return e1;
	case	'2':	return e2;
	case	'3':	return e3;
	case	'4':	return e4;
	case	'5':	return e5;
	case	'6':	return e6;
	case	'7':	return e7;
	case	'8':	return e8;
	case	'9':	return e9;
	
	case	'a':	return ea;
	case	'b':	return eb;
	case	'c':	return ec;
	case	'd':	return ed;
	case	'e':	return ee;
	case	'f':	return ef;
	case	'g':	return eg;
	case	'h':	return eh;
	case	'i':	return ei;
	case	'j':	return ej;
	case	'k':	return ek;
	case	'l':	return el;
	case	'm':	return em;
	case	'n':	return en;
	case	'o':	return eo;
	case	'p':	return ep;
	case	'q':	return eq;
	case	'r':	return er;
	case	's':	return es;
	case	't':	return et;
	case	'u':	return eu;
	case	'v':	return ev;
	case	'w':	return ew;
	case	'x':	return ex;
	case	'y':	return ey;
	case	'z':	return ez;
	
	case	'A':	return eA;
	case	'B':	return eB;
	case	'C':	return eC;
	case	'D':	return eD;
	case	'E':	return eE;
	case	'F':	return eF;
	case	'G':	return eG;
	case	'H':	return eH;
	case	'I':	return eI;
	case	'J':	return eJ;
	case	'K':	return eK;
	case	'L':	return eL;
	case	'M':	return eM;
	case	'N':	return eN;
	case	'O':	return eO;
	case	'P':	return eP;
	case	'Q':	return eQ;
	case	'R':	return eR;
	case	'S':	return eS;
	case	'T':	return eT;
	case	'U':	return eU;
	case	'V':	return eV;
	case	'W':	return eW;
	case	'X':	return eX;
	case	'Y':	return eY;
	case	'Z':	return eZ;
	case	'.':	return eDot;
    }
    return 0;
}

void reverse(char * input , UINT16 length)
{
    char tempVar,
        *iterator = input + length;

    while ( --iterator > input )
    {
      tempVar = *input;
      *input++=*iterator;
      *iterator=tempVar;
    }
}
void itos(UINT16 input, char* destination)
{
	UINT16 Out = input;
	UINT16 Length = 0;
	char 	*Data = destination;
	if(Out == 0)
	{
		Data[0] = (UINT16)'0';
		Length = 1;
	}
	else
	{
		while (Out > 0 && Length < 6)
		{
			Data[0] = (UINT16)'0' + Out%10;
			Out /= 10;
			Length ++;
			Data++;
		}
		reverse(destination, Length);
	}
	destination[Length] = '\0';
}

void swap(UINT8Ptr pA, UINT8Ptr pB)
{
    UINT8 temp = *pA;
    *pA = *pB;
    *pB = temp;
}