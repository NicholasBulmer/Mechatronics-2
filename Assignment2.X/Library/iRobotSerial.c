/*
 * File:   iRobotSerial.c
 * Author: Chadwick Aryana
 *
 * MX2: iRobot Function Library (Source Code)
 */

#include <stdarg.h>
#include <stdbool.h>
#include <string.h>
#include <iRobotSerial.h>

//Macros
////////////////////////////////////////////////////////////////////////////////

#define ABS(x)     ((x) > 0 ? (x) : -(x))
#define HIGH_BYTE(x)   (((x)>>8) & 0xFF)
#define LOW_BYTE(x)   ((x) & 0xFF)
#define MOVE_HIGH(x)  ((x)<<8)

//Global Variables
////////////////////////////////////////////////////////////////////////////////

typedef struct {
								UINT16 HB, LB;
} splitShort;

splitShort iRDistanceSS, iRAngleSS;

INT16
								iRDistance,          //Distance in mm since last call/update
								iRAngle;          //Angle in degrees since last call/update

///The script stack is a global variable that is required for efficient handling
///and usage of the iRobots SCRIPT command. It stores in order (starting from
///index 0) the appropriate OPCodes and relevant data. The function that is used
///to send this data to the iRobot is "irobot_script_play()".

UINT8
								iRScriptStack [100],
								iRScriptIndex = 0,
								iRBumpDrop,
								iRWall,
								iRCliffL,
								iRCliffFL,
								iRCliffFR,
								iRCliffR,
								iRVirtualWall;

bool
								iRBumpRight,
								iRBumpLeft,
								iRDropRight,
								iRDropLeft,
								iRDropCaster;

//Sorting Functions
////////////////////////////////////////////////////////////////////////////////

UINT8 get_packet_size(UINT8 packetID){           //Return size of packet function
								switch (packetID) {
								case iR_PKT_BUMP_DROP:  return iR_PKT_BUMP_DROP_BN;
								case iR_PKT_WALL:   return iR_PKT_WALL_BN;
								case iR_PKT_CLIFF_L:  return iR_PKT_CLIFF_L_BN;
								case iR_PKT_CLIFF_FL:  return iR_PKT_CLIFF_FL_BN;
								case iR_PKT_CLIFF_FR:  return iR_PKT_CLIFF_FR_BN;
								case iR_PKT_CLIFF_R: return iR_PKT_CLIFF_R_BN;
								case iR_PKT_V_WALL:  return iR_PKT_V_WALL_BN;
								case iR_PKT_DISTANCE: return iR_PKT_DISTANCE_BN;
								case iR_PKT_ANGLE:  return iR_PKT_ANGLE_BN;
								}
}

void rx_assign(UINT8 packetID, UINT8 packetIDValue, UINT8 byteNumber){   //Assign global values from the input data stream function
								switch (packetID) {
								case iR_PKT_BUMP_DROP:  iRBumpDrop = packetIDValue; sort_iRBumpDrop(); break;
								case iR_PKT_WALL:   iRWall = packetIDValue; break;
								case iR_PKT_CLIFF_L:  iRCliffL = packetIDValue; break;
								case iR_PKT_CLIFF_FL:  iRCliffFL = packetIDValue; break;
								case iR_PKT_CLIFF_FR:  iRCliffFR = packetIDValue; break;
								case iR_PKT_CLIFF_R: iRCliffR = packetIDValue; break;
								case iR_PKT_V_WALL:  iRVirtualWall = packetIDValue; break;
								case iR_PKT_DISTANCE:
																(byteNumber == 0) ? (iRDistanceSS.HB = packetIDValue) : (iRDistanceSS.LB = packetIDValue,
																																																																									iRDistance = MOVE_HIGH(iRDistanceSS.HB) + iRDistanceSS.LB); break;
								case iR_PKT_ANGLE:
																(byteNumber == 0) ? (iRAngleSS.HB = packetIDValue) : (iRAngleSS.LB = packetIDValue,
																																																																						iRAngle = MOVE_HIGH(iRAngleSS.HB) + iRAngleSS.LB); break;
								}
}

