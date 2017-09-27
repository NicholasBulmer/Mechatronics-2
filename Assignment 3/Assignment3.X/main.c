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
 *              Tanya Nassir
 *
 * MX2:         Assignment 2
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
#include <math.h>

#define DEFAULT_SPEED       250 //mms^-1
#define MAZE_CENTRE         550 //mm
#define CELL_LENGTH         1000 //mm
#define DISTANCE_NO_WALL    800 //mm
#define ANGLE_WALL_FOLLOW   72 //degrees; 90 degrees means the sensor is perp. to the wall (dont want that,)
#define INVERSE_STEP_AMOUNT 2 //half step

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

//Variable and Fucntion Declarations
////////////////////////////////////////////////////////////////////////////////

Motor Stepper;
extern ADC ADC_AN0;

extern INT16
	iRDistance,																	//Distance in mm since last call/update
	distanceTotal,
	iRAngle,																	//Angle in degrees since last call/update
	angleTotal;

extern UINT8 
	iRBumpDrop,
	iRVirtualWall;

INT16 IRValue;
INT16 localSensorAngle = 0;
INT16 cardinalAngle = 0;
bool stepperMoved = 0;
bool rightWall;

// Global vars
int bearing = 2; // value of 1 to 4. 1 is North, 2 is East, 3 is South, 4 is West.
int xPos = 9;
int yPos = 2;
int xPosNext;
int yPosNext;
int gridSize = 100;
int currentPos;
char currentPosChar;

// Prototype functions
void update_IR_distance(void);
UINT16 get_apparentDistance(UINT16 distanceDesired);
void follow_wall(INT16 followSpeed, UINT16 apparentDistance);
void update_display1(void);
void update_SSD(INT16 renderSSD);

void move_stepper_to(INT16 moveStepperTo);
void move_stepper_neutral(void);
INT16 degrees_to_steps(INT16 stepperDegrees);

void irobot_centralise(void);
void irobot_move_to(INT16 moveToDistance, INT16 moveToSpeed);
void irobot_move_to_straight(INT16 moveToDistance, INT16 moveToSpeed);
void irobot_rotate_to(INT16 rotateToAngle, INT16 rotateToSpeed);
void irobot_move_cell(void);

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

//Function Definitions - will not work in an external library cause MXK is fucked
////////////////////////////////////////////////////////////////////////////////

void update_IR_distance(void){
    extern ADC ADC_AN0;
    float IRCumulative = 0;
    UINT8 IRSamples = 20; //20 samples
	for (UINT16 i = 0; i <= IRSamples; i++){
		ADC_Start(&ADC_AN0);
		IRCumulative += (590 / ADC_Voltage(&ADC_AN0)); //get val in mm
	}
    //returns millimeters
    IRValue = ((int)IRCumulative)/IRSamples;
}

//Use millimetres and use this as an input parameter for correct_distance()
UINT16 get_apparentDistance(UINT16 distanceDesired){
	return (distanceDesired/(cos((90-ANGLE_WALL_FOLLOW)*(M_PI/180)))); 
}

//This function will move the robot indefinitely until irobot_stop_motion(0);
void follow_wall(INT16 followSpeed, UINT16 apparentDistance){
    UINT16 i, _d1=apparentDistance-80, _d2=apparentDistance-30, _d3=apparentDistance+30;  
    
    //Check if the stepper has checked that there is a wall to actually follow
    if (!stepperMoved){
        move_stepper_neutral();
        if (rightWall){
            move_stepper_to(ANGLE_WALL_FOLLOW);
        }
        else{
            move_stepper_to(-ANGLE_WALL_FOLLOW);
        }
        stepperMoved = 1;
    }
    
    update_IR_distance();
    
    //Bang-bang in all its glory
    (rightWall) ? (i = -1) : (i = 1);
    if 		(IRValue < _d1)	{irobot_move(0, followSpeed, -500*i);} 	//Very close                        
    else if (IRValue < _d2)	{irobot_move(0, followSpeed, -1000*i);}	//Close
    else if (IRValue > _d3)	{irobot_move(0, followSpeed, 750*i);} 	//Slightly far away
    else	{irobot_move(0, followSpeed, 1000*i);}                  //Default condition
    
	//If the walls disappears while moving, use the other wall as a reference
	if (IRValue > DISTANCE_NO_WALL){rightWall = !rightWall; stepperMoved = 0;}
}

//Checks to see if there is a wall directly infront of it, if there is it moves 500mm away from it
void irobot_centralise(void){
    INT16 differenceDistance;
    update_IR_distance();
    if (IRValue < 800){
    differenceDistance = IRValue - 500;
    (differenceDistance > 0) ? 
    irobot_move_to_straight(differenceDistance, DEFAULT_SPEED) :
    irobot_move_to_straight(differenceDistance, -DEFAULT_SPEED);
    }
}

//update the LCD with possible debug info
void update_display1(void){
	if (MXK_SwitchTo(eMXK_HMI)) {
	printf("%c", ENDOFTEXT);
	printf("Var1: %d\n", angleTotal);
	Console_Render();
	if (MXK_Release())
		MXK_Dequeue();}
}

