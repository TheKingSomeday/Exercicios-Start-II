#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX4()

    local aArea   := GetArea()
    local cAlias  := GetNextAlias()
    local cDesc   := ""
    local cQuery  := ""
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'
    cQuery := "SELECT * FROM " + RetSqlName('SB1') + " WHERE B1_GRUPO = 'G002' AND D_E_L_E_T_ = ' '"
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())
    While &(cAlias)->(!EOF())
        cDesc += "Descrição: " + &(cAlias)->(B1_DESC) + CRLF
        &(cAlias)->(DbSkip())
    End
    FwAlertInfo(cDesc, "Películas")
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return
