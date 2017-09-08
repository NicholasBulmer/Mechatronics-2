/*
 * Point.h
 *
 *  Created on: 23/12/2016
 *      Author: David Ledger
 */

#ifndef POINT_H_
#define POINT_H_
#include "Types.h"

typedef struct Point    Point;
typedef Point * const   PointPtr;

struct Point
{
	INT16 x;
	INT16 y;
};

typedef Point           Size;
typedef Point *         SizePtr;

void Point_Init(PointPtr pInput, INT16 x, INT16 y);
void Size_Init(SizePtr pInput, INT16 x, INT16 y);
#endif /* POINT_H_ */
