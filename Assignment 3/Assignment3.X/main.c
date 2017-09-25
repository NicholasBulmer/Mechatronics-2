/* TODO:
 * Please use FUNCTIONS. Makes life so much easier for everyone.
 * Please comment your functions too as well as the indivudual lines of code.
 * This is just good practice.
 */

/*
 * File:        main.c
 *
 * Author(s):   Chad Aryana
 *              Jamin Early
 *              Matt Woods
 *              Nick Bulmer
 *              Tania Nassir
 *
 * MX2:         Assignment 3
 */

// #include <xc.h>
// #include <pic18f67j50.h>
// #include "ProcessorConfig.h"
// #include "ISR.h"
// #include "MXK.h"
// #include "Config.h"
// #include "Functions.h"
// #include "Colours.h"
// #include "Console.h"
#include <stdio.h>
// #include "Motor.h"
// #include "LCD.h"
// #include "LED.h"
// #include "HMI.h"
// #include "iRobotSerial.h"
// #include "ADC.h"

bool maze[9][11] = {
        {1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,1,0,1,0,0,0,1},
        {1,0,1,1,1,0,1,1,1,0,1},
        {1,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,0,1,1,1,0,1},
        {1,0,0,0,1,0,1,0,1,0,1},
        {1,0,1,0,1,0,1,1,1,0,1},
        {1,0,1,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1},
};

int bearing = 2;
int xPos = 9;
int yPos = 2;

void rotateCW();
void rotateCCW();
void moveStraight();

void main(){

}
