#include "LCD.h"
#include "LED.h"
#include "SPI.h"
#include "Port.h"
#include "Config.h"

static UINT8 w = LCD_TFTWIDTH;
static UINT8 l = LCD_TFTLENGTH;
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#ifndef BIT9MODE
#define ALTINIT
#define BIT8MODE
#endif
////////////////////////////////////////////////////////////////////////////////
#define MCMD(a)	    (a<<8)
#define UCMD(a)	    (a>>8)
#define DELAY	    0x80
#define D_CX	    (PORTFbits.RF7)



#ifdef BUFFERED
UINT16 Buf[LCD_TFTWIDTH][LCD_TFTLENGTH];
#define Buffer(x, y) Buf[x][y]
#endif

void Set_Addr_Window    ( UINT8 xs, UINT8 ys, UINT8 xe, UINT8 ye);
void LCD_Word_Write     ( UINT16 value );
void Set_Rotation(UINT8 m);

inline void Reset_Low()
{
    Port_SetPin(&PortF, IO_NRST, 1);
}
inline void Reset_High()
{
    Port_SetPin(&PortF, IO_NRST, 0);
}
inline void Mode_Set(eLCDMode pMode)
{
    PORTFbits.RF7 = (UINT8)pMode;
}
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
void Configure_GPIOs()
{
    //Make RS an output
    Port_SetPinType(&PortF, IO_WRITE, eTypeOutput);
    
    //Make RST an output
    Port_SetPinType(&PortF, IO_NRST, eTypeOutput);
    
    //Reset the LCD
    LCD_Reset();
    
#ifdef BITBANG
    Port_SetPinType(&PortD, SPI2_CS,	eTypeOutput);
    Port_SetPinType(&PortD, SPI2_SCK,	eTypeOutput);
    Port_SetPinType(&PortD, SPI2_SIMO,	eTypeOutput);
#else
    //Initialize the SPI port
    SPI_Init(SPIFREQ, eSPI2, eSPI_Mode1);
    SPI_MaxSpeed(&SPI2);
#endif
}
void LCD_Write(UINT8 value, eLCDMode mode)
{
#ifdef BITBANG
    UINT8 x=9;
    UINT16 v = value;
    v |= (mode == eCommand)?0:0x0100;
    PortD.mOutput->mBit7 = 0;
    while(x--)
    {
	PortD.mOutput->mBit6 = 0;
	PortD.mOutput->mBit4 = (v >> 8) & 41;
        PortD.mOutput->mBit6 = 1;
        v <<= 1;
    }
    PortD.mOutput->mBit7 = 1;
#else
    
#ifdef BIT9MODE
    UINT16 v = value;
    v  |= (mode == eCommand)?0:(1<<8);
    SPI_Send9(&SPI2, v);
#else
    Mode_Set(mode);
    SPI_Send(&SPI2, value);
#endif
#endif
}

void LCD_Reset()
{
    Reset_High();
    LED_Toggle(eLED2);
    delay_ms(DELAY);
    LED_Toggle(eLED2);
    Reset_Low();
    delay_ms(DELAY);
    LED_Toggle(eLED2);
    Reset_High();
    delay_ms(DELAY);
    LED_Toggle(eLED2);
}
void RAM_Address_Set()
{
     Set_Addr_Window(0x00, 0x00, 0x7F, 0x9F);
}

