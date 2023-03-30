#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} MYMVC
    Execicio de MVC
    @type  Function
    @author Henrique O.
    @since 27/03/2023
    /*/
User Function Aluncad()
    Local cAlias := 'ZZN'
    Local cTitle := 'Cadastro de Cursos'
    Local oMark   := FWMarkBrowse():New() 
    oMark:AddButton('Excluir Marc.',   'U_Deleti', 5, 1)
    oMark:SetAlias(cAlias)       
    oMark:SetDescription(cTitle) 
    oMark:SetFieldMark('ZZN_MARC')
    oMark:DisableDetails() 
    oMark:DisableReport()       
    oMark:Activate()            
    
Return 
Static Function MenuDef()
    
    Local aRotina := {}
    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF' OPERATION 5 ACCESS 0
Return FWMVCMenu('Aluncad')
 
Static Function ModelDef()
    Local oStruZZN    := FWFormStruct(1, 'ZZN')      
    Local bModelPos   := {|oModel| ValidPos(oModel)} 
    Local aGatilho    := FwStruTrigger('ZZN_CODINS', 'ZZN_NOMEIN', 'ZZ5->ZZ5_NOME', .T., 'ZZ5', 1, 'xFilial("ZZ5")+AllTrim(M->ZZN_CODINS)')
    Local oModel      := MPFormModel():New('AluncadM', , bModelPos,, )
    oStruZZN:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])
    oModel:AddFields('ZZNMASTER', /*cOwner*/, oStruZZN, , /*bFieldPos*/, /*bLoad*/)
    oStruZZN:SetProperty('ZZN_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZZN", "ZZN_COD")'))
    oModel:SetDescription('Cadastro de Alunos')
    oModel:GetModel('ZZNMASTER'):SetDescription('Formulário do Cadastro de Alunos')
    oModel:SetPrimaryKey({'ZZN_COD'})
Return oModel
Static Function ViewDef()
    Local oModel    := FwLoadModel('Aluncad')
    Local oStruZZN  := FWFormStruct(2, 'ZZN')   
    Local oView     := FwFormView():New()       
    oView:SetModel(oModel)                            
    oView:AddField('VIEW_ZZN', oStruZZN, 'ZZNMASTER') 
    oView:CreateHorizontalBox('TELA', 100)            
    oView:SetFieldAction('ZZN_COD', {|oView| ValidField(oView)})
    
    oView:SetOwnerView('VIEW_ZZN', 'TELA')
Return oView
Static Function ValidPos(oModel)
    Local nOperation   := oModel:GetOperation()
    Local cCodInstru   := oModel:GetValue('ZZNMASTER','ZZN_CODINS')
    Local cRealizaAula := oModel:GetValue('ZZNMASTER','ZZN_LISTA')
    Local lAutorizado  := .T.
    
    DbSelectArea("ZZ5")
    DbSetOrder(1)
    if nOperation == 3 
        if DbSeek(xFilial("ZZ5") + cCodInstru)
            if ZZ5->ZZ5_QTDE > 4
                lAutorizado := .F.
                Help(NIL, NIL, "ERRO QTDE DE ALUNOS!", NIL, "Quantidade de alunos maior que 5!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Selecione outro Instrutor!"})
            else
                RecLock("ZZ5", .F.)
                    ZZ5_QTDE++
                MSUNLOCK()
            endif
        endif
    elseif nOperation == 5
        if cRealizaAula == "1"
            lAutorizado := .F.
            Help(NIL, NIL, "Realizando Aulas!", NIL, "Aluno realizando aulas!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Remover o aluno!"})
        
        else
            if DbSeek(xFilial("ZZ5") + cCodInstru)
                RecLock("ZZ5", .F.)
                    ZZ5_QTDE--
                MSUNLOCK()
            endif
        endif
    endif
Return lAutorizado
// Função para Apagar registros marcados
User Function Deleti()
    if MsgYesNo('Confirma a exclusão dos cursos selecionados?')
    
        DbSelectArea('ZZN')
        
        ZZN->(DbGotop())
        
        while ZZN->(!EOF())
            if oMark:IsMark() .and. ZZN->ZZN_LISTA != "1"  // Verifica se o registro está marcado
                RecLock('ZZN', .F.)
                    ZZN->(DbDelete()) // Marca o registro como Apagada (D_E_L_E_T_ = '*')
                    ExcluiAlu()
                ZZN->(MSUnlock())
            else 
                FwAlertError('O campo realiza aula não pode estar como SIM', 'ERRO!')
            endif
            ZZN->(DbSkip())
        enddo
    endif
    
    // Executa a atualização das informações no Browse
    oMark:Refresh(.T.) // .T. Indica que deverá ser posicionado no primeiro registro do Browse
Return
Static Function ExcluiAlu()
    
    DbSelectArea("ZZI")
    DbSetOrder(1)
    if DbSeek(xFilial("ZZI") + ZZN->ZZN_CODINS)
        RecLock("ZZI", .F.)
            ZZI_QTDE--
        ZZI->(MSUNLOCK())
    endif
Return 
