/* 6 � No Cadastro de Fornecedores, utilizando um Ponto de Entrada, ao tentar incluir ou alterar um cadastro, fa�a as seguintes valida��es: 
� Se o campo �Pa�s� estiver em branco n�o poder� realizar a inclus�o / altera��o.
� Se o pa�s for �Brasil� (105), o campo �CNPJ� dever� ser preenchido, caso n�o seja, n�o poder� realizar a inclus�o / altera��o.
� Se o pa�s n�o for �Brasil�, o CNPJ n�o � obrigat�rio. 
7 � Desenvolva uma rotina para que ao incluir um novo Cadastro de Fornecedor, o campo �LOJA� seja preenchido automaticamente antes da abertura da tela de cadastro, ou seja, quando a tela carregar, o campo LOJA j� estar� preenchido. O n�mero da loja dever� ser gerado automaticamente e estar entre 01 e 09
8 � Crie uma rotina que apresentar� mensagens diferentes em cada uma das seguintes situa��es dos Cadastros de Fornecedores:
� Inclus�o:
� Mensagem: Seja Bem vindo(a) ao Cadastro de Fornecedores!
� Altera��o:
� Mensagem: Voc� est� prestes a alterar o cadastro do fornecedor NomeFornecedor!
� Exclus�o:
� Mensagem: Cuidado, voc� est� prestes a excluir o fornecedor NomeFornecedor!
9 - Implemente uma valida��o na exclus�o de Cadastros de Fornecedores. O sistema dever� perguntar se o usu�rio confirma a exclus�o do cadastro, se ele confirmar, o cadastro dever� ser exclu�do, caso contr�rio, dever� permanecer na tela de exclus�o.
10 � Acrescente um bot�o � rotina de Cadastros de Fornecedores, para que seja poss�vel acessar os Cadastros de Produtos.
*/



#INCLUDE 'TOTVS.CH'
#Include 'PARMTYPE.CH'
#INCLUDE "FWMVCDEF.ch"

User Function CUSTOMERVENDOR()
    Local aParam := PARAMIXB
    Local xRet := .T.
    Local oObj := ""
    Local cIdPonto := ""
    Local cIdModel := ""
    Local lIsGrid := .F.
    Local cNum := ""

    cNum := StrZero(Randomize(1, 10), 2)

    If aParam <> NIL
        oObj := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]
        lIsGrid := (Len(aParam) > 3)

        if cIdPonto == "MODELPOS"
            if Vazio(M->A2_PAIS)
                Help(NIL, NIL, "ATEN��O!", NIL, "Informa��es de Pa�s incompletas!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha no formul�rio para efeturar o cadastro."})
                xRet := .F.

            elseif (M->A2_PAIS == "105") .and. Vazio(M->A2_CGC)
                Help(NIL, NIL, "ATEN��O!", NIL, "CNPJ/CPF incompletos!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha no formul�rio para efeturar o cadastro."})
                xRet := .F.

            // Valida��o de exclus�o 
            elseif (ALTERA == .F.) .AND. (INCLUI == .F.)
                xRet := MsgYesNo("Deseja realmente excluir esse registro?", "Aten��o!")
            endif

        elseif cIdPonto == "MODELVLDACTIVE"

            if INCLUI
                MsgAlert("Bem vindo(a) ao cadastro de fornecedores!", "Cadastro de Fornecedores")
            elseif ALTERA
                MsgAlert("Voc� est� prestes a alterar o cadastro do fornecedor " + alltrim(SA2->(A2_NOME)), "Altera��o de Cadastro")
            else
                MsgAlert("Aten��o! Voc� est� prestes a excluir o fornecedor " + alltrim(SA2->(A2_NOME)), "Exclus�o de Cadastro")
            endif


        ElseIf cIdPonto == "BUTTONBAR"
            xRet := {{"Cad.Produtos", "Test2", {||u_mBrowSB1()}}}

            oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", cNum)
            oView := FwViewActive()
            oView:Refresh()

        endif

    EndIf

Return xRet
