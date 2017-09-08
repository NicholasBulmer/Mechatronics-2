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

void main() {
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

    INT16 distanceTotal = 0;
    INT16 angleTotal = 0;

    loop() {
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
            if(HMIBoard.mUp.mGetState()){
                int dist = 0;
                irobot_move_straight(200);
                while(dist<5000){
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
}
