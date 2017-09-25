;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f65j50
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_GetPortProperties
	global	_GetPortPORT
	global	_GetPortTRIS
	global	_GetPortLAT
	global	_Port_CheckPairType
	global	_Port_CheckQuadType
	global	_Port_CheckPortType
	global	_Port_Init
	global	_Port_SetPinType
	global	_Port_SetPin
	global	_Port_GetPin
	global	_Port_SetPairType
	global	_Port_SetPair
	global	_Port_GetPair
	global	_Port_SetQuadType
	global	_Port_SetQuad
	global	_Port_GetQuad
	global	_Port_SetType
	global	_Port_Set
	global	_Port_Get

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget3
	extern	__gptrput3
	extern	__gptrput1
	extern	__gptrget1
	extern	_PMSTATLbits
	extern	_PMSTATHbits
	extern	_PMELbits
	extern	_PMEHbits
	extern	_PMMODELbits
	extern	_PMMODEHbits
	extern	_PMCONLbits
	extern	_PMCONHbits
	extern	_UEP0bits
	extern	_UEP1bits
	extern	_UEP2bits
	extern	_UEP3bits
	extern	_UEP4bits
	extern	_UEP5bits
	extern	_UEP6bits
	extern	_UEP7bits
	extern	_UEP8bits
	extern	_UEP9bits
	extern	_UEP10bits
	extern	_UEP11bits
	extern	_UEP12bits
	extern	_UEP13bits
	extern	_UEP14bits
	extern	_UEP15bits
	extern	_UIEbits
	extern	_UEIEbits
	extern	_UADDRbits
	extern	_UCFGbits
	extern	_UFRMLbits
	extern	_UFRMHbits
	extern	_UIRbits
	extern	_UEIRbits
	extern	_USTATbits
	extern	_UCONbits
	extern	_PMADDRHbits
	extern	_CMSTATbits
	extern	_CMSTATUSbits
	extern	_SSP2CON2bits
	extern	_SSP2CON1bits
	extern	_SSP2STATbits
	extern	_SSP2MSKbits
	extern	_CCP5CONbits
	extern	_CCP4CONbits
	extern	_T4CONbits
	extern	_CVRCONbits
	extern	_T3CONbits
	extern	_BAUDCON2bits
	extern	_BAUDCONbits
	extern	_BAUDCON1bits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_PORTFbits
	extern	_PORTGbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_LATDbits
	extern	_LATEbits
	extern	_LATFbits
	extern	_LATGbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
	extern	_DDRDbits
	extern	_TRISDbits
	extern	_DDREbits
	extern	_TRISEbits
	extern	_DDRFbits
	extern	_TRISFbits
	extern	_DDRGbits
	extern	_TRISGbits
	extern	_OSCTUNEbits
	extern	_RCSTA2bits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_PIE3bits
	extern	_PIR3bits
	extern	_IPR3bits
	extern	_EECON1bits
	extern	_TXSTA2bits
	extern	_RCSTAbits
	extern	_RCSTA1bits
	extern	_TXSTAbits
	extern	_TXSTA1bits
	extern	_CCP3CONbits
	extern	_ECCP3CONbits
	extern	_ECCP3DELbits
	extern	_ECCP3ASbits
	extern	_CCP2CONbits
	extern	_ECCP2CONbits
	extern	_ECCP2DELbits
	extern	_ECCP2ASbits
	extern	_CCP1CONbits
	extern	_ECCP1CONbits
	extern	_ECCP1DELbits
	extern	_ECCP1ASbits
	extern	_WDTCONbits
	extern	_ADCON1bits
	extern	_ANCON0bits
	extern	_ADCON0bits
	extern	_ANCON1bits
	extern	_SSP1CON2bits
	extern	_SSPCON2bits
	extern	_SSP1CON1bits
	extern	_SSPCON1bits
	extern	_SSP1STATbits
	extern	_SSPSTATbits
	extern	_SSP1MSKbits
	extern	_T2CONbits
	extern	_PADCFG1bits
	extern	_ODCON3bits
	extern	_T1CONbits
	extern	_ODCON2bits
	extern	_ODCON1bits
	extern	_RCONbits
	extern	_CM2CONbits
	extern	_CM2CON1bits
	extern	_CM1CONbits
	extern	_CM1CON1bits
	extern	_OSCCONbits
	extern	_REFOCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_PMSTAT
	extern	_PMSTATL
	extern	_PMSTATH
	extern	_PMEL
	extern	_PMEN
	extern	_PMEH
	extern	_PMDIN2
	extern	_PMDIN2L
	extern	_PMDIN2H
	extern	_PMDOUT2
	extern	_PMDOUT2L
	extern	_PMDOUT2H
	extern	_PMMODE
	extern	_PMMODEL
	extern	_PMMODEH
	extern	_PMCON
	extern	_PMCONL
	extern	_PMCONH
	extern	_UEP0
	extern	_UEP1
	extern	_UEP2
	extern	_UEP3
	extern	_UEP4
	extern	_UEP5
	extern	_UEP6
	extern	_UEP7
	extern	_UEP8
	extern	_UEP9
	extern	_UEP10
	extern	_UEP11
	extern	_UEP12
	extern	_UEP13
	extern	_UEP14
	extern	_UEP15
	extern	_UIE
	extern	_UEIE
	extern	_UADDR
	extern	_UCFG
	extern	_UFRM
	extern	_UFRML
	extern	_UFRMH
	extern	_UIR
	extern	_UEIR
	extern	_USTAT
	extern	_UCON
	extern	_PMDIN1
	extern	_PMDIN1L
	extern	_PMDIN1H
	extern	_PMADDR
	extern	_PMADDRL
	extern	_PMDOUT1
	extern	_PMDOUT1L
	extern	_PMADDRH
	extern	_PMDOUT1H
	extern	_CMSTAT
	extern	_CMSTATUS
	extern	_SSP2CON2
	extern	_SSP2CON1
	extern	_SSP2STAT
	extern	_SSP2ADD
	extern	_SSP2MSK
	extern	_SSP2BUF
	extern	_CCP5CON
	extern	_CCPR5
	extern	_CCPR5L
	extern	_CCPR5H
	extern	_CCP4CON
	extern	_CCPR4
	extern	_CCPR4L
	extern	_CCPR4H
	extern	_T4CON
	extern	_CVRCON
	extern	_PR4
	extern	_TMR4
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_BAUDCON2
	extern	_SPBRGH2
	extern	_BAUDCON
	extern	_BAUDCON1
	extern	_SPBRGH
	extern	_SPBRGH1
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_PORTF
	extern	_PORTG
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_LATD
	extern	_LATE
	extern	_LATF
	extern	_LATG
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
	extern	_DDRD
	extern	_TRISD
	extern	_DDRE
	extern	_TRISE
	extern	_DDRF
	extern	_TRISF
	extern	_DDRG
	extern	_TRISG
	extern	_OSCTUNE
	extern	_RCSTA2
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_PIE3
	extern	_PIR3
	extern	_IPR3
	extern	_EECON1
	extern	_EECON2
	extern	_TXSTA2
	extern	_TXREG2
	extern	_RCREG2
	extern	_SPBRG2
	extern	_RCSTA
	extern	_RCSTA1
	extern	_TXSTA
	extern	_TXSTA1
	extern	_TXREG
	extern	_TXREG1
	extern	_RCREG
	extern	_RCREG1
	extern	_SPBRG
	extern	_SPBRG1
	extern	_CCP3CON
	extern	_ECCP3CON
	extern	_CCPR3
	extern	_CCPR3L
	extern	_CCPR3H
	extern	_ECCP3DEL
	extern	_ECCP3AS
	extern	_CCP2CON
	extern	_ECCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_ECCP2DEL
	extern	_ECCP2AS
	extern	_CCP1CON
	extern	_ECCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ECCP1DEL
	extern	_ECCP1AS
	extern	_WDTCON
	extern	_ADCON1
	extern	_ANCON0
	extern	_ADCON0
	extern	_ANCON1
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSP1CON2
	extern	_SSPCON2
	extern	_SSP1CON1
	extern	_SSPCON1
	extern	_SSP1STAT
	extern	_SSPSTAT
	extern	_SSP1ADD
	extern	_SSP1MSK
	extern	_SSPADD
	extern	_SSP1BUF
	extern	_SSPBUF
	extern	_T2CON
	extern	_PR2
	extern	_PADCFG1
	extern	_TMR2
	extern	_ODCON3
	extern	_T1CON
	extern	_ODCON2
	extern	_TMR1
	extern	_TMR1L
	extern	_ODCON1
	extern	_TMR1H
	extern	_RCON
	extern	_CM2CON
	extern	_CM2CON1
	extern	_CM1CON
	extern	_CM1CON1
	extern	_OSCCON
	extern	_REFOCON
	extern	_T0CON
	extern	_TMR0
	extern	_TMR0L
	extern	_TMR0H
	extern	_STATUS
	extern	_FSR2L
	extern	_FSR2H
	extern	_PLUSW2
	extern	_PREINC2
	extern	_POSTDEC2
	extern	_POSTINC2
	extern	_INDF2
	extern	_BSR
	extern	_FSR1L
	extern	_FSR1H
	extern	_PLUSW1
	extern	_PREINC1
	extern	_POSTDEC1
	extern	_POSTINC1
	extern	_INDF1
	extern	_WREG
	extern	_FSR0L
	extern	_FSR0H
	extern	_PLUSW0
	extern	_PREINC0
	extern	_POSTDEC0
	extern	_POSTINC0
	extern	_INDF0
	extern	_INTCON3
	extern	_INTCON2
	extern	_INTCON
	extern	_PROD
	extern	_PRODL
	extern	_PRODH
	extern	_TABLAT
	extern	_TBLPTR
	extern	_TBLPTRL
	extern	_TBLPTRH
	extern	_TBLPTRU
	extern	_PC
	extern	_PCL
	extern	_PCLATH
	extern	_PCLATU
	extern	_STKPTR
	extern	_TOS
	extern	_TOSL
	extern	_TOSH
	extern	_TOSU
	extern	_Byte_SetBit
	extern	_Byte_SetPair
	extern	_Byte_SetQuad
	extern	_Byte_SetPort
	extern	_Word_SetPair
	extern	_Word_GetPair
	extern	_PortProperty_Valid

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_Port__Port_Get	code
_Port_Get:
;	.line	575; Port.c	UINT8		Port_Get		(PortPtr pInput)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	577; Port.c	return pInput->mInput->mBits & 0xFF;
	MOVLW	0x09
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	ANDLW	0xff
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_Set	code
_Port_Set:
;	.line	532; Port.c	void		Port_Set		(PortPtr pInput, UINT8 pValue)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	534; Port.c	ePinType	Type = (ePinType)Word_GetPair(&pInput->mType, 0);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x04
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	535; Port.c	UINT16		TypeRequired = Type | (Type << 2) | (Type << 4) | (Type << 6) | (Type << 8) | (Type << 10) | (Type << 12) | (Type << 14);
	MOVFF	r0x04, r0x05
	CLRF	r0x06
	MOVF	r0x05, W
	MOVWF	r0x07
	ADDWF	r0x07, F
	RLCF	r0x06, W
	MOVWF	r0x08
	BCF	STATUS, 0
	RLCF	r0x07, F
	RLCF	r0x08, F
	MOVF	r0x05, W
	IORWF	r0x07, F
	MOVF	r0x06, W
	IORWF	r0x08, F
	SWAPF	r0x06, W
	ANDLW	0xf0
	MOVWF	r0x0a
	SWAPF	r0x05, W
	MOVWF	r0x09
	ANDLW	0x0f
	XORWF	r0x09, F
	ADDWF	r0x0a, F
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	RRNCF	r0x05, W
	MOVWF	r0x09
	RRNCF	r0x09, F
	RRNCF	r0x06, W
	MOVWF	r0x0a
	RRNCF	r0x0a, F
	MOVLW	0xc0
	ANDWF	r0x0a, F
	ANDWF	r0x09, W
	XORWF	r0x09, W
	IORWF	r0x0a, F
	XORWF	r0x09, F
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	MOVF	r0x05, W
	MOVWF	r0x0a
	CLRF	r0x09
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	RLNCF	r0x05, W
	RLNCF	WREG, W
	ANDLW	0xfc
	MOVWF	r0x0a
	CLRF	r0x09
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	SWAPF	r0x05, W
	ANDLW	0xf0
	MOVWF	r0x0a
	CLRF	r0x09
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
	RRNCF	r0x05, W
	RRNCF	WREG, W
	ANDLW	0xc0
	MOVWF	r0x0a
	CLRF	r0x09
	MOVF	r0x09, W
	IORWF	r0x07, W
	MOVWF	r0x05
	MOVF	r0x0a, W
	IORWF	r0x08, W
	MOVWF	r0x06