//This is recommended from manufacturer
const UINT16 InitList[] = { 
    
#ifdef ALTINIT
    MCMD(0x11),
    DELAY, 300, 
    MCMD(0xb1), 0x02, 0x35, 0x36, 
    MCMD(0xb2), 0x02, 0x35, 0x36, 
    MCMD(0xb3), 0x02, 0x35, 0x36, 0x02, 0x35, 0x36, 
    MCMD(0xb4), 0x00,
    MCMD(0xc0), 0xa2, 0x02, 0x84, 
    MCMD(0xc1), 0xc5, 
    MCMD(0xc2), 0x0d, 0x00, 
    MCMD(0xc3), 0x8d, 0x2a, 
    MCMD(0xc4), 0x8d, 0xee, 
    MCMD(0xc5), 0x0a, 
    MCMD(0x36), 0xc8, 
    MCMD(0xe0), 0x12, 0x1c, 0x10, 0x18, 0x33, 0x2c, 0x25, 0x28, 0x28, 0x27, 0x2f, 0x3c, 0x00, 0x03, 0x03, 0x10, 
    DELAY, 120, 
    MCMD(0xe1), 0x12, 0x1c, 0x10, 0x18, 0x2d, 0x28, 0x23, 0x28, 0x28, 0x26, 0x2f, 0x3b, 0x00, 0x03, 0x03, 0x10, 
    MCMD(0x3a), 0x05, 
    MCMD(0x2A), 0x00, 0x02, 0x00, 0x81, 
    MCMD(0x2b), 0x00, 0x03, 0x00, 0xa2, 
    MCMD(0x29), 
    MCMD(0x2C)
#else
    MCMD(0x11),
    DELAY, 300, 
    MCMD(0xb1), 0x02, 0x35, 0x36, 
    MCMD(0xb2), 0x02, 0x35, 0x36, 
    MCMD(0xb3), 0x02, 0x35, 0x36, 0x02, 0x35, 0x36, 
    MCMD(0xb4), 0x00,
    MCMD(0xc0), 0xa2, 0x02, 0x84, 
    MCMD(0xc1), 0xc5, 
    MCMD(0xc2), 0x0d, 0x00, 
    MCMD(0xc3), 0x8a, 0x2a, 
    MCMD(0xc4), 0x8d, 0xee, 
    MCMD(0xc5), 0x12, 
    MCMD(0x36), 0xc8, 
    MCMD(0xe0), 0x12, 0x1c, 0x10, 0x18, 0x33, 0x2c, 0x25, 0x28, 0x28, 0x27, 0x2f, 0x3c, 0x00, 0x03, 0x03, 0x10, 
    DELAY, 120, 
    MCMD(0xe1), 0x12, 0x1c, 0x10, 0x18, 0x2d, 0x28, 0x23, 0x28, 0x28, 0x26, 0x2f, 0x3b, 0x00, 0x03, 0x03, 0x10, 
    MCMD(0x3a), 0x05, 
    MCMD(0x2A), 0x00, 0x02, 0x00, 0x81, 
    MCMD(0x2b), 0x00, 0x03, 0x00, 0xa2, 
    MCMD(0x29), 
    MCMD(0x2C)
#endif
};    
void LCD_WriteCMD(UINT16 value)
{
    LCD_Write(((value & 0xFF00) >> 0x08), DAT);
    LCD_Write((value & 0x00FF), DAT);
}
void LCD_WriteData(UINT16 value)
{
    LCD_Write(((value & 0xFF00) >> 0x08), DAT);
    LCD_Write((value & 0x00FF), DAT);
}
void LCD_Init()
{
    UINT16 i;
    Configure_GPIOs();
    
    for (i = 0; i < ARRAYLEN(InitList); i++)
    {
	if (DELAY == InitList[i] && (i < (ARRAYLEN(InitList) - 1)))
	    delay_ms(InitList[++i]);
	else
	{
	    if (InitList[i] > 0xFF) LCD_Write(UCMD(InitList[i]),    eCommand);
	    else		    LCD_Write(InitList[i],	    eData);
	}
    }
    delay_ms(100);
    LCD_Write(LCD_DISPON, eCommand);
    Set_Rotation(1);
    
    delay_ms(100);
    LCD_Fill(BLACK);
}
inline bool LCD_Busy()
{
    return (SPI_Busy(&SPI2));
}
void LCD_Word_Write(UINT16 value)
{
    LCD_Write(((value & 0xFF00) >> 0x08), DAT);
    LCD_Write((value & 0x00FF), DAT);
}
void LCD_Data_Write(UINT8 DataH, UINT8 DataL)
{
    LCD_Write(DataH, DAT);
    LCD_Write(DataL, DAT);
}
void LCD_Data_Write_4k(UINT8 DataH, UINT8 DataM, UINT8 DataL)
{
    LCD_Write(DataH, DAT);
    LCD_Write(DataM, DAT);
    LCD_Write(DataL, DAT);
}
void Set_Addr_Window(UINT8 xs, UINT8 ys, UINT8 xe, UINT8 ye)
{
    ys+=2;
    ye+=2;
    xs+=3;
    xe+=3;

    LCD_Write(LCD_CASET, CMD);
    LCD_Write(0x00, DAT);
    LCD_Write(xs,   DAT);
    LCD_Write(0x00, DAT);
    LCD_Write(xe,   DAT);
    LCD_Write(LCD_RASET, CMD);
    LCD_Write(0x00, DAT);
    LCD_Write(ys,   DAT);
    LCD_Write(0x00, DAT);
    LCD_Write(ye,   DAT);
    LCD_Write(LCD_RAMWR, CMD);
}
void Invert_Display(UINT8 i)
{
    if(i == LCD_INVON)
    {
	LCD_Write(LCD_INVON, CMD);
    }
    else
    {
	LCD_Write(LCD_DISPON, CMD);
    }
}
UINT16 Swap_Colour(Colour pColour)
{
    return ((pColour << 0x000B) | (pColour & 0x07E0) | (pColour >> 0x000B));
}
void Set_Rotation(UINT8 m)
{
    UINT8 rotation = 0x00;

    LCD_Write(LCD_MADCTL, CMD);
    rotation = (m % 4);

    switch(rotation)
    {
        case 0:
        {
            LCD_Write((MADCTL_MX | MADCTL_MY | MADCTL_RGB), DAT);
            w = LCD_TFTWIDTH;
            l = LCD_TFTLENGTH;
            break;
        }
        case 1:
        {
            LCD_Write((MADCTL_MY | MADCTL_MV | MADCTL_RGB), DAT);
            w = LCD_TFTLENGTH;
            l = LCD_TFTWIDTH;
            break;
        }
        case 2:
        {
            LCD_Write((MADCTL_RGB), DAT);
            w = LCD_TFTWIDTH;
            l = LCD_TFTLENGTH;
            break;
        }
        case 3:
        {
            LCD_Write((MADCTL_MX | MADCTL_MV | MADCTL_RGB), DAT);
            w = LCD_TFTLENGTH;
            l = LCD_TFTWIDTH;
            break;
        }
    }
}
void LCD_Fill(Colour pColour)
{
#ifdef BUFFERED
    UINT8 x = 0x00;
    UINT8 y = 0x00;
    for(y = 0; y < l; y++)
        for(x = 0; x < w; x++)
	    Buffer(x,y) = pColour;
#else
    UINT8 i = 0x00;
    UINT8 j = 0x00;
    Set_Addr_Window(0, 0, (w - 1), (l - 1));
    for (j = l; j > 0; j--)
        for (i = w; i > 0; i--)
            LCD_Word_Write(pColour);
#endif
}

