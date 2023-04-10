#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function TReport
	Exemplo de impressão com TReport.
	@type  Function
	@author Henrique O
	@since 10/04/2023
/*/
User Function TReport()
	Local oReport := GeraReport() 
	
	//? Exibindo a tela de configuração para a impressão do relatório
 	oReport:PrintDialog()
Return
Static Function GeraReport()
	Local cAlias	:= GetNextAlias()
	
	//? Instanciando a classe de impressão.
	Local oReport	:= TReport():New('TREPORT', 'Relatório de Produtos',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relatório imprimirá todos os produtos cadastrados',.F.,,,, .T., .T.)	
	//? Instanciando a classe de sessão (Ficará dentro da impressão)
	Local oSection1	:= TRSection():New(oReport, "Clientes Novos por UF",,,.F.,.T.)		
	// oReport:SetLandscape() //? Se deixarmos o 6º parâmetro do método contrutor (:New()) como ".T." não precisamos usar esse método. 
	//? Criando célula onde ficará o código
	TRCell():New(oSection1, 'B1_COD', 'SB1', 'Codigo', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
	//? Criando célula onde ficará o Descricao
	TRCell():New(oSection1, 'B1_DESC', 'SB1', 'Descricao', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
	//? Criando célula onde ficará o endereço
	TRCell():New(oSection1, 'B1_UM', 'SB1', 'Unidade de Medida', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
	//? Criando célula onde ficará o Preco de Venda
	TRCell():New(oSection1, 'B1_PRV1', 'SB1', 'Preco de Venda', /*Picture*/, 20, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
	//? Criando célula onde ficará a Armazem
	TRCell():New(oSection1, 'B1_LOCPAD', 'SB1', 'Armazem', /*Picture*/, 20, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
Return oReport

//* Faz o print das colunas.
Static Function Imprime(oReport, cAlias)
	Local oSection1 := oReport:Section(1)
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()	
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)	
	//*------------------------------------------------------------------------------------------------------------------------
	   //? DBUseArea: Abre uma tabela de dados na área de trabalho atual ou na primeira área de trabalho disponível.
		   //TODO: https://tdn.totvs.com/pages/releaseview.action?pageId=23889335
	
	  //? TCGenQry: Determina que a próxima chamada à DBUseArea será a abertura de uma Query e não de tabela.
		   //TODO: https://tdn.totvs.com/display/tec/TCGenQry
	//*------------------------------------------------------------------------------------------------------------------------
	Count TO nTotReg //? "Count" contém a quantidade de registros da consulta. "Count TO nTotRec" passa a quant. p/ nTot
	//? Define o número máximo para a barra de progressão
	oReport:SetMeter(nTotReg)
	//? Define o título do Relatório
	oReport:SetTitle('Relatório de Clientes')
	//? Inicializa uma nova página para impressão
	oReport:StartPage()
	oSection1:Init()  
	(cAlias)->(DBGoTop())
	
	//? Percorre todos os registros
	while !(cAlias)->(EoF())
		//? Se cancelar a operação
		if oReport:Cancel() //! Cancela o loop, ou seja, o processo.
			Exit
		endif
		//? Setando o conteúdo do registro posicionado na coluna "Código" da seção
		oSection1:Cell('Codigo'):SetValue((cAlias)->B1_COD)

		//? Setando o conteúdo do registro posicionado na coluna "Descricao" da seção
		oSection1:Cell('Descricao'):SetValue((cAlias)->B1_DESC)
		
		//? Setando o conteúdo do registro posicionado na coluna "Endereço" da seção
		oSection1:Cell('Unidade de Medida'):SetValue((cAlias)->B1_UM)
		
		//? Setando o conteúdo do registro posicionado na coluna "Preco de Venda" da seção
		oSection1:Cell('Preco de Venda'):SetValue((cAlias)->B1_PRV1)
		
		//? Setando o conteúdo do registro posicionado na coluna "Armazem" da seção
		oSection1:Cell('Armazem'):SetValue((cAlias)->B1_LOCPAD)
		
		//? Imprimindo (gerando) a linha
		oSection1:PrintLine()
		//? Imprimindo uma linha fina
		oReport:ThinLine()
		//? Imcrementando a barra de progressão
		oReport:IncMeter()
		(cAlias)->(DBSkip())
	enddo   
	
	(cAlias)->(DBCloseArea())
	//? Finalizando a impressão da seção
	oSection1:Finish()			
	//? Finalizando a página na impressão
	oReport:EndPage()
Return  

//* Monta a consuta SQL.
Static Function GeraQuery()
	Local cQuery := ''
	cQuery += 'SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD' + CRLF
	cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF
Return cQuery
