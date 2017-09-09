/* 
 * File:   Port.h
 * Author: User
 *
 * Created on 13 September 2016, 12:18 PM
 */

#ifndef PORT_H
#define	PORT_H
#include "Types.h"
////////////////////////////////////////////////////////////////////////////////////
typedef struct	Port		Port;
typedef Port * const		PortPtr;

typedef enum 
{
	eP0 = 0,
	eP1 = 1,
	eP2 = 2,
	eP3 = 3,
	eP4 = 4,
	eP5 = 5,
	eP6 = 6,
	eP7 = 7
}ePin;
typedef enum 
{
	eP0_1 = 0,
	eP2_3 = 1,
	eP4_5 = 2,
	eP6_7 = 3,
	eP8_9 = 4,
	eP10_11 = 5,
	eP12_13 = 6,
	eP14_15 = 7
}ePair;
typedef enum 
{
	eP0_2	=	0,
	eP3_5	=	1,
	eP4_6	=	2,
	eP5_7	=	3
}eTriple;
typedef enum 
{
	eP0_3 = 0,
	eP4_7 = 1,
	eP8_11 = 2,
	eP12_15 = 3,
	eP16_19 = 4,
	eP20_23 = 5,
	eP24_27 = 6,
	eP28_31 = 7
}eQuad;
////////////////////////////////////////////////////////////////////////////////////
typedef enum 
{
	ePortA,
	ePortB,
	ePortC,
	ePortD,
	ePortE,
	ePortF,
	ePortG
}ePort;
////////////////////////////////////////////////////////////////////////////////////
typedef enum 
{
	eTypeInput				= 0b0000,
	eTypeOutputOpenDrain	= 0b0001,
	eTypeOutputOpenSource	= 0b0010,
	eTypeOutputPushPull		= 0b0011
}ePinType;
////////////////////////////////////////////////////////////////////////////////////
struct Port
{
	PortProperty const *mProperties;
	Byte*				mDirection;
	Byte*				mOutput;
	Byte*				mInput;
	Word				mType;
};
////////////////////////////////////////////////////////////////////////////////////
PortProperty const * GetPortProperties(ePort pInput);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Byte * const GetPortPORT(ePort pInput);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Byte * const GetPortTRIS(ePort pInput);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Byte * const GetPortLAT(ePort pInput);
////////////////////////////////////////////////////////////////////////////////////
//Private functions
ePinError	Port_CheckPairType(PortPtr pInput, ePair pPair, ePinDrive pDrive);
ePinError	Port_CheckQuadType(PortPtr pInput, eQuad pQuad, ePinDrive pDrive);
ePinError	Port_CheckPortType(PortPtr pInput, ePinDrive pDrive);
////////////////////////////////////////////////////////////////////////////////////
//Public Functions
void		Port_Init		(PortPtr pInput, ePort pPort);
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetPinType	(PortPtr pInput, ePin pPin, ePinType pType);
void		Port_SetPin		(PortPtr pInput, ePin pPin, UINT8 pValue);
UINT8		Port_GetPin		(PortPtr pInput, ePin pPin);
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetPairType(PortPtr pInput, ePair pPair, ePinType pType);
void		Port_SetPair	(PortPtr pInput, ePair pPair, UINT8 pValue);
UINT8		Port_GetPair	(PortPtr pInput, ePair pPair);
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetQuadType(PortPtr pInput, eQuad pQuad, ePinType pType);
void		Port_SetQuad	(PortPtr pInput, eQuad pQuad, UINT8 pValue);
UINT8		Port_GetQuad	(PortPtr pInput, eQuad pQuad);
////////////////////////////////////////////////////////////////////////////////////
ePinError	Port_SetType	(PortPtr pInput, ePinType pType);
void		Port_Set		(PortPtr pInput, UINT8 pValue);
UINT8		Port_Get		(PortPtr pInput);
////////////////////////////////////////////////////////////////////////////////////
#endif	/* PORT_H */

