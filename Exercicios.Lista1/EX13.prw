#INCLUDE "TOTVS.CH"

User Function EX13()

    Local cProd         := ""
    Local nQuant        := ""
    Local nPre�oUni     := 0

    cProd       := FwInputBox("Digite o nome do produto: ", cProd)

    nQuant      := VAL(FwInputBox("Digite a quantidade comprada: ",""))

    nPre�oUni   := VAL(FwInputBox("Digite o pre�o unit�rio: ",""))


    CalcProd(cProd, nQuant, nPre�oUni)


Return



Static Function CalcProd(cProd, nQuant, nPre�oUni)

        local nValorFinal := 0
        local nDesc := 0

        if nQuant <= 5 
            
            nDesc       := nPre�oUni * 2/100
            nValorFinal := nPre�oUni - nDesc
                                        
        elseif nQuant > 5 .and.  nQuant <= 10
            
            nDesc       := nPre�oUni * 3/100
            nValorFinal := nPre�oUni - nDesc

        else
            
            nDesc       := nPre�oUni * 5/100
            nValorFinal := nPre�oUni - nDesc

        endif

        MSGALERT("O pre�o final do produto com o desconto �: " + alltrim(Str(nValorFinal)) + "R$")
        
Return nValorFinal
