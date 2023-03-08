#INCLUDE "TOTVS.CH"

User Function EX12()

    Local cTime1 := ""
    Local cTime2 := ""
    Local nGol1  := 0
    Local nGol2  := 0


    cTime1 := FwInputBox("Digite o nome do primeiro time: ","")

    nGol1 := VAL(FwInputBox("Digite quantos gols o primeiro time fez: ",""))

    cTime2 := FwInputBox("Digite o nome do segundo time: ","")

    nGol2 := VAL(FwInputBox("Digite quantos gols o segundo time fez: ",""))

    IF nGol1 > nGol2

        MSGALERT(cTime1+" VENCEU!")

    ELSEIF nGol1 == nGol2

        MSGALERT("EMPATE!")    

    ELSE

        MSGALERT(cTime2+" VENCEU!")    

    ENDIF


Return
