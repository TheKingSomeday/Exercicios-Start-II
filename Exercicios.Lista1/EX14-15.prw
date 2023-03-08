#INCLUDE "TOTVS.CH"

User Function EX14()

    Local nNum1         := 0
    Local nNum2         := 0
    local nResult       := 0
    local lLoop         := .F.

    Num1  := VAL(FwInputBox("Digite o Dividendo: ",""))

    while lLoop == .F.

        Num2  := VAL(FwInputBox("Digite o Dividor: ",""))  

            if nNum2  > 0
                
                lLoop := .T.

            else
                MSGALERT("Informe um numero positivo.")    
                
            endif
    end

    nResult := nNota1/nNum2 

    FwAlertSuccess("O Resultado da Divisão entre " + alltrim(Str(nNum1)) + " e " + alltrim(Str(nNum2 )) + "é: " + alltrim(Str(nResult)))
Return 
