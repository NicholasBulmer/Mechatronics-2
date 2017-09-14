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

//Global Variables
INT16 distanceTotal = 0;
INT16 angleTotal = 0;
int dip;
int mode = 0;
int StepRotate = 0; //logs steps rotated
int MinDist = 1000; //logs minimum distance
int Stepstomin = 0; //logs steps required to min value
int IRValue = 0; //logs current IR Value
int TimerX = 8; //while loop delay
int angleToClosestWall = 0;
int dist = 0;
Motor Stepper;
ADC ADC_AN0;

// Prototype Functions
void init();
void getMode();
void mode1();
void mode2();
void mode3();
void mode4();
void move_and_rotate();
void findClosestWall();
void safeToGo();

// Initialisation Function
void init() {
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

        eusart_init(); //Init PIC EUSART comms
        irobot_init(); //Init iRobot settings

        irobot_led_power_on(0xA); //Power LED to orange
        irobot_init_song_0(); //Init the song
        delay_ms(20);

        //    irobot_move_straight(200);
        //    irobot_rotate(0, 90, 200); //Rotate the robot at 200mm/s
}

// Read button press and determine mode
void getMode() {
        HMI_Poll();
        mode = 0;
        if (HMIBoard.mUp.mGetState()) {
                mode = 1;
        }
        if (HMIBoard.mRight.mGetState()) {
                mode = 2;
        }
        if (HMIBoard.mDown.mGetState()) {
                mode = 3;
        }
        if (HMIBoard.mLeft.mGetState()) {
                mode = 4;
        }
}

void safeToGo(){
        update_bump_and_cliff(); //Fetch bump status from iRobot
        update_distance(); //Fetch distance from iRobot
        update_angle(); //Fetch angle from iRobot
        if (iRBumpLeft || iRBumpRight) { //Stop robot and play sound when bumper is triggered
                irobot_song_play(0);
                irobot_stop_motion(0);
        }
        if (angleTotal > 83) { //Wait until 90degrees has been reached
                irobot_stop_motion(0); //Stop robot when reached
        }
        HMI_Poll();
}

// Function for mode 3
void move_and_rotate(){
        dist = 0;
        irobot_move_straight(100);
        while (dist < 1000) {
                update_distance();
                dist += iRDistance;
        }
        irobot_stop_motion(0);
        delay_ms(100);
        irobot_rotate(0, 67, 200);
        delay_ms(100);
}

// Finds the closest wall for Mode 4
void findClosestWall(){
        StepRotate--;
        ADC_Start(&ADC_AN0);
        IRValue = (59 / ADC_Voltage(&ADC_AN0));
        if (MXK_SwitchTo(eMXK_HMI)) {
                HMI_SetNumber(IRValue);
                HMI_Render();
                if (MXK_Release())
                        MXK_Dequeue();
        }
        if (IRValue < MinDist) {
                MinDist = IRValue;
                Stepstomin = StepRotate;
        }
        if (MXK_SwitchTo(eMXK_Motor)) {
                Motor_Speed(&Stepper, HZ(50));
                Motor_Move(&Stepper, -1);
                if (MXK_Release())
                        MXK_Dequeue();
        }
        TimerX = 10;
        if (TimerX > 0) {
                while (TimerX > 0) {
                        ADC_Start(&ADC_AN0);
                        if (MXK_SwitchTo(eMXK_HMI)) {
                                HMI_SetNumber(IRValue);
                                HMI_Render();
                                if (MXK_Release())
                                        MXK_Dequeue();
                        }
                        IRValue = (59 / ADC_Voltage(&ADC_AN0));
                        TimerX--;
                }
        }
        angleToClosestWall = Stepstomin * 0.67;
        if (MXK_SwitchTo(eMXK_HMI)) {
                printf("%c", ENDOFTEXT);
                printf("Closest Wall:%u\nClosest Angle:%c\nLeft Bump:%u\nRightBump:%u\n", MinDist, angleToClosestWall, iRBumpLeft, iRBumpRight);
                Console_Render();
                if (MXK_Release())
                        MXK_Dequeue();
        }
}