;	.line	536; Port.c	UINT16		TypeActual = Type;
	MOVFF	r0x04, r0x07
	CLRF	r0x08
;	.line	537; Port.c	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 1) << 2;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x0a
	MOVF	r0x09, W
	MOVWF	r0x0b
	ADDWF	r0x0b, F
	RLCF	r0x0a, W
	MOVWF	r0x0c
	BCF	STATUS, 0
	RLCF	r0x0b, F
	RLCF	r0x0c, F
	MOVF	r0x0b, W
	MOVWF	r0x09
	MOVF	r0x0c, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
;	.line	538; Port.c	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 2) << 4;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x0a
	SWAPF	r0x0a, W
	ANDLW	0xf0
	MOVWF	r0x0c
	SWAPF	r0x09, W
	MOVWF	r0x0b
	ANDLW	0x0f
	XORWF	r0x0b, F
	ADDWF	r0x0c, F
	MOVF	r0x0b, W
	MOVWF	r0x09
	MOVF	r0x0c, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
;	.line	539; Port.c	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 3) << 6;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x0a
	RRNCF	r0x09, W
	MOVWF	r0x0b
	RRNCF	r0x0b, F
	RRNCF	r0x0a, W
	MOVWF	r0x0c
	RRNCF	r0x0c, F
	MOVLW	0xc0
	ANDWF	r0x0c, F
	ANDWF	r0x0b, W
	XORWF	r0x0b, W
	IORWF	r0x0c, F
	XORWF	r0x0b, F
	MOVF	r0x0b, W
	MOVWF	r0x09
	MOVF	r0x0c, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
;	.line	540; Port.c	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 4) << 8;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x0a
	MOVF	r0x09, W
	MOVWF	r0x0c
	CLRF	r0x0b
	MOVF	r0x0b, W
	MOVWF	r0x09
	MOVF	r0x0c, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
;	.line	541; Port.c	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 5) << 10;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x0a
	RLNCF	r0x09, W
	RLNCF	WREG, W
	ANDLW	0xfc
	MOVWF	r0x0c
	CLRF	r0x0b
	MOVF	r0x0b, W
	MOVWF	r0x09
	MOVF	r0x0c, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
