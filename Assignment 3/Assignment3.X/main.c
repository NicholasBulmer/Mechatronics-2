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
 * 0 - Unexplored
 * 1 - Wall
 * 2 - Current Position
 * 3 - Explored
 */
int maze[9][11] = {
        {1,1,1,1,1,1,1,1,1,1,1},
        {1,0,0,0,1,0,1,2,0,0,1},
        {1,0,1,1,1,0,1,1,1,0,1},
        {1,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,0,1,1,1,0,1},
        {1,0,0,0,1,0,1,0,1,0,1},
        {1,0,1,0,1,0,1,1,1,0,1},
        {1,0,1,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1},
};

// Global vars
int bearing = 2;
int xPos = 9;
int yPos = 2;
int gridSize = 100;

void rotateCW();
void rotateCCW();
void moveStraight();

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
        irobot_move_straight(100);
        irobot_stop_motion(0);

        // update array and current positioning
        maze[xPos][yPos] = 3;
        switch (bearing) {
        case 1:
                yPos -= 2;
        case 2:
                xPos += 2;
        case 3:
                yPos += 2;
        case 4:
                xPos -= 2;
        }
        if (!(map[xPos][yPos] > 2)) {
                map[xPos][yPos] = 2;
        }
}

void main(){

}
