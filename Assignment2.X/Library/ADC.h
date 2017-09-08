/* 
 * File:   ADC.h
 * Author: David Ledger
 *
 * Created on 31 March 2017, 6:27 PM
 */

#ifndef ADC_H
#define	ADC_H
#include "Types.h"

#define ADC_ISR_CONDITION (PIR1bits.ADIF && PIE1bits.ADIE)
#define ADC_BUSY (ADCON0bits.GODONE)
#define ADC_GO (ADCON0bits.GO)
#define ADCCALMIN  (float)0.000
#define ADCCALMAX  (float)3.3

typedef struct ADC ADC;
typedef ADC * ADCPtr;

typedef enum 
{
    eADC_Ch0 = 0,
    eADC_Ch1 = 1,
    eADC_Ch2 = 2,
    eADC_Ch3 = 3
} eADC_Channel;

struct ADC
{
    eADC_Channel    mChannel;
    UINT16          mValue;
    ADCPtr          mNext;
};

void    ADC_Init    (ADCPtr pInput, eADC_Channel pChannel);
void    ADC_Sequence(ADCPtr pItemA, ADCPtr pItemB);
void    ADC_Start   (ADCPtr pInput);
void    ADC_ISR();
float   ADC_Voltage(ADCPtr pInput);

UINT8 rand();
UINT8 rand_between(UINT8 pValA, UINT8 pValB);
#endif	/* ADC_H */

