#include "SPI.h"
#include <xc.h>
#include <stdbool.h>
#include "Timer2.h"
#include "Types.h"
#include "Port.h"
#include "LED.h"
#include "Config.h"
////////////////////////////////////////////////////////////////////////////////
SPI	SPI1, SPI2;
////////////////////////////////////////////////////////////////////////////////
void SPI_Init(UINT32 pClock, eSPI_Channel pChannel, eSPI_Mode pMode)
{
    SPIPtr pInput;
    
    switch (pChannel)
    {
	case eSPI1:
	    pInput = &SPI1;
	    break;
	case eSPI2:
	    pInput = &SPI2;
	    break;
    };
    
    pInput->mChannel = pChannel;
    ////////////////////////////////////////////////////////////////////////////
    
#ifdef ISR_SPI
    FIFO_Init(&(pInput->mInputFIFO),  (CUINT8Ptr)(pInput->mInputBuffer),	SPI_BUFFERSIZE);
    FIFO_Init(&(pInput->mOutputFIFO), (CUINT8Ptr)(pInput->mOutputBuffer),	SPI_BUFFERSIZE);
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
            pInput->SSPSTATT	= (BytePtr)&SSP1STAT;
            pInput->SSPCON1T	= (BytePtr)&SSP1CON1;
            pInput->SSPBUF	= (UINT8Ptr)&SSP1BUF;
	    ////////////////////////////////////////////////////////////////////
            #ifdef ISR_SPI
            pInput->mISR = SPI1_ISR;
	    #endif
	    ////////////////////////////////////////////////////////////////////
            break;
        case eSPI2:
            ////////////////////////////////////////////////////////////////////
            Port_SetPinType(&PortD, SPI2_CS,	eTypeOutput);
            Port_SetPinType(&PortD, SPI2_SCK,	eTypeOutput);
            Port_SetPinType(&PortD, SPI2_SIMO,	eTypeOutput);
            Port_SetPinType(&PortD, SPI2_SOMI,	eTypeInput);
            ////////////////////////////////////////////////////////////////////
            pInput->SSPSTATT	= (BytePtr)&SSP2STAT;
            pInput->SSPCON1T	= (BytePtr)&SSP2CON1;
            pInput->SSPBUF	= (UINT8Ptr)&SSP2BUF;
	    ////////////////////////////////////////////////////////////////////
            #ifdef ISR_SPI
            pInput->mISR = SPI2_ISR;
	    #endif
	    ////////////////////////////////////////////////////////////////////
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
    
    #ifdef ISR_SPI
	SPI_ClearFlags(pInput);
	SPI_EnableISR(pInput);
    #else	
	SPI_DisableISR(pInput);
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
    SPI_DCS(pInput);
    
    pInput->mBusy = false;
    ////////////////////////////////////////////////////////////////////////////
    //Enable Serial Port
    Byte_SetQuad(pInput->SSPCON1T, SSPCON1_SSPM, SSPCON1_SSPM_F_TMR2);
    Byte_SetBit	(pInput->SSPCON1T, SSPCON1_SSPEN, SSPCON1_SSPEN_ON);
    ////////////////////////////////////////////////////////////////////////////
}
inline bool SPI_Busy(SPIPtr pInput)
{
    return 
#ifdef ISR_SPI
    //This indicates that a FIFO is dumping
    (pInput->mBusy) ||
#endif
    SPI_BF(pInput);
}
inline bool SPI_BF(SPIPtr pInput)
{
    return (pInput->SSPSTATTb->BF);
}
inline UINT8Ptr SPI_Buffer(SPIPtr pInput)
{
    return (pInput->SSPBUF);
}
void SPI_ClearFlags(SPIPtr pInput)
{
    volatile UINT8 data;
    
    pInput->mBusy = false;
    switch (pInput->mChannel)
    {
        case eSPI1:   SPI1_IFP	=   0;	data = SSP1BUF; return;
        case eSPI2:   SPI2_IFP	=   0;	data = SSP2BUF; return;
        default:                                        return;
    };  
}
void SPI_SetFlags(SPIPtr pInput)
{
    pInput->mBusy = true;
    switch (pInput->mChannel)
    {
        case eSPI1:   SPI1_IFP	=   1;  return;
        case eSPI2:   SPI2_IFP	=   1;  return;
        default:                       return;
    };  
}
void SPI_EnableISR(SPIPtr pInput)
{
    switch (pInput->mChannel)
    {
	case eSPI1:    SPI1_IEP = 1;    return;
	case eSPI2:    SPI2_IEP = 1;    return;
	default:                        return;
    }; 
}
void SPI_DisableISR(SPIPtr pInput)
{
    switch (pInput->mChannel)
    {
	case eSPI1:    SPI1_IEP = 0;    return;
	case eSPI2:    SPI2_IEP = 0;    return;
	default:                        return;
    }; 
}
void SPI_MinSpeed(SPIPtr pInput)
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
void SPI_MaxSpeed(SPIPtr pInput)
{
    ////////////////////////////////////////////////////////////////////////////
    //Disable Serial Port
    Byte_SetBit(pInput->SSPCON1T,   SSPCON1_SSPEN,  SSPCON1_SSPEN_OFF);
    ////////////////////////////////////////////////////////////////////////////
    //Enable Serial Port
    Byte_SetQuad(pInput->SSPCON1T,  SSPCON1_SSPM,   SSPCON1_SSPM_F_4);
    Byte_SetBit(pInput->SSPCON1T,   SSPCON1_SSPEN,  SSPCON1_SSPEN_ON);
    ////////////////////////////////////////////////////////////////////////////
}
 void SPI_CS(SPIPtr pInput)
{
    if (pInput->mChannel == eSPI1)
	SPI1_CSP = SPI_SELECT;
    else
	SPI2_CSP = SPI_SELECT;
}
void SPI_DCS(SPIPtr pInput)
{
    if (pInput->mChannel == eSPI1)
	SPI1_CSP = SPI_DESELECT;
    else
	SPI2_CSP = SPI_DESELECT;
}
UINT8 SPI_Send(SPIPtr pInput, UINT8 pData)
{
#ifdef ISR_SPI
    ////////////////////////////////////////////////////////////////////////////
    //Conduct a SPI transaction
    ////////////////////////////////////////////////////////////////////
#ifdef SPI_FILLBUFFER
    //Add the byte to the FIFO
    pInput->mBits = eSPI_8Bit;
    while (!FIFO_Put(&(pInput->mOutputFIFO), pData));
    
    //Start the process, triggers interrupt
    if (FIFO_Half(&(pInput->mOutputFIFO)))
	SPI_SetFlags(pInput);
#else    
    bool Kickstart = FIFO_Empty(&(pInput->mOutputFIFO));
    
    //Add the byte to the FIFO
    pInput->mBits = eSPI_8Bit;
    while(!FIFO_Put(&(pInput->mOutputFIFO), pData));
    
    //Start the process, triggers interrupt
    if (Kickstart)
	SPI_SetFlags(pInput);
#endif
    return 1;
#else
    switch (pInput->mChannel)
    {
        case eSPI1:
            SPI1_CSP = SPI_SELECT;
	    SPI1_BUF = pData;
	    while (!SPI1_BF);
	    pData = SPI1_BUF;
	    SPI1_CSP = SPI_DESELECT;
            return pData;
        case eSPI2:
	    SPI2_CSP = SPI_SELECT;
	    SPI2_BUF = pData;
	    while (!SPI2_BF);
	    pData = SPI2_BUF;
	    SPI2_CSP = SPI_DESELECT;
            return pData;
    };
    return pData;
#endif
}
UINT16 SPI_Send9(SPIPtr pInput, UINT16 pData)
{
    pData &= 0x1FF;

#ifdef ISR_SPI
#ifdef SPI_FILLBUFFER
    //Add the byte to the FIFO
    pInput->mBits = eSPI_9Bit;
    
    while (!FIFO_Put16(&(pInput->mOutputFIFO), pData));
    
    //Start the process, triggers interrupt
    if (FIFO_Half(&(pInput->mOutputFIFO)))
	SPI_SetFlags(pInput);
#else
    bool Kickstart = FIFO_Empty(&(pInput->mOutputFIFO));
    
    //Add the byte to the FIFO
    pInput->mBits = eSPI_9Bit;
    while (!FIFO_Put16(&(pInput->mOutputFIFO), pData));
    
    //Start the process, triggers interrupt
    if (Kickstart)
	SPI_SetFlags(pInput);
#endif
    return 1;
#else
    static Word dat;
    dat.mBits   = pData;

    switch (pInput->mChannel)
    {
        case eSPI1:
	    SPI1_CSP	= SPI_SELECT;
            SPI1_ENAP   = 0;            //Disable module
            SPI1_CLKP	= 0;            //Toggle clock
            SPI1_DATP	= dat.H;        //Single data bit
            SPI1_CLKP	= 1;            //Toggle clock
            SPI1_ENAP   = 1;            //Enable module
	    SPI1_BUF	= pData;
	    while (!SPI1_BF);
	    SPI1_CSP	= SPI_DESELECT;
	    pData	= SPI1_BUF;
            break;
        case eSPI2:
	    SPI2_CSP	= SPI_SELECT;
            SPI2_ENAP   = 0;            //Ditto above
            SPI2_CLKP	= 0;
            SPI2_DATP	= dat.H;
            SPI2_CLKP	= 1;
            SPI2_ENAP   = 1;
	    SPI2_BUF	= pData;
	    while (!SPI2_BF);
	    SPI2_CSP	= SPI_DESELECT;
	    pData	= SPI2_BUF;
            break;
    };
    
    //Return the last 8 bits.
    return pData;
#endif
}