void sort_iRBumpDrop(void){              //Sorts Packet no7 into appropriate variables
								(iRBumpDrop & 0x1) ? (iRBumpRight = 1) : (iRBumpRight = 0);
								((iRBumpDrop >> 0x1) & (0x1)) ? (iRBumpLeft = 1) : (iRBumpLeft = 0);
								((iRBumpDrop >> 0x2) & (0x1)) ? (iRDropRight = 1) : (iRDropRight = 0);
								((iRBumpDrop >> 0x3) & (0x1)) ? (iRDropLeft = 1) : (iRDropLeft = 0);
								((iRBumpDrop >> 0x4) & (0x1)) ? (iRDropCaster = 1) : (iRDropCaster = 0);
}

//Serial (EUSART) Functions for the iRobot
////////////////////////////////////////////////////////////////////////////////

void eusart_init(void){
								TRISCbits.TRISC6 = 0;       //Set port directions on the MXK MCU for EUSART communications
								TRISCbits.TRISC7 = 1;

								TXSTA1 = 0b00100100;       //Configure TXSTA register to requirements
								RCSTA1 = 0b10011000;         //Configure RCSTA register to requirements

								BAUDCON1bits.DTRXP =  0;      //Configure BAUDCON register to requirements
								BAUDCON1bits.SCKP =  0;
								BAUDCON1bits.WUE =   0;
								BAUDCON1bits.ABDEN = 0;

								TXSTA1bits.BRGH =   1;      //Set appropriate bits and registers to meet baud of the iRobot
								BAUDCON1bits.BRG16 =  0;
								SPBRG1 =    51;      //SPBRG1 = 51 yields 0.16% error
}

void eusart_putch(UINT8 eusartSendChar){           //Send a character (unsigned byte) to the iRobot
								while (!TXSTA1bits.TRMT) {};
								TXREG1 = eusartSendChar;
}

UINT8 eusart_getch(void){              //Listen to receive a character (unsigned byte) from the iRobot
								while (!PIR1bits.RC1IF) {};
								return RCREG1;
}

void irobot_query_and_update(UINT8 numberOfPacketRequests, ...){
								UINT8 i, j, packetVariable, streamSize = 0, startIndex = 0, RXArray[256], TXArray[256];

								va_list packetIDs;        //Initialise variadic list
								va_start(packetIDs, numberOfPacketRequests);
								eusart_putch(iR_QUERY_LIST);
								eusart_putch(numberOfPacketRequests);
								for (i = 0; i < numberOfPacketRequests; i++) { //Iterate through the n-sensors; sending the appropriate sensor requests
																packetVariable = va_arg(packetIDs, int);
																streamSize += get_packet_size(packetVariable);
																TXArray[i] = packetVariable;
																eusart_putch(packetVariable);
								}
								va_end(packetIDs);        //End variadic list

								for (i = 0; i < streamSize; i++) {RXArray[i] = eusart_getch();} //Populate the RXArray

								for (i = 0; i < numberOfPacketRequests; i++) {
																for (j = startIndex; j < get_packet_size(TXArray[i]) + startIndex; j++) {
																								rx_assign(TXArray[i], RXArray[j], j - startIndex);
																}
																startIndex += get_packet_size(TXArray[i]); //Move starting index appropriately
								}
}

//iRobot Primitive Functions
////////////////////////////////////////////////////////////////////////////////

///WARNING:

///Some functions (except the wait functions) are integrated with script queuing.
///A boolean high (1) is required in most functions if you wish to add the
///command to the script stack or a boolean low (0) if you wish to send the command
///directly to the iRobot

///The boolean is required (if needed) as the first input argument for the function