;	.line	542; Port.c	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 6) << 12;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x0a
	SWAPF	r0x09, W
	ANDLW	0xf0
	MOVWF	r0x0c
	CLRF	r0x0b
	MOVF	r0x0b, W
	MOVWF	r0x09
	MOVF	r0x0c, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
;	.line	543; Port.c	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, 7) << 14;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	CLRF	r0x0a
	RRNCF	r0x09, W
	RRNCF	WREG, W
	ANDLW	0xc0
	MOVWF	r0x0c
	CLRF	r0x0b
	MOVF	r0x0b, W
	MOVWF	r0x09
	MOVF	r0x0c, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	IORWF	r0x07, F
	MOVF	r0x0a, W
	IORWF	r0x08, F
;	.line	546; Port.c	if (TypeRequired == TypeActual)
	MOVF	r0x05, W
	XORWF	r0x07, W
	BNZ	_00506_DS_
	MOVF	r0x06, W
	XORWF	r0x08, W
	BZ	_00507_DS_
_00506_DS_:
	BRA	_00484_DS_
_00507_DS_:
;	.line	549; Port.c	switch (Type)
	MOVLW	0x04
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00484_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x04, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00509_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00509_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00509_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00509_DS_:
	GOTO	_00476_DS_
	GOTO	_00477_DS_
	GOTO	_00478_DS_
	GOTO	_00479_DS_
_00476_DS_:
;	.line	552; Port.c	return;
	BRA	_00484_DS_
_00477_DS_:
;	.line	555; Port.c	Byte_SetPort(pInput->mDirection, pValue);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPort
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	556; Port.c	break;
	BRA	_00484_DS_
_00478_DS_:
;	.line	559; Port.c	pValue = ~pValue;
	COMF	r0x03, F
;	.line	560; Port.c	Byte_SetPort(pInput->mDirection, pValue);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPort
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	561; Port.c	break;
	BRA	_00484_DS_
_00479_DS_:
;	.line	564; Port.c	Byte_SetPort(pInput->mOutput, pValue);
	MOVLW	0x06
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPort
	MOVLW	0x04
	ADDWF	FSR1L, F
_00484_DS_:
;	.line	568; Port.c	}
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_SetType	code
_Port_SetType:
;	.line	475; Port.c	ePinError	Port_SetType	(PortPtr pInput, ePinType pType)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	477; Port.c	ePinError Output = ePinErrorState;
	MOVLW	0x05
	MOVWF	r0x04
;	.line	479; Port.c	switch (pType)
	MOVLW	0x04
	SUBWF	r0x03, W
	BTFSC	STATUS, 0
	BRA	_00452_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x03, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00471_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00471_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00471_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00471_DS_:
	GOTO	_00435_DS_
	GOTO	_00439_DS_
	GOTO	_00443_DS_
	GOTO	_00447_DS_
_00435_DS_:
;	.line	483; Port.c	if ((Output=Port_CheckPortType(pInput, eNone)) == ePinErrorNone)
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPortType
	MOVWF	r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x05, r0x04
	MOVF	r0x05, W
	BNZ	_00437_DS_
;	.line	484; Port.c	pInput->mDirection->mBits = 0xFF;
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	BRA	_00452_DS_
_00437_DS_:
;	.line	485; Port.c	else return Output;
	MOVF	r0x04, W
	BRA	_00453_DS_
_00439_DS_:
;	.line	488; Port.c	if ((Output=Port_CheckPortType(pInput, eLow)) == ePinErrorNone)
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPortType
	MOVWF	r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x05, r0x04
	MOVF	r0x05, W
	BTFSS	STATUS, 2
	BRA	_00441_DS_
;	.line	491; Port.c	pInput->mDirection->mBits = 0x00;
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	494; Port.c	pInput->mOutput->mBits = 0x00;
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	BRA	_00452_DS_
_00441_DS_:
;	.line	496; Port.c	else return Output;
	MOVF	r0x04, W
	BRA	_00453_DS_
_00443_DS_:
;	.line	499; Port.c	if ((Output=Port_CheckPortType(pInput, eHigh)) == ePinErrorNone)
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPortType
	MOVWF	r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x05, r0x04
	MOVF	r0x05, W
	BTFSS	STATUS, 2
	BRA	_00445_DS_
;	.line	502; Port.c	pInput->mDirection->mBits = 0xFF;
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	505; Port.c	pInput->mOutput->mBits = 0xFF;
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	BRA	_00452_DS_
_00445_DS_:
;	.line	507; Port.c	else return Output;
	MOVF	r0x04, W
	BRA	_00453_DS_
_00447_DS_:
;	.line	510; Port.c	if ((Output=Port_CheckPortType(pInput, eHL)) == ePinErrorNone)
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPortType
	MOVWF	r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	r0x05, r0x04
	MOVF	r0x05, W
	BNZ	_00449_DS_
;	.line	513; Port.c	pInput->mDirection->mBits = 0x00;
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
	BRA	_00452_DS_
_00449_DS_:
;	.line	515; Port.c	else return Output;
	MOVF	r0x04, W
	BRA	_00453_DS_
