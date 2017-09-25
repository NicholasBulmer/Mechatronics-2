;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f65j50
	radix	dec
	CONFIG	XINST=OFF


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_main
	global	_highInterrupt
	global	_lowInterrupt

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern	_Port_Init
	extern	_Port_SetPinType
	extern	_Port_SetPin
	extern	_Port_GetPin

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
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

udata_main_0	udata
_main_PortC_1_48	res	14

;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_main_ivec_0x1_highInterrupt	code	0X000008
ivec_0x1_highInterrupt:
	GOTO	_highInterrupt

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_main_ivec_0x2_lowInterrupt	code	0X000018
ivec_0x2_lowInterrupt:
	GOTO	_lowInterrupt

; I code from now on!
; ; Starting pCode block
S_main__main	code
_main:
;	.line	22; main.c	Port_Init(&PortC, ePortC);
	MOVLW	HIGH(_main_PortC_1_48)
	MOVWF	r0x01
	MOVLW	LOW(_main_PortC_1_48)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_Init
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	23; main.c	Port_SetPinType(&PortC, eP0 ,eTypeOutputPushPull);
	MOVLW	HIGH(_main_PortC_1_48)
	MOVWF	r0x01
	MOVLW	LOW(_main_PortC_1_48)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Port_SetPinType
	MOVLW	0x05
	ADDWF	FSR1L, F
_00113_DS_:
;	.line	28; main.c	while(count--);
	MOVLW	0xe8
	MOVWF	r0x00
	MOVLW	0x03
	MOVWF	r0x01
_00105_DS_:
	MOVFF	r0x00, r0x02
	MOVFF	r0x01, r0x03
	MOVLW	0xff
	ADDWF	r0x00, F
	ADDWFC	r0x01, F
	MOVF	r0x02, W
	IORWF	r0x03, W
	BNZ	_00105_DS_
;	.line	29; main.c	Port_SetPin(&PortC, eP0, !Port_GetPin(&PortC, eP0));
	MOVLW	HIGH(_main_PortC_1_48)
	MOVWF	r0x01
	MOVLW	LOW(_main_PortC_1_48)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_main_PortC_1_48)
	MOVWF	r0x04
	MOVLW	LOW(_main_PortC_1_48)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_Port_GetPin
	MOVWF	r0x03
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x03
	RLCF	r0x03, F
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
	CALL	_Port_SetPin
	MOVLW	0x05
	ADDWF	FSR1L, F
	BRA	_00113_DS_
	RETURN	

; ; Starting pCode block
S_main__lowInterrupt	code
_lowInterrupt:
;	.line	34; main.c	void lowInterrupt(void)     __interrupt(2){}
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVF	PREINC1, W
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	RETFIE	

; ; Starting pCode block
S_main__highInterrupt	code
_highInterrupt:
;	.line	33; main.c	void highInterrupt(void)    __interrupt(1){}
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVWF	POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVF	PREINC1, W
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	RETFIE	



; Statistics:
; code size:	  366 (0x016e) bytes ( 0.28%)
;           	  183 (0x00b7) words
; udata size:	   14 (0x000e) bytes ( 0.38%)
; access size:	    6 (0x0006) bytes


	end
