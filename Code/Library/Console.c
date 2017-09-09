/*
 * Console.c
 *
 *  Created on: 23/12/2016
 *      Author: David Ledger
 */
////////////////////////////////////////////////////////////////////////////////
#include "Console.h"
#include "LCD.h"
#include "Point.h"
#include <stdio.h>
////////////////////////////////////////////////////////////////////////////////
#define XRST	    6
#define YRST	    6
#define CHARWIDTH   5
#define CHARHEIGHT  7

#define CHARWIDTHI  (CHARWIDTH + 1)
#define CHARHEIGHTI (CHARHEIGHT + 1)

#define TABSIZE	    4
////////////////////////////////////////////////////////////////////////////////
#define MAXCHARS    (UINT8)((LCD_TFTWIDTH-XRST)/6)
#define LASTPOST    ((MAXCHARS-1)*6)
#define LINES	    (UINT8)((LCD_TFTWIDTH-YRST)/8)
#define MAXPX_W	    (MAXCHARS*6)
#define MAXPX_H	    (LINES*8)

#ifdef CONSOLE_BUFFERED
static bool	change = true;
static bool	clearall = false;
static UINT8	lBufferX, lBufferY;

static UINT16	lCBuffer[LINES];
static char	lBuffer	[LINES][MAXCHARS];

#define BUFC(x,y,c) {change=true; lBuffer[y][x] = 0x80 | c;}

//DO NOT ADD TABS OR SPACES IT WILL BREAK THE MACRO
#define BUF(x,y) lBuffer[y][x]
#define COLBUF(x,y) lCBuffer[y]
#endif


