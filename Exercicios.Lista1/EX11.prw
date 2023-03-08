#INCLUDE "TOTVS.CH"

User Function EX11()

        local nValor1   := 0
        local nValor2   := 0
        local nValor3   := 0

    nValor1 := Val(FwInputBox("Passe o primeiro lado do Triangulo: ", ""))
    nValor2 := Val(FwInputBox("Passe o segundo lado do Triangulo: ", ""))
    nValor3 := Val(FwInputBox("Passe o terceiro lado do Triangulo: ", ""))

    MSGINFO("Agora vamos descobrir se ele é um triangulo")

    if ( nValor1 + nValor2 >= nValor3 ) .and. (nValor2 + nValor3 >= nValor1)  .and. (nValor1 + nValor3 >= nValor2)
        FwAlertError("Não é um Triangulo")

    else
        FwAlertSuccess("É um Triangulo!")            
            
    endif


Return 

