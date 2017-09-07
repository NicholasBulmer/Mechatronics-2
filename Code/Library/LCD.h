/* 
 * File:   LCD.h
 * Author: David Ledger
 *
 * Created on 20 September 2016, 6:20 PM
 */

#ifndef LCD_H
#define	LCD_H
#include "Types.h"
#include "Colours.h"
#include "Point.h"

#define LCD_NOP                                                             0x00
#define LCD_SWRESET                                                         0x01
#define LCD_RDDID                                                           0x04
#define LCD_RDDST                                                           0x09
#define LCD_RDDPM                                                           0x0A
#define LCD_RDD_MADCTL                                                      0x0B
#define STT7735_RDD_COLMOD                                                  0x0C
#define LCD_RDDIM                                                           0x0D
#define LCD_RDDSM                                                           0x0E

#define LCD_SLPIN                                                           0x10
#define LCD_SLPOUT                                                          0x11
#define LCD_PTLON                                                           0x12
#define LCD_NORON                                                           0x13

#define LCD_INVOFF                                                          0x20
#define LCD_INVON                                                           0x21
#define LCD_GAMSET                                                          0x26
#define LCD_DISPOFF                                                         0x28
#define LCD_DISPON                                                          0x29
#define LCD_CASET                                                           0x2A
#define LCD_RASET                                                           0x2B
#define LCD_RAMWR                                                           0x2C
#define LCD_RAMRD                                                           0x2E

#define LCD_PTLAR                                                           0x30
#define LCD_TEOFF                                                           0x34
#define LCD_TEON                                                            0x35
#define LCD_MADCTL                                                          0x36
#define LCD_IDMOFF                                                          0x38
#define LCD_IDMON                                                           0x39
#define LCD_COLMOD                                                          0x3A

#define LCD_RDID1                                                           0xDA
#define LCD_RDID2                                                           0xDB
#define LCD_RDID3                                                           0xDC
#define LCD_RDID4                                                           0xDD

#define LCD_FRMCTR1                                                         0xB1
#define LCD_FRMCTR2                                                         0xB2
#define LCD_FRMCTR3                                                         0xB3
#define LCD_INVCTR                                                          0xB4
#define LCD_DISSET5                                                         0xB6

#define LCD_PWCTR1                                                          0xC0
#define LCD_PWCTR2                                                          0xC1
#define LCD_PWCTR3                                                          0xC2
#define LCD_PWCTR4                                                          0xC3
#define LCD_PWCTR5                                                          0xC4
#define LCD_VMCTR1                                                          0xC5

#define LCD_RDID1                                                           0xDA
#define LCD_RDID2                                                           0xDB
#define LCD_RDID3                                                           0xDC
#define LCD_RDID4                                                           0xDD

#define LCD_PWCTR6                                                          0xFC

#define LCD_GMCTRP1                                                         0xE0
#define LCD_GMCTRN1                                                         0xE1

#define MADCTL_MY                                                           0x80
#define MADCTL_MX                                                           0x40
#define MADCTL_MV                                                           0x20
#define MADCTL_ML                                                           0x10
#define MADCTL_RGB                                                          0x08
#define MADCTL_MH                                                           0x04

#define LCD_TFTWIDTH                                                        128
#define LCD_TFTLENGTH                                                       128
#define LCD_TFTHEIGHT LCD_TFTWIDTH

#define CMD                                                                 0x0
#define DAT                                                                 0x1
#define SQUARE                                                              0x00
#define ROUND                                                               0x01
#define NO                                                                  0x00
#define YES                                                                 0x01

typedef enum
{
    eCommand = 0,
    eData = 1
}   eLCDMode;
////////////////////////////////////////////////////////////////////////////////
//#define BITBANG
////////////////////////////////////////////////////////////////////////////////
void LCD_Reset( void );
void        LCD_Init    ( void );
inline bool LCD_Busy    ( void );
////////////////////////////////////////////////////////////////////////////////
void LCD_Fill           ( Colour pColour);
void LCD_FillRectangle  ( Colour pColour,    Point pPoint,   Size pSize);
void LCD_DrawPixel      ( Colour pColour,    Point pPoint);
void LCD_DrawLine       ( Colour pColour,    Point pPoint1,  Point pPoint2);
void LCD_DrawField      ( UINT16Ptr pField,  Point pPoint,   Size pSize);
void LCD_DrawRectangle  ( Colour pColour,    Point pPoint1,  Point pPoint2);
void LCD_DrawCircle     ( Colour pColour,    Point pCentre,  UINT16 pRadius);
void LCD_FillCircle     ( Colour pColour,    Point pCentre,  UINT16 pRadius);
void Set_Addr_Window    ( UINT8 xs, UINT8 ys, UINT8 xe, UINT8 ye);
void LCD_Word_Write     ( UINT16 value );
////////////////////////////////////////////////////////////////////////////////
#endif	/* LCD_H */

