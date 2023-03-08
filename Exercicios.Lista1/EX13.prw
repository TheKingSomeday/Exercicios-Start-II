#INCLUDE "TOTVS.CH"

User Function EX13()

    Local cProd         := ""
    Local nQuant        := ""
    Local nPreçoUni     := 0

    cProd       := FwInputBox("Digite o nome do produto: ", cProd)

    nQuant      := VAL(FwInputBox("Digite a quantidade comprada: ",""))

    nPreçoUni   := VAL(FwInputBox("Digite o preço unitário: ",""))


    CalcProd(cProd, nQuant, nPreçoUni)


Return



Static Function CalcProd(cProd, nQuant, nPreçoUni)

        local nValorFinal := 0
        local nDesc := 0

        if nQuant <= 5 
            
            nDesc       := nPreçoUni * 2/100
            nValorFinal := nPreçoUni - nDesc
                                        
        elseif nQuant > 5 .and.  nQuant <= 10
            
            nDesc       := nPreçoUni * 3/100
            nValorFinal := nPreçoUni - nDesc

        else
            
            nDesc       := nPreçoUni * 5/100
            nValorFinal := nPreçoUni - nDesc

        endif

        MSGALERT("O preço final do produto com o desconto é: " + alltrim(Str(nValorFinal)) + "R$")
        
Return nValorFinal
