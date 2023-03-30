#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} MYMVC
    Execicio de MVC
    @type  Function
    @author Henrique O.
    @since 27/03/2023
    /*/
User Function CadVei()
    
    Local cAlias := 'ZZV'
    Local cTitle := 'Cadastro de Veiculos'
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
Return FWMVCMenu('CadVei')
 
Static Function ModelDef()
    
    Local oModel   := MPFormModel():New('CadVeiM') // precisa colocar o M no final
    Local oStruZZV := FWFormStruct(1, 'ZZV') // Esta função fornece o objeto com as estruturas de metadado do dicionário de dados
    oModel:AddFields('ZZVMASTER', /*PAI!*/, oStruZZV)
    oModel:SetDescription('Modelo de Cadastro de Veiculos')
    oModel:GetModel('ZZVMASTER'):SetDescription('Formulário de Cadastro de Veiculos')
    oModel:SetPrimaryKey({'ZZV_COD'})
Return oModel
Static Function ViewDef()
    Local oModel    := FwLoadModel('CadVei')     // Carregando o modelo
    Local oStruZZV  := FWFormStruct(2, 'ZZV')   
    Local oView     := FwFormView():New()       // Criação de formulário do tipo FormField
    oView:SetModel(oModel)                            
    oView:AddField('VIEW_ZZV', oStruZZV, 'ZZVMASTER') // Adiciona um campo a estrutura.
    oView:CreateHorizontalBox('TELA', 100)            
    oView:SetOwnerView('VIEW_ZZV', 'TELA')
Return oView
