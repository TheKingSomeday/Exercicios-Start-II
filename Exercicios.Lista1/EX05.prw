#INCLUDE "TOTVS.CH"

User Function EX05()

    local nValFabCarro  := 0
    local nDistri       := 28/100
    local nImposto      := 45/100
    local nAumento      := 0
    local nValFinal     := 0
    

    nValFabCarro := Val(FwInputBox("Digite o Valor de F�brica do carro: ", ""))
    
    nAumento        := (nValFabCarro*nDistri)*nImposto 

    nValFinal   := nValFabCarro + nAumento

    MSGALERT( "O Pre�o final do carro �: " + Alltrim(Str(nValFinal)) + "." )
    
    
Return 



