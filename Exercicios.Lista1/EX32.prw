#INCLUDE 'TOTVS.CH'

User Function EX32()

    local aArray1   := {}
    local aArray2   := {}
    local nCount    := 0
    local nUser     := 0
    local cPosScan  := ""
    local nConta    := 0

    
    For nCount := 1 to 15
        nUser := Val(FwInputBox("Digite um n�mero: " + cvaltochar(nCount) + "/15"))
        aAdd(aArray1, nUser)
    next
    
    For nCount := 1 to 15
        nUser := Val(FwInputBox("Digite um n�mero adicionar ao segundo array: " + cvaltochar(nCount) + "/15"))
        aAdd(aArray2, nUser)
    Next

    For nCount := 1 to 15
        
        if (aArray1[nCount]) == (aArray2[nCount])
                cPosScan += cvaltochar(nCount) + " // "
                nConta++
        endif
    Next

    if nConta > 0
        FwAlertInfo("Ambos os arrays possuem n�meros iguais nas posi��es abaixo:" + CRLF +;
                    cPosScan, "Arrays")
    else
        FwAlertError("N�o existem n�meros em posi��es iguais em ambos os arrays.", "Arrays")
    endif 


Return
