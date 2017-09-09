#include "Timer0.h"
#include "LED.h"

#define TMR0ON_ON       1
#define TMR0ON_OFF      0
#define T08BIT_8BIT     1
#define T08BIT_16BIT    0
#define INC_HL          1
#define INC_LH          0
#define PSA_PRESCALE    0
#define PSA_NOPRESCALE  1
#define T0CS_T0CLK      1
#define T0CS_CLKO       0
#define ENABLE		1
#define DISABLE		0

static UINT16	    COUNTER;
static UINT8        INDEX = 0;

void Timer0_Clear()
{
    TMR0		= COUNTER;
    INTCONbits.TMR0IF	= 0;
}
void Timer0_Init(UINT32 pFrequency)
{
    UINT32 pCPUClock = CPUCLOCK/8;
    ////////////////////////////////////////////////////////////////////////////
    static const UINT16 PRESCALE[] = {2, 4, 8, 16, 32, 64 ,128, 256};
    ////////////////////////////////////////////////////////////////////////////
    static UINT8        PRE = 0;
    static UINT32       DIV = 0;
    ////////////////////////////////////////////////////////////////////////////
    UINT32 DIVIDE;

    ////////////////////////////////////////////////////////////////////////////
    T0CONbits.TMR0ON	=   OFF;
    if (pFrequency == 0)
	return;
    
    T0CONbits.PSA       =   PSA_PRESCALE;
    T0CONbits.T08BIT    =   T08BIT_16BIT;
    T0CONbits.T0CS      =   T0CS_CLKO;
    T0CONbits.T0SE      =   INC_LH;
    ////////////////////////////////////////////////////////////////////////////
    DIVIDE		= pCPUClock / pFrequency;
    ////////////////////////////////////////////////////////////////////////////
    //Mask out the various sections of divide
    while ((DIVIDE/PRESCALE[INDEX]) > 0xFFFF)
    {
        INDEX ++;
        if (INDEX >= 3)
            break;
	
	//Frequency is impossible
	if (INDEX >= 8)
	    return;
    }
    ////////////////////////////////////////////////////////////////////////////
    //Clear flags, disable interrupts
    ////////////////////////////////////////////////////////////////////////////
    PRE = PRESCALE[INDEX];
    DIV = (DIVIDE-1);
    ////////////////////////////////////////////////////////////////////////////
    COUNTER = 0xFFFF-DIV/PRE;
    ///////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    Timer0_Clear();
    ////////////////////////////////////////////////////////////////////////////
    //Start the timer
    T0CONbits.TMR0ON = ON;
}

static Function gISR = 0;
void Timer0_Start(Function pFunction)
{
    gISR = pFunction;
    TMR0		= COUNTER;
    T0CONbits.T0PS	= INDEX;
    INTCONbits.TMR0IF	= 0;
    INTCONbits.TMR0IE	= ENABLE;
}
void Timer0_Restart()
{
    TMR0		= COUNTER;
    //T0CONbits.T0PS	= INDEX;
    INTCONbits.TMR0IE	= ENABLE;
}
void Timer0_Stop()
{
    INTCONbits.TMR0IE	= DISABLE;  
    INTCONbits.TMR0IF	= 0;
}
void Timer0_ISR()
{
    Timer0_Stop();
    
    //It is up to this function to re-enable the timer.
    if (gISR != 0)
	gISR();
}