#ifdef BUFFERED
void LCD_Redraw()
{
    UINT8 i = 0x00;
    UINT8 j = 0x00;

    Set_Addr_Window(0, 0, (w - 1), (l - 1));
    for(j = 0; j < l; j++)
        for(i = 0; i < w; i++)
            LCD_Word_Write(Buffer(i,j));
}
#endif

void LCD_FillRectangle(Colour pColour, Point pPoint, Size pSize)
{
    UINT8 i = 0x00;
    UINT8 j = 0x00;
    
#ifdef BUFFERED
    UINT8 xmax = pPoint.x + pSize.x;
    UINT8 ymax = pPoint.y + pSize.y;
    for(j = pPoint.y; j < ymax; j++)
        for(i = pPoint.x; i < xmax; i++)
	    Buffer(i,j) = pColour;
#else
    Set_Addr_Window(pPoint.x, pPoint.y, pPoint.x + pSize.x - 1, pPoint.y + pSize.y - 1);
    for(j = pSize.y; j > 0; j--)
        for(i = pSize.x; i > 0; i--)
            LCD_Word_Write(pColour);
#endif
}
inline Point ToPoint(INT8 x, INT8 y)
{
    Point pt;
    pt.x = x;
    pt.y = y;
    return pt;
}
void LCD_DrawPixel(Colour pColour, Point pPoint)
{
#ifdef BUFFERED
    if (pPoint.x < w && pPoint.y < l)
	Buffer(pPoint.x, pPoint.y) = pColour;
#else
    Set_Addr_Window(pPoint.x, pPoint.y, (1 + pPoint.x), (1 + pPoint.y));
    LCD_Word_Write(pColour);
#endif
}
void LCD_DrawLine(Colour pColour, Point pPoint1, Point pPoint2)
{
    INT16 ww = pPoint2.x - pPoint1.x;
    INT16 hh = pPoint2.y - pPoint1.y;
    INT16 longest = abs(ww);
    INT16 shhortest = abs(hh);
    INT16 dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0;
    INT16 numerator = longest >> 1 ;
    INT16 i;
    
    if (ww<0) dx1 = -1 ; else if (ww>0) dx1 = 1 ;
    if (hh<0) dy1 = -1 ; else if (hh>0) dy1 = 1 ;
    if (ww<0) dx2 = -1 ; else if (ww>0) dx2 = 1 ;

    if (!(longest>shhortest)) 
    {
        longest = abs(hh) ;
        shhortest = abs(ww) ;
        if (hh<0) dy2 = -1 ; else if (hh>0) dy2 = 1 ;
        dx2 = 0 ;
    }
    
    for (i=0;i<=longest;i++) 
    {
        LCD_DrawPixel(pColour, pPoint1);
	
        numerator += shhortest ;
        if (!(numerator<longest)) 
	{
            numerator -= longest ;
            pPoint1.x += dx1 ;
            pPoint1.y += dy1 ;
        } 
	else 
	{
            pPoint1.x += dx2 ;
            pPoint1.y += dy2 ;
        }
    }
}
void LCD_DrawField(UINT16Ptr pField, Point pPoint, Size pSize)
{
    ////////////////////////////////////////////////////////////////////////////
    UINT8   i	    =	0x00;
    UINT8   xmax    =	pPoint.x + pSize.x;
    UINT8   ymax    =	pPoint.y + pSize.y;
    UINT16  count   =	pSize.x * pSize.y;
    ////////////////////////////////////////////////////////////////////////////
    Set_Addr_Window(pPoint.x, pPoint.y, (xmax - 1), (ymax - 1));
    ////////////////////////////////////////////////////////////////////////////
    for(i = 0; i < count; i++)
	LCD_Word_Write(pField[i]);
    ////////////////////////////////////////////////////////////////////////////
}
void LCD_DrawRectangle(Colour pColour, Point pPoint1, Point pPoint2)
{
    static Point p2;
    static Point p4;
    ////////////////////////////////////////////////////////////////////////////
    Point_Init(&p2, pPoint1.x, pPoint2.y);
    Point_Init(&p4, pPoint2.x, pPoint1.y);
    ////////////////////////////////////////////////////////////////////////////
    LCD_DrawLine(pColour, pPoint1, p2);
    LCD_DrawLine(pColour, p2, pPoint2);
    LCD_DrawLine(pColour, pPoint2, p4);
    LCD_DrawLine(pColour, p4, pPoint1);
    ////////////////////////////////////////////////////////////////////////////
}
void LCD_DrawCircle(Colour pColour, Point pCentre, UINT16 pRadius)
{
    INT16 a = 0x0000;
    INT16 b = 0x0000;
    INT16 p = 0x0000;

    b = pRadius;
    p = (1 - b);

    do
    {
	LCD_DrawPixel(pColour, ToPoint(pCentre.x + a, pCentre.y + b));
	LCD_DrawPixel(pColour, ToPoint(pCentre.x + b, pCentre.y + a));
	LCD_DrawPixel(pColour, ToPoint(pCentre.x - a, pCentre.y + b));
	LCD_DrawPixel(pColour, ToPoint(pCentre.x - b, pCentre.y + a));
	LCD_DrawPixel(pColour, ToPoint(pCentre.x + b, pCentre.y - a));
	LCD_DrawPixel(pColour, ToPoint(pCentre.x + a, pCentre.y - b));
	LCD_DrawPixel(pColour, ToPoint(pCentre.x - a, pCentre.y - b));
	LCD_DrawPixel(pColour, ToPoint(pCentre.x - b, pCentre.y - a));

	if(p < 0)
	    p += (0x03 + (0x02 * a++));
	else
	    p += (0x05 + (0x02 * ((a++) - (b--))));
     }while(a <= b);
}
void LCD_FillCircle(Colour pColour, Point pCentre, UINT16 pRadius)
{
   INT16 a = 0x0000;
   INT16 b = 0x0000;
   INT16 p = 0x0000;

   b = pRadius;
   p = (1 - b);

   do
   {
	LCD_DrawLine(pColour, ToPoint((pCentre.x - a), (pCentre.y + b)), ToPoint((pCentre.x + a), (pCentre.y + b)));
	LCD_DrawLine(pColour, ToPoint((pCentre.x - a), (pCentre.y - b)), ToPoint((pCentre.x + a), (pCentre.y - b)));
	LCD_DrawLine(pColour, ToPoint((pCentre.x - b), (pCentre.y + a)), ToPoint((pCentre.x + b), (pCentre.y + a)));
	LCD_DrawLine(pColour, ToPoint((pCentre.x - b), (pCentre.y - a)), ToPoint((pCentre.x + b), (pCentre.y - a)));

        if(p < 0)
            p += (0x03 + (0x02 * a++));
        else
            p += (0x05 + (0x02 * ((a++) - (b--))));
    }while(a <= b);
}