// Mode 1
void mode1() {
        safeToGo();
        if (MXK_SwitchTo(eMXK_HMI)) {
                printf("%c", ENDOFTEXT);
                printf("Total Distance:%u\nLeft Bump:%u\nRight Bump:%u\n", distanceTotal, iRBumpLeft, iRBumpRight);
                Console_Render();
                if (MXK_Release())
                        MXK_Dequeue();
        }
        StepRotate = 0; //logs steps rotated
        MinDist = 1000; //logs minimum distance
        Stepstomin = 0; //logs steps required to min value
        IRValue = 0; //logs current IR Value
        TimerX = 8; //while loop delay
        while (StepRotate < 400) {
                StepRotate++;
                ADC_Start(&ADC_AN0);
                IRValue = (59 / ADC_Voltage(&ADC_AN0));
                if (MXK_SwitchTo(eMXK_HMI)) {
                        HMI_SetNumber(IRValue);
                        HMI_Render();
                        if (MXK_Release())
                                MXK_Dequeue();
                }
                if (IRValue < MinDist) {
                        MinDist = IRValue;
                        Stepstomin = StepRotate;
                }
                if (MXK_SwitchTo(eMXK_Motor)) {
                        Motor_Speed(&Stepper, HZ(50));
                        Motor_Move(&Stepper, 1);
                        if (MXK_Release())
                                MXK_Dequeue();
                }
                TimerX = 10;
                if (TimerX > 0) {
                        while (TimerX > 0) {
                                ADC_Start(&ADC_AN0);
                                if (MXK_SwitchTo(eMXK_HMI)) {
                                        HMI_SetNumber(IRValue);
                                        HMI_Render();
                                        if (MXK_Release())
                                                MXK_Dequeue();
                                }
                                IRValue = (59 / ADC_Voltage(&ADC_AN0));
                                TimerX--;
                        }
                }
        }
        if (MXK_SwitchTo(eMXK_Motor)) {
                Motor_Speed(&Stepper, HZ(50));
                int moveto = 400 - Stepstomin;
                //Motor_Move(&Stepper, (400-Stepstomin));
                Motor_Move(&Stepper, (-moveto));
                if (MXK_Release())
                        MXK_Dequeue();
        }
        while (Stepper.mDelta > 0) {
                ADC_Start(&ADC_AN0);
                if (MXK_SwitchTo(eMXK_HMI)) {
                        HMI_SetNumber(IRValue);
                        HMI_Render();
                        if (MXK_Release())
                                MXK_Dequeue();
                }
                IRValue = (59 / ADC_Voltage(&ADC_AN0));
        }
}

// Mode 2
void mode2() {
        safeToGo();
        if (MXK_SwitchTo(eMXK_HMI)) {
                printf("%c", ENDOFTEXT);
                printf("Total Distance:%u\nLeft Bump:%u\nRight Bump:%u\n", distanceTotal, iRBumpLeft, iRBumpRight);
                Console_Render();

                int dist = 0;
                irobot_move_straight(200);
                while (dist < 5000) {
                        update_distance();
                        dist += iRDistance;
                        printf("%c", ENDOFTEXT);
                        printf("Distance: %d\n", dist);
                        Console_Render();
                }
                irobot_stop_motion(0);

                if (MXK_Release())
                        MXK_Dequeue();
        }
}

// Mode 3
void mode3() {
        safeToGo();
        move_and_rotate();
        move_and_rotate();
        move_and_rotate();
        move_and_rotate();
}

// Mode 4
void mode4() {
        safeToGo();
        StepRotate = 401;     //logs steps rotated
        MinDist = 1000;     //logs minimum distance
        Stepstomin = 0;     //logs steps required to min value
        angleToClosestWall = 1000;     //Convert to a angle out of 360
        IRValue = 0;     //logs current IR Value
        TimerX = 8;     //while loop delay
        while (StepRotate > 0) {
                findClosestWall();
        }
        irobot_rotate(0, angleToClosestWall - 67, 200);     // Rotate perpendicular to the closest wall
        while (!iRBumpLeft && !iRBumpRight && !iRDropRight && !iRDropLeft) {
                irobot_move_straight(200); //Go straight until a bumper is triggered
                update_bump_and_cliff();
        }
        irobot_song_play(0); //Play a song
        irobot_stop_motion(0);     //Stop
}

// Main Loop
void main() {

        init();

        loop() {
                getMode();
                switch (mode) {
                case 1:
                        mode1();
                        break;
                case 2:
                        mode2();
                        break;
                case 3:
                        mode3();
                        break;
                case 4:
                        mode4();
                        break;
                default:
                        if (MXK_SwitchTo(eMXK_HMI)) {
                                printf("%c", ENDOFTEXT);
                                printf("Please select mode.\n");
                                printf("                   \n");
                                printf("                   \n");
                                printf("                   \n");
                                printf("                   \n");
                                Console_Render();
                                HMI_Poll();
                                if (MXK_Release())
                                        MXK_Dequeue();
                        }
                }
        }
}
