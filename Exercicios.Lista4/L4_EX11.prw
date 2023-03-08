#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function l4_EX11()

    local cProd     := space(6)
    Private oCalc 

    FWAlertinfo("Busca de Produtos.","ProtRicks")

    DEFINE MSDIALOG oCalc TITLE "Busca produtos" FROM 000, 000 to 160, 350 PIXEL 
    @ 020, 010 SAY "Digite o codigo do produto: " SIZE 80, 14 OF oCalc Pixel
    @ 017, 090 MSGET cProd                        SIZE 60, 11 OF oCalc PIXEL 
    @ 065, 058 BUTTON 'Cancelar'                  SIZE 55, 11 OF oCalc PIXEL ACTION (nOpcao := 2, oDlg:End())
    @ 045, 025 BUTTON "Buscar"                    SIZE 120, 11 OF oCalc Pixel;
    ACTION (BuscaProd(cProd))

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function BuscaProd(cProd)

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
    Local nI      := 0

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'FAT'

    cQuery := "SELECT " + CRLF
    cQuery += "     B1_COD " + CRLF
    cQuery += "     ,B1_DESC " + CRLF
    cQuery += "     ,B1_PRV1 " + CRLF
    cQuery += "FROM " + RetSqlName('SB1') +  CRLF
    cQuery += " ORDER BY B1_DESC ASC "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())

        If alltrim(cProd) == ALLTRIM(&(cAlias)->(B1_COD))
            cMsg += 'Código: ' + &(cAlias)->(B1_COD) + CRLF
            cMsg += 'Descrição: ' + &(cAlias)->(B1_DESC) + CRLF
            cMsg += 'Preço de venda: R$' + Alltrim(STR(&(cAlias)->(B1_PRV1))) + CRLF
            cMsg += '--------------------' + CRLF + CRLF

            nI++
        Endif

        &(cAlias)->(DbSkip())
    Enddo

    If nI > 0
        FwAlertSuccess(cMsg, 'Dados do Produto')
    Else
        FwAlertError('Código de produto inexistente no sistema')
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return
