/* 
 * File:   Port.h
 * Author: User
 *
 * Created on 13 September 2016, 12:18 PM
 */
#include "Port.h"
//The following table outlines the MXK's supported pin functions for the entire microcontroller these are consulted by the functions below.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//							Port Label						P0			P1			P2			P3			P4			P5			P6			P7	  		//
const static PortProperty	PortA_Property = PORTPROPERTY(	eNone,		eNone,		eNone,		eNone,		eHL,		eHL,		eHL,		eHL); 		//
const static PortProperty	PortB_Property = PORTPROPERTY(	eHL,		eHL,		eHL,		eHL,		eNone,		eNone,		eNone,		eNone);		//
const static PortProperty	PortC_Property = PORTPROPERTY(	eHL,		eHL,		eNone,		eNone,		eNone,		eNone,		eNone,		eNone);		//
const static PortProperty	PortD_Property = PORTPROPERTY(	eNone,		eNone,		eNone,		eNone,		eNone,		eNone,		eNone,		eNone);		//
const static PortProperty	PortE_Property = PORTPROPERTY(	eHL,		eHL,		eHL,		eHL,		eHL,		eHL,		eHL,		eHL);  		//
const static PortProperty	PortF_Property = PORTPROPERTY(	eNone,		eNone,		eNone,		eNone,		eNone,		eNone,		eHL,		eHL);		//
const static PortProperty	PortG_Property = PORTPROPERTY(	eHL,		eHL,		eHL,		eHL,		eHL,		eNone,		eNone,		eNone);		//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PortProperty const * GetPortProperties(ePort pInput)
{
    switch (pInput)	
    {
    case ePortA:
	    return (PortProperty const *)&PortA_Property;
    case ePortB:
	    return (PortProperty const *)&PortB_Property;
    case ePortC:
	    return (PortProperty const *)&PortC_Property;
    case ePortD:
	    return (PortProperty const *)&PortD_Property;
    case ePortE:
	    return (PortProperty const *)&PortE_Property;
    case ePortF:
	    return (PortProperty const *)&PortF_Property;
    case ePortG:
	    return (PortProperty const *)&PortG_Property;
    default:
	    return NULLPTR;
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Byte * const GetPortPORT(ePort pInput)
{
    switch (pInput)
    {
    case ePortA:
	    return (Byte * const)&PORTA;
    case ePortB:
	    return (Byte * const)&PORTB;
    case ePortC:
	    return (Byte * const)&PORTC;
    case ePortD:
	    return (Byte * const)&PORTD;
    case ePortE:
	    return (Byte * const)&PORTE;
    case ePortF:
	    return (Byte * const)&PORTF;
    case ePortG:
	    return (Byte * const)&PORTG;
    default:
	    return NULLPTR;
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Byte * const GetPortTRIS(ePort pInput)
{
    switch (pInput)
    {
    case ePortA:
	    return (Byte * const)&TRISA;
    case ePortB:
	    return (Byte * const)&TRISB;
    case ePortC:
	    return (Byte * const)&TRISC;
    case ePortD:
	    return (Byte * const)&TRISD;
    case ePortE:
	    return (Byte * const)&TRISE;
    case ePortF:
	    return (Byte * const)&TRISF;
    case ePortG:
	    return (Byte * const)&TRISG;
    default:
	    return NULLPTR;
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Byte * const GetPortLAT(ePort pInput)
{
    switch (pInput)
    {
    case ePortA:
	    return (Byte * const)&LATA;
    case ePortB:
	    return (Byte * const)&LATB;
    case ePortC:
	    return (Byte * const)&LATC;
    case ePortD:
	    return (Byte * const)&LATD;
    case ePortE:
	    return (Byte * const)&LATE;
    case ePortF:
	    return (Byte * const)&LATF;
    case ePortG:
	    return (Byte * const)&LATG;
    default:
	    return NULLPTR;
    }
}
ePinError	Port_CheckPairType(PortPtr pInput, ePair pPair, ePinDrive pDrive)
{
    ePinError Output = ePinErrorState;

    PortProperty* Props = (PortProperty*)&(pInput->mProperties->mWord);
    ePin Pin1 = (ePin)((int)pPair * 2);
    ePin Pin2 = (ePin)((int)pPair * 2 + 1);

    //Don't bother checking pin 2 if pin 1 isn't valid
    if ((Output = PortProperty_Valid(Props, pDrive, Pin1)) == ePinErrorNone)
	    Output = PortProperty_Valid(Props, pDrive, Pin2);

    return Output;
}
ePinError	Port_CheckQuadType(PortPtr pInput, eQuad pQuad, ePinDrive pDrive)
{
    ePinError Output = ePinErrorState;

    PortProperty* Props = (PortProperty*)&(pInput->mProperties->mWord);
    ePair Pair1 = (ePair)((int)pQuad * 2);
    ePair Pair2 = (ePair)((int)pQuad * 2 + 1);

    //Don't bother checking pin 2 if pin 1 isn't valid
    if ((Output = Port_CheckPairType(pInput, Pair1, pDrive)) == ePinErrorNone)
	    Output = Port_CheckPairType(pInput, Pair2, pDrive);

    return Output;
}
ePinError	Port_CheckPortType(PortPtr pInput, ePinDrive pDrive)
{
    ePinError Output = ePinErrorState;
    PortProperty* Props = (PortProperty*)&(pInput->mProperties->mWord);

    //Don't bother checking pin 2 if pin 1 isn't valid
    if ((Output = Port_CheckQuadType(pInput, eP0_3, pDrive)) == ePinErrorNone)
	    Output = Port_CheckQuadType(pInput, eP4_7, pDrive);

    return Output;
}
////////////////////////////////////////////////////////////////////////////////////
//Public Functions
void		Port_Init		(PortPtr pInput, ePort pPort)
{
    //Setup the port properties checker
    pInput->mProperties = GetPortProperties(pPort);
    pInput->mInput = GetPortLAT(pPort);
    pInput->mOutput = GetPortPORT(pPort);
    pInput->mDirection = GetPortTRIS(pPort);

    //Zero out inputs
    pInput->mInput->mBits = 0x00;
    pInput->mDirection->mBits = 0x00;

    //Safest input mode is inputs
    Port_SetType(pInput, eTypeInput);
    Port_Set(pInput, 0x00);
}
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetPinType	(PortPtr pInput, ePin pPin, ePinType pType)
{
    PortProperty* Props = (PortProperty*)&(pInput->mProperties->mWord);
    ePinError Output = ePinErrorState;

    switch (pType)
    {
    case eTypeInput:
	    if ((Output = PortProperty_Valid(Props, eLow, pPin)) == ePinErrorNone)
	    {
		    //Set the port to be an input
		    Byte_SetBit(pInput->mDirection, (UINT8)pPin, 1);

		    //Set the output register state to be low
		    Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
	    }
	    else return Output;
	    break;
    case eTypeOutputOpenDrain:
	    if ((Output = PortProperty_Valid(Props, eLow, pPin)) == ePinErrorNone)
	    {
		    //Set the port to be an input
		    Byte_SetBit(pInput->mDirection, (UINT8)pPin, 0);

		    //Set the output register state to be low
		    Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
	    }
	    else return Output;
	    break;
    case eTypeOutputOpenSource:
	    if ((Output = PortProperty_Valid(Props, eHigh, pPin)) == ePinErrorNone)
	    {
		    //Set the port to be an input
		    Byte_SetBit(pInput->mDirection, (UINT8)pPin, 1);

		    //Set the output register state to be low
		    Byte_SetBit(pInput->mOutput, (UINT8)pPin, 1);
	    }
	    else return Output;
	    break;
    case eTypeOutputPushPull:
	    if ((Output = PortProperty_Valid(Props, eHL, pPin)) == ePinErrorNone)
	    {
		    //Set the port to be an output
		    Byte_SetBit(pInput->mDirection, (UINT8)pPin, 0);

		    //Set the output register state to be low
		    Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
	    }
	    else return Output;
	    break;
    default:
	    break;
    }

    //Setup the pin type
    Word_SetPair(&pInput->mType, (UINT8)pPin, (UINT8)pType);

    return Output;
}
void		Port_SetPin		(PortPtr pInput, ePin pPin, UINT8 pValue)
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
	    pValue = ~pValue;
	    pValue &= 1;
	    Byte_SetBit(pInput->mDirection, pPin, pValue);
	    break;
    case eTypeOutputPushPull:
	    pValue &= 1;
	    Byte_SetBit(pInput->mDirection, pPin, pValue);
	    break;
    default:
	    break;
    }
}
UINT8		Port_GetPin		(PortPtr pInput, ePin pPin)
{
    UINT8 Output = pInput->mInput->mBits;
    Output >>= (UINT8)pPin;
    Output &= 0b1;
    return Output;
}
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetPairType(PortPtr pInput, ePair pPair, ePinType pType)
{
	ePinError Output = ePinErrorState;

	switch (pType)
	{
	case eTypeInput:
		if ( (Output=Port_CheckPairType(pInput, pPair, eNone)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0b11);

			//Set the output register state to be low
			Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0b00);
		}
		else return Output;
		break;
	case eTypeOutputOpenDrain:
		if ((Output = Port_CheckPairType(pInput, pPair, eLow)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0b00);

			//Set the output register state to be low
			Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0b00);
		}
		else return Output;
		break;
	case eTypeOutputOpenSource:
		if ((Output = Port_CheckPairType(pInput, pPair, eHigh)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0b11);

			//Set the output register state to be low
			Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0b11);
		}
		else return Output;
		break;
	case eTypeOutputPushPull:
		if ((Output = Port_CheckPairType(pInput, pPair, eHL)) == ePinErrorNone)
		{
			//Set the port to be an output
			Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0b00);

			//Set the output register state to be low
			Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0b00);
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
void		Port_SetPair	(PortPtr pInput, ePair pPair, UINT8 pValue)
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
UINT8		Port_GetPair	(PortPtr pInput, ePair pPair)
{
    UINT8 Output = pInput->mInput->mBits;
    Output >>= ((UINT8)pPair * 2);
    Output &= 0b11;
    return Output;
}
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetQuadType(PortPtr pInput, eQuad pQuad, ePinType pType)
{
	ePinError Output = ePinErrorState;

	switch (pType)
	{
	case eTypeInput:
		if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0b1111);

			//Set the output register state to be low
			Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0b0000);
		}
		else return Output;
		break;
	case eTypeOutputOpenDrain:
		if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
		{
			//Set the port to be an output
			Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0b0000);

			//Set the output register state to be low
			Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0b0000);
		}
		else return Output;
		break;
	case eTypeOutputOpenSource:
		if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
		{
			//Set the port to be an input
			Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0b1111);

			//Set the output register state to be low
			Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0b1111);
		}
		else return Output;
		break;
	case eTypeOutputPushPull:
		if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
		{
			//Set the port to be an output
			Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0b0000);

			//Set the output register state to be low
			Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0b0000);
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
void		Port_SetQuad	(PortPtr pInput, eQuad pQuad, UINT8 pValue)
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
UINT8		Port_GetQuad	(PortPtr pInput, eQuad pQuad)
{
	UINT8 Output = pInput->mInput->mBits;
	Output >>= ((UINT8)pQuad * 4);
	Output &= 0b1111;
	return Output;
}
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetType	(PortPtr pInput, ePinType pType)
{
	ePinError Output = ePinErrorState;

	switch (pType)
	{
	case eTypeInput:
		//Set the port to be an input
		if ((Output=Port_CheckPortType(pInput, eNone)) == ePinErrorNone)
			pInput->mDirection->mBits = 0xFF;
		else return Output;
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
void		Port_Set		(PortPtr pInput, UINT8 pValue)
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
			Byte_SetPort(pInput->mDirection, pValue);
			break;
		case eTypeOutputOpenSource:
			//Open source pulls up
			pValue = ~pValue;
			Byte_SetPort(pInput->mDirection, pValue);
			break;
		case eTypeOutputPushPull:
			//Drives high or low
			Byte_SetPort(pInput->mOutput, pValue);
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
UINT8		Port_Get		(PortPtr pInput)
{
	return pInput->mInput->mBits & 0xFF;
}
////////////////////////////////////////////////////////////////////////////////////