_00452_DS_:
;	.line	522; Port.c	Word_SetPair(&pInput->mType, 0, (UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	523; Port.c	Word_SetPair(&pInput->mType, 1, (UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	524; Port.c	Word_SetPair(&pInput->mType, 2, (UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	525; Port.c	Word_SetPair(&pInput->mType, 3, (UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	526; Port.c	Word_SetPair(&pInput->mType, 4, (UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	527; Port.c	Word_SetPair(&pInput->mType, 5, (UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	528; Port.c	Word_SetPair(&pInput->mType, 6, (UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	529; Port.c	Word_SetPair(&pInput->mType, 7, (UINT8)pType);
	MOVLW	0x0c
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x07
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	530; Port.c	return Output;
	MOVF	r0x04, W
_00453_DS_:
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_GetQuad	code
_Port_GetQuad:
;	.line	467; Port.c	UINT8		Port_GetQuad	(PortPtr pInput, eQuad pQuad)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	469; Port.c	UINT8 Output = pInput->mInput->mBits;
	MOVLW	0x09
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	ANDLW	0xff
	MOVWF	r0x00
; ;multiply lit val:0x04 by variable r0x03 and store in r0x03
;	.line	470; Port.c	Output >>= ((UINT8)pQuad * 4);
	MOVF	r0x03, W
	MULLW	0x04
	MOVF	PRODH, W
	MOVWF	r0x01
	MOVFF	PRODL, r0x03
	MOVF	r0x03, W
	BZ	_00427_DS_
	BN	_00430_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00428_DS_:
	RRCF	r0x00, F
	ADDLW	0x01
	BNC	_00428_DS_
	BRA	_00427_DS_
_00430_DS_:
	BCF	STATUS, 0
_00429_DS_:
	RLCF	r0x00, F
	ADDLW	0x01
	BNC	_00429_DS_
_00427_DS_:
;	.line	471; Port.c	Output &= 0b1111;
	MOVLW	0x0f
	ANDWF	r0x00, F
;	.line	472; Port.c	return Output;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_SetQuad	code
_Port_SetQuad:
;	.line	429; Port.c	void		Port_SetQuad	(PortPtr pInput, eQuad pQuad, UINT8 pValue)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	431; Port.c	ePinType	Type			= (ePinType)Word_GetPair(&pInput->mType, ((UINT8)pQuad) * 4);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
; ;multiply lit val:0x04 by variable r0x03 and store in r0x08
	MOVF	r0x03, W
	MULLW	0x04
	MOVFF	PRODL, r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	432; Port.c	UINT8		TypeRequired	= Type | (Type << 2) | (Type << 4) | (Type << 6);
	RLNCF	r0x05, W
	RLNCF	WREG, W
	ANDLW	0xfc
	MOVWF	r0x06
	MOVF	r0x05, W
	IORWF	r0x06, F
	SWAPF	r0x05, W
	ANDLW	0xf0
	MOVWF	r0x07
	MOVF	r0x07, W
	IORWF	r0x06, F
	RRNCF	r0x05, W
	RRNCF	WREG, W
	ANDLW	0xc0
	MOVWF	r0x07
	MOVF	r0x07, W
	IORWF	r0x06, F
;	.line	435; Port.c	TypeActual |=	(ePinType)Word_GetPair(&pInput->mType, (UINT8)pQuad * 4 + 1) << 2;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0a
	INCF	r0x08, W
	MOVWF	r0x0b
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x07
	MOVLW	0x04
	ADDWF	FSR1L, F
	RLNCF	r0x07, W
	RLNCF	WREG, W
	ANDLW	0xfc
	MOVWF	r0x09
	MOVF	r0x09, W
	IORWF	r0x05, W
	MOVWF	r0x07
;	.line	436; Port.c	TypeActual |=	(ePinType)Word_GetPair(&pInput->mType, (UINT8)pQuad * 4 + 2) << 4;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x02
	ADDWF	r0x08, W
	MOVWF	r0x0c
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x09
	MOVLW	0x04
	ADDWF	FSR1L, F
	SWAPF	r0x09, W
	ANDLW	0xf0
	MOVWF	r0x0a
	MOVF	r0x0a, W
	IORWF	r0x07, F
;	.line	437; Port.c	TypeActual |=	(ePinType)Word_GetPair(&pInput->mType, (UINT8)pQuad * 4 + 3) << 6;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x03
	ADDWF	r0x08, F
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x08
	MOVLW	0x04
	ADDWF	FSR1L, F
	RRNCF	r0x08, W
	RRNCF	WREG, W
	ANDLW	0xc0
	MOVWF	r0x09
	MOVF	r0x09, W
	IORWF	r0x07, F
;	.line	440; Port.c	if (TypeRequired == TypeActual)
	MOVF	r0x06, W
	XORWF	r0x07, W
	BZ	_00418_DS_
	BRA	_00403_DS_
_00418_DS_:
;	.line	442; Port.c	switch (Type)
	MOVLW	0x04
	SUBWF	r0x05, W
	BTFSC	STATUS, 0
	BRA	_00403_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x05, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00420_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00420_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00420_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00420_DS_:
	GOTO	_00395_DS_
	GOTO	_00396_DS_
	GOTO	_00397_DS_
	GOTO	_00398_DS_
_00395_DS_:
;	.line	445; Port.c	return;
	BRA	_00403_DS_
_00396_DS_:
;	.line	448; Port.c	pValue &= 0xF;
	MOVLW	0x0f
	ANDWF	r0x04, F
;	.line	449; Port.c	Byte_SetQuad(pInput->mDirection, pQuad, pValue);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	450; Port.c	break;
	BRA	_00403_DS_
_00397_DS_:
;	.line	453; Port.c	pValue &= 0xF;
	MOVLW	0x0f
	ANDWF	r0x04, F
;	.line	454; Port.c	pValue = ~pValue;
	COMF	r0x04, F
;	.line	455; Port.c	Byte_SetQuad(pInput->mDirection, pQuad, pValue);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	456; Port.c	break;
	BRA	_00403_DS_
_00398_DS_:
;	.line	459; Port.c	pValue &= 0xF;
	MOVLW	0x0f
	ANDWF	r0x04, F
;	.line	460; Port.c	Byte_SetQuad(pInput->mOutput, pQuad, pValue);
	MOVLW	0x06
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
_00403_DS_:
;	.line	464; Port.c	};
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_SetQuadType	code
_Port_SetQuadType:
;	.line	368; Port.c	ePinError	Port_SetQuadType(PortPtr pInput, eQuad pQuad, ePinType pType)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	370; Port.c	ePinError Output = ePinErrorState;
	MOVLW	0x05
	MOVWF	r0x05
;	.line	372; Port.c	switch (pType)
	MOVLW	0x04
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00371_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x04, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00390_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00390_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00390_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00390_DS_:
	GOTO	_00354_DS_
	GOTO	_00358_DS_
	GOTO	_00362_DS_
	GOTO	_00366_DS_
_00354_DS_:
;	.line	375; Port.c	if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckQuadType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x05
	MOVF	r0x06, W
	BTFSS	STATUS, 2
	BRA	_00356_DS_
;	.line	378; Port.c	Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0b1111);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	381; Port.c	Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0b0000);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00371_DS_
_00356_DS_:
;	.line	383; Port.c	else return Output;
	MOVF	r0x05, W
	BRA	_00372_DS_
_00358_DS_:
;	.line	386; Port.c	if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckQuadType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x05
	MOVF	r0x06, W
	BTFSS	STATUS, 2
	BRA	_00360_DS_
;	.line	389; Port.c	Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0b0000);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	392; Port.c	Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0b0000);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00371_DS_
_00360_DS_:
;	.line	394; Port.c	else return Output;
	MOVF	r0x05, W
	BRA	_00372_DS_
_00362_DS_:
;	.line	397; Port.c	if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckQuadType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x05
	MOVF	r0x06, W
	BTFSS	STATUS, 2
	BRA	_00364_DS_
;	.line	400; Port.c	Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0b1111);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	403; Port.c	Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0b1111);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00371_DS_
_00364_DS_:
;	.line	405; Port.c	else return Output;
	MOVF	r0x05, W
	BRA	_00372_DS_
_00366_DS_:
;	.line	408; Port.c	if ((Output = Port_CheckQuadType(pInput, pQuad, eNone)) == ePinErrorNone)
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckQuadType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x05
	MOVF	r0x06, W
	BTFSS	STATUS, 2
	BRA	_00368_DS_
;	.line	411; Port.c	Byte_SetQuad(pInput->mDirection, (UINT8)pQuad, 0b0000);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	414; Port.c	Byte_SetQuad(pInput->mOutput, (UINT8)pQuad, 0b0000);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetQuad
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00371_DS_
_00368_DS_:
;	.line	416; Port.c	else return Output;
	MOVF	r0x05, W
	BRA	_00372_DS_
_00371_DS_:
;	.line	423; Port.c	Word_SetPair(&pInput->mType, (UINT8)pQuad * 4,		(UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
; ;multiply lit val:0x04 by variable r0x03 and store in r0x03
	MOVF	r0x03, W
	MULLW	0x04
	MOVFF	PRODL, r0x03
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	424; Port.c	Word_SetPair(&pInput->mType, (UINT8)pQuad * 4 + 1,	(UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	INCF	r0x03, W
	MOVWF	r0x09
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	425; Port.c	Word_SetPair(&pInput->mType, (UINT8)pQuad * 4 + 2,	(UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVLW	0x02
	ADDWF	r0x03, W
	MOVWF	r0x09
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	426; Port.c	Word_SetPair(&pInput->mType, (UINT8)pQuad * 4 + 3,	(UINT8)pType);
	MOVLW	0x0c
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVLW	0x03
	ADDWF	r0x03, F
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	427; Port.c	return Output;
	MOVF	r0x05, W
_00372_DS_:
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_GetPair	code
_Port_GetPair:
;	.line	360; Port.c	UINT8		Port_GetPair	(PortPtr pInput, ePair pPair)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	362; Port.c	UINT8 Output = pInput->mInput->mBits;
	MOVLW	0x09
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	ANDLW	0xff
	MOVWF	r0x00
; ;multiply lit val:0x02 by variable r0x03 and store in r0x03
;	.line	363; Port.c	Output >>= ((UINT8)pPair * 2);
	MOVF	r0x03, W
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x01
	MOVFF	PRODL, r0x03
	MOVF	r0x03, W
	BZ	_00346_DS_
	BN	_00349_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00347_DS_:
	RRCF	r0x00, F
	ADDLW	0x01
	BNC	_00347_DS_
	BRA	_00346_DS_
_00349_DS_:
	BCF	STATUS, 0
_00348_DS_:
	RLCF	r0x00, F
	ADDLW	0x01
	BNC	_00348_DS_
_00346_DS_:
;	.line	364; Port.c	Output &= 0b11;
	MOVLW	0x03
	ANDWF	r0x00, F
;	.line	365; Port.c	return Output;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_SetPair	code
_Port_SetPair:
;	.line	321; Port.c	void		Port_SetPair	(PortPtr pInput, ePair pPair, UINT8 pValue)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	323; Port.c	ePinType	Type = (ePinType)Word_GetPair(&pInput->mType, ((UINT8)pPair) * 2);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
; ;multiply lit val:0x02 by variable r0x03 and store in r0x08
	MOVF	r0x03, W
	MULLW	0x02
	MOVFF	PRODL, r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	324; Port.c	UINT8		TypeRequired = Type | (Type << 2);
	RLNCF	r0x05, W
	RLNCF	WREG, W
	ANDLW	0xfc
	MOVWF	r0x06
	MOVF	r0x05, W
	IORWF	r0x06, F
;	.line	326; Port.c	TypeActual |= (ePinType)Word_GetPair(&pInput->mType, (UINT8)pPair * 2 + 1) << 2;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0a
	INCF	r0x08, F
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x07
	MOVLW	0x04
	ADDWF	FSR1L, F
	RLNCF	r0x07, W
	RLNCF	WREG, W
	ANDLW	0xfc
	MOVWF	r0x08
	MOVF	r0x08, W
	IORWF	r0x05, W
	MOVWF	r0x07
;	.line	329; Port.c	if (TypeRequired == TypeActual)
	MOVF	r0x06, W
	XORWF	r0x07, W
	BZ	_00337_DS_
	BRA	_00326_DS_
_00337_DS_:
;	.line	331; Port.c	switch (Type)
	MOVLW	0x04
	SUBWF	r0x05, W
	BTFSC	STATUS, 0
	BRA	_00326_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x05, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00339_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00339_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00339_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00339_DS_:
	GOTO	_00318_DS_
	GOTO	_00319_DS_
	GOTO	_00320_DS_
	GOTO	_00321_DS_
_00318_DS_:
;	.line	334; Port.c	return;
	BRA	_00326_DS_
_00319_DS_:
;	.line	337; Port.c	pValue &= 0x03;
	MOVLW	0x03
	ANDWF	r0x04, F
;	.line	338; Port.c	Byte_SetPair(pInput->mDirection, pPair, pValue);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	339; Port.c	break;
	BRA	_00326_DS_
_00320_DS_:
;	.line	342; Port.c	pValue = ~pValue;
	COMF	r0x04, F
;	.line	343; Port.c	pValue &= 0x03;
	MOVLW	0x03
	ANDWF	r0x04, F
;	.line	344; Port.c	Byte_SetPair(pInput->mDirection, pPair, pValue);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	345; Port.c	break;
	BRA	_00326_DS_
_00321_DS_:
;	.line	348; Port.c	pValue &= 0x03;
	MOVLW	0x03
	ANDWF	r0x04, F
;	.line	349; Port.c	Byte_SetPair(pInput->mOutput, pPair, pValue);
	MOVLW	0x06
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
_00326_DS_:
;	.line	353; Port.c	}
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_SetPairType	code
_Port_SetPairType:
;	.line	262; Port.c	ePinError	Port_SetPairType(PortPtr pInput, ePair pPair, ePinType pType)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	264; Port.c	ePinError Output = ePinErrorState;
	MOVLW	0x05
	MOVWF	r0x05
;	.line	266; Port.c	switch (pType)
	MOVLW	0x04
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00294_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x04, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00313_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00313_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00313_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00313_DS_:
	GOTO	_00277_DS_
	GOTO	_00281_DS_
	GOTO	_00285_DS_
	GOTO	_00289_DS_
_00277_DS_:
;	.line	269; Port.c	if ( (Output=Port_CheckPairType(pInput, pPair, eNone)) == ePinErrorNone)
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPairType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x05
	MOVF	r0x06, W
	BTFSS	STATUS, 2
	BRA	_00279_DS_
;	.line	272; Port.c	Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0b11);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	275; Port.c	Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0b00);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00294_DS_
_00279_DS_:
;	.line	277; Port.c	else return Output;
	MOVF	r0x05, W
	BRA	_00295_DS_
_00281_DS_:
;	.line	280; Port.c	if ((Output = Port_CheckPairType(pInput, pPair, eLow)) == ePinErrorNone)
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPairType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x05
	MOVF	r0x06, W
	BTFSS	STATUS, 2
	BRA	_00283_DS_
;	.line	283; Port.c	Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0b00);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	286; Port.c	Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0b00);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00294_DS_
_00283_DS_:
;	.line	288; Port.c	else return Output;
	MOVF	r0x05, W
	BRA	_00295_DS_
_00285_DS_:
;	.line	291; Port.c	if ((Output = Port_CheckPairType(pInput, pPair, eHigh)) == ePinErrorNone)
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPairType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x05
	MOVF	r0x06, W
	BTFSS	STATUS, 2
	BRA	_00287_DS_
;	.line	294; Port.c	Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0b11);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	297; Port.c	Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0b11);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00294_DS_
_00287_DS_:
;	.line	299; Port.c	else return Output;
	MOVF	r0x05, W
	BRA	_00295_DS_
_00289_DS_:
;	.line	302; Port.c	if ((Output = Port_CheckPairType(pInput, pPair, eHL)) == ePinErrorNone)
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPairType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x06, r0x05
	MOVF	r0x06, W
	BTFSS	STATUS, 2
	BRA	_00291_DS_
;	.line	305; Port.c	Byte_SetPair(pInput->mDirection, (UINT8)pPair, 0b00);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	308; Port.c	Byte_SetPair(pInput->mOutput, (UINT8)pPair, 0b00);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget3
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00294_DS_
_00291_DS_:
;	.line	310; Port.c	else return Output;
	MOVF	r0x05, W
	BRA	_00295_DS_
_00294_DS_:
;	.line	317; Port.c	Word_SetPair(&pInput->mType, (UINT8)pPair * 2,		(UINT8)pType);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
; ;multiply lit val:0x02 by variable r0x03 and store in r0x03
	MOVF	r0x03, W
	MULLW	0x02
	MOVFF	PRODL, r0x03
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	318; Port.c	Word_SetPair(&pInput->mType, (UINT8)pPair * 2 + 1,	(UINT8)pType);
	MOVLW	0x0c
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	INCF	r0x03, F
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	319; Port.c	return Output;
	MOVF	r0x05, W
_00295_DS_:
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_GetPin	code
_Port_GetPin:
;	.line	254; Port.c	UINT8		Port_GetPin		(PortPtr pInput, ePin pPin)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	256; Port.c	UINT8 Output = pInput->mInput->mBits;
	MOVLW	0x09
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	ANDLW	0xff
	MOVWF	r0x00
;	.line	257; Port.c	Output >>= (UINT8)pPin;
	MOVF	r0x03, W
	BZ	_00271_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00272_DS_:
	RRCF	r0x00, F
	ADDLW	0x01
	BNC	_00272_DS_
_00271_DS_:
;	.line	258; Port.c	Output &= 0b1;
	MOVLW	0x01
	ANDWF	r0x00, F
;	.line	259; Port.c	return Output;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_SetPin	code
_Port_SetPin:
;	.line	228; Port.c	void		Port_SetPin		(PortPtr pInput, ePin pPin, UINT8 pValue)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	230; Port.c	ePinType Type = (ePinType)Word_GetPair(&pInput->mType, (UINT8)pPin);
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Word_GetPair
	MOVWF	r0x05
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	231; Port.c	switch (Type)
	MOVLW	0x04
	SUBWF	r0x05, W
	BTFSC	STATUS, 0
	BRA	_00258_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x05, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00264_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00264_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00264_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00264_DS_:
	GOTO	_00252_DS_
	GOTO	_00253_DS_
	GOTO	_00254_DS_
	GOTO	_00255_DS_
_00252_DS_:
;	.line	234; Port.c	return;
	BRA	_00258_DS_
_00253_DS_:
;	.line	237; Port.c	pValue &= 1;
	MOVLW	0x01
	ANDWF	r0x04, F
;	.line	238; Port.c	Byte_SetBit(pInput->mDirection, pPin, pValue);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	239; Port.c	break;
	BRA	_00258_DS_
_00254_DS_:
;	.line	242; Port.c	pValue = ~pValue;
	COMF	r0x04, F
;	.line	243; Port.c	pValue &= 1;
	MOVLW	0x01
	ANDWF	r0x04, F
;	.line	244; Port.c	Byte_SetBit(pInput->mDirection, pPin, pValue);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	245; Port.c	break;
	BRA	_00258_DS_
_00255_DS_:
;	.line	247; Port.c	pValue &= 1;
	MOVLW	0x01
	ANDWF	r0x04, F
;	.line	248; Port.c	Byte_SetBit(pInput->mDirection, pPin, pValue);
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
_00258_DS_:
;	.line	252; Port.c	}
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_SetPinType	code
_Port_SetPinType:
;	.line	168; Port.c	ePinError	Port_SetPinType	(PortPtr pInput, ePin pPin, ePinType pType)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	170; Port.c	PortProperty* Props = (PortProperty*)&(pInput->mProperties->mWord);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVF	r0x07, W
	MOVWF	r0x07
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x05, W
	MOVWF	r0x05
;	.line	171; Port.c	ePinError Output = ePinErrorState;
	MOVLW	0x05
	MOVWF	r0x08
;	.line	173; Port.c	switch (pType)
	MOVLW	0x04
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00228_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x04, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00247_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00247_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00247_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00247_DS_:
	GOTO	_00211_DS_
	GOTO	_00215_DS_
	GOTO	_00219_DS_
	GOTO	_00223_DS_
_00211_DS_:
;	.line	176; Port.c	if ((Output = PortProperty_Valid(Props, eLow, pPin)) == ePinErrorNone)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_PortProperty_Valid
	MOVWF	r0x09
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x09, r0x08
	MOVF	r0x09, W
	BTFSS	STATUS, 2
	BRA	_00213_DS_
;	.line	179; Port.c	Byte_SetBit(pInput->mDirection, (UINT8)pPin, 1);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget3
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	182; Port.c	Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget3
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00228_DS_
_00213_DS_:
;	.line	184; Port.c	else return Output;
	MOVF	r0x08, W
	BRA	_00229_DS_
_00215_DS_:
;	.line	187; Port.c	if ((Output = PortProperty_Valid(Props, eLow, pPin)) == ePinErrorNone)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_PortProperty_Valid
	MOVWF	r0x09
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x09, r0x08
	MOVF	r0x09, W
	BTFSS	STATUS, 2
	BRA	_00217_DS_
;	.line	190; Port.c	Byte_SetBit(pInput->mDirection, (UINT8)pPin, 0);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget3
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	193; Port.c	Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget3
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00228_DS_
_00217_DS_:
;	.line	195; Port.c	else return Output;
	MOVF	r0x08, W
	BRA	_00229_DS_
_00219_DS_:
;	.line	198; Port.c	if ((Output = PortProperty_Valid(Props, eHigh, pPin)) == ePinErrorNone)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_PortProperty_Valid
	MOVWF	r0x09
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x09, r0x08
	MOVF	r0x09, W
	BTFSS	STATUS, 2
	BRA	_00221_DS_
;	.line	201; Port.c	Byte_SetBit(pInput->mDirection, (UINT8)pPin, 1);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget3
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	204; Port.c	Byte_SetBit(pInput->mOutput, (UINT8)pPin, 1);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget3
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00228_DS_
_00221_DS_:
;	.line	206; Port.c	else return Output;
	MOVF	r0x08, W
	BRA	_00229_DS_
_00223_DS_:
;	.line	209; Port.c	if ((Output = PortProperty_Valid(Props, eHL, pPin)) == ePinErrorNone)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_PortProperty_Valid
	MOVWF	r0x05
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x05, r0x08
	MOVF	r0x05, W
	BTFSS	STATUS, 2
	BRA	_00225_DS_
;	.line	212; Port.c	Byte_SetBit(pInput->mDirection, (UINT8)pPin, 0);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	215; Port.c	Byte_SetBit(pInput->mOutput, (UINT8)pPin, 0);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget3
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_Byte_SetBit
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00228_DS_
_00225_DS_:
;	.line	217; Port.c	else return Output;
	MOVF	r0x08, W
	BRA	_00229_DS_
_00228_DS_:
;	.line	224; Port.c	Word_SetPair(&pInput->mType, (UINT8)pPin, (UINT8)pType);
	MOVLW	0x0c
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Word_SetPair
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	226; Port.c	return Output;
	MOVF	r0x08, W
_00229_DS_:
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_Init	code
_Port_Init:
;	.line	151; Port.c	void		Port_Init		(PortPtr pInput, ePort pPort)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	154; Port.c	pInput->mProperties = GetPortProperties(pPort);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_GetPortProperties
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVF	POSTINC1, F
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x06, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
;	.line	155; Port.c	pInput->mInput = GetPortLAT(pPort);
	MOVF	r0x00, W
	ADDLW	0x09
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x06
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_GetPortLAT
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVFF	PRODH, r0x09
	MOVF	POSTINC1, F
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, PRODH
	MOVFF	r0x09, TBLPTRL
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput3
;	.line	156; Port.c	pInput->mOutput = GetPortPORT(pPort);
	MOVF	r0x00, W
	ADDLW	0x06
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x09
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_GetPortPORT
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVF	POSTINC1, F
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x0c, TBLPTRL
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput3
;	.line	157; Port.c	pInput->mDirection = GetPortTRIS(pPort);
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x09
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_GetPortTRIS
	MOVWF	r0x03
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVF	POSTINC1, F
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x0a, PRODH
	MOVFF	r0x0b, TBLPTRL
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput3
;	.line	160; Port.c	pInput->mInput->mBits = 0x00;
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget3
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrput1
;	.line	161; Port.c	pInput->mDirection->mBits = 0x00;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput1
;	.line	164; Port.c	Port_SetType(pInput, eTypeInput);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_SetType
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	165; Port.c	Port_Set(pInput, 0x00);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_Set
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_CheckPortType	code
_Port_CheckPortType:
;	.line	138; Port.c	ePinError	Port_CheckPortType(PortPtr pInput, ePinDrive pDrive)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	144; Port.c	if ((Output = Port_CheckQuadType(pInput, eP0_3, pDrive)) == ePinErrorNone)
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckQuadType
	MOVWF	r0x04
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x04, r0x05
	MOVF	r0x04, W
	BNZ	_00200_DS_
;	.line	145; Port.c	Output = Port_CheckQuadType(pInput, eP4_7, pDrive);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckQuadType
	MOVWF	r0x05
	MOVLW	0x05
	ADDWF	FSR1L, F
_00200_DS_:
;	.line	147; Port.c	return Output;
	MOVF	r0x05, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_CheckQuadType	code
_Port_CheckQuadType:
;	.line	124; Port.c	ePinError	Port_CheckQuadType(PortPtr pInput, eQuad pQuad, ePinDrive pDrive)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	129; Port.c	ePair Pair1 = (ePair)((int)pQuad * 2);
	CLRF	r0x05
; ;multiply lit val:0x02 by variable r0x03 and store in r0x03
	MOVF	r0x03, W
	MULLW	0x02
	MOVFF	PRODL, r0x03
	MOVF	r0x03, W
	MOVWF	r0x05
;	.line	130; Port.c	ePair Pair2 = (ePair)((int)pQuad * 2 + 1);
	INCF	r0x03, F
;	.line	133; Port.c	if ((Output = Port_CheckPairType(pInput, Pair1, pDrive)) == ePinErrorNone)
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPairType
	MOVWF	r0x05
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x05, r0x06
	MOVF	r0x05, W
	BNZ	_00193_DS_
;	.line	134; Port.c	Output = Port_CheckPairType(pInput, Pair2, pDrive);
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_CheckPairType
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
_00193_DS_:
;	.line	136; Port.c	return Output;
	MOVF	r0x06, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__Port_CheckPairType	code
_Port_CheckPairType:
;	.line	110; Port.c	ePinError	Port_CheckPairType(PortPtr pInput, ePair pPair, ePinDrive pDrive)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	114; Port.c	PortProperty* Props = (PortProperty*)&(pInput->mProperties->mWord);
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget3
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
;	.line	115; Port.c	ePin Pin1 = (ePin)((int)pPair * 2);
	CLRF	r0x05
; ;multiply lit val:0x02 by variable r0x03 and store in r0x03
	MOVF	r0x03, W
	MULLW	0x02
	MOVFF	PRODL, r0x03
	MOVF	r0x03, W
	MOVWF	r0x05
;	.line	116; Port.c	ePin Pin2 = (ePin)((int)pPair * 2 + 1);
	INCF	r0x03, F
;	.line	119; Port.c	if ((Output = PortProperty_Valid(Props, pDrive, Pin1)) == ePinErrorNone)
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_PortProperty_Valid
	MOVWF	r0x05
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	r0x05, r0x06
	MOVF	r0x05, W
	BNZ	_00186_DS_
;	.line	120; Port.c	Output = PortProperty_Valid(Props, pDrive, Pin2);
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_PortProperty_Valid
	MOVWF	r0x06
	MOVLW	0x05
	ADDWF	FSR1L, F
_00186_DS_:
;	.line	122; Port.c	return Output;
	MOVF	r0x06, W
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__GetPortLAT	code
_GetPortLAT:
;	.line	88; Port.c	Byte * const GetPortLAT(ePort pInput)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	90; Port.c	switch (pInput)
	MOVLW	0x07
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00172_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00180_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00180_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00180_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00180_DS_:
	GOTO	_00165_DS_
	GOTO	_00166_DS_
	GOTO	_00167_DS_
	GOTO	_00168_DS_
	GOTO	_00169_DS_
	GOTO	_00170_DS_
	GOTO	_00171_DS_
_00165_DS_:
;	.line	93; Port.c	return (Byte * const)&LATA;
	MOVLW	LOW(_LATA)
	MOVWF	r0x00
	MOVLW	HIGH(_LATA)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00174_DS_
_00166_DS_:
;	.line	95; Port.c	return (Byte * const)&LATB;
	MOVLW	LOW(_LATB)
	MOVWF	r0x00
	MOVLW	HIGH(_LATB)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00174_DS_
_00167_DS_:
;	.line	97; Port.c	return (Byte * const)&LATC;
	MOVLW	LOW(_LATC)
	MOVWF	r0x00
	MOVLW	HIGH(_LATC)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00174_DS_
_00168_DS_:
;	.line	99; Port.c	return (Byte * const)&LATD;
	MOVLW	LOW(_LATD)
	MOVWF	r0x00
	MOVLW	HIGH(_LATD)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00174_DS_
_00169_DS_:
;	.line	101; Port.c	return (Byte * const)&LATE;
	MOVLW	LOW(_LATE)
	MOVWF	r0x00
	MOVLW	HIGH(_LATE)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00174_DS_
_00170_DS_:
;	.line	103; Port.c	return (Byte * const)&LATF;
	MOVLW	LOW(_LATF)
	MOVWF	r0x00
	MOVLW	HIGH(_LATF)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00174_DS_
_00171_DS_:
;	.line	105; Port.c	return (Byte * const)&LATG;
	MOVLW	LOW(_LATG)
	MOVWF	r0x00
	MOVLW	HIGH(_LATG)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00174_DS_
_00172_DS_:
;	.line	107; Port.c	return NULLPTR;
	CLRF	PRODH
	CLRF	PRODL
	CLRF	WREG
_00174_DS_:
;	.line	108; Port.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__GetPortTRIS	code
_GetPortTRIS:
;	.line	65; Port.c	Byte * const GetPortTRIS(ePort pInput)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	67; Port.c	switch (pInput)
	MOVLW	0x07
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00152_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00160_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00160_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00160_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00160_DS_:
	GOTO	_00145_DS_
	GOTO	_00146_DS_
	GOTO	_00147_DS_
	GOTO	_00148_DS_
	GOTO	_00149_DS_
	GOTO	_00150_DS_
	GOTO	_00151_DS_
_00145_DS_:
;	.line	70; Port.c	return (Byte * const)&TRISA;
	MOVLW	LOW(_TRISA)
	MOVWF	r0x00
	MOVLW	HIGH(_TRISA)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00154_DS_
_00146_DS_:
;	.line	72; Port.c	return (Byte * const)&TRISB;
	MOVLW	LOW(_TRISB)
	MOVWF	r0x00
	MOVLW	HIGH(_TRISB)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00154_DS_
_00147_DS_:
;	.line	74; Port.c	return (Byte * const)&TRISC;
	MOVLW	LOW(_TRISC)
	MOVWF	r0x00
	MOVLW	HIGH(_TRISC)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00154_DS_
_00148_DS_:
;	.line	76; Port.c	return (Byte * const)&TRISD;
	MOVLW	LOW(_TRISD)
	MOVWF	r0x00
	MOVLW	HIGH(_TRISD)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00154_DS_
_00149_DS_:
;	.line	78; Port.c	return (Byte * const)&TRISE;
	MOVLW	LOW(_TRISE)
	MOVWF	r0x00
	MOVLW	HIGH(_TRISE)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00154_DS_
_00150_DS_:
;	.line	80; Port.c	return (Byte * const)&TRISF;
	MOVLW	LOW(_TRISF)
	MOVWF	r0x00
	MOVLW	HIGH(_TRISF)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00154_DS_
_00151_DS_:
;	.line	82; Port.c	return (Byte * const)&TRISG;
	MOVLW	LOW(_TRISG)
	MOVWF	r0x00
	MOVLW	HIGH(_TRISG)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00154_DS_
_00152_DS_:
;	.line	84; Port.c	return NULLPTR;
	CLRF	PRODH
	CLRF	PRODL
	CLRF	WREG
_00154_DS_:
;	.line	85; Port.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__GetPortPORT	code
_GetPortPORT:
;	.line	42; Port.c	Byte * const GetPortPORT(ePort pInput)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	44; Port.c	switch (pInput)
	MOVLW	0x07
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00132_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00140_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00140_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00140_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00140_DS_:
	GOTO	_00125_DS_
	GOTO	_00126_DS_
	GOTO	_00127_DS_
	GOTO	_00128_DS_
	GOTO	_00129_DS_
	GOTO	_00130_DS_
	GOTO	_00131_DS_
_00125_DS_:
;	.line	47; Port.c	return (Byte * const)&PORTA;
	MOVLW	LOW(_PORTA)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTA)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00134_DS_
_00126_DS_:
;	.line	49; Port.c	return (Byte * const)&PORTB;
	MOVLW	LOW(_PORTB)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTB)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00134_DS_
_00127_DS_:
;	.line	51; Port.c	return (Byte * const)&PORTC;
	MOVLW	LOW(_PORTC)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTC)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00134_DS_
_00128_DS_:
;	.line	53; Port.c	return (Byte * const)&PORTD;
	MOVLW	LOW(_PORTD)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTD)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00134_DS_
_00129_DS_:
;	.line	55; Port.c	return (Byte * const)&PORTE;
	MOVLW	LOW(_PORTE)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTE)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00134_DS_