void	    Console_ClearCursor();
inline void Console_ClearLine       (void);
ColourPtr   Console_MakeField       (char pInput);
void        Console_ResetCursor();
////////////////////////////////////////////////////////////////////////////////
static Point	gCursor		= {XRST, YRST};
static Size	gCharSize	= {CHARWIDTH, CHARHEIGHT};
static Size	gLineSize	= {LCD_TFTWIDTH, CHARHEIGHT};
static UINT16	gForecolour	=   WHITE;
static UINT16	gBackcolour	=   BLACK;
////////////////////////////////////////////////////////////////////////////////
CUINT8 Font5x7[] = 
{
    0x00, 0x00, 0x00, 0x00, 0x00,// (space)
    0x00, 0x00, 0x5F, 0x00, 0x00,// !
    0x00, 0x07, 0x00, 0x07, 0x00,// "
    0x14, 0x7F, 0x14, 0x7F, 0x14,// #
    0x24, 0x2A, 0x7F, 0x2A, 0x12,// $
    0x23, 0x13, 0x08, 0x64, 0x62,// %
    0x36, 0x49, 0x55, 0x22, 0x50,// &
    0x00, 0x05, 0x03, 0x00, 0x00,// '
    0x00, 0x1C, 0x22, 0x41, 0x00,// (
    0x00, 0x41, 0x22, 0x1C, 0x00,// )
    0x08, 0x2A, 0x1C, 0x2A, 0x08,// *
    0x08, 0x08, 0x3E, 0x08, 0x08,// +
    0x00, 0x50, 0x30, 0x00, 0x00,// ,
    0x08, 0x08, 0x08, 0x08, 0x08,// -
    0x00, 0x60, 0x60, 0x00, 0x00,// .
    0x20, 0x10, 0x08, 0x04, 0x02,// /
    0x3E, 0x51, 0x49, 0x45, 0x3E,// 0
    0x00, 0x42, 0x7F, 0x40, 0x00,// 1
    0x42, 0x61, 0x51, 0x49, 0x46,// 2
    0x21, 0x41, 0x45, 0x4B, 0x31,// 3
    0x18, 0x14, 0x12, 0x7F, 0x10,// 4
    0x27, 0x45, 0x45, 0x45, 0x39,// 5
    0x3C, 0x4A, 0x49, 0x49, 0x30,// 6
    0x01, 0x71, 0x09, 0x05, 0x03,// 7
    0x36, 0x49, 0x49, 0x49, 0x36,// 8
    0x06, 0x49, 0x49, 0x29, 0x1E,// 9
    0x00, 0x36, 0x36, 0x00, 0x00,// :
    0x00, 0x56, 0x36, 0x00, 0x00,// ;
    0x00, 0x08, 0x14, 0x22, 0x41,// <
    0x14, 0x14, 0x14, 0x14, 0x14,// =
    0x41, 0x22, 0x14, 0x08, 0x00,// >
    0x02, 0x01, 0x51, 0x09, 0x06,// ?
    0x32, 0x49, 0x79, 0x41, 0x3E,// @
    0x7E, 0x11, 0x11, 0x11, 0x7E,// A
    0x7F, 0x49, 0x49, 0x49, 0x36,// B
    0x3E, 0x41, 0x41, 0x41, 0x22,// C
    0x7F, 0x41, 0x41, 0x22, 0x1C,// D
    0x7F, 0x49, 0x49, 0x49, 0x41,// E
    0x7F, 0x09, 0x09, 0x01, 0x01,// F
    0x3E, 0x41, 0x41, 0x51, 0x32,// G
    0x7F, 0x08, 0x08, 0x08, 0x7F,// H
    0x00, 0x41, 0x7F, 0x41, 0x00,// I
    0x20, 0x40, 0x41, 0x3F, 0x01,// J
    0x7F, 0x08, 0x14, 0x22, 0x41,// K
    0x7F, 0x40, 0x40, 0x40, 0x40,// L
    0x7F, 0x02, 0x04, 0x02, 0x7F,// M
    0x7F, 0x04, 0x08, 0x10, 0x7F,// N
    0x3E, 0x41, 0x41, 0x41, 0x3E,// O
    0x7F, 0x09, 0x09, 0x09, 0x06,// P
    0x3E, 0x41, 0x51, 0x21, 0x5E,// Q
    0x7F, 0x09, 0x19, 0x29, 0x46,// R
    0x46, 0x49, 0x49, 0x49, 0x31,// S
    0x01, 0x01, 0x7F, 0x01, 0x01,// T
    0x3F, 0x40, 0x40, 0x40, 0x3F,// U
    0x1F, 0x20, 0x40, 0x20, 0x1F,// V
    0x7F, 0x20, 0x18, 0x20, 0x7F,// W
    0x63, 0x14, 0x08, 0x14, 0x63,// X
    0x03, 0x04, 0x78, 0x04, 0x03,// Y
    0x61, 0x51, 0x49, 0x45, 0x43,// Z
    0x00, 0x00, 0x7F, 0x41, 0x41,// [
    0x02, 0x04, 0x08, 0x10, 0x20,// "\"
    0x41, 0x41, 0x7F, 0x00, 0x00,// ]
    0x04, 0x02, 0x01, 0x02, 0x04,// ^
    0x40, 0x40, 0x40, 0x40, 0x40,//
    0x00, 0x01, 0x02, 0x04, 0x00,// `
    0x20, 0x54, 0x54, 0x54, 0x78,// a
    0x7F, 0x48, 0x44, 0x44, 0x38,// b
    0x38, 0x44, 0x44, 0x44, 0x20,// c
    0x38, 0x44, 0x44, 0x48, 0x7F,// d
    0x38, 0x54, 0x54, 0x54, 0x18,// e
    0x08, 0x7E, 0x09, 0x01, 0x02,// f
    0x08, 0x14, 0x54, 0x54, 0x3C,// g
    0x7F, 0x08, 0x04, 0x04, 0x78,// h
    0x00, 0x44, 0x7D, 0x40, 0x00,// i
    0x20, 0x40, 0x44, 0x3D, 0x00,// j
    0x00, 0x7F, 0x10, 0x28, 0x44,// k
    0x00, 0x41, 0x7F, 0x40, 0x00,// l
    0x7C, 0x04, 0x18, 0x04, 0x78,// m
    0x7C, 0x08, 0x04, 0x04, 0x78,// n
    0x38, 0x44, 0x44, 0x44, 0x38,// o
    0x7C, 0x14, 0x14, 0x14, 0x08,// p
    0x08, 0x14, 0x14, 0x18, 0x7C,// q
    0x7C, 0x08, 0x04, 0x04, 0x08,// r
    0x48, 0x54, 0x54, 0x54, 0x20,// s
    0x04, 0x3F, 0x44, 0x40, 0x20,// t
    0x3C, 0x40, 0x40, 0x20, 0x7C,// u
    0x1C, 0x20, 0x40, 0x20, 0x1C,// v
    0x3C, 0x40, 0x30, 0x40, 0x3C,// w
    0x44, 0x28, 0x10, 0x28, 0x44,// x
    0x0C, 0x50, 0x50, 0x50, 0x3C,// y
    0x44, 0x64, 0x54, 0x4C, 0x44,// z
    0x00, 0x08, 0x36, 0x41, 0x00,// 
    0x00, 0x00, 0x7F, 0x00, 0x00,// |
    0x00, 0x41, 0x36, 0x08, 0x00,// 
    0x08, 0x08, 0x2A, 0x1C, 0x08,// ->
    0x08, 0x1C, 0x2A, 0x08, 0x08 // <-
};


