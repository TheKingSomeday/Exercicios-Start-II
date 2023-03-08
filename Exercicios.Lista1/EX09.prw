#INCLUDE "TOTVS.CH"

User Function EX09()

    local nValor := 0

    nValor := Val(FwInputBox("Digite um valor e veja se é positivo, negativo ou zero: ", ""))

    if nValor == 0 

        FwAlertSuccess("O Valor é Zero!")

    elseif nValor < 0        
           
        nPreço := nValor
        FwAlertSuccess("O Valor é Negativo!")

    else

        FwAlertSuccess("O Valor é Positivo!")    
            
    endif

    
Return 

