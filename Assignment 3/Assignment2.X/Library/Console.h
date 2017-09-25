/*
 * Console.h
 *
 *  Created on: 23/12/2016
 *      Author: David Ledger
 */
#ifndef CONSOLE_H
#define CONSOLE_H
#include "Types.h"
#include "Config.h"
#include "Colours.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//#define FULL_CLEAR //NOT RECOMMENDED
#define PRINTF_ENABLE
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#ifdef CONSOLE_BUFFERED
void        Console_Init            ();
#else
#define     Console_Init()
#endif
void	    Console_ClearCursor();
inline void Console_PrintChar       (char pInput);
void        Console_PrintString     (str pInput);
#ifdef CONSOLE_BUFFERED
void        Console_Render();
#else
#define     Console_Render()
#endif

////////////////////////////////////////////////////////////////////////////////
inline void Console_SetForecolour   (Colour pColour);
inline void Console_SetBackcolour   (Colour pColour);
inline void Console_SetForecolourRGB(UINT8 r, UINT8 g, UINT8 b);
inline void Console_SetBackcolourRGB(UINT8 r, UINT8 g, UINT8 b);
#endif /* CONSOLE_H_ */
