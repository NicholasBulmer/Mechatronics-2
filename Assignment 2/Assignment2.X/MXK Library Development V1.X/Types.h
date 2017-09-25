/* 
 * File:   Types.h
 * Author: User
 *
 * Created on 13 September 2016, 11:57 AM
 */

#ifndef TYPES_H
#define	TYPES_H

#include <pic18fregs.h>
#include <pic18f65j50.h>

////////////////////////////////////////////////////////////////////////////////////
#define NULLPTR                     (void*)0
#define ifnull(x)                   if(x==NULLPTR)
#define ifnnull(x)                  if(x!=NULLPTR)
#define ifzero(x)                   if(x==0)
#define ifnzero(x)                  if(x!=0)
#define loop()                      for(;;)
////////////////////////////////////////////////////////////////////////////////////
//#define NULL						0
#define INPUT						(UINT8)1
#define OUTPUT						(UINT8)0					
#define eTypeOutput					eTypeOutputPushPull
//////////////////////////////////////////////////////////////
#define SPI1_SCK					(ePin)3
#define SPI1_SOMI					(ePin)4
#define SPI1_SIMO					(ePin)5
#define SPI1_CS						(ePin)2
#define SPI2_SCK					(ePin)6
#define SPI2_SOMI					(ePin)5
#define SPI2_SIMO					(ePin)4
#define SPI2_CS						(ePin)7
#define I2C1_SCL					(ePin)3
#define I2C1_SDA					(ePin)4
#define I2C2_SDA					(ePin)5
#define I2C2_SCL					(ePin)6
#define UART_TX						(ePin)6
#define UART_RX						(ePin)7
//////////////////////////////////////////////////////////////
#define SSPSTAT_BF					(UINT8)0
#define SSPSTAT_UA					(UINT8)1
#define SSPSTAT_RW					(UINT8)2
#define SSPSTAT_S					(UINT8)3
#define SSPSTAT_P					(UINT8)4
#define SSPSTAT_DA					(UINT8)5
#define SSPSTAT_CKE					(UINT8)6
#define SSPSTAT_CKE_ATI				(UINT8)0
#define SSPSTAT_CKE_ITA				(UINT8)1
#define SSPSTAT_CKE_SMB_EN			(UINT8)1
#define SSPSTAT_CKE_SMB_DIS			(UINT8)0
#define SSPSTAT_SMP					(UINT8)7
#define SSPSTAT_SMP_MID				(UINT8)0
#define SSPSTAT_SMP_END				(UINT8)1
#define SSPSTAT_SMP_HGH_SPEED		(UINT8)0
#define SSPSTAT_SMP_STA_SPEED		(UINT8)1
//////////////////////////////////////////////////////////////
#define SSPCON1_WCOL				(UINT8)7
#define SSPCON1_WCOL_NO_COL			(UINT8)0
#define SSPCON1_WCOL_COL			(UINT8)1
#define SSPCON1_SSPOV				(UINT8)6
#define SSPCON1_SSPOV_NO_OVFLW		(UINT8)0
#define SSPCON1_SSPOV_OVFLW			(UINT8)1
#define SSPCON1_SSPEN				(UINT8)5
#define SSPCON1_SSPEN_OFF			(UINT8)0
#define SSPCON1_SSPEN_ON			(UINT8)1
#define SSPCON1_CKP					(UINT8)4
#define SSPCON1_CKP_IDLEH			(UINT8)1
#define SSPCON1_CKP_IDLEL			(UINT8)0
#define SSPCON1_CKP_RELEASE			(UINT8)1
#define SSPCON1_CKP_STRETCH			(UINT8)0
#define SSPCON1_SSPM				(UINT8)0
#define SSPCON1_SSPM_F_4			(UINT8)0b0000
#define SSPCON1_SSPM_F_16			(UINT8)0b0001
#define SSPCON1_SSPM_F_64			(UINT8)0b0010
#define SSPCON1_SSPM_F_TMR2			(UINT8)0b0011
#define SSPCON1_SSPM_S_CSEN			(UINT8)0b0100
#define SSPCON1_SSPM_S_CSDIS		(UINT8)0b0101
#define SSPCON1_SSPM_I2C_S_07B_SSI	(UINT8)0b1111
#define SSPCON1_SSPM_I2C_S_10B_SSI	(UINT8)0b1110
#define SSPCON1_SSPM_I2C_M_FIRM		(UINT8)0b1011
#define SSPCON1_SSPM_I2C_MSK		(UINT8)0b1001
#define SSPCON1_SSPM_I2C_M_FOSC4	(UINT8)0b1000
#define SSPCON1_SSPM_I2C_S_10B		(UINT8)0b0111
#define SSPCON1_SSPM_I2C_S_07B		(UINT8)0b0110
//////////////////////////////////////////////////////////////
#define SSPCON2_GCEN				(UINT8)7
#define SSPCON2_GCEN_GEN			(UINT8)1
#define SSPCON2_GCEN_GDIS			(UINT8)0
#define SSPCON2_ACKSTAT				(UINT8)6
#define SSPCON2_ACKSTAT_NACK		(UINT8)1
#define SSPCON2_ACKSTAT_ACK			(UINT8)0
#define SSPCON2_ACKDT				(UINT8)5
#define SSPCON2_ACKDT_NACK			(UINT8)1
#define SSPCON2_ACKDT_ACK			(UINT8)0
#define SSPCON2_ACKEN				(UINT8)4
#define SSPCON2_ACKEN_IDLE			(UINT8)0
#define SSPCON2_ACKEN_TRANS			(UINT8)1
#define SSPCON2_RCEN				(UINT8)3
#define SSPCON2_RCEN_RECEIV			(UINT8)1
#define SSPCON2_RCEN_IDLE			(UINT8)0
#define SSPCON2_PEN					(UINT8)2
#define SSPCON2_PEN_S_COND			(UINT8)1
#define SSPCON2_PEN_S_IDLE			(UINT8)0
#define SSPCON2_RSEN				(UINT8)1
#define SSPCON2_RSEN_RSC			(UINT8)1
#define SSPCON2_RSEN_RSCI			(UINT8)0
#define SSPCON2_SEN					(UINT8)0
#define SSPCON2_SEN_SC				(UINT8)1
#define SSPCON2_SEN_SCI				(UINT8)0
//////////////////////////////////////////////////////////////
#define TXSTA_CSRC					(UINT8)7
#define TXSTA_CSRC_MASTER			(UINT8)1
#define TXSTA_CSRC_SLAVE			(UINT8)0
#define TXSTA_TX9					(UINT8)6
#define TXSTA_TX9_9BIT				(UINT8)1
#define TXSTA_TX9_8BIT				(UINT8)0
#define TXSTA_TXEN					(UINT8)5
#define TXSTA_TXEN_TXEN				(UINT8)1
#define TXSTA_TXEN_TXDIS			(UINT8)0
#define TXSTA_SYNC					(UINT8)4
#define TXSTA_SYNC_SYNC				(UINT8)1
#define TXSTA_SYNC_ASYN				(UINT8)0
#define TXSTA_SENDB					(UINT8)3
#define TXSTA_SENDB_SEND_SYNCB		(UINT8)1
#define TXSTA_SENDB_COMPL_SYNC		(UINT8)0
#define TXSTA_BRGH					(UINT8)2
#define TXSTA_BRGH_HIGHSP			(UINT8)1
#define TXSTA_BRGH_LOWSP			(UINT8)0
#define TXSTA_TRMT					(UINT8)1
#define TXSTA_TRMT_EMPTY			(UINT8)1
#define TXSTA_TRMT_FULL				(UINT8)0
#define TXSTA_TX9D					(UINT8)0
//////////////////////////////////////////////////////////////
#define RCSTA_SPEN					(UINT8)7
#define RCSTA_SPEN_SP_EN			(UINT8)1
#define RCSTA_SPEN_SP_DIS			(UINT8)0
#define RCSTA_RX9					(UINT8)6
#define RCSTA_RX9_9BIT_REC			(UINT8)1
#define RCSTA_RX9_8BIT_REC			(UINT8)0
#define RCSTA_SREN					(UINT8)5
#define RCSTA_SREN_EN_REC			(UINT8)1
#define RCSTA_SREN_DIS_REC			(UINT8)0
#define RCSTA_CREN					(UINT8)4
#define RCSTA_CREN_EN_REC			(UINT8)1
#define RCSTA_CREN_DIS_REC			(UINT8)0
#define RCSTA_ADDEN					(UINT8)3
#define RCSTA_ADDEN_EN_DECT			(UINT8)1
#define RCSTA_ADDEN_DIS_DECT		(UINT8)0
#define RCSTA_FERR					(UINT8)2
#define RCSTA_FERR_FRAME_ERR		(UINT8)1
#define RCSTA_FERR_NO_FRAME			(UINT8)0
#define RCSTA_OERR					(UINT8)1
#define RCSTA_OERR_OVERR_ERR		(UINT8)1
#define RCSTA_OERR_NO_OVERR			(UINT8)0
#define RCSTA_RX9D					(UINT8)0
//////////////////////////////////////////////////////////////
#define BAUDCON_ABDOVF				(UINT8)7
#define BAUDCON_ABDOVF_BRG_ROLL		(UINT8)1 
#define BAUDCON_ABDOVF_NBRG_ROLL	(UINT8)0 
#define BAUDCON_RCIDL				(UINT8)6  
#define BAUDCON_RCIDL_RX_OP_IDLE	(UINT8)1
#define BAUDCON_RCIDL_RX_OP_ACTIVE	(UINT8)0
#define BAUDCON_DTRXP				(UINT8)5
#define BAUDCON_DTRXP_RX_INV		(UINT8)1
#define BAUDCON_DTRXP_RX_NONINV		(UINT8)0
#define BAUDCON_SCKP				(UINT8)4
#define BAUDCON_SCKP_TX_I_LOW		(UINT8)1
#define BAUDCON_SCKP_TX_I_HIGH		(UINT8)0
#define BAUDCON_BRG16				(UINT8)3
#define BAUDCON_BRG16_16BIT_BAUD	(UINT8)1
#define BAUDCON_BRG16_8BIT_BAUD		(UINT8)0
#define BAUDCON_UN					(UINT8)2
#define BAUDCON_WUE					(UINT8)1 
#define BAUDCON_WUE_WAKEUP_EN		(UINT8)1
#define BAUDCON_WUE_WAKEUP_DIS		(UINT8)0
#define BAUDCON_ABDEN				(UINT8)0 
#define BAUDCON_ABDEN_EN_AUTOBAUD	(UINT8)1
#define BAUDCON_ABDEN_DIS_AUTOBAUD	(UINT8)0
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
typedef unsigned long		bits;
typedef unsigned char		byte;
typedef unsigned char		UINT8;
typedef unsigned short		UINT16;
typedef unsigned int		UINT32;
typedef UINT8	const		CUINT8;
typedef UINT16	const		CUINT16;
typedef UINT32	const		CUINT32;
typedef UINT8	* 			UINT8Ptr;
typedef UINT16	* 			UINT16Ptr;
typedef UINT32	*			UINT32Ptr;
typedef UINT8	* const		CUINT8Ptr;
typedef UINT16	* const		CUINT16Ptr;
typedef UINT32	* const		CUINT32Ptr;
typedef UINT8 *				PTR;
typedef PTR const			CPTR;
typedef PTR *				PPTR;
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

