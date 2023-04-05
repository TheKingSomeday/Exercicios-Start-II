/*/{Protheus.doc} User Function PSAY
	Exemplo de relat�rio utilizando PSAY EX2
	@type  Function
	@author Henrique O
	@since 04/04/2023
	/*/
User Function PSAY_EX2()                
	Local cTitulo       := 'Cadastros de Produtos'
	Private cTamanho    := 'M'
	Private cNomeProg   := 'PSAY' //? Nome do programa para impressao no cabecalho
	Private aReturn     := {'Zebrado', 1, 'Administracao', 1, 2, '', '', 1}
	Private nLastKey    := 0
	Private cNomRel     := 'PSAY' //? Nome do arquivo usado para impressao em disco
	Private cAlias 	    := 'SB1'
	Private m_pag		:= 1
	//? Monta a interface padrao com o usuario...
	cNomRel := SetPrint(cAlias, cNomeProg, '', @cTitulo, '', '', '', .F.,, .T., cTamanho,, .F.)
	
	//? Se pressionar "ESC" encerra o programa
	if nLastKey == 27
		FwAlertError('Opera��o cancelada pelo usu�rio!', 'CANCELADO!')
		Return
	endif
	//? Prepara o ambiente para impress�o
	SetDefault(aReturn, cAlias,, .T., 1)
	//? Processamento. RPTSTATUS monta janela com a regua de processamento.
	RptStatus({|| Imprime(cTitulo)}, cTitulo)
Return

Static Function Imprime(cTitulo)
	Local cCabec	 := ' C�DIGO         DESCRI��O                      UN. MED.               PRE�O      ARMAZ�M
 	Local cTraco	 := '-------------------------------------------------------------------------------------------------------------'
	Local nLinha 	 := 8 //? Linha em que a impress�o iniciar�
	Local aColunas	 := {}
	Local cPreco     := 0
	
	//? Colunas para impress�o
	Aadd(aColunas, 001)
	Aadd(aColunas, 012)
	Aadd(aColunas, 050)
	Aadd(aColunas, 070)
	Aadd(aColunas, 085)
	DbSelectArea('SB1')
	SB1->(DbSetOrder(1))
	//? Cabe�alho do Relat�rio
	Cabec(cTitulo, cCabec, '',, cTamanho)
	//? Impress�o dos dados de cada registro em linha
	while !Eof()
		cPreco := 'R$'+Alltrim(STR(SB1->B1_PRV1,,2))
		@ nLinha, aColunas[1] PSAY PADR(Alltrim(SB1->B1_COD), 10)
		@ nLinha, aColunas[2] PSAY PADR(Alltrim(SB1->B1_DESC), 30)
		@ nLinha, aColunas[3] PSAY PADR(Alltrim(SB1->B1_UM), 30)
		@ nLinha, aColunas[4] PSAY Alltrim(cPreco)
		@ nLinha, aColunas[5] PSAY PADR(Alltrim(SB1->B1_LOCPAD), 20)
		nLinha++
		@ nLinha,00 PSAY cTraco
		nLinha++
		SB1->(dbSkip())
  	enddo
	//? Finaliza a execucao do relatorio...
	SET DEVICE TO SCREEN
	//? Se impressao em disco, chama o gerenciador de impressao...
	if aReturn[5] == 1
		SET PRINTER TO dbCommitAll()
		OurSpool(cNomRel) //? Gerenciador de impress�o do Protheus
	endif
	//? Descarrega o spool de impress�o
	MS_FLUSH()
Return