UINT16 twos_complement_of(INT16 complementValue){        //Split signed value into "2s Complement" format
								if (complementValue < 0) {
																complementValue = ABS(complementValue);
																complementValue = ~complementValue;
																complementValue += 1;
								}
								return complementValue;
}

void load_iRScriptStack(UINT8 bytesToLoad, ...){        //Load commands into iRScriptStack
								va_list loadByte;        //Start variadic list
								va_start(loadByte, bytesToLoad);
								for (UINT8 i = 0; i < bytesToLoad; i++) { //Move data into iRScriptStack
																iRScriptStack[iRScriptIndex + i] = va_arg(loadByte, int);
								}
								va_end(loadByte);        //End variadic list
								iRScriptIndex += bytesToLoad;     //Move starting index to new point ready for a new command
}

///USAGE:
///Use this function after you have called ALL of your script functions IN ORDER
///of desired execution
void irobot_script_play(void){             //Execute commands in iRScriptStack
								eusart_putch(iR_SCRIPT);
								eusart_putch(iRScriptIndex);
								for (UINT8 i = 0; i < iRScriptIndex; i++) {eusart_putch(iRScriptStack[i]);} //Iterates through iRScriptStack and sends each element through EUSART
								eusart_putch(iR_SCRIPT_PLAY);
								memset(iRScriptStack, 0x00, sizeof(iRScriptStack)); //Clear global iRScriptStack contents
								iRScriptIndex = 0;        //Reset starting index
}

void irobot_init(void){               //iRobot initialisation function
								eusart_putch(iR_START);
								eusart_putch(iR_FULL_MODE);
}

//SCRIPT USAGE ONLY FUNCTION
void irobot_angle_wait(INT16 angleWait){          //Angle wait function
								angleWait = twos_complement_of(angleWait);

								load_iRScriptStack(3, iR_WAIT_ANGLE,
																											HIGH_BYTE(angleWait), LOW_BYTE(angleWait));
}

//SCRIPT USAGE ONLY FUNCTION
void irobot_distance_wait(INT16 distanceWait){         //Distance wait function
								distanceWait = twos_complement_of(distanceWait);

								load_iRScriptStack(3, iR_WAIT_DISTANCE,
																											HIGH_BYTE(distanceWait), LOW_BYTE(distanceWait));
}

//SCRIPT STACK INTEGRATED
void irobot_move(bool isScript, INT16 moveSpeed, INT16 moveTurnRadius){   //iRobot general move function
								moveSpeed = twos_complement_of(moveSpeed);
								moveTurnRadius = twos_complement_of(moveTurnRadius);

								if (isScript) {
																load_iRScriptStack(5, iR_DRIVE,
																																			HIGH_BYTE(moveSpeed), LOW_BYTE(moveSpeed),
																																			HIGH_BYTE(moveTurnRadius), LOW_BYTE(moveTurnRadius));
								}
								else{
																eusart_putch(iR_DRIVE);
																eusart_putch(HIGH_BYTE(moveSpeed));
																eusart_putch(LOW_BYTE(moveSpeed));
																eusart_putch(HIGH_BYTE(moveTurnRadius));
																eusart_putch(LOW_BYTE(moveTurnRadius));
								}
}

//SCRIPT STACK INTEGRATED
void irobot_leds(bool isScript, UINT8 LEDBit, UINT8 powerColour, UINT8 powerLuminosity){ //General LED function
								if (isScript) {
																load_iRScriptStack(4, iR_LEDS,
																																			LEDBit, powerColour, powerLuminosity);
								}
								else{
																eusart_putch(iR_LEDS);
																eusart_putch(LEDBit);
																eusart_putch(powerColour);
																eusart_putch(powerLuminosity);
								}
}

void irobot_init_song_0(void){             //Define Song 0
								eusart_putch(iR_SONG_INIT);
								eusart_putch(0);
								eusart_putch(1);
								eusart_putch(60);        //Aryana's Serenade in C maj
								eusart_putch(4);        //Check out my soundcloud
}