#ifdef ISR_SPI
inline void SPI_9BITX(SPIPtr pInput, UINT16 pData)
{
    static Word dat;
    dat.mBits = pData;
    switch (pInput->mChannel)
    {
        case eSPI1:
            SPI1_CSP    = SPI_SELECT;   //Chip select
            SPI1_ENAP   = 0;            //Disable module
            SPI1_CLKP	= 0;            //Toggle clock
            SPI1_DATP	= dat.H;        //Single data bit
            SPI1_CLKP	= 1;            //Toggle clock
            SPI1_ENAP   = 1;            //Enable module
	    SPI1_BUF	= dat.L;
            break;
        case eSPI2:
            SPI2_CSP    = SPI_SELECT;   //Ditto above
            SPI2_ENAP   = 0;            
            SPI2_CLKP	= 0;
            SPI2_DATP	= dat.H;
            SPI2_CLKP	= 1;
            SPI2_ENAP   = 1;
	    SPI2_BUF	= dat.L;
            break;
    };
}
inline void SPI_8BITX(SPIPtr pInput, UINT8 pData)
{
    SPI_CS(pInput);
    //Doesn't deselect the chip, this is done after interrupt returns
    *(pInput->SSPBUF)	= pData;
}

inline void ISR_SPI_GENERAL(SPIPtr pInput)
{
    static Word dat;
    FIFOPtr OFIFO = &(pInput->mOutputFIFO);
    FIFOPtr IFIFO = &(pInput->mInputFIFO);
    
    switch (pInput->mBits)
    {
	case eSPI_8Bit:
	    if (SPI_BF(pInput))
	    {
		SPI_DCS(pInput);
		FIFO_Put(IFIFO, *(pInput->SSPBUF));
	    }

	    //Continue transmission
	    if (FIFO_Items(OFIFO))
		SPI_8BITX(pInput, FIFO_Read(OFIFO));
	    else
		SPI_ClearFlags(pInput);
	    break;
	case eSPI_9Bit:
	    if (SPI_BF(pInput))
	    {
		SPI_DCS(pInput);
		dat.L = *(pInput->SSPBUF);
	    }

	    //Continue transmission
	    if (FIFO_Items(OFIFO))
		SPI_9BITX(pInput, FIFO_Read16(OFIFO));
	    else
		SPI_ClearFlags(pInput);
	    break;
    };
}
void SPI1_ISR()
{
    SPI1_IFP = 0;
    ISR_SPI_GENERAL(&SPI1);
}
void SPI2_ISR()
{
    SPI2_IFP = 0;
    ISR_SPI_GENERAL(&SPI2); 
}
#endif