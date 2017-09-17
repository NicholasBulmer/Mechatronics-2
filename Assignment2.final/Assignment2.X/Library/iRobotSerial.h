/* 
 * File:   iRobotSerial.h
 * Author: Chad Aryana
 *
 * MX2: iRobot Function Library (Header File)
 */

#include "Types.h"

//iRobot OPCodes and Constants
////////////////////////////////////////////////////////////////////////////////

///These are the OPCodes as per defined in the iRobot Create OI Specification
typedef enum{
	iR_START 			= 128,
	iR_FULL_MODE 		= 132,
	iR_DRIVE 			= 137,
	iR_LEDS				= 139,
	iR_SONG_INIT		= 140,
	iR_SONG_PLAY		= 141,
	iR_SENSORS 			= 142,
	iR_DIRECT_DRIVE		= 145,
	iR_STREAM 			= 148,
	iR_QUERY_LIST		= 149,
	iR_SCRIPT			= 152,
	iR_SCRIPT_PLAY		= 153,
	iR_WAIT_TIME 		= 155,
	iR_WAIT_DISTANCE 	= 156,
	iR_WAIT_ANGLE 		= 157,
	iR_WAIT_EVENT 		= 158,	 
 }iR_OPCODE;

///Data Packets ID numbers as per defined in the iRobot Create OI Specification
typedef enum{
	iR_PKT_BUMP_DROP	= 7,
	iR_PKT_WALL			= 8,
	iR_PKT_CLIFF_L		= 9,
	iR_PKT_CLIFF_FL		= 10,
	iR_PKT_CLIFF_FR		= 11,
	iR_PKT_CLIFF_R		= 12,
	iR_PKT_V_WALL		= 13,
	iR_PKT_DISTANCE		= 19,
	iR_PKT_ANGLE		= 20,
 }iR_PACKET;

///Data Packets sizes (bytes) as per defined in the iRobot Create OI Specification
typedef enum{
	iR_PKT_BUMP_DROP_BN	= 1,	
	iR_PKT_WALL_BN		= 1,
	iR_PKT_CLIFF_L_BN	= 1,
	iR_PKT_CLIFF_FL_BN	= 1,
	iR_PKT_CLIFF_FR_BN	= 1,
	iR_PKT_CLIFF_R_BN	= 1,
	iR_PKT_V_WALL_BN	= 1,
	iR_PKT_DISTANCE_BN	= 2,
	iR_PKT_ANGLE_BN		= 2,
}iR_PACKET_SIZE;

///Random constants that the iRobot specifies
typedef enum{
	iR_CONST_STRAIGHT_1	= 0x8000,
	iR_CONST_STRAIGHT_2	= 0x7FFF,
	iR_CONST_CW 		= 0xFFFF,
	iR_CONST_CCW 		= 0x1,
	iR_CONST_GREEN		= 0x0,
	iR_CONST_YELLOW		= 0x55,
	iR_CONST_ORANGE		= 0xAA,
	iR_CONST_RED		= 0xFF,
	iR_CONST_LED_ON		= 0xFF,
}iR_CONSTANTS;

//Function Prototypes
////////////////////////////////////////////////////////////////////////////////

UINT8 get_packet_size(UINT8 packetID);
void rx_assign(UINT8 packetID, UINT8 packetIDValue, UINT8 byteNumber);
void sort_iRBumpDrop(void);

void eusart_init(void);
void eusart_putch(UINT8 eusartSendChar);
UINT8 eusart_getch(void);
void irobot_query_and_update(UINT8 numberOfPacketRequests, ...);

UINT16 twos_complement_of(INT16 complementValue);
void load_iRScriptStack(UINT8 bytesToLoad, ...);
void irobot_script_play(void);
void irobot_init(void);
void irobot_angle_wait(INT16 angleWait);
void irobot_distance_wait(INT16 distanceWait);
void irobot_move(bool isScript, INT16 moveSpeed, INT16 moveTurnRadius);
void irobot_leds(bool isScript, UINT8 LEDBit, UINT8 powerColour, UINT8 powerLuminosity);
void irobot_led_power_on(UINT8 powerOnColour);
void irobot_led_power_off(void);
void irobot_move_to_simple(INT16 moveToDistance, INT16 moveToSpeed);
void irobot_rotate_to(INT16 rotateToAngle, INT16 rotateSpeed);

//ASSIGNMENT 2 FUNCTIONS
////////////////////////////////////////////////////////////////////////////////

void irobot_rotate(bool isScript, INT16 rotateAngle, INT16 rotateSpeed);
void irobot_stop_motion(bool isScript);
void irobot_move_straight(INT16 straightSpeed);
void update_bump_and_cliff(void);
void update_distance(void);
void update_angle(void);
void irobot_init_song_0(void);
void irobot_song_play(UINT8 songNumber);

//Global Variables Declarations
////////////////////////////////////////////////////////////////////////////////

extern INT16
	iRDistance,																	//Distance in mm since last call/update
	iRAngle;																	//Angle in degrees since last call/update

extern UINT8 
	iRWall,
	iRCliffL,
	iRCliffFL,
	iRCliffFR,
	iRCliffR,
	iRVirtualWall;

extern bool
	iRBumpRight,
	iRBumpLeft,
	iRDropRight,
	iRDropLeft,
	iRDropCaster;