#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} MYMVC
    Execicio de MVC
    @type  Function
    @author Henrique O.
    @since 28/03/2023
    /*/
User Function VizCAT()
    Local cAlias  := 'ZZ3'
    Local cTitle  := 'Vizualizar cadastros'
    Local oBrowse := FwMBrowse():New() 
    oBrowse:SetAlias(cAlias)       
    oBrowse:SetDescription(cTitle) 
    oBrowse:DisableDetails()       
    oBrowse:DisableReport()        
    oBrowse:Activate()             
    
Return 
Static Function MenuDef()
    Local aRotina := {}
    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.VizCAT' OPERATION 2 ACCESS 0
Return aRotina
 
Static Function ModelDef()
    
    Local oModel    := MPFormModel():New('VizCATM')
    Local oStruZZH  := FWFormStruct(1, 'ZZH')    
    Local oStruZZI  := FWFormStruct(1, 'ZZI')
    Local oStruZZN  := FWFormStruct(1, 'ZZN')
    oModel:AddFields('ZZHMASTER', /*cOwner*/, oStruZZH)
    oModel:AddGrid('IDETAIL', 'ZZHMASTER', oStruZZI)
    oModel:AddGrid('ZZNDETAIL', 'ZZIDETAIL', oStruZZN)
    oModel:SetDescription('Vizualizar cadastros')
    oModel:GetModel('ZZHMASTER'):SetDescription('Categorias')
    oModel:GetModel('ZZIDETAIL'):SetDescription('Instrutores')
    oModel:GetModel('ZZNDETAIL'):SetDescription('Alunos')
    oModel:SetRelation('ZZIDETAIL', {{'ZZI_FILIAL', 'xFilial("ZZI")'}, {'ZZI_CATEGO', 'ZZ3_COD'}}, ZZ5->(IndexKey(1)))
    oModel:SetRelation('ZZNDETAIL', {{'ZZN_FILIAL', 'xFilial("ZZN")'}, {'ZZN_CODINS', 'ZZ5_COD'}}, ZZN->(IndexKey(1)))
    oModel:SetPrimaryKey({'ZZH_COD','ZZI_COD','ZZN_COD'})
Return oModel
Static Function ViewDef()
    Local oModel    := FwLoadModel('VizCAT')     
    Local oStruZZH  := FWFormStruct(2, 'ZZH')        
    Local oStruZZI  := FWFormStruct(2, 'ZZI')
    Local oStruZZN  := FWFormStruct(2, 'ZZN')
    Local oView     := FwFormView():New()       
    oView:SetModel(oModel)                           
    oView:AddField('VIEW_ZZH', oStruZZH, 'ZZHMASTER') //! Adiciona um campo a estrutura.
    oView:AddGrid('VIEW_ZZI', oStruZZI, 'ZZIDETAIL')
    oView:AddGrid('VIEW_ZZN', oStruZZN, 'ZZNDETAIL')
    oView:CreateHorizontalBox('CATEGORIAS', 30)           
    oView:CreateHorizontalBox('INSTRUTORES', 35) 
    oView:CreateHorizontalBox('ALUNOS', 35) 
    oView:SetOwnerView('VIEW_ZZH', 'CATEGORIAS')
    oView:SetOwnerView('VIEW_ZZI', 'INSTRUTORES')
    oView:SetOwnerView('VIEW_ZZN', 'ALUNOS')
    oView:EnableTitleView('VIEW_ZZH', 'Categorias')
    oView:EnableTitleView('VIEW_ZZI', 'Instrutores')
    oView:EnableTitleView('VIEW_ZZN', 'Alunos')
Return oView
