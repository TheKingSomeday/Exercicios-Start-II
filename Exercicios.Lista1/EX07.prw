#INCLUDE "TOTVS.CH"

User Function EX07()

    local nQuantidade := 0
    local nPre�o      := 0


    nQuantidade := Val(FwInputBox("Digite quantas ma��s voc� quer comprar: ", ""))

    if nQuantidade > 0 .and. nQuantidade < 12

        nPre�o := nQuantidade * 1.30
        FwAlertSuccess("O pre�o fincal da compra ficou: " + Alltrim(Str(nPre�o)) + "R$")

    else   

        nPre�o := nQuantidade * 1
        FwAlertSuccess("O pre�o fincal da compra ficou: " + Alltrim(Str(nPre�o)) + "R$")
        
    endif

    
Return 

