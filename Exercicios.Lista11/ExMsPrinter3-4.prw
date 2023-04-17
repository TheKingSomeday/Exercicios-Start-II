#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO    RGB(000, 000, 000)

#DEFINE MAX_LINE 770   

/*/{Protheus.doc} User Function ExMsPrinter
    Relatório dos Exercícios 03 e 04 da lista 11
    @type  Function
    @author Henrique )
    @since 17/04/2023
    /*/
User Function ExMsPrinter()
    Local cAlias := GeraCons()
    if !Empty(cAlias)
        Processa({|| MontaRel(cAlias)}, "Aguarde...", "Imprimindo relatório...", .F.)
    else
        FwAlertError("Nenhum registro encontrado.", "Atenção")
    endif
Return 

User Function MT120BRW() 
    AAdd( aRotina, { 'Relatório Selecionado', 'U_ExMsPrinter', 0, 6 })//Adicionando um botão dentro da rotina de Pedidos de Compra.
    AAdd( aRotina, { 'Relatório Total', 'U_ExMsPrinter', 0, 6 })
Return

Static Function GeraCons()
    Local aArea     := GetArea()
    Local cAlias    := GetNextAlias()
    Local cQuery := ""
    cQuery += "SELECT SC7.C7_NUM, SC7.C7_EMISSAO, SC7.C7_FORNECE, SA2.A2_CGC, SA2.A2_NOME, SC7.C7_LOJA, SC7.C7_COND, SC7.C7_PRODUTO, SC7.C7_DESCRI, SC7.C7_QUANT, SC7.C7_PRECO, SC7.C7_TOTAL, SE4.E4_DESCRI" + CRLF
    cQuery += "FROM " + RetSqlName("SC7") + " SC7 " + CRLF
    cQuery += "INNER JOIN " + RetSqlName("SA2") + " SA2 ON SC7.C7_FORNECE = SA2.A2_COD " + CRLF
    cQuery += "INNER JOIN " + RetSqlName("SE4") + " SE4 ON SC7.C7_COND = SE4.E4_CODIGO " + CRLF
    cQuery += "WHERE SC7.C7_NUM = '" + alltrim(SC7->C7_NUM) + "' AND SC7.D_E_L_E_T_ = ' '" + CRLF
    
    TCQUERY cQuery ALIAS (cAlias) NEW
    (cAlias)->(DbGoTop())
    if (cAlias)->(Eof())
        cAlias := ""
    endif
    RestArea(aArea)
