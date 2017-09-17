/* 
 * File:   SPI.h
 * Author: User
 *
 * Created on 19 September 2016, 1:25 PM
 */
////////////////////////////////////////////////////////////////////////////////
#ifndef SPI_H
#define	SPI_H
#include "Types.h"
#include "FIFO.h"
#include "Config.h"

#define SPI1_ISR_CONDITION (PIR1bits.SSP1IF && PIE1bits.SSP1IE && (SSP1CON1bits.SSPM < 0b0110))
#define SPI2_ISR_CONDITION (PIR3bits.SSP2IF && PIE3bits.SSP2IE && (SSP2CON1bits.SSPM < 0b0110))
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#define SPI_SELECT      0
#define SPI_DESELECT    1

#define SPI1_IFP    PIR1bits.SSP1IF
#define SPI1_CSP    PortC.mOutput->mBit2
#define SPI1_CLKP   PortC.mOutput->mBit3
#define SPI1_ENAP   SSP1CON1bits.SSPEN
#define SPI1_DATP   PortC.mOutput->mBit5

#define SPI2_IFP    PIR3bits.SSP2IF
#define SPI2_CSP    PortD.mOutput->mBit7
#define SPI2_CLKP   PortD.mOutput->mBit6
#define SPI2_ENAP   SSP2CON1bits.SSPEN
#define SPI2_DATP   PortD.mOutput->mBit4

#ifndef SPI_ISR
#define SPI1_ISR()
#define SPI2_ISR()
#else
void SPI1_ISR();
void SPI2_ISR();
#endif 
typedef struct SPI SPI;
extern SPI SPI1, SPI2;

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
typedef enum
{
    eSPI1 = 0,
    eSPI2 = 1
} eSPI_Channel;
////////////////////////////////////////////////////////////////////////////////
typedef enum
{
    eSPI_Mode0,
    eSPI_Mode1,
    eSPI_Mode2,
    eSPI_Mode3
} eSPI_Mode;
////////////////////////////////////////////////////////////////////////////////
typedef union
{
    UINT16 Word;
    struct
    {
	UINT8 MSB;
	UINT8 LSB;
    };
} SPIWORD;


typedef enum
{
    eSPI_8Bit,
    eSPI_9Bit
} eSPI_Bits;

struct SPI
{   
    eSPI_Bits       mBits;
    eSPI_Channel    mChannel;
    FIFO            mInputFIFO;
    FIFO            mOutputFIFO;
    
    //These are managed by the above FIFOS
    // In 9 bit mode, every second byte has 7 bits wasted
    UINT8           mInputBuffer[SPI_BUFFERSIZE];
    UINT8           mOutputBuffer[SPI_BUFFERSIZE];
    
    //These are pointers to the status registers
    SSPSTATbits_t*  SSPSTATT;
    
    union
    {
        BytePtr         SSPCON1T;
        SSP2CON1bits_t  SSPCON1Tb;
    };
    UINT8Ptr        SSPBUF;
    
    void            (*mISR)();
};

