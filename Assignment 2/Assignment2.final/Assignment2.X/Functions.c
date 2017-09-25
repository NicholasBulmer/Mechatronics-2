#include "Functions.h"
#include <stdio.h>
#include "Types.h"
#include "Button.h"
#include "Motor.h"
#include "HMI.h"
#include "LCD.h"
#include "LED.h"
#include "Console.h"
#include "MXK.h"
#include "ISR.h"
#include "ADC.h"
#include "Config.h"
#include "Timer0.h"

void FunctInitButton() {
    //Configures the test button press event to call the 
    //Event_TestButton function when a change in state occurs
    Button_Init(&TestButton, DEBOUNCE, MXK_InitTestButton, MXK_TestButton, Event_TestButton);

    //Configures the DIP buttons press event to call the
    //Event_DIPSwitches function when a value change occurs
    Button_Init(&DIPSwitch, DEBOUNCE, MXK_InitDIPSwitch, MXK_DIPSwitch, Event_DIPSwitch);
}

ADC ADC_AN0;
ADC ADC_AN1;
ADC ADC_AN2;
ADC ADC_AN3;

void FunctInitADC() {
    //Initialize channels
    ADC_Init(&ADC_AN0, eADC_Ch0);
    ADC_Init(&ADC_AN1, eADC_Ch1);
    ADC_Init(&ADC_AN2, eADC_Ch2);
    ADC_Init(&ADC_AN3, eADC_Ch3);

    //Initialize sequence
    ADC_Sequence(&ADC_AN0, &ADC_AN1);
    ADC_Sequence(&ADC_AN1, &ADC_AN2);
    ADC_Sequence(&ADC_AN2, &ADC_AN3);
}

void FunctInitUSB() {
    USB_Init();
}
////////////////////////////////////////////////////////////////////////////////

void FunctUSB() {
    USB_Poll();
}

void FunctButton() {
    MXK_Poll();
}

void FunctADC() {
    ADC_Start(&ADC_AN0);
}
