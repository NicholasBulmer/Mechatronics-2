#include "Point.h"

void Point_Init(PointPtr pInput, INT16 x, INT16 y)
{
    pInput->x = x;
    pInput->y = y;
}

void Size_Init(SizePtr pInput, INT16 x, INT16 y)
{
    pInput->x = x;
    pInput->y = y;
}