void TSPI_Init(SPI * pInput, UINT32 pCPUClock, UINT32 pClock, eSPI_Channel pChannel, eSPI_Mode pMode)
{
    pInput->mChannel = pChannel;
    ////////////////////////////////////////////////////////////////////////////
    
#ifdef SPI_ISR
    FIFO_Init(&pInput->mInputFIFO,  pInput->mInputBuffer,	SPI_BUFFERSIZE);
    FIFO_Init(&pInput->mOutputFIFO, pInput->mOutputBuffer,	SPI_BUFFERSIZE);
#endif
    
    //Initialize GPIO and registers
    switch (pChannel)
    {
        case eSPI1:
            ////////////////////////////////////////////////////////////////////
            Port_SetPinType(&PortC, SPI1_CS,	eTypeOutput);
            Port_SetPinType(&PortC, SPI1_SCK,	eTypeOutput);
            Port_SetPinType(&PortC, SPI1_SIMO,	eTypeOutput);
            Port_SetPinType(&PortC, SPI1_SOMI,	eTypeInput);
            ////////////////////////////////////////////////////////////////////
            pInput->SSPSTATT = &SSP1STAT;
            pInput->SSPCON1T = (BytePtr)&SSP1CON1;
            pInput->SSPBUF = SSP1BUF;
            
            pInput->mISR = TSPI1_ISR;
            break;
        case eSPI2:
            ////////////////////////////////////////////////////////////////////
            Port_SetPinType(&PortD, SPI2_CS,	eTypeOutput);
            Port_SetPinType(&PortD, SPI2_SCK,	eTypeOutput);
            Port_SetPinType(&PortD, SPI2_SIMO,	eTypeOutput);
            Port_SetPinType(&PortD, SPI2_SOMI,	eTypeInput);
            ////////////////////////////////////////////////////////////////////
            pInput->SSPSTATT = &SSP2STAT;
            pInput->SSPCON1T = (BytePtr)&SSP2CON1;
            pInput->SSPBUF = SSP2BUF;
            
            pInput->mISR = TSPI2_ISR;
            break;
        default:
            return;
    };   
    ////////////////////////////////////////////////////////////////////////////
    //Disable Serial Port
    Byte_SetBit(pInput->SSPCON1T, SSPCON1_SSPEN, SSPCON1_SSPEN_OFF);
    ////////////////////////////////////////////////////////////////////////////
    //Setup SPI Modes
    switch(pMode)
    {
        case eSPI_Mode0:
            Byte_SetBit(pInput->SSPCON1T, SSPCON1_CKP, SSPCON1_CKP_IDLEL);   //MSB CKP
            Byte_SetBit(pInput->SSPSTATT, SSPSTAT_CKE, SSPSTAT_CKE_ATI);     //LSB CKE
            break;
        case eSPI_Mode1:
            Byte_SetBit(pInput->SSPCON1T, SSPCON1_CKP, SSPCON1_CKP_IDLEL);   //MSB CKP
            Byte_SetBit(pInput->SSPSTATT, SSPSTAT_CKE, SSPSTAT_CKE_ITA);     //LSB CKE
            break;
        case eSPI_Mode2:
            Byte_SetBit(pInput->SSPCON1T, SSPCON1_CKP, SSPCON1_CKP_IDLEH);   //MSB CKP
            Byte_SetBit(pInput->SSPSTATT, SSPSTAT_CKE, SSPSTAT_CKE_ATI);     //LSB CKE
            break;
        case eSPI_Mode3:
            Byte_SetBit(pInput->SSPCON1T, SSPCON1_CKP, SSPCON1_CKP_IDLEH);   //MSB CKP
            Byte_SetBit(pInput->SSPSTATT, SSPSTAT_CKE, SSPSTAT_CKE_ITA);     //LSB CKE
            break;
        default:
            return;
    };
    ////////////////////////////////////////////////////////////////////////////
    //Clear Flags
    Byte_SetBit(pInput->SSPCON1T, SSPCON1_WCOL,  SSPCON1_WCOL_NO_COL);  
    Byte_SetBit(pInput->SSPCON1T, SSPCON1_SSPOV, SSPCON1_SSPOV_NO_OVFLW);    
    ////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    //Clear flags
    //NOTE: The clock input is shared between ports, the dividers are not shared
    Timer2_Init(pClock);
    
    #ifdef SPI_ISR
	SPI_ClearFlags(pChannel);
	SPI_EnableISR(pChannel);
    #else	
	SPI_DisableISR(pChannel);
    #endif
    ////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    switch (pChannel)
    {
        case eSPI1:	IPR1bits.SSP1IP = 1;	break;
        case eSPI2:	IPR3bits.SSP2IP = 1;	break;
        default:				return;
    };  
    ////////////////////////////////////////////////////////////////////////////
    //CS is an output and deselect line
    SPI_DCS(pChannel);
    ////////////////////////////////////////////////////////////////////////////
    //Enable Serial Port
    Byte_SetQuad(pInput->SSPCON1T, SSPCON1_SSPM, SSPCON1_SSPM_F_TMR2);
    Byte_SetBit	(pInput->SSPCON1T, SSPCON1_SSPEN, SSPCON1_SSPEN_ON);
    ////////////////////////////////////////////////////////////////////////////
}
inline bool TSPI_BF(SPI * pInput)
{
    return (pInput->SSPSTATT.BF);
}
inline UINT8Ptr TSPI_BUF(SPI * pInput)
{
    return (pInput->SSPBUF);
}
void TSPI_ClearFlags(SPI * pInput)
{
    static UINT8 data;
    switch (pInput->mChannel)
    {
        case eSPI1:   PIR1bits.SSP1IF	=   0;	data = SSP1BUF; return;
        case eSPI2:   PIR3bits.SSP2IF	=   0;	data = SSP2BUF; return;
        default:                                                return;
    };  
}
void TSPI_SetFlags(SPI * pInput)
{
    switch (pInput->mChannel)
    {
        case eSPI1:   PIR1bits.SSP1IF	=   1; return;
        case eSPI2:   PIR3bits.SSP2IF	=   1; return;
        default:                               return;
    };  
}
void TSPI_EnableISR(SPI * pInput)
{
    switch (pInput->mChannel)
    {
	case eSPI1:    PIE1bits.SSP1IE = 1;    return;
	case eSPI2:    PIE3bits.SSP2IE = 1;    return;
	default:                               return;
    }; 
}
void TSPI_DisableISR(SPI * pInput)
{
    switch (pInput->mChannel)
    {
	case eSPI1:    PIE1bits.SSP1IE = 0;    return;
	case eSPI2:    PIE3bits.SSP2IE = 0;    return;
	default:                               return;
    }; 
}
void TSPI_MinSpeed(SPI * pInput)
{
    ////////////////////////////////////////////////////////////////////////////
    //Disable Serial Port
    Byte_SetBit(pInput->SSPCON1T,   SSPCON1_SSPEN, SSPCON1_SSPEN_OFF);
    ////////////////////////////////////////////////////////////////////////////
    //Enable Serial Port
    Byte_SetQuad(pInput->SSPCON1T,  SSPCON1_SSPM, SSPCON1_SSPM_F_64);
    Byte_SetBit(pInput->SSPCON1T,   SSPCON1_SSPEN, SSPCON1_SSPEN_ON);
    ////////////////////////////////////////////////////////////////////////////
}
void TSPI_MaxSpeed(SPI * pInput)
{
    ////////////////////////////////////////////////////////////////////////////
    //Disable Serial Port
    Byte_SetBit(pInput->SSPCON1T,   SSPCON1_SSPEN, SSPCON1_SSPEN_OFF);
    ////////////////////////////////////////////////////////////////////////////
    //Enable Serial Port
    Byte_SetQuad(pInput->SSPCON1T,  SSPCON1_SSPM, SSPCON1_SSPM_F_4);
    Byte_SetBit(pInput->SSPCON1T,   SSPCON1_SSPEN, SSPCON1_SSPEN_ON);
    ////////////////////////////////////////////////////////////////////////////
}
inline void TSPI_CS(SPI * pInput)
{
    switch(pInput->mChannel)
    {
    case eSPI1:	PORTCbits.RC2 = SPI_SELECT;	return;
    case eSPI2:	PORTDbits.RD7 = SPI_SELECT;	return;
    }
}
inline void TSPI_DCS(SPI * pInput)
{
    switch(pInput->mChannel)
    {
    case eSPI1:	PORTCbits.RC2 = SPI_DESELECT;	return;
    case eSPI2:	PORTDbits.RD7 = SPI_DESELECT;	return;
    }
}
UINT8 TSPI_Send(SPI * pInput, CUINT8 pData)
{
#ifdef SPI_ISR
    bool Kickstart = false;
    
    ////////////////////////////////////////////////////////////////////////////
    //Conduct a SPI transaction
    ////////////////////////////////////////////////////////////////////
    if (FIFO_Empty(&(pInput->mOutputFIFO)))
        Kickstart = true;
    
    //Add the byte to the FIFO
    while(!FIFO_Put(&(pInput->mOutputFIFO), pData));
    
    //Start the process
    if (Kickstart)
        pInput->mISR();
    
    return 1;
#else
    TSPI_CS(pInput);
    pInput->SSPBUF = pData;
    while (!pInput->SSPSTATT->BF);
    TSPI_DCS(pInput);
    return pInput->SSPBUF;
#endif
}