Return cAlias
//? Função principal (Criação do Relatório)
Static Function MontaRel(cAlias)
    Local cPath     := "H:\Desktop\Programação\TOTVS EXS\Aula08\Relatorio\FwMsPrinter\Rel.FwMsPrinter\"
    Local cArquivo  := 'EX3-4.pdf'
    //!Começo das variáveis privadas
    Private nLinha  := 105
    Private nColIni := 20
    Private nColFim := 820
    Private oPrint
    //! Fontes utilizadas
    Private oFont10 := TFont():New('Times New Roman', /*Compat*/, 10, /*Compat*/, .F. /*Negrito*/, /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F./*Sublinhado*/, .F./*Italico*/)
    Private oFont12 := TFont():New('Times New Roman', /*Compat*/, 12, /*Compat*/, .F., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oFont14 := TFont():New('Times New Roman', /*Compat*/, 14, /*Compat*/, .F., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oFont16 := TFont():New('Times New Roman', /*Compat*/, 16, /*Compat*/, .T., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .T., .F.)
    oPrint := FwMSPrinter():New(cArquivo, IMP_PDF, .F., ' ', .T., /*TR*/, @oPrint, ' ', /*LServer*/, /*Compat*/, /*RAW*/, .T., /*QtdCópias*/)
    oPrint:cPathPDF := cPath
    oPrint:SetPortrait() //!Deixa a orientação como retrato.
    oPrint:SetPaperSize(9) //!Seleciona o tamanho da folha de papel.
    oPrint:StartPage() //!Começa a página para impressão.
    Cabecalho(cAlias)
    ImpDados(cAlias)
    oPrint:EndPage() //!Finaliza a página para impressão.
    oPrint:Preview() //!Mostra o relatório
Return
Static Function Cabecalho(cAlias)
    //! Criando caixa para colocar texto
    oPrint:Box(015, 015, 085, 580, '-8')
    //!Criando uma linha
    oPrint:Line(50, 15, 50, 580, PRETO, '-6')
    oPrint:Say(35, 20, 'Empresa / Filial : ' + Alltrim(SM0->M0_NOME) + ' / ' + Alltrim(SM0->M0_FILIAL), oFont16, /*LargText*/, PRETO)
    oPrint:Say(35, 350, 'DATA: ' + (DtoC(StoD(Alltrim((cAlias)->C7_EMISSAO)))), oFont16, /*LargText*/, PRETO)
    oPrint:Say(70, 20, 'Número Pedido ' + Alltrim((cAlias)->(C7_NUM)), oFont14, /*LargText*/, PRETO)
    oPrint:Say(70, 350, 'CPF/CNPJ ' + Alltrim((cAlias)->(A2_CGC)), oFont14, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 20,  'FORNECEDOR' , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 250, 'LOJA'       , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 350, 'PAGAMENTO'  , oFont12, /*LargText*/, PRETO)
    nLinha += 5
    oPrint:Line(nLinha, 15, nLinha, 580, PRETO, '-6')
    nLinha += 20
    oPrint:Say(nLinha, 20, Alltrim((cAlias)->(C7_FORNECE)), oFont10,/*LargText*/, PRETO)
    oPrint:Say(nLinha, 70, Alltrim((cAlias)->(A2_NOME)), oFont10,/*LargText*/, PRETO)
    oPrint:Say(nLinha, 250, Alltrim((cAlias)->(C7_LOJA)), oFont10,/*LargText*/, PRETO)
    oPrint:Say(nLinha, 350, Alltrim((cAlias)->(C7_COND)) + " - " + alltrim((cAlias)->(E4_DESCRI)), oFont10,/*LargText*/, PRETO)
    nLinha += 40
    oPrint:Say(nLinha, 20,  'CÓDIGO', oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 100,  'DESCRIÇÃO', oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 250,  'QTD. VENDIDA', oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 350,  'VLR. UNI.', oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 420,  'VLR. TOTAL', oFont12, /*LargText*/, PRETO)
    nLinha += 5
    oPrint:Line(nLinha, 15, nLinha, 580, PRETO, '-6')
    nLinha += 20
Return
Static Function ImpDados(cAlias)
    Local cString := ''
    Local nTotal  := 0
    DbSelectArea(cAlias)
    (cAlias)->(DbGoTop())
While (cAlias)->(!EOF())
        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(C7_PRODUTO)), oFont10,, PRETO)
        //? Copiando o Descrição do produto para a variável cString
        cString  := AllTrim((cAlias)->(C7_DESCRI))
        //? Chamando função que verifica se há a necessidade de quebrar a linha
        VeriQuebLn(cString, 30, 100)
        oPrint:Say(nLinha, 250, cValToChar((cAlias)->(C7_QUANT)), oFont10,, PRETO)
        oPrint:Say(nLinha, 350, 'R$ ' + cValToChar((cAlias)->(C7_PRECO)), oFont10,, PRETO)
        oPrint:Say(nLinha, 420, 'R$ ' + cValToChar((cAlias)->(C7_TOTAL)), oFont10,, PRETO)
        nTotal += ((cAlias)->(C7_TOTAL)) //! Soma os valores totais para o totalizador
        nLinha += 30
        IncProc()
        (cAlias)->(DbSkip())
    Enddo
    
    oPrint:Line(nLinha, 015, nLinha, 580)
    nLinha += 10
    oPrint:Say(nLinha, 400, "TOTAL", oFont12,, PRETO)
    oPrint:Say(nLinha, 480, "R$ " + cValToCHar(nTotal), oFont12,, PRETO)
Return
Static Function VeriQuebLn(cString, nQtdCar, nCol)
    Local cTxtLinha  := ''
    Local lTemQuebra := .F.
    Local nQtdLinhas := MLCount(cString, nQtdCar, /*Tabulação*/, .F.)
    Local nI         := 0
    If nQtdLinhas > 1
        lTemQuebra := .T.
            For nI := 1 to nQtdLinhas
                cTxtLinha := MemoLine(cString, nQtdCar, nI)
                oPrint:Say(nLinha, nCol, cTxtLinha, oFont10,, PRETO)
                nLinha += 10
            Next
    Else
        oPrint:Say(nLinha, nCol, cString, oFont10,, PRETO)
    Endif
    If lTemQuebra
        nLinha -= nQtdLinhas * 10
    Endif
Return
