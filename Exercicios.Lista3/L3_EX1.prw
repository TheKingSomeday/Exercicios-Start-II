#INCLUDE "TOTVS.CH"
#INCLUDE "TBICONN.CH"
#INCLUDE "TOPCONN.CH"

user Function L3_EX1()

    local aArea     := GetArea()
    local cAlias    := GetNextAlias()
    local cDesc     := ""
    local cQuery    := ""
    local nCont     := 1

    PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" TABLES "SC7" MODULO "COM"

    cQuery := "SELECT C7_NUM FROM " + RetSqlName("SC7") + " GROUP BY C7_NUM"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cDesc += "Pedido " + CVALTOCHAR(Strzero(nCont, 2)) + "1 " + &(cAlias)->(C7_NUM) + CRLF
        nCont ++
        &(cAlias)->(DbSkip())
        
    end

    FwAlertInfo(cDesc, "Tabela dos Pedidos")

    &(cAlias)->(DBCLOSEAREA())
    RestArea(aArea)

Return
