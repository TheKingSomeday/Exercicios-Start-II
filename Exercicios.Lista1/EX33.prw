#INCLUDE 'TOTVS.CH'

User Function EX33()

    local aNumeros  := {}
    local nCount    := 0
    local nCont     := 1
    local nUser     := 0
    local cPosScan  := ""
    local nConta    := 0

    
    For nCount := 1 to 20
        nUser := Val(FwInputBox("Digite um n�mero: " + cvaltochar(nCount) + "/20"))
        aAdd(aNumeros, nUser)
    next

    For nCount := 1 to 20
        
        if (aNumeros[nCount]) == (aNumeros[nCont])
                cPosScan += cvaltochar(nCount) + " // "
                nConta++
        endif

    Next

    if nConta > 0
        FwAlertInfo("Existem n�meros iguais nas posi��es: " + CRLF +;
                    cPosScan, "Arrays")
    else
        FwAlertError("N�o existem n�meros em posi��es iguais em ambos os arrays.", "Arrays")
    endif 


Return
