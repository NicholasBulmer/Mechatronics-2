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

#include <xc.h>
#include <pic18f67j50.h>
#include "ProcessorConfig.h"
#include "ISR.h"
#include "MXK.h"
#include "Config.h"
#include "Functions.h"
#include "Colours.h"
#include "Console.h"
#include <stdio.h>
#include "Motor.h"
#include "LCD.h"
#include "LED.h"
#include "HMI.h"
#include "iRobotSerial.h"
#include "ADC.h"

/* A 2D array is used to store information regarding the maze.
 * 155 - Wall
 * 154 - Unexplored
 * 1 to 153 - Steps from home
 */
int maze[9][11] = {
        {155,155,155,155,155,155,155,155,155,155,155},
        {155,154,154,154,155,154,155,0,154,154,155},
        {155,154,155,155,155,154,155,155,155,154,155},
        {155,154,154,154,154,154,154,154,154,154,155},
        {155,155,155,155,155,154,155,155,155,154,155},
        {155,154,154,154,155,154,155,154,154,154,155},
        {155,154,155,154,155,154,155,155,155,154,155},
        {155,154,155,154,154,154,154,154,154,154,155},
        {155,155,155,155,155,155,155,155,155,155,155},
};

char mazeConsole[9][11];

// Global vars
int bearing = 2; // value of 1 to 4. 1 is North, 2 is East, 3 is South, 4 is West.
int xPos = 9;
int yPos = 2;
int xPosNext;
int yPosNext;
int gridSize = 100;
int currentPos;
char currentPosChar;
ADC ADC_AN0;
Motor Stepper;

// Prototype functions
void rotateCW();
void rotateCCW();
void moveStraight();
void rotateNorth();
void rotateSouth();
void rotateWest();
void rotateEast();
bool safeToMove();
void printToConsole();
void addVirtualWall(int i, int j);
void init();

// Basic movement functions for turning and going straight.
void rotateCW(){
        // Rotate 90 degrees clockwise
        irobot_rotate(0, -68, 200);
        irobot_stop_motion(0);
        delay_ms(100);

        // Update bearing
        bearing++;
        if(bearing == 5) {
                bearing = 1;
        }
}

void rotateCCW(){
        // Rotate 90 degrees counter-clockwise
        irobot_rotate(0, 68, 200);
        irobot_stop_motion(0);
        delay_ms(100);

        // Update bearing
        bearing--;
        if(bearing == 0) {
                bearing = 4;
        }
}

void moveStraight(){
        // move forward
        irobot_move_straight(gridSize);
        irobot_stop_motion(0);

        // update array and current positioning
        int posValue = maze[xPos][yPos];
        switch (bearing) {
        case 1:
                yPos -= 2;
                break;
        case 2:
                xPos += 2;
                break;
        case 3:
                yPos += 2;
                break;
        case 4:
                xPos -= 2;
                break;
        }
        if (posValue < maze[xPos][yPos]) {
                maze[xPos][yPos] = posValue++;
        }
}

void rotateNorth(){
        switch (bearing) {
        case 1:
                break;
        case 2:
                rotateCCW();
                break;
        case 3:
                rotateCCW();
                rotateCCW();
                break;
        case 4:
                rotateCW();
                break;
        }
}

void rotateSouth(){
        switch (bearing) {
        case 1:
                rotateCCW();
                rotateCCW();
                break;
        case 2:
                rotateCW();
                break;
        case 3:
                break;
        case 4:
                rotateCCW();
                break;
        }
}

void rotateWest(){
        switch (bearing) {
        case 1:
                rotateCCW();
                break;
        case 2:
                rotateCW();
                rotateCW();
                break;
        case 3:
                rotateCW();
                break;
        case 4:
                break;
        }
}

void rotateEast(){
        switch (bearing) {
        case 1:
                rotateCW();
                break;
        case 2:
                break;
        case 3:
                rotateCCW();
                break;
        case 4:
                rotateCCW();
                rotateCCW();
                break;
        }
}

// Checks is the next square is safe to move into the square you are facing.
bool safeToMove(){
        xPosNext = xPos;
        yPosNext = yPos;
        switch (bearing) {
        case 1:
                yPosNext--;
                break;
        case 2:
                xPosNext++;
                break;
        case 3:
                yPosNext++;
                break;
        case 4:
                xPosNext--;
                break;
        }
        if(yPosNext <= 0 || yPosNext >= 11 || xPosNext <= 0 || xPosNext >= 9 || maze[xPosNext][yPosNext] == 155) {
                return false;
        }
        switch (bearing) {
        case 1:
                yPosNext--;
                break;
        case 2:
                xPosNext++;
                break;
        case 3:
                yPosNext++;
                break;
        case 4:
                xPosNext--;
                break;
        }
        if(yPosNext <= 0 || yPosNext >= 11 || xPosNext <= 0 || xPosNext >= 9 || maze[xPosNext][yPosNext] == 155) {
                return false;
        }
        return true;
}

// Prints the current map to the LCD
void printToConsole(){
        printf("%c", ENDOFTEXT);
        // Prints maze to console
        for (int i = 1; i < 10; i++) {
                for (int j = 1;  j < 12; j++) {
                        currentPos = maze[i][j];
                        if (i == xPos && j == yPos) {
                                currentPosChar = '*';
                        }
                        else {
                                switch (currentPos) {
                                case 155:
                                        currentPosChar = 'X';
                                        break;
                                case 154:
                                        currentPosChar = ' ';
                                        break;
                                default:
                                        break;
                                }
                                if (currentPos >= 0 && currentPos < 154 ) {
                                        currentPosChar = currentPos + '0';
                                }
                        }
                        printf("%c", currentPosChar);
                }
                printf("\n");
        }
        if (MXK_SwitchTo(eMXK_HMI)) {
                Console_Render();
                if (MXK_Release())
                        MXK_Dequeue();
        }
}

// Adds a wall to the maze when a virtual wall is found.
void addVirtualWall(int i, int j){
        maze[i][j] = 155;
}

// Init function
void init(){
        //Init MXK Pins
        MXK_Init();

        //Enable Interupts
        ISR_Enable();

        //Init HMI
        if (MXK_BlockSwitchTo(eMXK_HMI)) {
                Console_Init();
                HMI_Init();
                LCD_Init();
                if (MXK_Release())
                        MXK_Dequeue();
        }

        //Init Stepper Motor
        if (MXK_BlockSwitchTo(eMXK_Motor)) {
                Motor_Init(&Stepper, MXK_MOTOR);
                if (MXK_Release())
                        MXK_Dequeue();
        }

        //Init Sensor
        ADC_Init(&ADC_AN0, eADC_Ch0);
        float ADC_Voltage(ADCPtr plnput);
        ADC_Start(&ADC_AN0);

        //Init iRobot
        eusart_init(); //Init PIC EUSART comms
        irobot_init(); //Init iRobot settings
        irobot_led_power_on(0xA); //Power LED to orange
        irobot_init_song_0(); //Init the song
        delay_ms(20);
}

// Main loop
void main(){
        init();
        loop(){
                // do shit
        }
}
