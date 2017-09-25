/* 
 * File:   Port.h
 * Author: User
 *
 * Created on 13 September 2016, 12:18 PM
 */
#include "Port.h"
Port PortA, PortB, PortC, PortD, PortE, PortF, PortG;

//The following table outlines the MXK's supported pin functions for the entire microcontroller these are consulted by the functions below.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//							Port Label						P0			P1			P2			P3			P4			P5			P6			P7	  		//
const static PortProperty	PortA_Property = PORTPROPERTY(	ENone,		ENone,		ENone,		ENone,		EHL,		EHL,		EHL,		EHL); 		//
const static PortProperty	PortB_Property = PORTPROPERTY(	EHL,		EHL,		EHL,		EHL,		ENone,		ENone,		ENone,		ENone);		//
const static PortProperty	PortC_Property = PORTPROPERTY(	EHL,		EHL,		ENone,		ENone,		ENone,		ENone,		ENone,		ENone);		//
const static PortProperty	PortD_Property = PORTPROPERTY(	ENone,		ENone,		ENone,		ENone,		ENone,		ENone,		ENone,		ENone);		//
const static PortProperty	PortE_Property = PORTPROPERTY(	EHL,		EHL,		EHL,		EHL,		EHL,		EHL,		EHL,		EHL);  		//
const static PortProperty	PortF_Property = PORTPROPERTY(	ENone,		ENone,		ENone,		ENone,		ENone,		ENone,		EHL,		EHL);		//
const static PortProperty	PortG_Property = PORTPROPERTY(	EHL,		EHL,		EHL,		EHL,		EHL,		ENone,		ENone,		ENone);		//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PortPropertyPtr GetPortProperties(ePort pInput)
{
    switch (pInput)	
    {
    case ePortA:
	return (PortPropertyPtr)&PortA_Property;
    case ePortB:
	return (PortPropertyPtr)&PortB_Property;
    case ePortC:
	return (PortPropertyPtr)&PortC_Property;
    case ePortD:
	return (PortPropertyPtr)&PortD_Property;
    case ePortE:
	return (PortPropertyPtr)&PortE_Property;
    case ePortF:
	return (PortPropertyPtr)&PortF_Property;
    case ePortG:
	return (PortPropertyPtr)&PortG_Property;
    default:
	return NULLPTR;
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
BytePtr GetPortPORT(ePort pInput)
{
    switch (pInput)
    {
    case ePortA:
	return (BytePtr)&PORTA;
    case ePortB:
	return (BytePtr)&PORTB;
    case ePortC:
	return (BytePtr)&PORTC;
    case ePortD:
	return (BytePtr)&PORTD;
    case ePortE:
	return (BytePtr)&PORTE;
    case ePortF:
	return (BytePtr)&PORTF;
    case ePortG:
	return (BytePtr)&PORTG;
    default:
	return NULLPTR;
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
BytePtr GetPortTRIS(ePort pInput)
{
    switch (pInput)
    {
    case ePortA:
	    return (BytePtr)&TRISA;
    case ePortB:
	    return (BytePtr)&TRISB;
    case ePortC:
	    return (BytePtr)&TRISC;
    case ePortD:
	    return (BytePtr)&TRISD;
    case ePortE:
	    return (BytePtr)&TRISE;
    case ePortF:
	    return (BytePtr)&TRISF;
    case ePortG:
	    return (BytePtr)&TRISG;
    default:
	    return NULLPTR;
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
BytePtr GetPortLAT(ePort pInput)
{
    switch (pInput)
    {
    case ePortA:
	    return (BytePtr)&LATA;
    case ePortB:
	    return (BytePtr)&LATB;
    case ePortC:
	    return (BytePtr)&LATC;
    case ePortD:
	    return (BytePtr)&LATD;
    case ePortE:
	    return (BytePtr)&LATE;
    case ePortF:
	    return (BytePtr)&LATF;
    case ePortG:
	    return (BytePtr)&LATG;
    default:
	    return NULLPTR;
    }
}
ePinError	Port_CheckPairType  (PortPtr pInput, ePair pPair, ePinDrive pDrive)
{
    ePinError Output = ePinErrorState;

    PortPropertyPtr Props = (PortPropertyPtr)&(pInput->mProperties->mWord);
    ePin Pin1 = (ePin)((int)pPair * 2);
    ePin Pin2 = (ePin)((int)pPair * 2 + 1);

    //Don't bother checking pin 2 if pin 1 isn't valid
    if ((Output = PortProperty_Valid(Props, pDrive, Pin1)) == ePinErrorNone)
	    Output = PortProperty_Valid(Props, pDrive, Pin2);

    return Output;
}
ePinError	Port_CheckQuadType  (PortPtr pInput, eQuad pQuad, ePinDrive pDrive)
{
    ePinError Output = ePinErrorState;
    ePair Pair1 = (ePair)((int)pQuad * 2);
    ePair Pair2 = (ePair)((int)pQuad * 2 + 1);

    //Don't bother checking pin 2 if pin 1 isn't valid
    if ((Output = Port_CheckPairType(pInput, Pair1, pDrive)) == ePinErrorNone)
	    Output = Port_CheckPairType(pInput, Pair2, pDrive);

    return Output;
}
ePinError	Port_CheckPortType  (PortPtr pInput, ePinDrive pDrive)
{
    ePinError Output = ePinErrorState;

    //Don't bother checking pin 2 if pin 1 isn't valid
    if ((Output = Port_CheckQuadType(pInput, eP0_3, pDrive)) == ePinErrorNone)
	    Output = Port_CheckQuadType(pInput, eP4_7, pDrive);

    return Output;
}
////////////////////////////////////////////////////////////////////////////////////
//Public Functions
void		Port_Init	    (PortPtr pInput, ePort pPort)
{
    //Setup the port properties checker
    pInput->mProperties = GetPortProperties(pPort);
    pInput->mInput	= GetPortPORT(pPort);
    pInput->mOutput	= GetPortPORT(pPort);
    pInput->mDirection	= GetPortTRIS(pPort);

    //Zero out inputs
    pInput->mOutput->mBits = 0x00;
    pInput->mDirection->mBits = 0xFF;

    //Safest input mode is inputs
    Port_SetType(pInput, eTypeInput);

    //Setup ports as per port properties as default:
    UINT8 i;
    for (i=0; i<8; i++)
    {
	switch(Word_GetPair(&pInput->mProperties->mType, i))
	{
	    case    EHL:
		Port_SetPinType(pInput, i, eTypeOutputPushPull);
		break;
	    case    EHigh:
		Port_SetPinType(pInput, i, eTypeOutputOpenSource);
		break;
	    case    ELow:
		Port_SetPinType(pInput, i, eTypeOutputOpenDrain);
		break;
	    case ENone:
		Port_SetPinType(pInput, i, eTypeInput);
		break;
	}
    }
    Port_Set(pInput, 0x00);
}

////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetPinType	    (PortPtr pInput, ePin pPin, ePinType pType)
{
    PortProperty * Props = pInput->mProperties;
    ePinError Output = ePinErrorState;
    switch (pType)
    {
    case eTypeInput:
	    //if ((Output = PortProperty_Valid(Props, eNone, pPin)) == ePinErrorNone)
	    {
		    //Set the port to be an input
		    Byte_SetBit(pInput->mDirection, (UINT8)pPin, INPUT);

		    //Set the output register state to be low
		    //Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
		    break;
	    }
	    //else return Output;
    case eTypeOutputOpenDrain:
	    if ((Output = PortProperty_Valid(Props, eLow, pPin)) == ePinErrorNone)
	    {
		    //Set the port to be an output
		    Byte_SetBit(pInput->mDirection, (UINT8)pPin, OUTPUT);

		    //Set the output register state to be low
		    Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
		    break;
	    }
	    else return Output;
	    
    case eTypeOutputOpenSource:
	    if ((Output = PortProperty_Valid(Props, eHigh, pPin)) == ePinErrorNone)
	    {
		    //Set the port to be an input
		    Byte_SetBit(pInput->mDirection, (UINT8)pPin, INPUT);

		    //Set the output register state to be low
		    Byte_SetBit(pInput->mOutput, (UINT8)pPin, 1);
		    break;
	    }
	    else return Output;
	    
    case eTypeOutputPushPull:
	    if ((Output = PortProperty_Valid(Props, eHL, pPin)) == ePinErrorNone)
	    {
		    //Set the port to be an output
		    Byte_SetBit(pInput->mDirection, (UINT8)pPin, OUTPUT);

		    //Set the output register state to be low
		    Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
		    break;
	    }
	    else return Output;
    };

    //Setup the pin type
    Word_SetPair(&pInput->mType, (UINT8)pPin, (UINT8)pType);
    return Output;
}
void		Port_SetPin	    (PortPtr pInput, ePin pPin, UINT8 pValue)
{
    ePinType Type = (ePinType)Word_GetPair(&pInput->mType, (UINT8)pPin);
    switch (Type)
    {
    case eTypeInput:
	    return;
    case eTypeOutputOpenDrain:
	    //Open drain pulls down
	    pValue &= 1;
	    Byte_SetBit(pInput->mDirection, pPin, pValue);
	    break;
    case eTypeOutputOpenSource:
	    //Open source pulls up
	    pValue &= 1;
	    pValue ^= 1;
	    Byte_SetBit(pInput->mDirection, pPin, pValue);
	    break;
    case eTypeOutputPushPull:
	    pValue &= 1;
	    Byte_SetBit(pInput->mOutput, pPin, pValue);
	    break;
    }
}
UINT8		Port_GetPin	    (PortPtr pInput, ePin pPin)
{
    UINT8 Output = pInput->mInput->mBits;
    Output >>= (UINT8)pPin;
    Output &= 1;
    return Output;
}
void		Port_TogglePin	    (PortPtr pInput, ePin pPin)
{
    UINT8 Value;
    Value = Port_GetPin(pInput, pPin);
    Value ^= 0x01;
    Port_SetPin(pInput, pPin, Value);
}
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetPairType    (PortPtr pInput, ePair pPair, ePinType pType)
{
	ePinError Output = ePinErrorState;

	switch (pType)
	{
	case eTypeInput:
		//if ( (Output=Port_CheckPairType(pInput, pPair, eNone)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetPair(pInput->mDirection, (UINT8)pPair, 3);

			//Set the output register state to be low
			Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0);
		}
		//else return Output;
		break;
	case eTypeOutputOpenDrain:
		if ((Output = Port_CheckPairType(pInput, pPair, eLow)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0);

			//Set the output register state to be low
			Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0);
		}
		else return Output;
		break;
	case eTypeOutputOpenSource:
		if ((Output = Port_CheckPairType(pInput, pPair, eHigh)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetPair(pInput->mDirection, (UINT8)pPair, 3);

			//Set the output register state to be low
			Byte_SetPair(pInput->mOutput, (UINT8)pPair, 3);
		}
		else return Output;
		break;
	case eTypeOutputPushPull:
		if ((Output = Port_CheckPairType(pInput, pPair, eHL)) == ePinErrorNone)
		{
			//Set the port to be an output
			Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0);

			//Set the output register state to be low
			Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0);
		}
		else return Output;
		break;
	default:
		break;
	}

	//Setup the pin type
	Word_SetPair(&pInput->mType, (UINT8)pPair * 2,		(UINT8)pType);
	Word_SetPair(&pInput->mType, (UINT8)pPair * 2 + 1,	(UINT8)pType);
	return Output;
}
void		Port_SetPair	    (PortPtr pInput, ePair pPair, UINT8 pValue)
{
    ePinType	Type = (ePinType)Word_GetPair(&pInput->mType, ((UINT8)pPair) * 2);
    UINT8		TypeRequired = Type | (Type << 2);
    UINT8		TypeActual = Type;
    TypeActual |= (ePinType)Word_GetPair(&pInput->mType, (UINT8)pPair * 2 + 1) << 2;

    //Test whether whole port is same type
    if (TypeRequired == TypeActual)
    {
	switch (Type)
	{
	case eTypeInput:
		return;
	case eTypeOutputOpenDrain:
		//Open drain pulls down
		pValue &= 0x03;
		Byte_SetPair(pInput->mDirection, pPair, pValue);
		break;
	case eTypeOutputOpenSource:
		//Open source pulls up
		pValue = ~pValue;
		pValue &= 0x03;
		Byte_SetPair(pInput->mDirection, pPair, pValue);
		break;
	case eTypeOutputPushPull:
		//Drives high or low
		pValue &= 0x03;
		Byte_SetPair(pInput->mOutput, pPair, pValue);
		break;
	default:
		break;
	}
    }
    else
    {
	//Report error
    }
}
UINT8		Port_GetPair	    (PortPtr pInput, ePair pPair)
{
    UINT8 Output = pInput->mInput->mBits;
    Output >>= ((UINT8)pPair * 2);
    Output &= 3;
    return Output;
}
void		Port_TogglePair	    (PortPtr pInput, ePair pPair)
{
    UINT8 Value;
    Value = Port_GetPair(pInput, pPair);
    Value ^= 0x03;
    Port_SetPair(pInput, pPair, Value); 
}
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetQuadType    (PortPtr pInput, eQuad pQuad, ePinType pType)
{
	ePinError Output = ePinErrorState;

	switch (pType)
	{
	case eTypeInput:
		//if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0xF);

			//Set the output register state to be low
			Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0);
		}
		//else return Output;
		break;
	case eTypeOutputOpenDrain:
		if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
		{
			//Set the port to be an output
			Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0);

			//Set the output register state to be low
			Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0);
		}
		else return Output;
		break;
	case eTypeOutputOpenSource:
		if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0xF);

			//Set the output register state to be low
			Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0xF);
		}
		else return Output;
		break;
	case eTypeOutputPushPull:
		if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
		{
			//Set the port to be an output
			Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0);

			//Set the output register state to be low
			Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0);
		}
		else return Output;
		break;
	default:
		break;
	};

	//Setup the pin type
	Word_SetPair(&pInput->mType, (UINT8)pQuad * 4,		(UINT8)pType);
	Word_SetPair(&pInput->mType, (UINT8)pQuad * 4 + 1,	(UINT8)pType);
	Word_SetPair(&pInput->mType, (UINT8)pQuad * 4 + 2,	(UINT8)pType);
	Word_SetPair(&pInput->mType, (UINT8)pQuad * 4 + 3,	(UINT8)pType);
	return Output;
}
void		Port_SetQuad	    (PortPtr pInput, eQuad pQuad, UINT8 pValue)
{
	ePinType	Type			= (ePinType)Word_GetPair(&pInput->mType, ((UINT8)pQuad) * 4);
	UINT8		TypeRequired	= Type | (Type << 2) | (Type << 4) | (Type << 6);
	UINT8		TypeActual		= Type;

	TypeActual |=	(ePinType)Word_GetPair(&pInput->mType, (UINT8)pQuad * 4 + 1) << 2;
	TypeActual |=	(ePinType)Word_GetPair(&pInput->mType, (UINT8)pQuad * 4 + 2) << 4;
	TypeActual |=	(ePinType)Word_GetPair(&pInput->mType, (UINT8)pQuad * 4 + 3) << 6;
	
	//Test whether whole port is same type
	if (TypeRequired == TypeActual)
	{
		switch (Type)
		{
		case eTypeInput:
			return;
		case eTypeOutputOpenDrain:
			//Open drain pulls down
			pValue &= 0xF;
			Byte_SetQuad(pInput->mDirection, pQuad, pValue);
			break;
		case eTypeOutputOpenSource:
			//Open source pulls up
			pValue &= 0xF;
			pValue = ~pValue;
			Byte_SetQuad(pInput->mDirection, pQuad, pValue);
			break;
		case eTypeOutputPushPull:
			//Drives high or low
			pValue &= 0xF;
			Byte_SetQuad(pInput->mOutput, pQuad, pValue);
			break;
		default:
			break;
		};
	}
}
UINT8		Port_GetQuad	    (PortPtr pInput, eQuad pQuad)
{
	UINT8 Output = pInput->mInput->mBits;
	Output >>= ((UINT8)pQuad * 4);
	Output &= 0xF;
	return Output;
}
void		Port_ToggleQuad	    (PortPtr pInput, eQuad pQuad)
{
    UINT8 Value;
    Value = Port_GetQuad(pInput, pQuad);
    Value ^= 0x0F;
    Port_SetQuad(pInput, pQuad, Value); 
}
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetType	    (PortPtr pInput, ePinType pType)
{
	ePinError Output = ePinErrorState;

	switch (pType)
	{
	case eTypeInput:
		//Set the port to be an input
		//if ((Output=Port_CheckPortType(pInput, eNone)) == ePinErrorNone)
			pInput->mDirection->mBits = 0xFF;
		//else return Output;
		break;
	case eTypeOutputOpenDrain:
		if ((Output=Port_CheckPortType(pInput, eLow)) == ePinErrorNone)
		{
			//Set the port to be an output
			pInput->mDirection->mBits = 0x00;

			//Set the output register state to be low
			pInput->mOutput->mBits = 0x00;
		}
		else return Output;
		break;
	case eTypeOutputOpenSource:
		if ((Output=Port_CheckPortType(pInput, eHigh)) == ePinErrorNone)
		{
			//Set the port to be an input
			pInput->mDirection->mBits = 0xFF;

			//Set the output register state to be low
			pInput->mOutput->mBits = 0xFF;
		}
		else return Output;
		break;
	case eTypeOutputPushPull:
		if ((Output=Port_CheckPortType(pInput, eHL)) == ePinErrorNone)
		{
			//Set the port to be an output
			pInput->mDirection->mBits = 0x00;
		}
		else return Output;
		break;
	default:
		break;
	}

	//Setup the pin type
	Word_SetPair(&pInput->mType, 0, (UINT8)pType);
	Word_SetPair(&pInput->mType, 1, (UINT8)pType);
	Word_SetPair(&pInput->mType, 2, (UINT8)pType);
	Word_SetPair(&pInput->mType, 3, (UINT8)pType);
	Word_SetPair(&pInput->mType, 4, (UINT8)pType);
	Word_SetPair(&pInput->mType, 5, (UINT8)pType);
	Word_SetPair(&pInput->mType, 6, (UINT8)pType);
	Word_SetPair(&pInput->mType, 7, (UINT8)pType);
	return Output;
}
void		Port_Set	    (PortPtr pInput, UINT8 pValue)
{
	ePinType	Type = (ePinType)Word_GetPair(&pInput->mType, 0);
	UINT16		TypeRequired = Type | (Type << 2) | (Type << 4) | (Type << 6) | (Type << 8) | (Type << 10) | (Type << 12) | (Type << 14);
	UINT16		TypeActual = Type;
	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 1) << 2;
	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 2) << 4;
	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 3) << 6;
	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 4) << 8;
	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 5) << 10;
	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 6) << 12;
	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 7) << 14;

	//Test whether whole port is same type
	if (TypeRequired == TypeActual)
	{
		pValue &= 0xFF;
		switch (Type)
		{
		case eTypeInput:
			return;
		case eTypeOutputOpenDrain:
			//Open drain pulls down
			Byte_SetByte(pInput->mDirection, pValue);
			break;
		case eTypeOutputOpenSource:
			//Open source pulls up
			pValue = ~pValue;
			Byte_SetByte(pInput->mDirection, pValue);
			break;
		case eTypeOutputPushPull:
			//Drives high or low
			Byte_SetByte(pInput->mOutput, pValue);
			break;
		default:
			break;
		}
	}
	else
	{
		//Report error
	}
}
UINT8		Port_Get	    (PortPtr pInput)
{
	return pInput->mInput->mBits & 0xFF;
}
void		Port_Toggle	    (PortPtr pInput)
{
    UINT8 Value;
    Value = Port_Get(pInput);
    Value ^= 0xFF;
    Port_Set(pInput, Value);  
}
////////////////////////////////////////////////////////////////////////////////////