typedef struct Byte             Byte;
typedef Byte * const            BytePtr;
////////////////////////////////////////////////////////////////////////////////////
typedef struct Word             Word;
typedef Word * const            Word*;
////////////////////////////////////////////////////////////////////////////////////
typedef struct PortProperty     PortProperty;
typedef PortProperty * const    PortPropertyPtr;
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#define PORTPROPERTY(T0, T1, T2, T3, T4, T5, T6, T7) {((UINT16)T0 | ((UINT16)T1 << 2) | ((UINT16)T2 << 4) | ((UINT16)T3 << 6) | ((UINT16)T4 << 8) | ((UINT16)T5 << 10) | ((UINT16)T6 << 12) | ((UINT16)T7 << 14))}
////////////////////////////////////////////////////////////////////////////////////
typedef enum 
{
	eHL		= 0x0,
	eLow	= 0x1,
	eHigh	= 0x2,
	eNone	= 0x3
}ePinDrive;
typedef enum 
{
	ePinErrorNone,
	ePinErrorCannotDriveHigh,
	ePinErrorCannotDriveLow,
	ePinErrorCannotDrive,
	ePinErrorPinInput,
	ePinErrorState
}ePinError;
////////////////////////////////////////////////////////////////////////////////////
struct PortProperty
{
	union
	{
		UINT16	mWord;
		Word	mType;
	};
};
struct Byte
{
	union
	{
		bits mBits : 8;
		////////////////////////////////////////////////////////////////////////////////////
		//Quad/Nibble
		struct
		{
			bits mBit0_3 : 4;
			bits mBit4_7 : 4;
		};
		struct
		{
			bits : 1;
			bits mBit1_4 : 4;
			bits : 3;
		};
		struct
		{
			bits: 2;
			bits mBit2_5 : 4;
			bits: 2;
		};
		struct
		{
			bits: 3;
			bits mBit3_6 : 4;
			bits: 1;
		};
		////////////////////////////////////////////////////////////////////////////////////
		//Triple
		struct
		{
			bits mBit0_2 : 3;
			bits mBit3_5 : 3;
			bits mBit6_7 : 2;
		};
		struct
		{
		bits: 1;
			bits mBit1_3 : 3;
			bits mBit4_6 : 3;
		bits: 1;
		};
		struct
		{
		bits: 2;
			bits mBit2_4 : 3;
			bits mBit5_7 : 3;
		};
		////////////////////////////////////////////////////////////////////////////////////
		//Pair
		struct
		{
			bits mBit0_1 : 2;
			bits mBit2_3 : 2;
			bits mBit4_5 : 2;
			bits  : 2;
		};
		struct
		{
			bits: 1;
			bits mBit1_2 : 2;
			bits mBit3_4 : 2;
			bits mBit5_6 : 2;
			bits : 1;
		};
		////////////////////////////////////////////////////////////////////////////////////
		//Bits
		struct
		{
			bits mBit0		: 1;
			bits mBit1		: 1;
			bits mBit2		: 1;
			bits mBit3		: 1;
			bits mBit4		: 1;
			bits mBit5		: 1;
			bits mBit6		: 1;
			bits mBit7		: 1;
		};
	};
};
struct Word
{
	union
	{
		bits mBits : 16;	//All the bits
		/*struct
		{
			Byte MS_Byte;	//Most significant byte.
			Byte LS_Byte;	//Least significant byte.
		};*/
	};
};
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
inline void     CopyBytes(PTR pSource, PTR pDestination, UINT16 pCount);
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
inline void     Byte_SetZone(BytePtr pInput, UINT8 pMax, UINT8 pChunk, UINT8 pChunkSize, UINT8 pValue);
inline UINT8    Byte_GetZone(BytePtr pInput, UINT8 pMax, UINT8 pChunk, UINT8 pChunkSize);
////////////////////////////////////////////////////////////////////////////////////
void            Byte_Init(BytePtr pInput);
////////////////////////////////////////////////////////////////////////////////////
void            Byte_SetBit(BytePtr pInput, UINT8 pBit, UINT8 pValue);
UINT8           Byte_GetBit(BytePtr pInput, UINT8 pBit);
////////////////////////////////////////////////////////////////////////////////////
void            Byte_SetPair(BytePtr pInput, UINT8 pPair, UINT8 pValue);
UINT8           Byte_GetPair(BytePtr pInput, UINT8 pPair);
////////////////////////////////////////////////////////////////////////////////////
void            Byte_SetTriple(BytePtr pInput, UINT8 pTriple, UINT8 pValue);
UINT8           Byte_GetTriple(BytePtr pInput, UINT8 pTriple);
////////////////////////////////////////////////////////////////////////////////////
void            Byte_SetQuad(BytePtr pInput, UINT8 pQuad, UINT8 pValue);
UINT8           Byte_GetQuad(BytePtr pInput, UINT8 pQuad);
////////////////////////////////////////////////////////////////////////////////////
void            Byte_SetPort(BytePtr pInput, UINT8 pValue);
UINT8           Byte_GetPort(BytePtr pInput);
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void            Word_Init   (Word* pInput);
////////////////////////////////////////////////////////////////////////////////////
void            Word_SetBit (Word* pInput, UINT8 pBit, UINT8 pValue);
UINT8           Word_GetBit (Word* pInput, UINT8 pBit);
////////////////////////////////////////////////////////////////////////////////////
void            Word_SetPair(Word* pInput, UINT8 pPair, UINT8 pValue);
UINT8           Word_GetPair(Word* pInput, UINT8 pPair);
////////////////////////////////////////////////////////////////////////////////////
void            Word_SetQuad(Word* pInput, UINT8 pQuad, UINT8 pValue);
UINT8           Word_GetQuad(Word* pInput, UINT8 pQuad);
////////////////////////////////////////////////////////////////////////////////////
void            Word_SetByte(Word* pInput, UINT8 pByte, UINT8 pValue);
UINT8           Word_GetByte(Word* pInput, UINT8 pByte);
////////////////////////////////////////////////////////////////////////////////////
void            Word_SetWord(Word* pInput, UINT16 pValue);
UINT16          Word_GetWord(Word* pInput);
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
void            PortProperty_Init(PortPropertyPtr pInput, ePinDrive pPinDrive[8]);
////////////////////////////////////////////////////////////////////////////////////
ePinError       PortProperty_Valid(PortPropertyPtr pInput, ePinDrive pPinDrive, UINT8 pPin);
////////////////////////////////////////////////////////////////////////////////////
#endif	/* TYPES_H */