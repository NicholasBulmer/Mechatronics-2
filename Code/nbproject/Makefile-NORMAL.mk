#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-NORMAL.mk)" "nbproject/Makefile-local-NORMAL.mk"
include nbproject/Makefile-local-NORMAL.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=NORMAL
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=Library/USB/src/usb_device.c Library/USB/src/usb_device_cdc.c Library/USB/src/usb_descriptors.c Library/USB/src/usb_events.c Library/Button.c Library/LCD.c Library/LED.c Library/Point.c Library/Port.c Library/SPI.c Library/Types.c Library/FIFO.c Library/Console.c Colours.c Timer0.c Timer2.c Motor.c I2C.c IMU.c HMI.c Tetris.c USB_Wrap.c MXK.c ISR.c Events.c Functions.c main.c ASMCode.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Library/USB/src/usb_device.p1 ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1 ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1 ${OBJECTDIR}/Library/USB/src/usb_events.p1 ${OBJECTDIR}/Library/Button.p1 ${OBJECTDIR}/Library/LCD.p1 ${OBJECTDIR}/Library/LED.p1 ${OBJECTDIR}/Library/Point.p1 ${OBJECTDIR}/Library/Port.p1 ${OBJECTDIR}/Library/SPI.p1 ${OBJECTDIR}/Library/Types.p1 ${OBJECTDIR}/Library/FIFO.p1 ${OBJECTDIR}/Library/Console.p1 ${OBJECTDIR}/Colours.p1 ${OBJECTDIR}/Timer0.p1 ${OBJECTDIR}/Timer2.p1 ${OBJECTDIR}/Motor.p1 ${OBJECTDIR}/I2C.p1 ${OBJECTDIR}/IMU.p1 ${OBJECTDIR}/HMI.p1 ${OBJECTDIR}/Tetris.p1 ${OBJECTDIR}/USB_Wrap.p1 ${OBJECTDIR}/MXK.p1 ${OBJECTDIR}/ISR.p1 ${OBJECTDIR}/Events.p1 ${OBJECTDIR}/Functions.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/ASMCode.obj
POSSIBLE_DEPFILES=${OBJECTDIR}/Library/USB/src/usb_device.p1.d ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1.d ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1.d ${OBJECTDIR}/Library/USB/src/usb_events.p1.d ${OBJECTDIR}/Library/Button.p1.d ${OBJECTDIR}/Library/LCD.p1.d ${OBJECTDIR}/Library/LED.p1.d ${OBJECTDIR}/Library/Point.p1.d ${OBJECTDIR}/Library/Port.p1.d ${OBJECTDIR}/Library/SPI.p1.d ${OBJECTDIR}/Library/Types.p1.d ${OBJECTDIR}/Library/FIFO.p1.d ${OBJECTDIR}/Library/Console.p1.d ${OBJECTDIR}/Colours.p1.d ${OBJECTDIR}/Timer0.p1.d ${OBJECTDIR}/Timer2.p1.d ${OBJECTDIR}/Motor.p1.d ${OBJECTDIR}/I2C.p1.d ${OBJECTDIR}/IMU.p1.d ${OBJECTDIR}/HMI.p1.d ${OBJECTDIR}/Tetris.p1.d ${OBJECTDIR}/USB_Wrap.p1.d ${OBJECTDIR}/MXK.p1.d ${OBJECTDIR}/ISR.p1.d ${OBJECTDIR}/Events.p1.d ${OBJECTDIR}/Functions.p1.d ${OBJECTDIR}/main.p1.d ${OBJECTDIR}/ASMCode.obj.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Library/USB/src/usb_device.p1 ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1 ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1 ${OBJECTDIR}/Library/USB/src/usb_events.p1 ${OBJECTDIR}/Library/Button.p1 ${OBJECTDIR}/Library/LCD.p1 ${OBJECTDIR}/Library/LED.p1 ${OBJECTDIR}/Library/Point.p1 ${OBJECTDIR}/Library/Port.p1 ${OBJECTDIR}/Library/SPI.p1 ${OBJECTDIR}/Library/Types.p1 ${OBJECTDIR}/Library/FIFO.p1 ${OBJECTDIR}/Library/Console.p1 ${OBJECTDIR}/Colours.p1 ${OBJECTDIR}/Timer0.p1 ${OBJECTDIR}/Timer2.p1 ${OBJECTDIR}/Motor.p1 ${OBJECTDIR}/I2C.p1 ${OBJECTDIR}/IMU.p1 ${OBJECTDIR}/HMI.p1 ${OBJECTDIR}/Tetris.p1 ${OBJECTDIR}/USB_Wrap.p1 ${OBJECTDIR}/MXK.p1 ${OBJECTDIR}/ISR.p1 ${OBJECTDIR}/Events.p1 ${OBJECTDIR}/Functions.p1 ${OBJECTDIR}/main.p1 ${OBJECTDIR}/ASMCode.obj

