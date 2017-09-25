/* 
 * File:   Colours.h
 * Author: David Ledger
 *
 * Created on 22 November 2016, 4:32 PM
 */

#ifndef COLOURS_H
#define	COLOURS_H

#include "Types.h"
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
typedef     UINT16  Colour;
typedef     Colour * ColourPtr;
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#define     BLACK                                                           0x0000
#define     LIGHTBLUE                                                       0xB6DF
#define     BLUE                                                            0x001F
#define     DARKBLUE                                                        0x3113
#define     RED                                                             0xF800
#define     GREEN                                                           0x07E0
#define     CYAN                                                            0x07FF
#define     MAGENTA                                                         0xF81F
#define     YELLOW                                                          0xFFE0
#define     WHITE                                                           0xFFFF
#define     GREY                                                            0x9CF3  
#define     DARKGREY                                                        0x39E7

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
Colour Colour_To565(UINT8 r, UINT8 g, UINT8 b);
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
#endif	/* COLOURS_H */

