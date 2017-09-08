#include "Colours.h"

UINT16 Colour_To565(UINT8 r, UINT8 g, UINT8 b)
{
    return (((r & 0xF8) << 0x08) | ((g & 0xFC) << 0x03) | (b >> 0x03));
}