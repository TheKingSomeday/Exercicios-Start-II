#INCLUDE "TOTVS.CH"

User Function EX07()

    local nQuantidade := 0
    local nPreço      := 0


    nQuantidade := Val(FwInputBox("Digite quantas maçãs você quer comprar: ", ""))

    if nQuantidade > 0 .and. nQuantidade < 12

        nPreço := nQuantidade * 1.30
        FwAlertSuccess("O preço fincal da compra ficou: " + Alltrim(Str(nPreço)) + "R$")

    else   

        nPreço := nQuantidade * 1
        FwAlertSuccess("O preço fincal da compra ficou: " + Alltrim(Str(nPreço)) + "R$")
        
    endif

    
Return 

