#INCLUDE "TOTVS.CH"

User Function EX03()

    local nAno := 0
    local nMes := 0
    local nDia := 0
    Local nTotaldias := 0 

    nAno   := Val(FwInputBox("Digite o ano que voce nasceu: ", ""))
    nMes   := Val(FwInputBox("Digite o Mes que voce nasceu: ", ""))
    nDia   := Val(FwInputBox("Digite o Dia que voce nasceu: ", ""))
    
    nTotaldias := CalcIdade(nAno, nMes, nDia) 

    MSGALERT( "A sua idade em dias é: " + Alltrim(Str(nTotaldias)) + " Dias." )
    
    
Return 


Static Function CalcIdade(nAno, nMes, nDia) 

    Local nTotdias := 0  

    while nAno > 0
        
        nTotdias := nTotdias + 365

        nAno--

    end

    while nMes > 0
        
        nTotdias := nTotdias + 30

        nMes--

    end

    nTotdias := nTotdias + nDia


    
Return nTotdias
