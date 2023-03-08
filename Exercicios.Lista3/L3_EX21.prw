#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX21()

 	Local aArea  := GetArea(), cAlias := GetNextAlias()
	Local cQuery := '', cGrp := '', cGat := ''

    rpcsetenv('99', '01')

	cQuery := 'SELECT * ' + CRLF + "FROM " + RetSqlName('SB1') + " SB1" + CRLF+"WHERE B1_ZZGRP =  '  ' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	DbSelectArea('SB1')
	DbSetOrder(2)

	while &(cAlias)->(!EOF())
		cCode := &(cAlias)->(B1_COD)
		cGrp  := &(cAlias)->(B1_TIPO)

		Do Case
			Case cGrp == "MP"
				cGat := "MATERIA PRIMA PRODUCAO"
			Case cGrp == "PA"
				cGat := "PRODUTO PARA COMERCIALIZACAO"
			Otherwise
				cGat := "OUTROS PRODUTOS"
		EndCASE

		if DbSeek(xFilial('SB1') + cGrp + cCode)
			RecLock('SB1', .F.)
			SB1->B1_ZZGRP := cGat 
			MsUnlock() 
		endif

		&(cAlias)->(DbSkip())
	enddo

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
    
Return


