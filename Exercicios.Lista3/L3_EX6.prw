#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX6()

    local aArea     := GetArea()
    local cAlias    := GetNextAlias()
    local cQuery    := ""
    local cProduto  := ""
    local cDesc     := ""
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cProduto := FwInputBox("Digite o c�digo a ser pesquisado:", cProduto)

    cQuery := "SELECT * FROM " + RetSqlName('SB1') + " WHERE B1_COD = '" + cProduto + "' AND D_E_L_E_T_ = ' '"

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        if alltrim(&(cAlias)->(B1_COD)) == cProduto
            cDesc := "C�digo: " + &(cAlias)->(B1_COD) + CRLF +;
                     "Descri��o: " + &(cAlias)->(B1_DESC) + CRLF+;
                     "Pre�o de Venda: R$ " + cvaltochar(&(cAlias)->(B1_PRV1))
            &(cAlias)->(DbSkip())
        endif
        
    End

    if cDesc == ""
        FwAlertError("N�o foram encontrados produtos com o c�digo informado.", "Aten��o")
    else
        FwAlertInfo(cDesc)
    endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return
