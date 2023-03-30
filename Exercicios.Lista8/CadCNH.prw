#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} MYMVC
    Execicio de MVC
    @type  Function
    @author Henrique O.
    @since 27/03/2023
    /*/
User Function CadCNH()
    
    Local cAlias := 'ZZH'
    Local cTitle := 'Categorias de CNH'
    Local oBrowse
    oBrowse := FwMBrowse():New() 
    oBrowse:SetAlias(cAlias) 
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableReport()  
    oBrowse:DisableDetails() 
    oBrowse:Activate()       
    
Return 
 
Static Function MenuDef()
    Local aRotina := {}
    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF' OPERATION 5 ACCESS 0
Return FWMVCMenu('CadCNH')
 
Static Function ModelDef()
    
    Local oStruZZH  := FWFormStruct(1, 'ZZH')        //! Esta função fornece o objeto com as estruturas de metadado do dicionário de dados, utilizadas pelas classes oModel e oView.
    Local bModelPos := {|oModel| ValidPos(oModel)}   //! Bloco de código que será chamado na Pós-validação (MODELPOS)
    Local aGatilho  := FwStruTrigger('ZZH_CODVEI', 'ZZH_NOME', 'ZZ4->ZZ4_NOME', .T., 'ZZ4', 1, 'xFilial("ZZ4")+AllTrim(M->ZZH_CODVEI)')
    Local oModel    := MPFormModel():New('CadCNHM', , bModelPos, /*MODELCOMITTTS*/, )
    oStruZZH:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])
    oModel:AddFields('ZZHMASTER', /*cOwner*/, oStruZZH, , /*bFieldPos*/, /*bLoad*/)
    oStruZZH:SetProperty('ZZH_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD,  'GetSXENum("ZZH", "ZZH_COD")'))
    oModel:SetDescription('Categorias de CNH')
    oModel:GetModel('ZZHMASTER'):SetDescription('Formulário das categorias de CNH')
    oModel:SetPrimaryKey({'ZZH_COD'})
Return oModel

Static Function ViewDef()
    Local oModel    := FwLoadModel('CadCNH')     
    Local oStruZZH  := FWFormStruct(2, 'ZZH')   //! Agora com o parâmetro '2'
    Local oView     := FwFormView():New()       //! Criação de formulário do tipo FormField
    
    oView:SetModel(oModel)                            
    oView:AddField('VIEW_ZZH', oStruZZH, 'ZZHMASTER') //! Adiciona um campo a estrutura.
    oView:CreateHorizontalBox('TELA', 100)            
    oView:SetFieldAction('ZZH_COD', {|oView| ValidField(oView)})
    
    oView:SetOwnerView('VIEW_ZZH', 'TELA')
Return oView

Static Function ValidPos(oModel)
    Local nOperation  := oModel:GetOperation()
    Local cConteudo   := ALLTRIM(oModel:GetValue('ZZHMASTER','ZZH_SIGLA'))
    Local lAutorizado := .T.
    
    if nOperation == 3 .AND. LEN(cConteudo) == 2
        
        lAutorizado := .F.
        Help(NIL, NIL, "ERRO SIGLA!", NIL, "Sigla incorreta!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Informe a sigla com 1 ou 3 caracteres"})
   
    endif
Return lAutorizado