_00130_DS_:
;	.line	57; Port.c	return (Byte * const)&PORTF;
	MOVLW	LOW(_PORTF)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTF)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00134_DS_
_00131_DS_:
;	.line	59; Port.c	return (Byte * const)&PORTG;
	MOVLW	LOW(_PORTG)
	MOVWF	r0x00
	MOVLW	HIGH(_PORTG)
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00134_DS_
_00132_DS_:
;	.line	61; Port.c	return NULLPTR;
	CLRF	PRODH
	CLRF	PRODL
	CLRF	WREG
_00134_DS_:
;	.line	62; Port.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_Port__GetPortProperties	code
_GetPortProperties:
;	.line	19; Port.c	PortProperty const * GetPortProperties(ePort pInput)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
;	.line	21; Port.c	switch (pInput)	
	MOVLW	0x07
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00112_DS_
	CLRF	PCLATH
	CLRF	PCLATU
	RLCF	r0x00, W
	RLCF	PCLATH, F
	RLCF	WREG, W
	RLCF	PCLATH, F
	ANDLW	0xfc
	ADDLW	LOW(_00120_DS_)
	MOVWF	POSTDEC1
	MOVLW	HIGH(_00120_DS_)
	ADDWFC	PCLATH, F
	MOVLW	UPPER(_00120_DS_)
	ADDWFC	PCLATU, F
	MOVF	PREINC1, W
	MOVWF	PCL
