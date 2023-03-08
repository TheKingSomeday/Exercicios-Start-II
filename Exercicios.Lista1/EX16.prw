#INCLUDE "TOTVS.CH"

User Function EX16()

    Local nNota1        := 0
    Local nNota2        := 0
    local nResult       := 0
    local lLoop        := .F.

    while lLoop == .F.

        nNota1  := VAL(FwInputBox("Digite a 1ª: ",""))

        nNota2  := VAL(FwInputBox("Digite a 2ª: ",""))  
            if nNota1  >= 0 .and. nNota1 <= 10 .and. nNota2  >= 0 .and. nNota2 <= 10
                
                lLoop := .T.

            else
                MSGALERT("Informe somente valores entre 0 e 10.")    
                
            endif
    end

    nResult := (nNota1+nNota2)/2

    FwAlertSuccess("A média é: " + alltrim(Str(nResult))) 

Return 
