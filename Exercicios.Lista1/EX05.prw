#INCLUDE "TOTVS.CH"

User Function EX05()

    local nValFabCarro  := 0
    local nDistri       := 28/100
    local nImposto      := 45/100
    local nAumento      := 0
    local nValFinal     := 0
    

    nValFabCarro := Val(FwInputBox("Digite o Valor de Fábrica do carro: ", ""))
    
    nAumento        := (nValFabCarro*nDistri)*nImposto 

    nValFinal   := nValFabCarro + nAumento

    MSGALERT( "O Preço final do carro é: " + Alltrim(Str(nValFinal)) + "." )
    
    
Return 



