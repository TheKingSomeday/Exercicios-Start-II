#INCLUDE 'TOTVS.ch'
#INCLUDE 'fwmvcdef.ch'

 /*/{Protheus.doc} MYMVC
    Execicio de MVC
    @type  Function
    @author Henrique O.
    @since 28/03/2023
    /*/
User Function InstMVC()
    
    Local cAlias := 'ZZI'
    Local cTitle := 'Cadastro de Cursos'
    Local oMark   := FWMarkBrowse():New() //? Instanciando a Classe
    oMark:AddButton('Excluir Marc.',   'U_Apaga', 5, 1)
    oMark:SetAlias(cAlias) //! 'Seta' a tabela SA1
    oMark:SetDescription(cTitle) //! Descrição da tela
    oMark:SetFieldMark('ZZI_MARC')
    oMark:DisableDetails() //! Desabilita os detalhes na parte inferior
    oMark:DisableReport()  //! Desabilita relatório
    oMark:Activate()       //! Ativa o Browse.
    
Return 
 
Static Function MenuDef()
    Local aRotina := {}
    ADD OPTION aRotina TITLE 'Incluir' ACTION 'VIEWDEF.InstMVC' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar' ACTION 'VIEWDEF.InstMVC' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir' ACTION 'VIEWDEF.InstMVC' OPERATION 5 ACCESS 0
Return aRotina
 
Static Function ModelDef()
    
    Local oStruZZI      := FWFormStruct(1, 'ZZI') //! Esta função fornece o objeto com as estruturas de metadado do dicionário de dados, utilizadas pelas classes oModel e oView.
    Local bModelPos     := {|oModel| ValidPos(oModel)}   //! Bloco de código que será chamado na Pós-validação (MODELPOS)
    Local oModel    := MPFormModel():New('InstMVCM', , bModelPos, , )
    oModel:AddFields('ZZIMASTER', /*PAI!*/, oStruZZI)
    oModel:SetDescription('Modelo de Dados de Cursos')
    oModel:GetModel('ZZIMASTER'):SetDescription('Formulário de Curso')
    oModel:SetPrimaryKey({'ZZI_COD'})
Return oModel
Static Function ViewDef()
    Local oModel    := FwLoadModel('InstMVC')     //! Carregando o modelo
    Local oStruZZI  := FWFormStruct(2, 'ZZI')   //! Agora com o parâmetro '2'
    Local oView     := FwFormView():New()       //! Criação de formulário do tipo FormField, onde é possível que o usuário edite um registro por vez - Criação de formulário do tipo FormGrid, onde é possível que o usuário edite N registros por vez - Criação de botões - Divisão da tela em diversos paineis - Criação de Folder
    oView:SetModel(oModel)                            //! Setando o modelo, no caso, o Model
    oView:AddField('VIEW_ZZI', oStruZZI, 'ZZIMASTER') //! Adiciona um campo a estrutura.
    oView:CreateHorizontalBox('TELA', 100)            //! Tela e quantos por cento ela ocupará
    oView:SetOwnerView('VIEW_ZZI', 'TELA')
Return oView
Static Function ValidPos(oModel)
    Local nOperation  := oModel:GetOperation()
    Local cConteudo   := oModel:GetValue('ZZIMASTER','ZZI_DATHAB')
    Local cDataNasc   := oModel:GetValue('ZZIMASTER','ZZI_DATNAS')
    Local cQtdAlu     := oModel:GetValue('ZZIMASTER','ZZI_QTDE')
    Local cEscola     := ALLTRIM(oModel:GetValue('ZZIMASTER','ZZI_ESCOLA'))
    Local lAutorizado := .T.
    
    cConteudo := DateDiffYear(cConteudo, Date())
    cDataNasc := DateDiffYear(cDataNasc, Date())
    if nOperation == 3
        if cConteudo < 2
            lAutorizado := .F.
            Help(NIL, NIL, "ERRO - DATA DA HABILITAÇÃO!", NIL, "Data incorreta!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"A data da habilitação deve ser maior que 2 anos!"})
        
        elseif cDataNasc < 21
            lAutorizado := .F.
            Help(NIL, NIL, "ERRO - DATA DE NASCIMENTO!", NIL, "Data incorreta!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"A idade mínima deve ser 21 anos!"})
        
        elseif cEscola == '1'
            lAutorizado := .F.
            Help(NIL, NIL, "ERRO - ESCOLA!", NIL, "Deve ter no mínimo ensino médio!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Cadastre a mínimo ensino médio!"})
        endif
    endif
    if nOperation == 5 .and. cQtdAlu >= 1
        lAutorizado := .F.
        Help(NIL, NIL, "ERRO - QTD ALUNOS!", NIL, "Não é possível apagar instrutores com alunos!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Remova os alunos para que possa apagar o cadastro do instrutor!"})
    endif
Return lAutorizado
//? Função para Apagar registros marcados
User Function Apaga()
  if MsgYesNo('Confirma a exclusão dos cursos selecionados?')
    DbSelectArea('ZZI')
    
    ZZI->(DbGotop())
    
    while ZZI->(!EOF())
      if oMark:IsMark()   //? Verifica se o registro está marcado
          RecLock('ZZI', .F.)
            ZZI->(DbDelete()) //? Marca o registro como Apagada (D_E_L_E_T_ = '*')
          ZZI->(MSUnlock())
      endif
      ZZI->(DbSkip())
    enddo
  endif
  
  //? Executa a atualização das informações no Browse
  oMark:Refresh(.T.) //? .T. Indica que deverá ser posicionado no primeiro registro do Browse
Return