void        Console_Init()
{
    #ifdef CONSOLE_BUFFERED
    lBufferX = 0;
    lBufferY = 0;
    
    UINT8 x, y;
    for (x = 0; x < MAXCHARS; x++)
    {
	for (y = 0; y < LINES; y++)
	{
	    BUF(x,y) = '\0';
	    COLBUF(x,y) = WHITE;
	}
    }
    #endif
}
////////////////////////////////////////////////////////////////////////////////
void Console_NewLine()
{
#ifdef CONSOLE_BUFFERED
    while (lBufferX < MAXCHARS)
    {
	if (BUF(lBufferX, lBufferY) != '\0')
	    BUFC(lBufferX,lBufferY, '\0');
	lBufferX ++;
    }
    
    lBufferX = 0;
    lBufferY ++;
#endif
    gCursor.y += 8;
    gCursor.x = XRST;
}
////////////////////////////////////////////////////////////////////////////////
void Console_FormFeed()
{
#ifdef CONSOLE_BUFFERED
    lBufferX = 0;
    lBufferY = 0;
    UINT8 x, y;
    
    for (y = 0; y < LINES; y++)
        for (x = 0; x < MAXCHARS; x++)	
	    BUFC(x,y, '\0');
    
#endif
    clearall = true;
    gCursor.x = XRST;
    gCursor.y = YRST;
}
////////////////////////////////////////////////////////////////////////////////
void Console_Backspace()
{
    if (lBufferX > 0)
    {
	gCursor.x -= 6;
	
	#ifdef CONSOLE_BUFFERED
	    lBufferX --;
	#endif
    }
    else if (lBufferY > 0)
    {
	gCursor.x = LASTPOST;
        gCursor.y -= 8;

	#ifdef CONSOLE_BUFFERED
	    lBufferX = MAXCHARS - 1;
	    lBufferY --;
	#endif
    }
    else
    {
	gCursor.x = XRST;
        gCursor.y = YRST;

	#ifdef CONSOLE_BUFFERED
	    lBufferX = 0;
	    lBufferY = 0;
	#endif
    }
    
    Console_ClearCursor();
}
////////////////////////////////////////////////////////////////////////////////
bool Console_IncrementCursor()
{
#ifdef CONSOLE_BUFFERED
    lBufferX += 1;
#endif
    gCursor.x += 6;
    if (gCursor.x + 6 >= LCD_TFTWIDTH)
	Console_NewLine();
    if (gCursor.y + 8>= LCD_TFTHEIGHT)
    {
	Console_FormFeed();
	return true;
    }
    
    return false;
}
////////////////////////////////////////////////////////////////////////////////
void Console_Tab()
{
    UINT8 i = 0;
    UINT8 c = (gCursor.x-XRST)/6;
    UINT8 t = c/TABSIZE;
    for (i = 0; i<(TABSIZE-(c-4*t)); i++)
    {
	Console_ClearCursor();
	Console_IncrementCursor();
    }
}
////////////////////////////////////////////////////////////////////////////////
inline void Console_SetForecolourRGB(UINT8 r, UINT8 g, UINT8 b)
{
    ////////////////////////////////////////////////////
     gForecolour = Colour_To565(r, g, b);
    ////////////////////////////////////////////////////
}
////////////////////////////////////////////////////////////////////////////////
inline void Console_SetBackcolourRGB(UINT8 r, UINT8 g, UINT8 b)
{
    ////////////////////////////////////////////////////
     gBackcolour = Colour_To565(r, g, b);
    ////////////////////////////////////////////////////
}
////////////////////////////////////////////////////////////////////////////////
inline void Console_SetForecolour(Colour pColour)
{
    ////////////////////////////////////////////////////
     gForecolour = pColour;
    ////////////////////////////////////////////////////
}
////////////////////////////////////////////////////////////////////////////////
inline void Console_SetBackcolour(Colour pColour)
{
    gBackcolour = pColour;
} 
void Console_ResetCursor()
{
    gCursor.x = XRST;
    gCursor.y = YRST;

    #ifdef CONSOLE_BUFFERED
	lBufferX = 0;
	lBufferY = 0;
    #endif
}
////////////////////////////////////////////////////////////////////////////////
void Console_ClearCursor()
{
#ifdef CONSOLE_BUFFERED
    BUFC(lBufferX,lBufferY, 0);
#else
    LCD_FillRectangle(gBackcolour, gCursor, gCharSize);    
#endif
}
////////////////////////////////////////////////////////////////////////////////
inline void Console_ClearLine()
{
    LCD_FillRectangle(gBackcolour, gCursor, gLineSize);    
}
////////////////////////////////////////////////////////////////////////////////
inline void Console_PrintChar(char pInput)
{
    switch(pInput)
    {
	case '\r':
	case '\n':
	    Console_NewLine();
	    return;
	case '\b':
	    Console_Backspace();
	    return;
	case '\f':
	    Console_FormFeed();
	    return;
	case '\t':
	    Console_Tab();
	    return;
	case '\a':
	    Console_IncrementCursor();
	    return;
	case ENDOFTEXT:	//This is the end of text command
	    Console_ResetCursor();
	    return;
	case ' ':

	    
#ifdef CONSOLE_BUFFERED
	default: 
	    if ((BUF(lBufferX,lBufferY) & 0x7F) != (pInput & 0x7F))
	    {
		BUFC(lBufferX,lBufferY, pInput);
		COLBUF(lBufferX, lBufferY) = gForecolour;
	    }
#else
	    #ifndef FULL_CLEAR
	    Console_ClearCursor();
	    #endif
	    Console_IncrementCursor();
	    return;
	    default:
	    #ifdef FULL_CLEAR
	if (gCursor.x == XRST)
	    Console_ClearLine(); 
	    #endif
	LCD_DrawField(Console_MakeField(pInput), gCursor, gCharSize);
#endif
	    if(Console_IncrementCursor())
		if ((BUF(lBufferX,lBufferY) & 0x7F) != (pInput & 0x7F))
		    BUFC(lBufferX,lBufferY, pInput);
	    return;
    };
}