//Send digits to the SSD
void update_SSD(INT16 renderSSD){
	if (MXK_SwitchTo(eMXK_HMI)) {
    HMI_SetNumber(renderSSD);
    HMI_Render();
	if (MXK_Release())
		MXK_Dequeue();}
    return;
}

//convert degrees to a step amount for the irobot CHECK DEFINITIONS FOR STEP VARIABLE
INT16 degrees_to_steps(INT16 stepperDegrees){
    return (int)((INVERSE_STEP_AMOUNT*stepperDegrees)/1.8);
}

//Move stepper in DEGREES: -ve is CCW rotation, +ve is CW rotation
void move_stepper_to(INT16 moveStepperTo){
    localSensorAngle += moveStepperTo;
    if (localSensorAngle >= 360 || localSensorAngle <= -360){localSensorAngle = 0;}
        
	if (MXK_BlockSwitchTo(eMXK_Motor)) {
		Motor_Move(&Stepper, degrees_to_steps(moveStepperTo));
		if (MXK_Release())
		MXK_Dequeue();} 
    //wait for the stepper to get to its position before calling something else
    delay_ms(75);   
}

//move the stepper to the forward direction of the irobot
void move_stepper_neutral(void){
    move_stepper_to(-localSensorAngle);
}

void irobot_move_to(INT16 moveToDistance, INT16 moveToSpeed){
    INT16 reverseDistance;
    distanceTotal = 0;
    iRDistance = 0; iRVirtualWall = 0;
	rightWall = 1; stepperMoved = 0;
    while ((distanceTotal <= moveToDistance) && !iRVirtualWall){
        follow_wall(moveToSpeed, get_apparentDistance(MAZE_CENTRE));
        update_distance();
        distanceTotal += iRDistance; 
        update_virtual_wall();
    }
    irobot_stop_motion(0);
    reverseDistance = -distanceTotal;
    //if a v wall is detected, move back to the center from the cell in which it came
    if (iRVirtualWall){
        irobot_song_play(0);
        move_stepper_neutral();
        delay_ms(200);
        irobot_move_to_straight(reverseDistance, -DEFAULT_SPEED);
    }
    stepperMoved = 0;
    irobot_stop_motion(0);
}

void irobot_move_to_straight(INT16 moveToDistance, INT16 moveToSpeed){
    distanceTotal = 0;
    iRDistance = 0;
    irobot_move_straight(moveToSpeed);
    if (moveToDistance > 0){
        while (distanceTotal <= moveToDistance){
            update_distance();
            distanceTotal += iRDistance;              
        }
    }
    else{
        while (distanceTotal >= moveToDistance){
            update_distance();
            distanceTotal += iRDistance;
        }
    }
    irobot_stop_motion(0);
}

//moves a distance of one cell in the current forward facing direction of the robot
void irobot_move_cell(void){
    irobot_move_to(CELL_LENGTH, DEFAULT_SPEED);
    move_stepper_neutral();
    irobot_centralise();
}

//-ve is CCW rotation, +ve is CW rotation
void irobot_rotate_to(INT16 rotateToAngle, INT16 rotateToSpeed){
    angleTotal = 0;
    iRAngle = 0;
    
    irobot_rotate_continuous(rotateToAngle, rotateToSpeed);
    
    if (rotateToAngle > 0){
        while (angleTotal >= -rotateToAngle) {
            update_angle();
            angleTotal += iRAngle;
        }
    }
    else{
        while (angleTotal <= -rotateToAngle) {
            update_angle();
            angleTotal += iRAngle;
        }        
    }
    irobot_stop_motion(0);
}

// Basic movement functions for turning and going straight.
void rotateCW(){
        // Rotate 90 degrees clockwise
        irobot_rotate_to(-85, DEFAULT_SPEED);
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
        irobot_rotate_to(85, DEFAULT_SPEED);
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
                        currentPos = mazeConsole[i][j];
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

void addVirtualWall(int i, int j){
    maze[i][j] = 155;
}

void init(){
//Program Initialisation
////////////////////////////////////////////////////////////////////////////////

    //Init MXK Pins
    MXK_Init();
	ISR_Enable();

    //Init HMI
    if (MXK_BlockSwitchTo(eMXK_HMI)) {
        Console_Init();
        HMI_Init();
        LCD_Init();
        if (MXK_Release())
            MXK_Dequeue();
    }
	
	//Init Motor
	if (MXK_BlockSwitchTo(eMXK_Motor)) {
		Motor_Init(&Stepper, MXK_MOTOR);
		if (MXK_Release())
			MXK_Dequeue();
	}
	
	//Init IR
	ADC_Init(&ADC_AN0, eADC_Ch0);
	float ADC_Voltage(ADCPtr plnput);
	ADC_Start(&ADC_AN0);
	
	//Init PIC EUSART and iRobot Comms
    eusart_init();                                                              
    irobot_init();   

    
    irobot_init_song_0();
}

void main(){
    init();	
    loop(){
        update_IR_distance();
        update_SSD(IRValue);
    }
}