#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

#DEFINE LEFT 1
#DEFINE CENTER 2
#DEFINE RIGHT 3

#DEFINE GENERAL 1
#DEFINE NUMERIC 2
#DEFINE MONEY 3
#DEFINE DATETIME 4

/*/{Protheus.doc} User Function L12_EX3
    Relatório em .xls gerado a partir de um botão na rotina em MVC de cadastro de cursos x alunos (MYMVC2).
    @type  Function
    @author Henrique O
    @since 20/04/2023
    /*/
User Function L12_EX3()
    local oExcel := FwMsExcelEx():New()
    local cPath     := "H:\Desktop\"
    local cFile     := "Relatorio_Cursos.xls"
    local aDados    := {}
    local cAlias    := GetNextAlias()
    local aArea     := GetArea()
    local cQuery    := ""
    local cIdCurso  := ""
    local cCurso    := ""
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'ZZC' MODULO 'COM'
    cQuery := "SELECT ZZC_CODIGO, ZZC_NOME, ZZB_CURSO, ZZB_COD, ZZB_NOME, ZZB_DTINIC, ZZB.D_E_L_E_T_ AS DEL1, ZZC.D_E_L_E_T_ AS DEL2 FROM " + RetSqlName("ZZC") + " ZZC INNER JOIN " + RetSqlName("ZZB") + " ZZB ON ZZC_CODIGO = ZZB_CURSO AND ZZB.D_E_L_E_T_ = ZZC.D_E_L_E_T_ WHERE ZZB.D_E_L_E_T_ = ' '"
    TCQUERY cQuery ALIAS &(cAlias) NEW
    DbSelectArea(cAlias)
    (cAlias)->(DbGoTop())
    While (cAlias)->(!EoF())
        if cIdCurso != alltrim((cAlias)->(ZZC_CODIGO))
            
            cIdCurso := alltrim((cAlias)->(ZZC_CODIGO))
            cCurso := alltrim((cAlias)->(ZZC_NOME))
            oExcel:AddWorkSheet(cCurso)
            oExcel:AddTable(cCurso, "Informações do Aluno")
            oExcel:AddColumn(cCurso, "Informações do Aluno", "Código", LEFT, GENERAL)
            oExcel:AddColumn(cCurso, "Informações do Aluno", "Nome", LEFT, GENERAL)
            oExcel:AddColumn(cCurso, "Informações do Aluno", "Dt. Inicio", CENTER, DATETIME)
        endif
        aAdd(aDados, alltrim((cAlias)->(ZZB_COD)))
        aAdd(aDados, alltrim((cAlias)->(ZZB_NOME)))
        aAdd(aDados, StoD((cAlias)->(ZZB_DTINIC)))
        oExcel:AddRow(cCurso, "Informações do Aluno", aDados)
        (cAlias)->(DbSkip())
        aDados := {}
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
        FwAlertError("Arquivo não encontrado no Windows", "Excel não encontrado!")
    endif
    oExcel:DeActivate()
Return 
