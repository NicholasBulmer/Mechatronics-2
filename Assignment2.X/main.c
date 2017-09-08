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

//Global Variables
INT16 distanceTotal = 0;
INT16 angleTotal = 0;
int dip;
int mode;
int selectedMode1;
int selectedMode2;
int selectedMode3;
int selectedMode4;

// Prototype Functions
void init();
void getMode();
void mode1();
void mode2();
void mode3();
void mode4();

// Initialisation Function
void init(){
        //Init MXK Pins
        MXK_Init();

        //Init HMI
        if (MXK_BlockSwitchTo(eMXK_HMI)) {
                Console_Init();
                HMI_Init();
                LCD_Init();
                if (MXK_Release())
                        MXK_Dequeue();
        }
        eusart_init(); //Init PIC EUSART comms
        irobot_init(); //Init iRobot settings

        irobot_led_power_on(0xA); //Power LED to orange
        irobot_init_song_0(); //Init the song
        delay_ms(20);

        //irobot_move_straight(200);
        irobot_rotate(0, 90, 200); //Rotate the robot at 200mm/s

        distanceTotal = 0;
        angleTotal = 0;
}

// Read button press and determine mode
void getMode(){
        // Read the button states and store them in corresponding variables
        selectedMode1 = HMIBoard.mUp.mGetState();
        selectedMode2 = HMIBoard.mRight.mGetState();
        selectedMode3 = HMIBoard.mDown.mGetState();
        selectedMode4 = HMIBoard.mLeft.mGetState();
        // Determine if the specified mode is valid ie no buttons pressed or two buttons pressed
        if((selectedMode1 + selectedMode2 + selectedMode3 + selectedMode4) != 1) {
                mode = 0;
        }
        // Assign mode
        else if (selectedMode1 == 1) {
                mode = 1;
        }
        else if (selectedMode2 == 1) {
                mode = 2;
        }
        else if (selectedMode3 == 1) {
                mode = 3;
        }
        else if (selectedMode4 == 1) {
                mode = 4;
        }
}

// Mode 1
void mode1(){
        //Fill
}

// Mode 2
void mode2(){
        update_bump_and_cliff(); //Fetch bump status from iRobot
        update_distance(); //Fetch distance from iRobot
        update_angle(); //Fetch angle from iRobot
        //distanceTotal += iRDistance;
        angleTotal += iRAngle; //Update the local angle count

        if (iRBumpLeft || iRBumpRight) { //Stop robot and play sound when bumper is triggered
                irobot_song_play(0);
                irobot_stop_motion(0);
        }
        if (angleTotal > 90) { //Wait until 90degrees has been reached
                irobot_stop_motion(0); //Stop robot when reached
        }
        HMI_Poll();
        if (MXK_SwitchTo(eMXK_HMI)) {
                printf("%c", ENDOFTEXT);
                printf("Total Distance:%u\nLeft Bump:%u\nRight Bump:%u\n", distanceTotal, iRBumpLeft, iRBumpRight);
                Console_Render();
                if(HMIBoard.mUp.mGetState()) {
                        int dist = 0;
                        irobot_move_straight(200);
                        while(dist<5000) {
                                update_distance();
                                dist += iRDistance;
                                printf("%c",ENDOFTEXT);
                                printf("Distance: %d\n",dist);
                                Console_Render();
                        }
                        irobot_stop_motion(0);
                }
                if (MXK_Release())
                        MXK_Dequeue();
        }
}

// Mode 3
void mode3(){
        //Fill
}

// Mode 4
void mode4(){
        //Fill
}

// Main Loop
void main() {
        init();
        loop() {
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
                }

        }
}