//ALL iROBOT FUNCTIONS NEEDED FOR ASSIGNMENT 2
////////////////////////////////////////////////////////////////////////////////

///WARNING:

///Scripts will NOT WORK for assignment 2. You have to tell the robot to move or
///rotate an infinite distance (i.e. direct input function) then poll the sensors
///to check the respective values. Scripts use a WAIT command which blocks all
///ingoing and outgoing serial communication with the iRobot pretty much making
///it a mute and deaf brick; thus not allowing you to update the distance travelled
///in realtime


//BEEP BOOP MOTHERFUCKER
void irobot_song_play(UINT8 songNumber){          //Play song number n
								eusart_putch(iR_SONG_PLAY);
								eusart_putch(songNumber);
}

//DIRECT INPUT FUNCTION/SCRIPT STACK INTEGRATED
void irobot_rotate(bool isScript, INT16 rotateAngle, INT16 rotateSpeed){		//Rotate on the spot function
	INT16 angleTotal = 0;

	(rotateAngle > 0) ? (rotateAngle = iR_CONST_CCW) : (rotateAngle = iR_CONST_CW);
	if (isScript) {
		irobot_move(1, rotateSpeed, rotateAngle);
	}
	else {
		irobot_move(0, rotateSpeed, rotateAngle);
		while (angleTotal < rotateAngle) {
			update_angle(); 
			angleTotal += iRAngle;
		}
		irobot_stop_motion(0);
	}	
}

//DIRECT INPUT FUNCTION/SCRIPT STACK INTEGRATED
void irobot_stop_motion(bool isScript){           //Stops the iRobot moving function
								(isScript) ? irobot_move(1,0,0) : irobot_move(0,0,0);
}

//DIRECT INPUT FUNCTION
void irobot_led_power_on(UINT8 powerOnColour){         //Turn power LED on to given colour
								irobot_leds(0, 0, powerOnColour, iR_CONST_LED_ON);
}

//DIRECT INPUT FUNCTION
void irobot_led_power_off(void){            //Turn power LED off
								irobot_leds(0, 0, 0, 0);
}

//DIRECT INPUT FUNCTION
void irobot_move_straight(INT16 straightSpeed){         //Move the iRobot straight with constant speed
								irobot_move(0, straightSpeed, iR_CONST_STRAIGHT_2);
}

//SENSOR VALUE UPDATE FUNCTION
void update_bump_and_cliff(){             //Updates bump and cliff sensors
								irobot_query_and_update(5, iR_PKT_BUMP_DROP,
																																iR_PKT_CLIFF_L, iR_PKT_CLIFF_FL,
																																iR_PKT_CLIFF_FR, iR_PKT_CLIFF_R);
}

//SENSOR VALUE UPDATE FUNCTION
void update_distance(void){               //Updates linear distance
								irobot_query_and_update(1, iR_PKT_DISTANCE);
}

//SENSOR VALUE UPDATE FUNCTION
void update_angle(void){               //Updates angular travel
								irobot_query_and_update(1, iR_PKT_ANGLE);
}

//SAMPLE SCRIPTS APPLICATIONS
////////////////////////////////////////////////////////////////////////////////

//SCRIPT ORIENTATED FUNCTION
void irobot_move_to_simple(INT16 moveToDistance, INT16 moveToSpeed){   //Moves the iRobot straight forward or backward to a set distance
								irobot_move(1, moveToSpeed, iR_CONST_STRAIGHT_2);
								irobot_distance_wait(moveToDistance);
								irobot_stop_motion(1);
}

//SCRIPT ORIENTATED FUNCTION
void irobot_rotate_to(INT16 rotateToAngle, INT16 rotateSpeed){     //Rotate the iRobot on its own axis to a given angle
								irobot_rotate(1, rotateToAngle, rotateSpeed);
								irobot_angle_wait(rotateToAngle);
								irobot_stop_motion(1);
}
