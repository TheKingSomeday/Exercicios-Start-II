#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX9()

    local aArea     := GetArea()
    local cAlias    := GetNextAlias()
    local cQuery    := ""
    local cDesc     := ""
    local cPesquisa := ""
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'COM'

    cPesquisa := FwInputBox("Digite o c�digo a ser pesquisado:", cPesquisa)

    cQuery := "SELECT PED.C5_NUM, PROD.C6_PRODUTO FROM " + RetSqlName('SC6') + " PROD INNER JOIN " + RetSqlName('SC5') + " PED ON PROD.C6_NUM = PED.C5_NUM WHERE PROD.C6_PRODUTO = '" + cPesquisa + "' AND PROD.D_E_L_E_T_ = ' '"

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        cDesc += alltrim(&(cAlias)->(C5_NUM))

            if &(cAlias)->(!EOF())
                cDesc += ", "
                &(cAlias)->(DbSkip())
            else
                cDesc += "."
                &(cAlias)->(DbSkip)
            endif
    End

    FwAlertInfo("O produto pesquisado se encontra nos pedidos:" + CRLF +;
                cDesc, "Pesquisa de Produto")

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return


