#include "ADC.h"
#include "Events.h"
#include "Config.h"

static bool ADC_Initialised = false;
static ADCPtr lCurrent;

//Local functions
void  ADC_Calibrate();
void  ADC_On();
void  ADC_Off();
void    ADC_ISROn();
void    ADC_ISROff();
void    ADC_SetupIO(eADC_Channel pChannel);
void    ADC_SetChannel(eADC_Channel pChannel);
void    ADC_ClockDivision(UINT8 pDivide);
void    ADC_ConversionTime(UINT8 pCount);

void ADC_Init(ADCPtr pInput, eADC_Channel pChannel)
{
        ifnull(pInput)
        return;

        //Ensure rand function and interrupt works
        lCurrent = pInput;

        pInput->mChannel = pChannel;
        pInput->mNext = (ADCPtr)0;
        pInput->mValue = 0;

        //Setup ADC registers
        ADC_SetChannel(pChannel);

        //Setup the ADC sample reference
        ADCON0bits.VCFG1 = 0; //VSS
        ADCON0bits.VCFG0 = 0; //AVDD  //3.3V

        //
        ADCON1bits.ADFM = 1; //Right justified
        ADCON1bits.ADCAL = 1; //Calibrate on next conversion

        //Setup the conversion time, this can be changed between 0 and 20
        ADC_ConversionTime(12);

        //Setup clock source
        //  Divide main clock by 16 for sample
        ADC_ClockDivision(16);

        //Setup Analog input
        ADC_SetupIO(pChannel);

        //Setup interrupts
#ifdef ADCISR
        ADC_ISROn();
#endif

        //Avoid redoing this
        ADC_Initialised = true;

        //Calibrate the ADC
        ADC_Calibrate();
}
void ADC_Calibrate()
{
        ADC_On();

        ADCON1bits.ADCAL = 1; //Calibrate on next conversion
        //Start conversion and wait
        ADC_GO = 1;
        while(ADC_BUSY) ;
        ADCON1bits.ADCAL = 0; //Calibrate on next conversion

        ADC_Off();
}
void ADC_ISROn()
{
        PIE1bits.ADIE = 1;
        PIR1bits.ADIF = 0;
}
void ADC_ISROff()
{
        PIE1bits.ADIE = 0;
        PIR1bits.ADIF = 0;
}
void ADC_On()
{
        ADCON0bits.ADON = ON;
        PIR1bits.ADIF = 0;

#ifdef ADCISR
        PIE1bits.ADIE = ON;
#endif
}
void ADC_Off()
{
        ADCON0bits.ADON = OFF;
        PIR1bits.ADIF = 0;
        PIE1bits.ADIE = OFF;
}

void ADC_Sequence(ADCPtr pItemA, ADCPtr pItemB)
{
        ifnull(pItemA)
        return;
        ifnull(pItemB)
        return;

        //Setup sequence
        pItemA->mNext = pItemB;
        pItemB->mNext = 0;
}


void ADC_Start(ADCPtr pInput)
{
        //Cannot sample if already sampling
        if (ADC_BUSY)
                return;

#ifdef ADCISR
        lCurrent = pInput;
        ADC_Off();
        ADC_SetChannel(pInput->mChannel);
        ADC_On();
        ADC_GO = 1;
#else
        loop()
        {
                ADC_Off();
                ADC_SetChannel(pInput->mChannel);
                ADC_On();

                //Start conversion and wait
                ADC_GO = 1;
                while(ADC_BUSY) ;

                //Save the result
                pInput->mValue = (ADRESH << 8) | ADRESL;

                //End the sequence
                if (pInput->mNext == 0)
                        break;

                //Continue the sequence
                pInput = pInput->mNext;
        }
        ADC_Off();
#endif
}
void ADC_SetupIO(eADC_Channel pChannel)
{
        UINT8 MASK = ~(1 << pChannel);
        ANCON0 &= MASK;
}
void ADC_SetChannel(eADC_Channel pChannel)
{
        ADCON0bits.CHS = (UINT8)pChannel;
}
void ADC_ClockDivision(UINT8 pDivide)
{
        UINT8 reg = 0;
        bool unfound = true;
        while (unfound)
                switch (pDivide)
                {
                case 2:
                        reg = 0;
                        unfound = false;
                        break;
                case 4:
                        reg = 0b100;
                        unfound = false;
                        break;
                case 8:
                        reg = 0b001;
                        unfound = false;
                        break;
                case 16:
                        reg = 0b101;
                        unfound = false;
                        break;
                case 32:
                        reg = 0b010;
                        unfound = false;
                        break;
                case 64:
                        reg = 0b110;
                        unfound = false;
                        break;
                default:
                        if (pDivide > 2)
                                pDivide--;
                        else
                                pDivide = 2;
                };

        ADCON1bits.ADCS = reg;
}
void ADC_ConversionTime(UINT8 pCount)
{
        if (pCount == 10)
                pCount -= 2;
        else if (pCount == 14)
                pCount -= 2;
        else if (pCount == 18)
                pCount -= 2;

        pCount <<= 1;
        ADCON1bits.ACQT = pCount;
}

void ADC_ISR()
{
        //Save the value
        lCurrent->mValue = (ADRESH << 8) | ADRESL;

        //Continue the conversion
        if (lCurrent->mNext)
        {
                ADC_Off();
                lCurrent = lCurrent->mNext;
                ADC_SetChannel(lCurrent->mChannel);
                ADC_On();

                //Start conversion and wait
                ADC_GO = 1;
        }
        else//End the sequence
        {
                ADC_Off();
                Event_ADCSequenceComplete(0);
        }
}

UINT8 ADC_Sample()
{
        UINT8 out = lCurrent->mValue;
#ifdef ADCISR
        ADC_ISROff();
#endif

        ADC_Off();
        ADC_SetChannel(lCurrent->mChannel);
        ADC_On();

        //Start conversion and wait
        ADC_GO = 1;
        while(ADC_BUSY) ;

        //Save the result
        out = ADRESL;

#ifdef ADCISR
        ADC_ISROn();
#endif
        return out;
}

float ADC_Voltage(ADCPtr pInput)
{
        const float max = 1024;
        const float ref = (ADCCALMAX-ADCCALMIN);
        float output = pInput->mValue;

        output /= max;
        output *= ref;

        return output + ADCCALMIN;
}

UINT8 rand()
{
        static UINT8 screw;
        UINT8 result = 0;
        UINT8 x;

        //Randomly generate all the bits
        for (x = 0; x<8; x++)
        {
                result <<= 1;
                result |= ADC_Sample() & 1;
        }
        result ^= screw;
        screw <<= 1;
        screw ^= result;
        return result;
}

UINT8 rand_between(UINT8 pValA, UINT8 pValB)
{
        if (pValB > pValA)
                swap(&pValA, &pValB);

        UINT8 range = pValA - pValB + 1;
        UINT32 rando = rand();
        return ((rando * range + 128) / 255) % range + pValB;
}