_00120_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
	GOTO	_00111_DS_
_00105_DS_:
;	.line	24; Port.c	return (PortProperty const *)&PortA_Property;
	MOVLW	UPPER(_PortA_Property)
	MOVWF	r0x02
	MOVLW	HIGH(_PortA_Property)
	MOVWF	r0x01
	MOVLW	LOW(_PortA_Property)
	MOVWF	r0x00
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00114_DS_
_00106_DS_:
;	.line	26; Port.c	return (PortProperty const *)&PortB_Property;
	MOVLW	UPPER(_PortB_Property)
	MOVWF	r0x02
	MOVLW	HIGH(_PortB_Property)
	MOVWF	r0x01
	MOVLW	LOW(_PortB_Property)
	MOVWF	r0x00
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00114_DS_
_00107_DS_:
;	.line	28; Port.c	return (PortProperty const *)&PortC_Property;
	MOVLW	UPPER(_PortC_Property)
	MOVWF	r0x02
	MOVLW	HIGH(_PortC_Property)
	MOVWF	r0x01
	MOVLW	LOW(_PortC_Property)
	MOVWF	r0x00
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00114_DS_
_00108_DS_:
;	.line	30; Port.c	return (PortProperty const *)&PortD_Property;
	MOVLW	UPPER(_PortD_Property)
	MOVWF	r0x02
	MOVLW	HIGH(_PortD_Property)
	MOVWF	r0x01
	MOVLW	LOW(_PortD_Property)
	MOVWF	r0x00
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00114_DS_
_00109_DS_:
;	.line	32; Port.c	return (PortProperty const *)&PortE_Property;
	MOVLW	UPPER(_PortE_Property)
	MOVWF	r0x02
	MOVLW	HIGH(_PortE_Property)
	MOVWF	r0x01
	MOVLW	LOW(_PortE_Property)
	MOVWF	r0x00
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00114_DS_
_00110_DS_:
;	.line	34; Port.c	return (PortProperty const *)&PortF_Property;
	MOVLW	UPPER(_PortF_Property)
	MOVWF	r0x02
	MOVLW	HIGH(_PortF_Property)
	MOVWF	r0x01
	MOVLW	LOW(_PortF_Property)
	MOVWF	r0x00
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00114_DS_
_00111_DS_:
;	.line	36; Port.c	return (PortProperty const *)&PortG_Property;
	MOVLW	UPPER(_PortG_Property)
	MOVWF	r0x02
	MOVLW	HIGH(_PortG_Property)
	MOVWF	r0x01
	MOVLW	LOW(_PortG_Property)
	MOVWF	r0x00
	MOVFF	r0x02, PRODH
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00114_DS_
_00112_DS_:
;	.line	38; Port.c	return NULLPTR;
	CLRF	PRODH
	CLRF	PRODL
	CLRF	WREG
_00114_DS_:
;	.line	39; Port.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block for Ival
	code
_PortA_Property:
	DB	0xff, 0x00, 0x00, 0x00
; ; Starting pCode block for Ival
_PortB_Property:
	DB	0x00, 0xff, 0x00, 0x00
; ; Starting pCode block for Ival
_PortC_Property:
	DB	0xf0, 0xff, 0x00, 0x00
; ; Starting pCode block for Ival
_PortD_Property:
	DB	0xff, 0xff, 0x00, 0x00
; ; Starting pCode block for Ival
_PortE_Property:
	DB	0x00, 0x00, 0x00, 0x00
; ; Starting pCode block for Ival
_PortF_Property:
	DB	0xff, 0x0f, 0x00, 0x00
; ; Starting pCode block for Ival
_PortG_Property:
	DB	0x00, 0xfc, 0x00, 0x00


; Statistics:
; code size:	 9966 (0x26ee) bytes ( 7.60%)
;           	 4983 (0x1377) words
; udata size:	    0 (0x0000) bytes ( 0.00%)
; access size:	   13 (0x000d) bytes


	end
