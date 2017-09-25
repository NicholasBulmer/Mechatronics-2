/* 
 * File:   I2C.h
 * Author: David Ledger
 *
 * Created on 16 January 2017, 11:38 AM
 */
#ifndef I2C_H
#define	I2C_H
#include <xc.h>
#include "Types.h"
#include "Port.h"

#define I2C1_ISR_CONDITION (PIR1bits.SSP1IF && PIE1bits.SSP1IE && (SSP1CON1bits.SSPM >= 0b0110))
#define I2C2_ISR_CONDITION (PIR3bits.SSP2IF && PIE3bits.SSP2IE && (SSP2CON1bits.SSPM >= 0b0110))

extern Port PortA, PortB, PortC, PortD, PortE, PortF, PortG;
typedef enum
{
    eI2C_Idle                   =	0x00,	//Bus isn't doing anything
    ////////////////////////////////////////////////////////////////////////////
#define eI2C_WriteInc eI2C_WriteStart
    eI2C_WriteStart             =	0x01,	//Assert SEN SSPxCON2 and set R/W\ Bit to 0
    eI2C_WriteWaitClearFlag     =	0x02,	//Wait for SSPxIF to clear
    eI2C_WriteAddress           =	0x03,	//Load SSPxBUF with address
    eI2C_WriteCheckAddressACK	=	0x04,	//Checks ACK from slave
    eI2C_WriteAddrClearFlag     =	0x05,	//Clear the SSPxIF bit
    eI2C_WriteRestart           =	0x06,	//Assert RSEN SSPxCON2
    eI2C_WriteData              =	0x07,	//Load SSPxBUF with data
    eI2C_WriteDataCheckACK      =	0x08,	//Check the ACK from slave
    eI2C_WriteDataClearFlag     =	0x09,	//Clear the SSPxIF bit
    eI2C_WriteStop              =	0x0A,	//Set the Stop Condition PEN in SSPxCON2
    eI2C_WriteStopClearFlag     =	0x0B,	//Clear the interrupt flag
    ////////////////////////////////////////////////////////////////////////////
#define eI2C_ReadInc eI2C_ReadStart
    eI2C_ReadStart              =	0x10,	//Assert SEN SSPxCON2 and set R/W\ Bit to 1
    eI2C_ReadRestart            =	0x20,	//Resents a start condition and schedules 
    eI2C_ReadWaitClearFlag      =	0x30,	//Wait for SSPxIF to clear
    eI2C_ReadAddress            =	0x40,	//Load SSPxBUF with address
    eI2C_ReadCheckAddressACK    =	0x50,	//Checks ACK from slave
    eI2C_ReadAddrClearFlag      =	0x60,	//Clear the SSPxIF bit
    eI2C_ReadData               =	0x70,	//Load SSPxBUF with data
    eI2C_ReadDataCheckACK       =	0x80,	//Check the ACK from slave
    eI2C_ReadDataClearFlag      =	0x90,	//Clear the SSPxIF bit
    eI2C_ReadStop               =	0xA0,	//Set the Stop Condition PEN in SSPxCON2
    eI2C_ReadStopClearFlag      =	0xB0,	//Clear the interrupt flag  
    ////////////////////////////////////////////////////////////////////////////
}   eI2CState;
typedef enum
{
    eI2C_NACK	= 0,
    eI2C_ACK	= 1
} eI2C_ACKType;

////////////////////////////////////////////////////////////////////////////////
typedef struct I2CT I2CT;
typedef I2CT * const I2CTPtr;
////////////////////////////////////////////////////////////////////////////////
struct I2CT
{
    UINT8       mAddress;
    UINT8Ptr    mData;
    UINT8       mIndex;
    UINT8       mCount;
    eI2CState	mState;
};
////////////////////////////////////////////////////////////////////////////////
bool            I2CT_Init(I2CTPtr pInput, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount);
////////////////////////////////////////////////////////////////////////////////
bool            I2CT_InitR(I2CTPtr pInput, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount);
////////////////////////////////////////////////////////////////////////////////
bool            I2CT_InitW(I2CTPtr pInput, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount);
////////////////////////////////////////////////////////////////////////////////
void            I2CT_Reset(I2CTPtr pInput);
////////////////////////////////////////////////////////////////////////////////
bool            I2CT_Get(I2CTPtr pInput, UINT8Ptr pOutput);
bool            I2CT_Put(I2CTPtr pInput, UINT8 pValue);
////////////////////////////////////////////////////////////////////////////////
bool            I2CT_At(I2CTPtr pInput, UINT8 pIndex, UINT8Ptr pOutput);
////////////////////////////////////////////////////////////////////////////////
inline bool     I2CT_IsRead(I2CTPtr pInput);
////////////////////////////////////////////////////////////////////////////////
inline bool     I2CT_IsWrite(I2CTPtr pInput);
////////////////////////////////////////////////////////////////////////////////
bool            I2CT_Next(I2CTPtr pInput);
////////////////////////////////////////////////////////////////////////////////
bool            I2CT_Continue(I2CTPtr pInput);
////////////////////////////////////////////////////////////////////////////////
bool            I2CT_Stop(I2CTPtr pInput);
////////////////////////////////////////////////////////////////////////////////
inline UINT8    I2CT_WAddress(I2CTPtr pInput);
////////////////////////////////////////////////////////////////////////////////
inline UINT8    I2CT_RAddress(I2CTPtr pInput);
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
typedef enum 
{
    eI2C_HighSpeed = 1,
    eI2C_LowSpeed = 0
} eI2C_Speed;
typedef enum 
{
    eI2C_Ch1,
    eI2C_Ch2
} eI2C_Channel;
typedef enum
{
    eI2C_Slave10bitISR  =   0b1111,
    eI2C_Slave7bitISR   =   0b1110,
    eI2C_Master         =   0b1000,
    eI2C_MasterClk      =   0b1001,
    eI2C_Slave10bit     =   0b0111,
    eI2C_Slave7bit      =   0b0110
} eI2C_Mode;

void    I2C_Init        (eI2C_Channel pChannel, UINT32 pClock, eI2C_Speed pSpeed, eI2C_Mode pMode);
bool    I2C_Write       (eI2C_Channel pChannel, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount,   void (*pRunDone)(),     bool (*pRunContinue)(I2CTPtr));
bool    I2C_RWrite      (eI2C_Channel pChannel, UINT8 pAddress, UINT8Ptr pData, UINT8 pCount,   bool (*pRunContinue)(I2CTPtr));
bool    I2C_Read        (eI2C_Channel pChannel, UINT8 pAddress, UINT8Ptr pDest, UINT8 pCount,   void (*pRunDone)(),     bool (*pRunContinue)(I2CTPtr));
bool    I2C_RRead       (eI2C_Channel pChannel, UINT8 pAddress, UINT8Ptr pDest,	UINT8 pCount,	bool (*pRunContinue)(I2CTPtr));
inline void    I2C1_ISR();
inline void    I2C2_ISR();
#endif	/* I2C_H */