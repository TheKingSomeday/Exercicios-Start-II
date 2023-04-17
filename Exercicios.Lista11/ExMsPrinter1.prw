#INCLUDE "TOTVS.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "RPTDEF.CH"
#INCLUDE "FWPRINTSETUP.CH"

#DEFINE PRETO RGB(000,000,000) 
#DEFINE MAX_LINE  770 

/*/{Protheus.doc} User Function ExMsPrinter
    (long_description)
    @type  Function
    @author Henrique O
    @since 14/04/2023
    /*/
User Function ExMsPrinter()
    local cAlias := GeraCons()

    if !Empty(cAlias)
        Processa({|| MontaRel(cAlias)}, "Aguarde...", "Imprimindo relatório...", .T.)
    else
        FwAlertError("Nenhum registro encontrado!","Atenção")
    ENDIF

Return 

Static Function GeraCons()
    local aArea  := GetArea()
    local cAlias := GetNextAlias()
    local cQuery := ""

    cQuery := "SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD" + CRLF
    cQuery += "FROM " + RetSqlName("SB1") + " SB1" + CRLF 
    cQuery += "WHERE D_E_L_E_T_ = ' '"

    TCQUERY cQuery ALIAS (cAlias) NEW

    (cAlias)->(DbGoTop())

    if (cAlias)->(EOF())
        cAlias := ""
    ENDIF

    RestArea(aArea)

Return cAlias

Static Function MontaRel(cAlias)
    local cPath := "H:\Desktop\Programação\TOTVS EXS\Aula08\Relatorio\FwMsPrinter\Rel.FwMsPrinter\"
    local cArquivo := "EX1.pdf"

    Private nLinha  := 105
    Private oPrint
    Private oFont10 := TFont():New("Arial", /*C*/, 10, /*C*/, .F., /*C*/, /*C*/, /*C*/, /*C*/, .F., .F.) //! Font size/ Negrito/Underline/Italic
    Private oFont12 := TFont():New("Arial", /*C*/, 12, /*C*/, .T., /*C*/, /*C*/, /*C*/, /*C*/, .F., .F.)
    Private oFont14 := TFont():New("Arial", /*C*/, 14, /*C*/, .T., /*C*/, /*C*/, /*C*/, /*C*/, .F., .F.)
    Private oFont16 := TFont():New("Arial", /*C*/, 16, /*C*/, .T., /*C*/, /*C*/, /*C*/, /*C*/, .T., .F.)

    oPrint := FWMsPrinter():New(cArquivo, IMP_PDF, .F., "", .T.,/*TR*/, @oPrint, "",/*LServ*/,/*C*/,/*RAW*/,.T.)
    oPrint:cPathPDF := cPath

    oPrint:SetPortrait()
    oPrint:SetPaperSize(9)

    oPrint:StartPage()

    Cabecalho()
    ImpDados(cAlias)

    oPrint:EndPage()

    oPrint:Preview()

Return

Static Function Cabecalho()
    oPrint:Box(15,15,85,580, "-8")
    oPrint:Line(50,15,50,580,, "-8")

    oPrint:Say(35,20, "Empresa / Filial: " + AllTRIM(SM0->M0_NOME) + " / " + AllTRIM(SM0->M0_FILIAL), oFont14,, PRETO )
    oPrint:Say(70,220, "PRODUTOS" , oFont16,, PRETO )

    oPrint:Say(nLinha,20,  "CÓDIGO"             , oFont12,,PRETO)
    oPrint:Say(nLinha,80,  "DESCRIÇÃO"          , oFont12,,PRETO)
    oPrint:Say(nLinha,200, "UNIDADE DE MEDIDA"  , oFont12,,PRETO)
    oPrint:Say(nLinha,320, "PREÇO DE VENDA"     , oFont12,,PRETO)
    oPrint:Say(nLinha,440, "ARMAZÉM"            , oFont12,,PRETO)

    nLinha += 5

    oPrint:Line(nLinha, 15, nLinha, 580,, "-6")

    nLinha += 20

RETURN

Static Function ImpDados(cAlias)
    local cString := ""

    DbSelectArea(cAlias)
    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        VeriQuebPg(MAX_LINE)

        oPrint:Say(nLinha, 20, Alltrim((cAlias)->(B1_COD)), oFont10,,)

        cString := Alltrim((cAlias)->(B1_DESC)) // Recebe a variavel (Nome)
        VeriQuebLn(cString, 20, 80) // Verifica se existe a quebra de linha

        cString := Alltrim((cAlias)->(B1_UM)) 
        VeriQuebLn(cString, 25, 200) 

        cString := cvaltochar((cAlias)->(B1_PRV1)) 
        VeriQuebLn(cString, 15, 320) 

        cString := ALLTRIM((cAlias)->(B1_LOCPAD))
        VeriQuebLn(cString, 15, 440) 
        
        nLinha += 30

        (cAlias)->(DBSKIP())
    enddo

return

Static Function VeriQuebLn(cString, nQtdChar, nCol)
    local cTxtLinha    := ""
    local lTemQuebra   := .F.
    local nQtdLinhas   := MLCOUNT(cString, nQtdChar, /*TAB*/, .F.)
    local nI           := 1 

    if nQtdLinhas > 1
        lTemQuebra := .T.

        for nI := 1 to nQtdLinhas
            cTxtLinha := MEMOLINE(cString, nQtdChar, nI,)

            oPrint:Say(nLinha, nCol, cTxtLinha , oFont10,,)
            nLinha += 10
        next
    else
        oPrint:Say(nLinha, nCol, cString , oFont10,,)
    endif    

    if lTemQuebra
        nLinha -= nQtdLinhas * 10
    endif
    
Return 

Static Function VeriQuebPg(nMAX)
    if nLinha > nMAX
        oPrint:EndPage()
        oPrint:StartPage()

        nLinha := 105

        Cabecalho()

    ENDIF
RETURN
