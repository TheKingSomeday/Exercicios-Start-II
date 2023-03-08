#INCLUDE 'TOTVS.CH'

User Function EX29()

    local aArray1    := {}
    local aArray2    := {}
    local nNum       := 0
    local nCont      := 0
    local cConcat    := ""


    For nCont := 1 to 10
        aadd(aArray1, nCont)

    NEXT    

    nNum := val(FwInputBox("Digite um numero multiplicador: "))

    For nCont := 1 to 10

        AADD( aArray2, aArray1[nCont] * nNum )

        if nCont < 10
            cConcat += "{" + CVALTOCHAR( aArray2[nCOnt] ) + "},"

        else 
            cConcat += "{" + CVALTOCHAR( aArray2[nCOnt] ) + "}."

        endif      

    NEXT

    MSGINFO( cConcat )

Return
