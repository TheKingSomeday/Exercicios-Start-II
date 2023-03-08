#INCLUDE "TOTVS.CH"

User Function EX17()

    Local nNota1        := 0
    Local nNota2        := 0
    local nResult       := 0
    local cRepetir      := ""
    local lLoop         := .F.

    while lLoop == .F.

        nNota1  := VAL(FwInputBox("Digite a 1ª: ",""))

        nNota2  := VAL(FwInputBox("Digite a 2ª: ",""))  
            if nNota1  >= 0 .and. nNota1 <= 10 .and. nNota2  >= 0 .and. nNota2 <= 10
                
                lLoop := .T.

            else
                MSGALERT("Informe somente valores entre 0 e 10.")    
                
            endif


        nResult := (nNota1+nNota2)/2

        FwAlertSuccess("A média é: " + alltrim(Str(nResult))) 

        cRepetir  := FwInputBox("Você deseja repetir o processo? (S/N): ",cRepetir )

            if cRepetir == "S" 
                lLoop := .F.

            elseif cRepetir == "N"
                lLoop := .T.

            endif    

    end

Return 