UINT16 TSPI_Send9(SPI * pInput, CUINT16 pData)
{
    pData &= 0x1FF;

#ifdef SPI_ISR
    bool Kickstart = false;
    
    //Add the byte to the FIFO
    pInput->mBits = eSPI_9Bit;
    while(!FIFO_Put16(&(pInput->mOutputFIFO), pData));
    
    //Start the process
    if (Kickstart)
        pInput->mISR();
    
    return 1;
#else
    static Word dat;
    dat.mBits   = pData;
    
    //Select the device
    TSPI_CS(pInput);
    
    switch (pInput->mChannel)
    {
        case eSPI1:
            SPI1_ENAP   = 0;            //Disable module
            SPI1_CLKP	= 0;            //Toggle clock
            SPI1_DATP	= dat.H;        //Single data bit
            SPI1_CLKP	= 1;            //Toggle clock
            SPI1_ENAP   = 1;            //Enable module
            break;
        case eSPI2:
            SPI2_ENAP   = 0;            //Ditto above
            SPI2_CLKP	= 0;
            SPI2_DATP	= dat.H;
            SPI2_CLKP	= 1;
            SPI2_ENAP   = 1;
            break;
    };
    
    //Send data
    pInput->SSPBUF = pData;
    
    //Wait for data to send
    while (!pInput->SSPSTATT->BF);
    TSPI_DCS(pInput);
    
    //Return the last 8 bits.
    return pInput->SSPBUF;
#endif
}