#ifdef CONSOLE_BUFFERED
#define RENDERME(x) (x & 0b10000000)
void Console_Render()
{
    Colour Temp;
    if (change)
    {
	UINT8 x, y, temp;
	Point lCursor = {XRST,YRST};

	if (clearall)
	{
	    //full screen height clearing then resume to normal 
	    // differential rendering
	    temp = lBufferY;
	    lBufferY = LINES;
	}
	  
	for (y = 0; y <= lBufferY; y++)
	{
	    gForecolour = COLBUF(x, y);
	    for (x = 0; x < MAXCHARS; x++)
	    {
		if (RENDERME(BUF(x,y)))
		{
		    BUF(x,y) &= 0x7F;
		    if (BUF(x,y))
		    {
			LCD_FillRectangle(gBackcolour, lCursor, gCharSize); 
			LCD_DrawField(Console_MakeField(BUF(x,y)), lCursor, gCharSize);
		    }
		    else
			LCD_FillRectangle(BLACK, lCursor, gCharSize); 
		}
		lCursor.x += CHARWIDTHI;
	    }
	    lCursor.y += CHARHEIGHTI;
	    lCursor.x = XRST;
	}
	
	if (clearall)
	{
	    clearall = false;
	    lBufferY = temp;
	}
    }
}
#undef RENDERME
#endif

////////////////////////////////////////////////////////////////////////////////
void Console_PrintString(str pInput)
{
    while (*(pInput))
    {
	Console_PrintChar(*pInput);
	pInput++;
    }
}
////////////////////////////////////////////////////////////////////////////////
ColourPtr Console_MakeField(UINT8 pInput)
{
    static Colour Fill[7][5];
    pInput -= 32;
    ////////////////////////////////////////////////////////////////////////////
    UINT16  Index   = (UINT16) pInput*CHARWIDTH;
    BytePtr Column  = (BytePtr) &(Font5x7[ Index ]);
    ////////////////////////////////////////////////////////////////////////////
    for (UINT8 x = 0; x < CHARWIDTH; x++)
    {                                  
	for (UINT8 y = 0; y < CHARHEIGHT; y++)
	    Fill[y][x] = ( Byte_GetBit( Column , y ) ) ? gForecolour : gBackcolour;
	Column += 1;
    }
    return (ColourPtr)Fill;
    ////////////////////////////////////////////////////////////////////////////
}
////////////////////////////////////////////////////////////////////////////////
#ifdef PRINTF_ENABLE
void putch(UINT8 c)
{
    Console_PrintChar(c);
}
#endif