# Source Files
SOURCEFILES=Library/USB/src/usb_device.c Library/USB/src/usb_device_cdc.c Library/USB/src/usb_descriptors.c Library/USB/src/usb_events.c Library/Button.c Library/LCD.c Library/LED.c Library/Point.c Library/Port.c Library/SPI.c Library/Types.c Library/FIFO.c Library/Console.c Colours.c Timer0.c Timer2.c Motor.c I2C.c IMU.c HMI.c Tetris.c USB_Wrap.c MXK.c ISR.c Events.c Functions.c main.c ASMCode.asm


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-NORMAL.mk dist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F67J50
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Library/USB/src/usb_device.p1: Library/USB/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library/USB/src" 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/USB/src/usb_device.p1  Library/USB/src/usb_device.c 
	@-${MV} ${OBJECTDIR}/Library/USB/src/usb_device.d ${OBJECTDIR}/Library/USB/src/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/USB/src/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1: Library/USB/src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library/USB/src" 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1  Library/USB/src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/Library/USB/src/usb_device_cdc.d ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/USB/src/usb_descriptors.p1: Library/USB/src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library/USB/src" 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/USB/src/usb_descriptors.p1  Library/USB/src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/Library/USB/src/usb_descriptors.d ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/USB/src/usb_events.p1: Library/USB/src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library/USB/src" 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/USB/src/usb_events.p1  Library/USB/src/usb_events.c 
	@-${MV} ${OBJECTDIR}/Library/USB/src/usb_events.d ${OBJECTDIR}/Library/USB/src/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/USB/src/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Button.p1: Library/Button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Button.p1.d 
	@${RM} ${OBJECTDIR}/Library/Button.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Button.p1  Library/Button.c 
	@-${MV} ${OBJECTDIR}/Library/Button.d ${OBJECTDIR}/Library/Button.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Button.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/LCD.p1: Library/LCD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/LCD.p1.d 
	@${RM} ${OBJECTDIR}/Library/LCD.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/LCD.p1  Library/LCD.c 
	@-${MV} ${OBJECTDIR}/Library/LCD.d ${OBJECTDIR}/Library/LCD.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/LCD.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/LED.p1: Library/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/LED.p1.d 
	@${RM} ${OBJECTDIR}/Library/LED.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/LED.p1  Library/LED.c 
	@-${MV} ${OBJECTDIR}/Library/LED.d ${OBJECTDIR}/Library/LED.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/LED.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Point.p1: Library/Point.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Point.p1.d 
	@${RM} ${OBJECTDIR}/Library/Point.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Point.p1  Library/Point.c 
	@-${MV} ${OBJECTDIR}/Library/Point.d ${OBJECTDIR}/Library/Point.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Point.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Port.p1: Library/Port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Port.p1.d 
	@${RM} ${OBJECTDIR}/Library/Port.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Port.p1  Library/Port.c 
	@-${MV} ${OBJECTDIR}/Library/Port.d ${OBJECTDIR}/Library/Port.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Port.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/SPI.p1: Library/SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/SPI.p1.d 
	@${RM} ${OBJECTDIR}/Library/SPI.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/SPI.p1  Library/SPI.c 
	@-${MV} ${OBJECTDIR}/Library/SPI.d ${OBJECTDIR}/Library/SPI.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/SPI.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Types.p1: Library/Types.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Types.p1.d 
	@${RM} ${OBJECTDIR}/Library/Types.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Types.p1  Library/Types.c 
	@-${MV} ${OBJECTDIR}/Library/Types.d ${OBJECTDIR}/Library/Types.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Types.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/FIFO.p1: Library/FIFO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/FIFO.p1.d 
	@${RM} ${OBJECTDIR}/Library/FIFO.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/FIFO.p1  Library/FIFO.c 
	@-${MV} ${OBJECTDIR}/Library/FIFO.d ${OBJECTDIR}/Library/FIFO.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/FIFO.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Console.p1: Library/Console.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Console.p1.d 
	@${RM} ${OBJECTDIR}/Library/Console.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Console.p1  Library/Console.c 
	@-${MV} ${OBJECTDIR}/Library/Console.d ${OBJECTDIR}/Library/Console.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Console.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Colours.p1: Colours.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Colours.p1.d 
	@${RM} ${OBJECTDIR}/Colours.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Colours.p1  Colours.c 
	@-${MV} ${OBJECTDIR}/Colours.d ${OBJECTDIR}/Colours.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Colours.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Timer0.p1: Timer0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer0.p1.d 
	@${RM} ${OBJECTDIR}/Timer0.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Timer0.p1  Timer0.c 
	@-${MV} ${OBJECTDIR}/Timer0.d ${OBJECTDIR}/Timer0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Timer0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Timer2.p1: Timer2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer2.p1.d 
	@${RM} ${OBJECTDIR}/Timer2.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Timer2.p1  Timer2.c 
	@-${MV} ${OBJECTDIR}/Timer2.d ${OBJECTDIR}/Timer2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Timer2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Motor.p1: Motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motor.p1.d 
	@${RM} ${OBJECTDIR}/Motor.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Motor.p1  Motor.c 
	@-${MV} ${OBJECTDIR}/Motor.d ${OBJECTDIR}/Motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/I2C.p1: I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/I2C.p1.d 
	@${RM} ${OBJECTDIR}/I2C.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/I2C.p1  I2C.c 
	@-${MV} ${OBJECTDIR}/I2C.d ${OBJECTDIR}/I2C.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/I2C.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/IMU.p1: IMU.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IMU.p1.d 
	@${RM} ${OBJECTDIR}/IMU.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/IMU.p1  IMU.c 
	@-${MV} ${OBJECTDIR}/IMU.d ${OBJECTDIR}/IMU.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/IMU.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HMI.p1: HMI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HMI.p1.d 
	@${RM} ${OBJECTDIR}/HMI.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/HMI.p1  HMI.c 
	@-${MV} ${OBJECTDIR}/HMI.d ${OBJECTDIR}/HMI.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HMI.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Tetris.p1: Tetris.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Tetris.p1.d 
	@${RM} ${OBJECTDIR}/Tetris.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Tetris.p1  Tetris.c 
	@-${MV} ${OBJECTDIR}/Tetris.d ${OBJECTDIR}/Tetris.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Tetris.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/USB_Wrap.p1: USB_Wrap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USB_Wrap.p1.d 
	@${RM} ${OBJECTDIR}/USB_Wrap.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/USB_Wrap.p1  USB_Wrap.c 
	@-${MV} ${OBJECTDIR}/USB_Wrap.d ${OBJECTDIR}/USB_Wrap.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/USB_Wrap.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MXK.p1: MXK.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MXK.p1.d 
	@${RM} ${OBJECTDIR}/MXK.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/MXK.p1  MXK.c 
	@-${MV} ${OBJECTDIR}/MXK.d ${OBJECTDIR}/MXK.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MXK.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/ISR.p1: ISR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ISR.p1.d 
	@${RM} ${OBJECTDIR}/ISR.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/ISR.p1  ISR.c 
	@-${MV} ${OBJECTDIR}/ISR.d ${OBJECTDIR}/ISR.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/ISR.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Events.p1: Events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Events.p1.d 
	@${RM} ${OBJECTDIR}/Events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Events.p1  Events.c 
	@-${MV} ${OBJECTDIR}/Events.d ${OBJECTDIR}/Events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Functions.p1: Functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Functions.p1.d 
	@${RM} ${OBJECTDIR}/Functions.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Functions.p1  Functions.c 
	@-${MV} ${OBJECTDIR}/Functions.d ${OBJECTDIR}/Functions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Functions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main.p1  main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/Library/USB/src/usb_device.p1: Library/USB/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library/USB/src" 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_device.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/USB/src/usb_device.p1  Library/USB/src/usb_device.c 
	@-${MV} ${OBJECTDIR}/Library/USB/src/usb_device.d ${OBJECTDIR}/Library/USB/src/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/USB/src/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1: Library/USB/src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library/USB/src" 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1  Library/USB/src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/Library/USB/src/usb_device_cdc.d ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/USB/src/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/USB/src/usb_descriptors.p1: Library/USB/src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library/USB/src" 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/USB/src/usb_descriptors.p1  Library/USB/src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/Library/USB/src/usb_descriptors.d ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/USB/src/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/USB/src/usb_events.p1: Library/USB/src/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library/USB/src" 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/Library/USB/src/usb_events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/USB/src/usb_events.p1  Library/USB/src/usb_events.c 
	@-${MV} ${OBJECTDIR}/Library/USB/src/usb_events.d ${OBJECTDIR}/Library/USB/src/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/USB/src/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Button.p1: Library/Button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Button.p1.d 
	@${RM} ${OBJECTDIR}/Library/Button.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Button.p1  Library/Button.c 
	@-${MV} ${OBJECTDIR}/Library/Button.d ${OBJECTDIR}/Library/Button.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Button.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/LCD.p1: Library/LCD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/LCD.p1.d 
	@${RM} ${OBJECTDIR}/Library/LCD.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/LCD.p1  Library/LCD.c 
	@-${MV} ${OBJECTDIR}/Library/LCD.d ${OBJECTDIR}/Library/LCD.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/LCD.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/LED.p1: Library/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/LED.p1.d 
	@${RM} ${OBJECTDIR}/Library/LED.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/LED.p1  Library/LED.c 
	@-${MV} ${OBJECTDIR}/Library/LED.d ${OBJECTDIR}/Library/LED.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/LED.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Point.p1: Library/Point.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Point.p1.d 
	@${RM} ${OBJECTDIR}/Library/Point.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Point.p1  Library/Point.c 
	@-${MV} ${OBJECTDIR}/Library/Point.d ${OBJECTDIR}/Library/Point.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Point.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Port.p1: Library/Port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Port.p1.d 
	@${RM} ${OBJECTDIR}/Library/Port.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Port.p1  Library/Port.c 
	@-${MV} ${OBJECTDIR}/Library/Port.d ${OBJECTDIR}/Library/Port.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Port.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/SPI.p1: Library/SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/SPI.p1.d 
	@${RM} ${OBJECTDIR}/Library/SPI.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/SPI.p1  Library/SPI.c 
	@-${MV} ${OBJECTDIR}/Library/SPI.d ${OBJECTDIR}/Library/SPI.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/SPI.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Types.p1: Library/Types.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Types.p1.d 
	@${RM} ${OBJECTDIR}/Library/Types.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Types.p1  Library/Types.c 
	@-${MV} ${OBJECTDIR}/Library/Types.d ${OBJECTDIR}/Library/Types.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Types.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/FIFO.p1: Library/FIFO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/FIFO.p1.d 
	@${RM} ${OBJECTDIR}/Library/FIFO.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/FIFO.p1  Library/FIFO.c 
	@-${MV} ${OBJECTDIR}/Library/FIFO.d ${OBJECTDIR}/Library/FIFO.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/FIFO.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Console.p1: Library/Console.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Console.p1.d 
	@${RM} ${OBJECTDIR}/Library/Console.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Console.p1  Library/Console.c 
	@-${MV} ${OBJECTDIR}/Library/Console.d ${OBJECTDIR}/Library/Console.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Console.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Colours.p1: Colours.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Colours.p1.d 
	@${RM} ${OBJECTDIR}/Colours.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Colours.p1  Colours.c 
	@-${MV} ${OBJECTDIR}/Colours.d ${OBJECTDIR}/Colours.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Colours.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Timer0.p1: Timer0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer0.p1.d 
	@${RM} ${OBJECTDIR}/Timer0.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Timer0.p1  Timer0.c 
	@-${MV} ${OBJECTDIR}/Timer0.d ${OBJECTDIR}/Timer0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Timer0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Timer2.p1: Timer2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Timer2.p1.d 
	@${RM} ${OBJECTDIR}/Timer2.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Timer2.p1  Timer2.c 
	@-${MV} ${OBJECTDIR}/Timer2.d ${OBJECTDIR}/Timer2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Timer2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Motor.p1: Motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motor.p1.d 
	@${RM} ${OBJECTDIR}/Motor.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Motor.p1  Motor.c 
	@-${MV} ${OBJECTDIR}/Motor.d ${OBJECTDIR}/Motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/I2C.p1: I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/I2C.p1.d 
	@${RM} ${OBJECTDIR}/I2C.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/I2C.p1  I2C.c 
	@-${MV} ${OBJECTDIR}/I2C.d ${OBJECTDIR}/I2C.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/I2C.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/IMU.p1: IMU.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IMU.p1.d 
	@${RM} ${OBJECTDIR}/IMU.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/IMU.p1  IMU.c 
	@-${MV} ${OBJECTDIR}/IMU.d ${OBJECTDIR}/IMU.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/IMU.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HMI.p1: HMI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HMI.p1.d 
	@${RM} ${OBJECTDIR}/HMI.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/HMI.p1  HMI.c 
	@-${MV} ${OBJECTDIR}/HMI.d ${OBJECTDIR}/HMI.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HMI.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Tetris.p1: Tetris.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Tetris.p1.d 
	@${RM} ${OBJECTDIR}/Tetris.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Tetris.p1  Tetris.c 
	@-${MV} ${OBJECTDIR}/Tetris.d ${OBJECTDIR}/Tetris.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Tetris.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/USB_Wrap.p1: USB_Wrap.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/USB_Wrap.p1.d 
	@${RM} ${OBJECTDIR}/USB_Wrap.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/USB_Wrap.p1  USB_Wrap.c 
	@-${MV} ${OBJECTDIR}/USB_Wrap.d ${OBJECTDIR}/USB_Wrap.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/USB_Wrap.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MXK.p1: MXK.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MXK.p1.d 
	@${RM} ${OBJECTDIR}/MXK.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/MXK.p1  MXK.c 
	@-${MV} ${OBJECTDIR}/MXK.d ${OBJECTDIR}/MXK.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MXK.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/ISR.p1: ISR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ISR.p1.d 
	@${RM} ${OBJECTDIR}/ISR.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/ISR.p1  ISR.c 
	@-${MV} ${OBJECTDIR}/ISR.d ${OBJECTDIR}/ISR.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/ISR.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Events.p1: Events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Events.p1.d 
	@${RM} ${OBJECTDIR}/Events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Events.p1  Events.c 
	@-${MV} ${OBJECTDIR}/Events.d ${OBJECTDIR}/Events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Functions.p1: Functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Functions.p1.d 
	@${RM} ${OBJECTDIR}/Functions.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Functions.p1  Functions.c 
	@-${MV} ${OBJECTDIR}/Functions.d ${OBJECTDIR}/Functions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Functions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main.p1  main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/ASMCode.obj: ASMCode.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ASMCode.obj.d 
	@${RM} ${OBJECTDIR}/ASMCode.obj 
	${MP_CC} -C $(MP_EXTRA_AS_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  -o${OBJECTDIR}/ASMCode.obj  ASMCode.asm 
	@-${MV} ${OBJECTDIR}/ASMCode.d ${OBJECTDIR}/ASMCode.obj.d 
	@${FIXDEPS} ${OBJECTDIR}/ASMCode.obj.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/ASMCode.obj: ASMCode.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ASMCode.obj.d 
	@${RM} ${OBJECTDIR}/ASMCode.obj 
	${MP_CC} -C $(MP_EXTRA_AS_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"  -o${OBJECTDIR}/ASMCode.obj  ASMCode.asm 
	@-${MV} ${OBJECTDIR}/ASMCode.d ${OBJECTDIR}/ASMCode.obj.d 
	@${FIXDEPS} ${OBJECTDIR}/ASMCode.obj.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"       --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.map  --double=32 --float=32 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=std -P -N255 -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" -I"Library/USB" -I"Library" --warn=-3 --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/MXK_Demo_V1.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/NORMAL
	${RM} -r dist/NORMAL

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
