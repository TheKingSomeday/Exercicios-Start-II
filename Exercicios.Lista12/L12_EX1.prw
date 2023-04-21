#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

#DEFINE LEFT 1
#DEFINE CENTER 2
#DEFINE RIGHT 3

#DEFINE GENERAL 1
#DEFINE NUMERIC 2
#DEFINE MONETARY 3
#DEFINE DATETIME 4

/*/{Protheus.doc} User Function L12_EX1
    Fun��o para criar uma planilha em XLS do Excel com informa��es de fornecedores
    @type  Function
    @author Henrique O
    @since 20/04/2023
    /*/
User Function L12_EX1()
    local oExcel := FwMsExcelEx():New()
    local cPath     := "H:\Desktop\"
    local cFile     := "Relatorio_Fornecedores.xls"
    local aDados    := {}
    local cAlias    := "SA2"
    local aArea     := GetArea()
    local cCGC      := ""
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'
    oExcel:AddWorkSheet("Fornecedores")
    oExcel:AddTable("Fornecedores", "Informa��es")
    oExcel:AddColumn("Fornecedores", "Informa��es", "C�digo", LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Informa��es", "Nome", LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Informa��es", "Loja", CENTER, GENERAL)
    oExcel:AddColumn("Fornecedores", "Informa��es", "CPF/CNPJ", CENTER, GENERAL)
    oExcel:AddColumn("Fornecedores", "Informa��es", "Endere�o", LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Informa��es", "Bairro", LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Informa��es", "Cidade", LEFT, GENERAL)
    oExcel:AddColumn("Fornecedores", "Informa��es", "UF", LEFT, GENERAL)
    DbSelectArea(cAlias)
    (cAlias)->(DbGoTop())
    While (cAlias)->(!EoF())
        
        aAdd(aDados, alltrim((cAlias)->(A2_COD)))
        aAdd(aDados, alltrim((cAlias)->(A2_NOME)))
        aAdd(aDados, alltrim((cAlias)->(A2_LOJA)))
        cCGC := alltrim((cAlias)->(A2_CGC))
        if len(cCGC) == 14
            cCGC := TRANSFORM(ALLTRIM(cCGC), "@R 99.999.999/9999-99")
            aAdd(aDados, cCGC)
            
        elseif len(cCGC) == 11
            cCGC := TRANSFORM(ALLTRIM(cCGC), "@R 999.999.999/99")
            aAdd(aDados, cCGC)
            
        elseif Empty(cCGC)
            aAdd(aDados, "Sem info")
        endif
        aAdd(aDados, alltrim((cAlias)->(A2_END)))
        aAdd(aDados, alltrim((cAlias)->(A2_BAIRRO)))
        aAdd(aDados, alltrim((cAlias)->(A2_MUN)))
        aAdd(aDados, alltrim((cAlias)->(A2_EST)))
        oExcel:AddRow("Fornecedores", "Informa��es", aDados)
        aDados := {}
        (cAlias)->(DbSkip())
    End do
    RestArea(aArea)
    oExcel:Activate()
    oExcel:GetXMLFile(cPath + cFile)
    if ApOleClient("MsExcel")
        oExec := MsExcel():New()
        oExec:WorkBooks:Open(cPath + cFile)
        oExec:SetVisible(.T.)
        oExec:Destroy()
    else
        FwAlertError("Arquivo n�o encontrado no Windows", "Excel n�o encontrado!")
    endif
    FwAlertSuccess("Arquivo gerado com sucesso.", "Conclu�do!")
    oExcel:DeActivate()
Return
