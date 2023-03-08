#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function l4_EX13()

    Local cTitle := 'BUSCA PRODUTO', cTexto := 'Digite o código do produto: '
    Local cCodigo := Space(15)
    Local nOpcao := 0
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cCodigo    SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Buscar'   SIZE 55, 11 OF oDlg PIXEL ACTION RetornaPed(cCodigo)
    @ 035, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 1, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function RetornaPed(cCodigo)

	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cPed := '', cMsg := 'Pedidos de venda para o produto ' + ALLTRIM(cCodigo) +  ' são: ¦ '

  rpcsetenv("99", "01")

	cQuery := 'SELECT C6_PRODUTO, C6_NUM' + CRLF + "FROM " + RetSqlName('SC6') + " SC6" + CRLF + "WHERE C6_PRODUTO = '" + cCodigo + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cPed := &(cAlias)->(C6_NUM)
		cMsg += cPed + " ¦ "
		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, 'Pedidos de venda')
	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
