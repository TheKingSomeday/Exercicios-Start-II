#INCLUDE "TOTVS.CH"

User Function EX09()

    local nValor := 0

    nValor := Val(FwInputBox("Digite um valor e veja se � positivo, negativo ou zero: ", ""))

    if nValor == 0 

        FwAlertSuccess("O Valor � Zero!")

    elseif nValor < 0        
           
        nPre�o := nValor
        FwAlertSuccess("O Valor � Negativo!")

    else

        FwAlertSuccess("O Valor � Positivo!")    
            
    endif

    
Return 

