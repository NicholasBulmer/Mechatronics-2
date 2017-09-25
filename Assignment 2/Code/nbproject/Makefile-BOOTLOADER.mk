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
ifeq "$(wildcard nbproject/Makefile-local-BOOTLOADER.mk)" "nbproject/Makefile-local-BOOTLOADER.mk"
include nbproject/Makefile-local-BOOTLOADER.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=BOOTLOADER
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=--mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=Library/Button.c Library/LCD.c Library/LED.c Library/Point.c Library/Port.c Library/SPI.c Library/Types.c Library/Console.c HMI.c Library/ADC.c Library/Colours.c Library/I2C.c Library/ISR.c Library/Motor.c Library/MXK.c Library/system.c Library/Timer0.c Library/Timer2.c Events.c Functions.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Library/Button.p1 ${OBJECTDIR}/Library/LCD.p1 ${OBJECTDIR}/Library/LED.p1 ${OBJECTDIR}/Library/Point.p1 ${OBJECTDIR}/Library/Port.p1 ${OBJECTDIR}/Library/SPI.p1 ${OBJECTDIR}/Library/Types.p1 ${OBJECTDIR}/Library/Console.p1 ${OBJECTDIR}/HMI.p1 ${OBJECTDIR}/Library/ADC.p1 ${OBJECTDIR}/Library/Colours.p1 ${OBJECTDIR}/Library/I2C.p1 ${OBJECTDIR}/Library/ISR.p1 ${OBJECTDIR}/Library/Motor.p1 ${OBJECTDIR}/Library/MXK.p1 ${OBJECTDIR}/Library/system.p1 ${OBJECTDIR}/Library/Timer0.p1 ${OBJECTDIR}/Library/Timer2.p1 ${OBJECTDIR}/Events.p1 ${OBJECTDIR}/Functions.p1 ${OBJECTDIR}/main.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/Library/Button.p1.d ${OBJECTDIR}/Library/LCD.p1.d ${OBJECTDIR}/Library/LED.p1.d ${OBJECTDIR}/Library/Point.p1.d ${OBJECTDIR}/Library/Port.p1.d ${OBJECTDIR}/Library/SPI.p1.d ${OBJECTDIR}/Library/Types.p1.d ${OBJECTDIR}/Library/Console.p1.d ${OBJECTDIR}/HMI.p1.d ${OBJECTDIR}/Library/ADC.p1.d ${OBJECTDIR}/Library/Colours.p1.d ${OBJECTDIR}/Library/I2C.p1.d ${OBJECTDIR}/Library/ISR.p1.d ${OBJECTDIR}/Library/Motor.p1.d ${OBJECTDIR}/Library/MXK.p1.d ${OBJECTDIR}/Library/system.p1.d ${OBJECTDIR}/Library/Timer0.p1.d ${OBJECTDIR}/Library/Timer2.p1.d ${OBJECTDIR}/Events.p1.d ${OBJECTDIR}/Functions.p1.d ${OBJECTDIR}/main.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Library/Button.p1 ${OBJECTDIR}/Library/LCD.p1 ${OBJECTDIR}/Library/LED.p1 ${OBJECTDIR}/Library/Point.p1 ${OBJECTDIR}/Library/Port.p1 ${OBJECTDIR}/Library/SPI.p1 ${OBJECTDIR}/Library/Types.p1 ${OBJECTDIR}/Library/Console.p1 ${OBJECTDIR}/HMI.p1 ${OBJECTDIR}/Library/ADC.p1 ${OBJECTDIR}/Library/Colours.p1 ${OBJECTDIR}/Library/I2C.p1 ${OBJECTDIR}/Library/ISR.p1 ${OBJECTDIR}/Library/Motor.p1 ${OBJECTDIR}/Library/MXK.p1 ${OBJECTDIR}/Library/system.p1 ${OBJECTDIR}/Library/Timer0.p1 ${OBJECTDIR}/Library/Timer2.p1 ${OBJECTDIR}/Events.p1 ${OBJECTDIR}/Functions.p1 ${OBJECTDIR}/main.p1

