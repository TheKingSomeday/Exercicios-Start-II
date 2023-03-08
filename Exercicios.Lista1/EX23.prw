#INCLUDE "TOTVS.CH"

User Function EX23()

    Local nI   := 1
    Local nNum := 0
    Local nNeg := 0

    WHILE nI <= 10 

        nNum := VAL(FwInputBox("Digite um valor:",""))

        IF nNum < 0

            nNeg++

        ENDIF

        nI++

    ENDDO

    MSGALERT("Você informou "+ALLTRIM(STR(nNeg))+" numeros negativos.")

Return
