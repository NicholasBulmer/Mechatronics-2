#include "Serial.h"
#include "SPI.h"

eSerialReturn Serial_Transaction(eSerial pType, Transaction * pDefinition, UINT16 pLength)
{
    UINT16 index;
    eTransaction current;
    
    switch (pType)
    {
        case eSPI:
            for(index = 0; index < pLength; index ++)
            {
                current = pDefinition[index].mType;
                switch(current)
                {
#ifdef SPI_ISR
                    case eSwap:
                        SPI_Send(&SPI1, pDefinition[index].mData);
                        break;
                    case eRead:
                        SPI_Send(&SPI1, 0xFF);
                        break;
                    case eWrite:
                        SPI_Send(&SPI1, pDefinition[index].mData);
                        break;
                    case eSetAddress:
                        return eReturnNoSetAddressAvaliable;        
#else
                    case eSwap:
                        pDefinition[index].mData = SPI_Send(&SPI1, pDefinition[index].mData);
                        break;
                    case eRead:
                        pDefinition[index].mData = SPI_Send(&SPI1, 0xFF);
                        break;
                    case eWrite:
                        SPI_Send(&SPI1, pDefinition[index].mData);
                        break;
                    case eSetAddress:
                        return eReturnNoSetAddressAvaliable;   
#endif
                };
            }
            break;
        case eI2C:
            break;
        case eUART:
            break;
    };
    return eReturnSuccess;
}