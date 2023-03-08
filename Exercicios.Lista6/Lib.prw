#INCLUDE "TOTVS.CH"

User Function ManuCad()
    Local aArea := GetArea()
     
    RecLock('SB1', .F.)
        SB1->B1_DESC := 'Cad. Manual - ' + M->B1_DESC
        SB1->B1_MSBLQL := '1'
    SB1->(MsUnlock())
     
    RestArea(aArea)
Return



User Function DelPed()
    local lRet := .F.

    if C5_ZTIPO == alltrim("1")
        lRet := .T.
    else
        MsgStop("Pedido automático! Não pode ser excluído.", "Atenção!")
    endif

Return lRet    



User Function CadCli()
    Local aArea := GetArea()

    RecLock("SA1", .F.)

    SA1->A1_MSBLQL := "1"

    SA1->(MsUnlock())
    RestArea(aArea)
Return 



User Function mBrowSB1()
    local aArea     := GetArea()
    local cAlias    := "SB1"
    local aRotina   := {}

    aAdd(aRotina, {'Pesquisar',    'AxPesqui',   0, 1})
    aAdd(aRotina, {'Visualizar',   'AxVisual',   0, 2})
    aAdd(aRotina, {'Cadastrar',    'AxInclui',   0, 3})
    aAdd(aRotina, {'Alterar',      'AxAltera',   0, 4})
    aAdd(aRotina, {'Excluir',      'AxDeleta',   0, 5})
    
    DbSelectArea("SB1")
    ("SB1")->(DbSetOrder(1))

    MBrowse(NIL, NIL, NIL, NIL, cAlias,,,,,,,,,,,,,,,,)

    DbCloseArea()
    RestArea(aArea)

Return



User Function CadMun()
    // Declaração de variáveis.
    local aArea := GetArea()
    local cAlias := GetNextAlias()
    local cQuery := ""
    local nCount := 0
    local lValido := .T.

    // Aqui é passada a pesquisa no banco de dados com base na UF e Município recém inseridos pelo usuário na tela do Protheus.
    cQuery := "SELECT CC2_EST, CC2_CODMUN, CC2_MUN FROM " + RetSqlName("CC2") + " WHERE CC2_EST = '" + M->CC2_EST  + "' AND CC2_MUN = '" + alltrim(M->CC2_MUN) + "'"
    
    // Aqui é feita a pesquisa no banco de dados.
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DBGOTOP())

    // Enquanto o ponteiro não chegar no final da tabela, é acrescido um contador.
    While &(cAlias)->(!EOF())
        nCount++
        &(cAlias)->(DBSKIP())
    end

    // Se o contador for maior que 1, existe um ou mais municípios com o mesmo nome cadastrado na UF mencionada anteriormente.
    if nCount > 1
        MSGStop("O município já existe!")
        lValido := .F.
    else
        lValido := .T.
    endif

    &(cAlias)->(DBCLOSEAREA())
    RestArea(aArea)

Return lValido
