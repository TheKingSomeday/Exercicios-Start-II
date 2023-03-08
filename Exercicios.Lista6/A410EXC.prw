#INCLUDE "TOTVS.CH" 

User Function A410EXC()
    Local aArea     := GetArea()
    Local aAreaSC5  := SC5->(GetArea())
    Local lRetorno  := .F.

    if DelPed('ValidaExc')
        lRetorno := DelPed('ValidaExc', .F., .F.)
    endif

    RestArea(aArea)
    RestArea(aAreaSC5)
Return lRetorno
