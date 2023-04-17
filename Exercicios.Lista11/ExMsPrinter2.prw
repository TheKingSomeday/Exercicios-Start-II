#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE "TOPCONN.CH"
#INCLUDE "RPTDEF.CH"
#INCLUDE "FWPRINTSETUP.CH"

#DEFINE PRETO RGB(0,0,0)
#DEFINE MAX_LINE 770

/*/{Protheus.doc} User Function TREPORT
    Browse de cadastro de Fornecedores com botÃ£o adicional de relatÃ³rio.
    @type  Function
    @author Henrique O
    @since 17/04/2023
    /*/
User Function ExMsPrinter()
    local cAlias    := 'SA2'
    local cTitle    := "Cadastro de Fornecedores"
    local oBrowse   := FWMBrowse():New()
    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableReport()
    oBrowse:DisableDetails()
    oBrowse:AddButton("Imprimir Informacoes", {|| REL_MsPrinter()})
    oBrowse:Activate()
Return 
Static Function MenuDef()
    local aRotina := {}
    ADD OPTION aRotina TITLE "Visualizar"   ACTION 'VIEWDEF.TREPORT' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE "Inserir"      ACTION 'VIEWDEF.TREPORT' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE "Alterar"      ACTION 'VIEWDEF.TREPORT' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE "Excluir"      ACTION 'VIEWDEF.TREPORT' OPERATION 5 ACCESS 0
Return aRotina
Static Function ModelDef()
    local oModel    := MpFormModel():New("TREPORTM")
    local oStruSA2  := FWFormStruct(1, "SA2")
    oModel:AddFields("SA2MASTER",, oStruSA2)
    oModel:SetDescription("Cadastro de Fornecedores")
    oModel:SetPrimaryKey({"A2_COD"})
Return oModel
Static Function ViewDef()
    local oModel    := FwLoadModel("TREPORT")
    local oStruSA2  := FWFormStruct(2, "SA2")
    local oView     := FwFormView():New()
    oView:SetModel(oModel)
    oView:AddField("VIEW_SA2", oStruSA2, "SA2MASTER")
    oView:CreateHorizontalBox("FORNECEDORES", 100)
    oView:SetOwnerView("VIEW_SA2", "FORNECEDORES")
    oView:EnableTitleView("VIEW_SA2", "Cadastro de Fornecedores")
Return oView

// GERAÇÃO DO RELATORIO 
Static Function REL_MsPrinter()
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

    cQuery := "SELECT A2_COD, A2_NOME, A2_NREDUZ, A2_LOJA, A2_END" + CRLF
    cQuery += "FROM " + RetSqlName("SA2") + " SA2" + CRLF 
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
    local cArquivo := "EX2.pdf"

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
    oPrint:Box(15,15,85,580,    "-8")
    oPrint:Line(50,15,50,580,,  "-8")

    oPrint:Say(35,20, "Empresa / Filial: " + AllTRIM(SM0->M0_NOME) + " / " + AllTRIM(SM0->M0_FILIAL), oFont14,, PRETO )
    oPrint:Say(70,220, "FORNECEDORES" , oFont16,, PRETO )

    oPrint:Say(nLinha,20,  "CÓDIGO"         , oFont12,,PRETO)
    oPrint:Say(nLinha,80,  "NOME"           , oFont12,,PRETO)
    oPrint:Say(nLinha,200, "NOME FANTASIA"  , oFont12,,PRETO)
    oPrint:Say(nLinha,350, "LOJA"           , oFont12,,PRETO)
    oPrint:Say(nLinha,440, "ENDEREÇO"       , oFont12,,PRETO)

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

        oPrint:Say(nLinha, 20, Alltrim((cAlias)->(A2_COD)), oFont10,,)

        cString := Alltrim((cAlias)->(A2_NOME)) // Recebe a variavel (Nome)
        VeriQuebLn(cString, 20, 80) // Verifica se existe a quebra de linha

        cString := Alltrim((cAlias)->(A2_NREDUZ)) 
        VeriQuebLn(cString, 25, 200) 

        cString := Alltrim((cAlias)->(A2_LOJA)) 
        VeriQuebLn(cString, 15, 350) 

        cString := Alltrim((cAlias)->(A2_END)) 
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
