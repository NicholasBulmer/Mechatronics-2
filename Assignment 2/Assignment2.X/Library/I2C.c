#include "I2C.h"
#include "LED.h"
#define WRITE	0
#define READ	1
////////////////////////////////////////////////////////////////////////////////
void	(*I2C1_Done)();
void	(*I2C2_Done)();
bool	(*I2C1_More)(I2CTPtr);
bool	(*I2C2_More)(I2CTPtr);
////////////////////////////////////////////////////////////////////////////////
I2CT	I2C1T, I2C2T;
////////////////////////////////////////////////////////////////////////////////
bool I2CT_Init(I2CTPtr pInput, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount)
{
    ifnull  (pInput)	return false;
    ifnull  (pData)	return false;
    ifzero  (pCount)	return false;
    ifzero  (pAddress)	return false;
   
    pInput->mIndex	= 0;
    pInput->mData	= pData;
    pInput->mCount	= pCount;
    pInput->mState	= eI2C_Idle;
    pInput->mAddress	= pAddress & 0x7F;
    
    return true;
}
////////////////////////////////////////////////////////////////////////////////
bool I2CT_InitR(I2CTPtr pInput, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount)
{
    ifnull  (pInput)	return false;
    ifnull  (pData)	return false;
    ifzero  (pCount)	return false;
    ifzero  (pAddress)	return false;
   
    pInput->mIndex	= 0;
    pInput->mData	= pData;
    pInput->mCount	= pCount;
    pInput->mState	= eI2C_ReadStart;
    pInput->mAddress	= pAddress & 0x7F;
    
    return true;
}
////////////////////////////////////////////////////////////////////////////////
bool I2CT_InitW(I2CTPtr pInput, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount)
{
    ifnull  (pInput)	return false;
    ifnull  (pData)	return false;
    ifzero  (pCount)	return false;
    ifzero  (pAddress)	return false;
   
    pInput->mIndex	= 0;
    pInput->mData	= pData;
    pInput->mCount	= pCount;
    pInput->mState	= eI2C_WriteStart;
    pInput->mAddress	= pAddress & 0x7F;
    
    return true;
}
////////////////////////////////////////////////////////////////////////////////
void I2CT_Reset(I2CTPtr pInput)
{
    pInput->mIndex = 0;
}
////////////////////////////////////////////////////////////////////////////////
bool I2CT_Get(I2CTPtr pInput, UINT8Ptr pOutput)
{
    if (pInput->mIndex < pInput->mCount)
    {
	*pOutput = pInput->mData[pInput->mIndex];
	 ++pInput->mIndex;
	return true;
    }
    return false;
}
////////////////////////////////////////////////////////////////////////////////
bool I2CT_Put(I2CTPtr pInput, UINT8 pValue)
{
    if (pInput->mIndex < pInput->mCount)
    {
	pInput->mData[pInput->mIndex] = pValue;
	++pInput->mIndex;
	return true;
    }
    return false;
}
////////////////////////////////////////////////////////////////////////////////
bool I2CT_At(I2CTPtr pInput, UINT8 pIndex, UINT8Ptr pOutput)
{
    if (pIndex < pInput->mCount)
    {
	*pOutput = pInput->mData[pInput->mIndex = pIndex];
	return true;
    }
    return false;
}
////////////////////////////////////////////////////////////////////////////////
inline bool I2CT_IsRead(I2CTPtr pInput)
{
    return ((UINT8)pInput->mState > 0xF);
}
////////////////////////////////////////////////////////////////////////////////
inline bool I2CT_IsWrite(I2CTPtr pInput)
{
    return ((UINT8)pInput->mState <= 0xF);
}
////////////////////////////////////////////////////////////////////////////////
bool I2CT_Next(I2CTPtr pInput)
{
    switch(I2CT_IsRead(pInput))
    {
	case true:
	    ////////////////////////////////////////////////////////////////////
	    //Read operation
	    if (pInput->mState == eI2C_ReadStopClearFlag)
	    {
		pInput->mState = eI2C_Idle;
		return false;																	    
	    }
	    ////////////////////////////////////////////////////////////////////
	    pInput->mState += eI2C_ReadInc;
	    if (pInput->mState == eI2C_ReadRestart)
		pInput->mState += eI2C_ReadInc;
	    return true;
	    ////////////////////////////////////////////////////////////////////
	case false:
	    ////////////////////////////////////////////////////////////////////
	    //Write operation
	    if (pInput->mState == eI2C_WriteStopClearFlag)
	    {
		pInput->mState = eI2C_Idle;
		return false;																	    
	    }
	    ////////////////////////////////////////////////////////////////////
	    pInput->mState += eI2C_WriteInc;
	    if (pInput->mState == eI2C_WriteRestart)
		pInput->mState += eI2C_WriteInc;
	    return true;
	    ////////////////////////////////////////////////////////////////////
    }
    return false;
}
////////////////////////////////////////////////////////////////////////////////
bool I2CT_Continue(I2CTPtr pInput)
{
    if (pInput->mIndex < pInput->mCount)
    {
	switch(I2CT_IsRead(pInput))
	{
	    case true:
		//Read operation
		pInput->mState = eI2C_ReadData;
		return true;
	    case false:
		//Write operation
		pInput->mState = eI2C_WriteData;
		return true;
	}
    }
    return false;
}
////////////////////////////////////////////////////////////////////////////////
bool I2CT_Stop(I2CTPtr pInput)
{
    switch(I2CT_IsRead(pInput))
    {
	case true:
	    //Read operation
	    pInput->mState = eI2C_ReadStop;
	    return true;
	case false:
	    //Write operation
	    pInput->mState = eI2C_WriteStop;
	    return true;
    }
    return false;
}
////////////////////////////////////////////////////////////////////////////////
inline UINT8 I2CT_WAddress(I2CTPtr pInput)
{
    return (pInput->mAddress << 1);
}
////////////////////////////////////////////////////////////////////////////////
inline UINT8 I2CT_RAddress(I2CTPtr pInput)
{
    return I2CT_WAddress(pInput) | 1;
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
void I2C_Init(eI2C_Channel pChannel, UINT32 pClock, eI2C_Speed pSpeed, eI2C_Mode pMode)
{
    volatile BytePtr TSSPSTAT;
    volatile BytePtr TSSPCON1;
    volatile BytePtr TSSPCON2;
    
    switch (pChannel)
    {
        case eI2C_Ch1:
            TSSPSTAT = (BytePtr)&SSP1STAT;
            TSSPCON1 = (BytePtr)&SSP1CON1;
            TSSPCON2 = (BytePtr)&SSP1CON2;
	    
	    //PortPtr pInput, ePin pPin, ePinType pType
	    Port_SetPinType(&PortC, I2C1_SCL, eTypeInput);
	    Port_SetPinType(&PortC, I2C1_SDA, eTypeInput);
	    
	    //
	    I2C1T.mState    = eI2C_Idle;
            break;
        case eI2C_Ch2:
            TSSPSTAT = (BytePtr)&SSP2STAT;
            TSSPCON1 = (BytePtr)&SSP2CON1;
            TSSPCON2 = (BytePtr)&SSP2CON2;
	    
	    //PortPtr pInput, ePin pPin, ePinType pType
	    Port_SetPinType(&PortD, I2C2_SCL, eTypeInput);
	    Port_SetPinType(&PortD, I2C2_SDA, eTypeInput);
	    
	    //
	    I2C2T.mState    = eI2C_Idle;
            break;
    };

    //Sets the speed of the I2C Port
    Byte_SetBit(TSSPSTAT,   SSPSTAT_SMP,	(UINT8)pSpeed);
    
    //Turns on the I2C specific inputs
    Byte_SetBit(TSSPSTAT,   SSPSTAT_CKE,	ON);

    //Clear flags, enable port and setup mode
    Byte_SetBit	(TSSPCON1,  SSPCON1_WCOL,	OFF);
    Byte_SetBit	(TSSPCON1,  SSPCON1_SSPOV,	OFF);
    Byte_SetQuad(TSSPCON1,  SSPCON1_SSPM,	(UINT8)pMode);
    Byte_SetBit	(TSSPCON2,  SSPCON2_ACKSTAT,	1);
    Byte_SetByte(TSSPCON2,  0);
    
    SSP1ADD = ((CPUCLOCK/4)/pClock)-1; //Setting Clock Speed
   
    //Enable the serial port
    Byte_SetBit	(TSSPCON1,  SSPCON1_SSPEN,	ON);
    
    //Enable channel interrupts
    switch (pChannel)
    {
        case eI2C_Ch1:
	    PIE1bits.SSP1IE = 1;    //Enable Interrupts
	    PIR1bits.SSP1IF = 0;    //Clear Interrupts
            break;
        case eI2C_Ch2:
	    PIE3bits.SSP2IE = 1;    //Enable Interrupts
	    PIR3bits.SSP2IF = 0;    //Clear Interrupts
            break;
    };
}
void I2C_Master_Wait1()
{
  while (SSP1STATbits.RW || (SSP1CON2 & 0b10111)); //Transmit is in progress
}
void I2C_Master_Wait2()
{
  while (SSP1STATbits.RW || (SSP2CON2 & 0b10111)); //Transmit is in progress
}
bool I2C_Write(eI2C_Channel pChannel, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount, void (*pRunDone)(),	bool (*pRunContinue)(I2CTPtr))
{
    switch (pChannel)
    {
    case eI2C_Ch1:
	if (I2C1T.mState == eI2C_Idle)
	{
	    I2CT_InitW(&I2C1T, pAddress, pData, pCount);
	    I2C1_ISR();
	    I2C1_Done   = pRunDone;
	    I2C1_More   = pRunContinue;
	    return true;
	}
	break;
    case eI2C_Ch2:
	if (I2C2T.mState == eI2C_Idle)
	{
	    I2CT_InitW(&I2C2T, pAddress, pData, pCount);
	    I2C2_ISR();
	    I2C2_Done   = pRunDone;
	    I2C2_More   = pRunContinue;
	    return true;
	}
	break;
    };
    return false;
}
bool I2C_RWrite(eI2C_Channel pChannel, UINT8 pAddress, UINT8Ptr pDest, UINT8 pCount,	bool (*pRunContinue)(I2CTPtr))
{
    switch (pChannel)
    {
    case eI2C_Ch1:
	I2CT_InitW(&I2C1T, pAddress, pDest, pCount);
	I2C1T.mState	= eI2C_WriteRestart;
	I2C1_More	= pRunContinue;
	return true;
    case eI2C_Ch2:
	I2CT_InitW(&I2C2T, pAddress, pDest, pCount);
	I2C2T.mState	= eI2C_WriteRestart;
	I2C2_More	= pRunContinue;
	return true;
    };
    return false;
}



bool I2C_Read(	eI2C_Channel pChannel, UINT8 pAddress, UINT8Ptr pDest,	UINT8 pCount,	void (*pRunDone)(),	bool (*pRunContinue)(I2CTPtr))
{
    switch (pChannel)
    {
    case eI2C_Ch1:
	if (I2C1T.mState == eI2C_Idle)
	{
	    I2CT_InitR(&I2C1T, pAddress, pDest, pCount);
	    I2C1_ISR();
	    I2C1_Done = pRunDone;
	    I2C1_More = pRunContinue;
	    return true;
	}
	break;
    case eI2C_Ch2:
	if (I2C2T.mState == eI2C_Idle)
	{
	I2C2T.mIndex = 0;
	    I2CT_InitR(&I2C2T, pAddress, pDest, pCount);
	    I2C2_ISR();
	    I2C2_Done = pRunDone;
	    I2C2_More = pRunContinue;
	    return true;
	}
	break;
    };
    return false;
}

bool I2C_RRead(	eI2C_Channel pChannel, UINT8 pAddress, UINT8Ptr pDest,	UINT8 pCount,	bool (*pRunContinue)(I2CTPtr))
{
    switch (pChannel)
    {
    case eI2C_Ch1:
	I2CT_InitR(&I2C1T, pAddress, pDest, pCount);
	I2C1T.mState	= eI2C_ReadRestart;
	I2C1_More	= pRunContinue;
	return true;
    case eI2C_Ch2:
	I2CT_InitR(&I2C2T, pAddress, pDest, pCount);
	I2C2T.mState	= eI2C_ReadRestart;
	I2C2_More	= pRunContinue;
	return true;
    };
    return false;
}



inline void I2C1_ACK(eI2C_ACKType pType)
{
    SSP1CON2bits.ACKEN = ON;
    SSP1CON2bits.ACKDT = (bool)pType;
}
inline void I2C2_ACK(eI2C_ACKType pType)
{
    SSP2CON2bits.ACKEN = ON;
    SSP2CON2bits.ACKDT = (bool)pType;
}
inline void I2C1_ISR()
{
    //Clear flag
    I2C_Master_Wait1();
    PIR1bits.SSP1IF = 0;
    loop()
    {
	////////////////////////////////////////////////////////////////////////
	switch (I2C1T.mState)
	{
	    case eI2C_WriteStart:
	    case eI2C_ReadStart:
		////////////////////////////////////////////////////////////////
		SSP1CON2bits.SEN = 1;
		I2CT_Next(&I2C1T);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
		return;	//SEN can trigger interrupt
		////////////////////////////////////////////////////////////////
	    case eI2C_ReadRestart:
		////////////////////////////////////////////////////////////////
		SSP1CON2bits.RSEN = 1;
		I2CT_Next(&I2C1T);
		return; //RSEN can trigger interrupt
		////////////////////////////////////////////////////////////////
	    case eI2C_WriteWaitClearFlag:
	    case eI2C_ReadWaitClearFlag:
		////////////////////////////////////////////////////////////////
		I2CT_Next(&I2C1T);
		break;	//Next doesn't trigger interrupt
		////////////////////////////////////////////////////////////////
	    case eI2C_WriteAddress:
		////////////////////////////////////////////////////////////////
		SSP1BUF = I2CT_WAddress(&I2C1T);
		I2CT_Next(&I2C1T);
		return;	//Byte transmitted triggers interrupt
	    case eI2C_ReadAddress:
		////////////////////////////////////////////////////////////////
		SSP1BUF = I2CT_RAddress(&I2C1T);
		I2CT_Next(&I2C1T);
		return;	//Byte transmitted triggers interrupt
		////////////////////////////////////////////////////////////////
	    case eI2C_WriteCheckAddressACK:
	    case eI2C_ReadCheckAddressACK:
		////////////////////////////////////////////////////////////////
		if (SSP1CON2bits.ACKSTAT)
		    I2CT_Stop(&I2C1T);
		else		    
		    I2CT_Next(&I2C1T);
		break;	//No function here triggers interrupt
		////////////////////////////////////////////////////////////////
	    case eI2C_WriteAddrClearFlag:
	    case eI2C_ReadAddrClearFlag:
		////////////////////////////////////////////////////////////////
		I2CT_Next(&I2C1T);
		break;	//No function here triggers interrupt
		////////////////////////////////////////////////////////////////
	    case eI2C_WriteRestart: 
		I2CT_Next(&I2C1T);
		break;
	    case eI2C_WriteData:
		////////////////////////////////////////////////////////////////
		I2CT_Get(&I2C1T, (UINT8Ptr)&SSP1BUF);
		I2CT_Next(&I2C1T);
		return;	//Byte transmitted triggers interrupt
		////////////////////////////////////////////////////////////////
	    case eI2C_ReadData:
		////////////////////////////////////////////////////////////////
		SSP1CON2bits.RCEN = 1;
		I2CT_Next(&I2C1T);
		return;	
		////////////////////////////////////////////////////////////////
	    case eI2C_WriteDataCheckACK:
		if (SSP1CON2bits.ACKSTAT)		
		    I2CT_Stop(&I2C1T);
		else if (!I2CT_Continue(&I2C1T))	
		    I2CT_Next(&I2C1T);
		break;
	    case eI2C_ReadDataCheckACK:
		////////////////////////////////////////////////////////////////
		if(I2CT_Put(&I2C1T, (UINT8)SSP1BUF))
		{
		    I2CT_Continue(&I2C1T);
		    I2C1_ACK(eI2C_NACK);
		}
		else
		{
		    I2CT_Stop(&I2C1T);
		    I2C1_ACK(eI2C_ACK);
		}
		return;	//ACK can generate an interrupts
		////////////////////////////////////////////////////////////////
	    case eI2C_WriteDataClearFlag:
	    case eI2C_ReadDataClearFlag:
		////////////////////////////////////////////////////////////////
		I2CT_Next(&I2C1T);
		break;
		////////////////////////////////////////////////////////////////
	    case eI2C_ReadStop:
	    case eI2C_WriteStop:
		////////////////////////////////////////////////////////////////
		if (I2C1_More(&I2C1T))
		    break;
		
		SSP1CON2bits.PEN = 1;
		I2CT_Next(&I2C1T);
		return;	//PEN Can generate an interrupt
		////////////////////////////////////////////////////////////////
	    case eI2C_WriteStopClearFlag:
	    case eI2C_ReadStopClearFlag:
		////////////////////////////////////////////////////////////////
		I2C1_Done();
		I2CT_Next(&I2C1T);
		return;
		////////////////////////////////////////////////////////////////
	}
    }
}
inline void I2C2_ISR()
{
}