inline void TSPI_9BITX(SPI * pInput, UINT16 pData)
{
    static Word dat;
    dat.mBits = pData;
    switch (pInput->mChannel)
    {
        case eSPI1:
            SPI1_CSP    = 0;            //Chip select
            SPI1_ENAP   = 0;            //Disable module
            SPI1_CLKP	= 0;            //Toggle clock
            SPI1_DATP	= dat.H;        //Single data bit
            SPI1_CLKP	= 1;            //Toggle clock
            SPI1_ENAP   = 1;            //Enable module
            break;
        case eSPI2:
            SPI2_CSP    = 0;            //Ditto above
            SPI2_ENAP   = 0;            
            SPI2_CLKP	= 0;
            SPI2_DATP	= dat.H;
            SPI2_CLKP	= 1;
            SPI2_ENAP   = 1;
            break;
    };
    
    //Doesn't deselect the chip, this is done after interrupt returns
    pInput->SSPBUF	= dat.L;
}
inline void TSPI_8BITX(SPI * pInput, CUINT8 pData)
{
    TSPI_CS(pInput);
    //Doesn't deselect the chip, this is done after interrupt returns
    pInput->SSPBUF	= pData;
}

void TSPI_ISR_GENERAL(SPI * pInput)
{
    Word dat;
    
    if (TSPI_BF(pInput))
    {
        TSPI_DCS(pInput);
        TSPI_ClearFlags(pInput);
        switch (pInput->mBits)
        {
            case eSPI_8Bit:
                FIFO_Put(&(pInput->mInputFIFO), pInput->SSPBUF);
                
                //Continue transmission
                if (FIFO_Get(&(pInput->mOutputFIFO), dat.L))
                    TSPI_8BITX(pInput, dat.L);
                break;
            case eSPI_9Bit:
                if (FIFO_Get16(&(pInput->mOutputFIFO), (UINT16Ptr)&dat))
                    TSPI_9BITX(pInput, dat.mBits);
                break;
        };
    }
}


void TSPI1_ISR()
{
    SPI1_IFP = 0;
    SPI_ISR_GENERAL(SPI1);
}
void TSPI2_ISR()
{
    SPI2_IFP = 0;
    SPI_ISR_GENERAL(SPI2); 
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
void            SPI_Init(UINT32 pCPUClock, UINT32 pClock, eSPI_Channel pChannel, eSPI_Mode pMode);
////////////////////////////////////////////////////////////////////////////////
inline void     SPI_CS  (eSPI_Channel pChannel);
////////////////////////////////////////////////////////////////////////////////
inline void     SPI_DCS (eSPI_Channel pChannel);
////////////////////////////////////////////////////////////////////////////////
#ifdef SPI_ISR
void            SPI_Send(eSPI_Channel pChannel, CUINT8 pInput);
#else
UINT8 SPI_Swap(eSPI_Channel pChannel, CUINT8 pInput);
#endif
////////////////////////////////////////////////////////////////////////////////
inline void     SPI_ClearFlags(eSPI_Channel pChannel);
void            SPI_MaxSpeed(eSPI_Channel pChannel);
void            SPI_MinSpeed(eSPI_Channel pChannel);
inline void     SPI2_9BIT(CUINT16 pInput);
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


#endif