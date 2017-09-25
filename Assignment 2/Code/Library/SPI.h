/* 
 * File:   SPI.h
 * Author: David Ledger
 *
 * Created on 19 September 2016, 1:25 PM
 */
////////////////////////////////////////////////////////////////////////////////
#ifndef SPI_H
#define	SPI_H
#include "Types.h"
#include "Config.h"
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#define SPI_SELECT      0
#define SPI_DESELECT    1
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#define SPI1_IFP    PIR1bits.SSP1IF
#define SPI1_IEP    PIE1bits.SSP1IE
#define SPI1_CSP    PortC.mOutput->mBit2
#define SPI1_CLKP   PortC.mOutput->mBit3
#define SPI1_ENAP   SSP1CON1bits.SSPEN
#define SPI1_BF     SSP1STATbits.BF
#define SPI1_DATP   PortC.mOutput->mBit5
#define SPI1_BUF    SSP1BUF
#define SPI1_ISR_CONDITION (SPI1_IFP && SPI1_IEP && (SSP1CON1bits.SSPM < 0b0110))
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#define SPI2_IFP    PIR3bits.SSP2IF
#define SPI2_IEP    PIE3bits.SSP2IE
#define SPI2_CSP    PortD.mOutput->mBit7
#define SPI2_CLKP   PortD.mOutput->mBit6
#define SPI2_BF     SSP2STATbits.BF
#define SPI2_ENAP   SSP2CON1bits.SSPEN
#define SPI2_DATP   PortD.mOutput->mBit4
#define SPI2_BUF    SSP2BUF
#define SPI2_ISR_CONDITION (SPI2_IFP && SPI2_IEP && (SSP2CON1bits.SSPM < 0b0110))
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#ifndef ISR_SPI
#define SPI1_ISR()
#define SPI2_ISR()
#else
void SPI1_ISR();
void SPI2_ISR();
#endif 
typedef struct SPI SPI;
typedef SPI * SPIPtr;

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
typedef enum
{
    eSPI_8Bit,
    eSPI_9Bit
} eSPI_Bits;
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////

struct SPI
{   
    bool            mBusy;
    eSPI_Bits       mBits;
    eSPI_Channel    mChannel;
#ifdef ISR_SPI
    FIFO            mInputFIFO;
    FIFO            mOutputFIFO;
    
    //These are managed by the above FIFOS
    // In 9 bit mode, every second byte has 7 bits wasted

    volatile UINT8  mInputBuffer[SPI_BUFFERSIZE];
    volatile UINT8  mOutputBuffer[SPI_BUFFERSIZE];
    
    void            (*mISR)();
#endif
    
    //These are pointers to the status registers
    union
    {
        BytePtr             SSPSTATT;
        SSPSTATbits_t   *   SSPSTATTb;
    };
    union
    {
        BytePtr         SSPCON1T;
        SSP2CON1bits_t  SSPCON1Tb;
    };
    UINT8Ptr        SSPBUF;
    

};

void            SPI_Init        (UINT32 pClock, eSPI_Channel pChannel, eSPI_Mode pMode);
inline bool     SPI_BF          (SPIPtr pInput);
inline bool     SPI_Busy        (SPIPtr pInput);
inline UINT8Ptr SPI_Buffer      (SPIPtr pInput);

void            SPI_ClearFlags  (SPIPtr pInput);
void            SPI_SetFlags    (SPIPtr pInput);
void            SPI_EnableISR   (SPIPtr pInput);
void            SPI_DisableISR  (SPIPtr pInput);
void            SPI_MinSpeed    (SPIPtr pInput);
void            SPI_MaxSpeed    (SPIPtr pInput);
void            SPI_CS          (SPIPtr pInput);
void            SPI_DCS         (SPIPtr pInput);
UINT8           SPI_Send        (SPIPtr pInput, UINT8 pData);
UINT16          SPI_Send9       (SPIPtr pInput, UINT16 pData);

//ISR Functions
#ifdef ISR_SPI
inline void     SPI_9BITX       (SPIPtr pInput, UINT16 pData);
inline void     SPI_8BITX       (SPIPtr pInput, UINT8 pData);
inline void     ISR_SPI_GENERAL (SPIPtr pInput);
void            SPI1_ISR();
void            SPI2_ISR();
#endif
#endif