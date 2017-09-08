/* 
 * File:   main.c
 * Author: User
 *
 * Created on 13 September 2016, 12:03 PM
 */
#pragma config XINST=OFF

#include <pic18fregs.h>
#include <pic18f65j50.h>
#include "Types.h"
#include "Port.h"

/*
 * 
 */
void main()
{
    UINT16 count;
    Port PortC;
    
    Port_Init(&PortC, ePortC);
    Port_SetPinType(&PortC, eP0 ,eTypeOutputPushPull);
    
    loop()
    {
	count = 1000;
	while(count--);
	Port_SetPin(&PortC, eP0, !Port_GetPin(&PortC, eP0));
    }
}

void highInterrupt(void)    __interrupt(1){}
void lowInterrupt(void)     __interrupt(2){}