# Source Files
SOURCEFILES=Library/Button.c Library/LCD.c Library/LED.c Library/Point.c Library/Port.c Library/SPI.c Library/Types.c Library/Console.c HMI.c Library/ADC.c Library/Colours.c Library/I2C.c Library/ISR.c Library/Motor.c Library/MXK.c Library/system.c Library/Timer0.c Library/Timer2.c Events.c Functions.c main.c


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
	${MAKE}  -f nbproject/Makefile-BOOTLOADER.mk dist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F67J50
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Library/Button.p1: Library/Button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Button.p1.d 
	@${RM} ${OBJECTDIR}/Library/Button.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Button.p1  Library/Button.c 
	@-${MV} ${OBJECTDIR}/Library/Button.d ${OBJECTDIR}/Library/Button.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Button.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/LCD.p1: Library/LCD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/LCD.p1.d 
	@${RM} ${OBJECTDIR}/Library/LCD.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/LCD.p1  Library/LCD.c 
	@-${MV} ${OBJECTDIR}/Library/LCD.d ${OBJECTDIR}/Library/LCD.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/LCD.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/LED.p1: Library/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/LED.p1.d 
	@${RM} ${OBJECTDIR}/Library/LED.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/LED.p1  Library/LED.c 
	@-${MV} ${OBJECTDIR}/Library/LED.d ${OBJECTDIR}/Library/LED.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/LED.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Point.p1: Library/Point.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Point.p1.d 
	@${RM} ${OBJECTDIR}/Library/Point.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Point.p1  Library/Point.c 
	@-${MV} ${OBJECTDIR}/Library/Point.d ${OBJECTDIR}/Library/Point.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Point.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Port.p1: Library/Port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Port.p1.d 
	@${RM} ${OBJECTDIR}/Library/Port.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Port.p1  Library/Port.c 
	@-${MV} ${OBJECTDIR}/Library/Port.d ${OBJECTDIR}/Library/Port.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Port.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/SPI.p1: Library/SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/SPI.p1.d 
	@${RM} ${OBJECTDIR}/Library/SPI.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/SPI.p1  Library/SPI.c 
	@-${MV} ${OBJECTDIR}/Library/SPI.d ${OBJECTDIR}/Library/SPI.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/SPI.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Types.p1: Library/Types.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Types.p1.d 
	@${RM} ${OBJECTDIR}/Library/Types.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Types.p1  Library/Types.c 
	@-${MV} ${OBJECTDIR}/Library/Types.d ${OBJECTDIR}/Library/Types.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Types.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Console.p1: Library/Console.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Console.p1.d 
	@${RM} ${OBJECTDIR}/Library/Console.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Console.p1  Library/Console.c 
	@-${MV} ${OBJECTDIR}/Library/Console.d ${OBJECTDIR}/Library/Console.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Console.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HMI.p1: HMI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HMI.p1.d 
	@${RM} ${OBJECTDIR}/HMI.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/HMI.p1  HMI.c 
	@-${MV} ${OBJECTDIR}/HMI.d ${OBJECTDIR}/HMI.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HMI.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/ADC.p1: Library/ADC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/ADC.p1.d 
	@${RM} ${OBJECTDIR}/Library/ADC.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/ADC.p1  Library/ADC.c 
	@-${MV} ${OBJECTDIR}/Library/ADC.d ${OBJECTDIR}/Library/ADC.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/ADC.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Colours.p1: Library/Colours.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Colours.p1.d 
	@${RM} ${OBJECTDIR}/Library/Colours.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Colours.p1  Library/Colours.c 
	@-${MV} ${OBJECTDIR}/Library/Colours.d ${OBJECTDIR}/Library/Colours.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Colours.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/I2C.p1: Library/I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/I2C.p1.d 
	@${RM} ${OBJECTDIR}/Library/I2C.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/I2C.p1  Library/I2C.c 
	@-${MV} ${OBJECTDIR}/Library/I2C.d ${OBJECTDIR}/Library/I2C.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/I2C.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/ISR.p1: Library/ISR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/ISR.p1.d 
	@${RM} ${OBJECTDIR}/Library/ISR.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/ISR.p1  Library/ISR.c 
	@-${MV} ${OBJECTDIR}/Library/ISR.d ${OBJECTDIR}/Library/ISR.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/ISR.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Motor.p1: Library/Motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Motor.p1.d 
	@${RM} ${OBJECTDIR}/Library/Motor.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Motor.p1  Library/Motor.c 
	@-${MV} ${OBJECTDIR}/Library/Motor.d ${OBJECTDIR}/Library/Motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/MXK.p1: Library/MXK.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/MXK.p1.d 
	@${RM} ${OBJECTDIR}/Library/MXK.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/MXK.p1  Library/MXK.c 
	@-${MV} ${OBJECTDIR}/Library/MXK.d ${OBJECTDIR}/Library/MXK.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/MXK.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/system.p1: Library/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/system.p1.d 
	@${RM} ${OBJECTDIR}/Library/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/system.p1  Library/system.c 
	@-${MV} ${OBJECTDIR}/Library/system.d ${OBJECTDIR}/Library/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Timer0.p1: Library/Timer0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Timer0.p1.d 
	@${RM} ${OBJECTDIR}/Library/Timer0.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Timer0.p1  Library/Timer0.c 
	@-${MV} ${OBJECTDIR}/Library/Timer0.d ${OBJECTDIR}/Library/Timer0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Timer0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Timer2.p1: Library/Timer2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Timer2.p1.d 
	@${RM} ${OBJECTDIR}/Library/Timer2.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Timer2.p1  Library/Timer2.c 
	@-${MV} ${OBJECTDIR}/Library/Timer2.d ${OBJECTDIR}/Library/Timer2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Timer2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Events.p1: Events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Events.p1.d 
	@${RM} ${OBJECTDIR}/Events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Events.p1  Events.c 
	@-${MV} ${OBJECTDIR}/Events.d ${OBJECTDIR}/Events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Functions.p1: Functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Functions.p1.d 
	@${RM} ${OBJECTDIR}/Functions.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Functions.p1  Functions.c 
	@-${MV} ${OBJECTDIR}/Functions.d ${OBJECTDIR}/Functions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Functions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main.p1  main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/Library/Button.p1: Library/Button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Button.p1.d 
	@${RM} ${OBJECTDIR}/Library/Button.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Button.p1  Library/Button.c 
	@-${MV} ${OBJECTDIR}/Library/Button.d ${OBJECTDIR}/Library/Button.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Button.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/LCD.p1: Library/LCD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/LCD.p1.d 
	@${RM} ${OBJECTDIR}/Library/LCD.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/LCD.p1  Library/LCD.c 
	@-${MV} ${OBJECTDIR}/Library/LCD.d ${OBJECTDIR}/Library/LCD.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/LCD.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/LED.p1: Library/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/LED.p1.d 
	@${RM} ${OBJECTDIR}/Library/LED.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/LED.p1  Library/LED.c 
	@-${MV} ${OBJECTDIR}/Library/LED.d ${OBJECTDIR}/Library/LED.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/LED.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Point.p1: Library/Point.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Point.p1.d 
	@${RM} ${OBJECTDIR}/Library/Point.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Point.p1  Library/Point.c 
	@-${MV} ${OBJECTDIR}/Library/Point.d ${OBJECTDIR}/Library/Point.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Point.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Port.p1: Library/Port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Port.p1.d 
	@${RM} ${OBJECTDIR}/Library/Port.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Port.p1  Library/Port.c 
	@-${MV} ${OBJECTDIR}/Library/Port.d ${OBJECTDIR}/Library/Port.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Port.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/SPI.p1: Library/SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/SPI.p1.d 
	@${RM} ${OBJECTDIR}/Library/SPI.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/SPI.p1  Library/SPI.c 
	@-${MV} ${OBJECTDIR}/Library/SPI.d ${OBJECTDIR}/Library/SPI.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/SPI.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Types.p1: Library/Types.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Types.p1.d 
	@${RM} ${OBJECTDIR}/Library/Types.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Types.p1  Library/Types.c 
	@-${MV} ${OBJECTDIR}/Library/Types.d ${OBJECTDIR}/Library/Types.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Types.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Console.p1: Library/Console.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Console.p1.d 
	@${RM} ${OBJECTDIR}/Library/Console.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Console.p1  Library/Console.c 
	@-${MV} ${OBJECTDIR}/Library/Console.d ${OBJECTDIR}/Library/Console.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Console.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/HMI.p1: HMI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HMI.p1.d 
	@${RM} ${OBJECTDIR}/HMI.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/HMI.p1  HMI.c 
	@-${MV} ${OBJECTDIR}/HMI.d ${OBJECTDIR}/HMI.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/HMI.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/ADC.p1: Library/ADC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/ADC.p1.d 
	@${RM} ${OBJECTDIR}/Library/ADC.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/ADC.p1  Library/ADC.c 
	@-${MV} ${OBJECTDIR}/Library/ADC.d ${OBJECTDIR}/Library/ADC.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/ADC.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Colours.p1: Library/Colours.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Colours.p1.d 
	@${RM} ${OBJECTDIR}/Library/Colours.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Colours.p1  Library/Colours.c 
	@-${MV} ${OBJECTDIR}/Library/Colours.d ${OBJECTDIR}/Library/Colours.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Colours.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/I2C.p1: Library/I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/I2C.p1.d 
	@${RM} ${OBJECTDIR}/Library/I2C.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/I2C.p1  Library/I2C.c 
	@-${MV} ${OBJECTDIR}/Library/I2C.d ${OBJECTDIR}/Library/I2C.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/I2C.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/ISR.p1: Library/ISR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/ISR.p1.d 
	@${RM} ${OBJECTDIR}/Library/ISR.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/ISR.p1  Library/ISR.c 
	@-${MV} ${OBJECTDIR}/Library/ISR.d ${OBJECTDIR}/Library/ISR.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/ISR.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Motor.p1: Library/Motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Motor.p1.d 
	@${RM} ${OBJECTDIR}/Library/Motor.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Motor.p1  Library/Motor.c 
	@-${MV} ${OBJECTDIR}/Library/Motor.d ${OBJECTDIR}/Library/Motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/MXK.p1: Library/MXK.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/MXK.p1.d 
	@${RM} ${OBJECTDIR}/Library/MXK.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/MXK.p1  Library/MXK.c 
	@-${MV} ${OBJECTDIR}/Library/MXK.d ${OBJECTDIR}/Library/MXK.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/MXK.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/system.p1: Library/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/system.p1.d 
	@${RM} ${OBJECTDIR}/Library/system.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/system.p1  Library/system.c 
	@-${MV} ${OBJECTDIR}/Library/system.d ${OBJECTDIR}/Library/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Timer0.p1: Library/Timer0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Timer0.p1.d 
	@${RM} ${OBJECTDIR}/Library/Timer0.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Timer0.p1  Library/Timer0.c 
	@-${MV} ${OBJECTDIR}/Library/Timer0.d ${OBJECTDIR}/Library/Timer0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Timer0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Library/Timer2.p1: Library/Timer2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Library" 
	@${RM} ${OBJECTDIR}/Library/Timer2.p1.d 
	@${RM} ${OBJECTDIR}/Library/Timer2.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Library/Timer2.p1  Library/Timer2.c 
	@-${MV} ${OBJECTDIR}/Library/Timer2.d ${OBJECTDIR}/Library/Timer2.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Library/Timer2.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Events.p1: Events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Events.p1.d 
	@${RM} ${OBJECTDIR}/Events.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Events.p1  Events.c 
	@-${MV} ${OBJECTDIR}/Events.d ${OBJECTDIR}/Events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/Functions.p1: Functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Functions.p1.d 
	@${RM} ${OBJECTDIR}/Functions.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/Functions.p1  Functions.c 
	@-${MV} ${OBJECTDIR}/Functions.d ${OBJECTDIR}/Functions.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/Functions.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/main.p1: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.p1.d 
	@${RM} ${OBJECTDIR}/main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/main.p1  main.c 
	@-${MV} ${OBJECTDIR}/main.d ${OBJECTDIR}/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=pickit3  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"        $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    pic18f67j50_pim.x.production.hex
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.map  --double=32 --float=32 --emi=wordwrite --rom=default,-0-13FF,-1406-1407,-1416-1417 --opt=+asm,-asmfile,+speed,-space,-debug,-local --addrqual=ignore --mode=free -P -N255 -I"Library" -I"../" -I"./" -I"Library/USB/inc" -I"Library/USB/src" --warn=-3 --asmlist -DXPRJ_BOOTLOADER=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --codeoffset=0x1400 --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
	@echo "Creating unified hex file"
	@"C:/Program Files (x86)/Microchip/MPLABX/v4.00/mplab_ide/platform/../mplab_ide/modules/../../bin/hexmate" --edf="C:/Program Files (x86)/Microchip/MPLABX/v4.00/mplab_ide/platform/../mplab_ide/modules/../../dat/en_msgs.txt" -break=1FFF8  dist/${CND_CONF}/${IMAGE_TYPE}/Code.${IMAGE_TYPE}.hex pic18f67j50_pim.x.production.hex -odist/${CND_CONF}/production/Code.production.unified.hex

endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/BOOTLOADER
	${RM} -r dist/BOOTLOADER

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
