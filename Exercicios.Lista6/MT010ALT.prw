#INCLUDE 'TOTVS.CH'

User Function MT010ALT()
    Local aArea     := GetArea()
    Local aAreaSB1  := SB1->(GetArea())
    Local lRetorno  := .F.

    if ExistBlock('ManuCad')
        lRetorno := ExecBlock('ManuCad', .F., .F.)
    endif

    RestArea(aArea)
    RestArea(aAreaSB1)
Return lRetorno
