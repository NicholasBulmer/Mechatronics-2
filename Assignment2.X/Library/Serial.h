/* 
 * File:   Serial.h
 * Author: David Ledger
 *
 * Created on 19 September 2016, 1:16 PM
 */

#ifndef SERIAL_H
#define	SERIAL_H
#include "Types.h"
typedef enum
{
    eSPI,
    eI2C,
    eUART
}eSerial;
typedef enum 
{
	eSwap,
	eRead,
	eWrite,
	eSetAddress
}eTransaction ;
typedef struct 
{
	eTransaction	mType;
	UINT8			mData;
}Transaction;
typedef enum
{
    eReturnSuccess,
    eReturnNoSwapAvaliable,
    eReturnNoReadAvaliable,
    eReturnNoWriteAvaliable,
    eReturnNoSetAddressAvaliable
}eSerialReturn;

eSerialReturn Serial_Transaction(eSerial pType, Transaction * pDefinition, UINT16 pLength);

#endif	/* SERIAL_H */