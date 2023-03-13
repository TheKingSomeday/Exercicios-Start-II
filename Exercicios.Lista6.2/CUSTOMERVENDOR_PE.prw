/* 6 – No Cadastro de Fornecedores, utilizando um Ponto de Entrada, ao tentar incluir ou alterar um cadastro, faça as seguintes validações: 
• Se o campo “País” estiver em branco não poderá realizar a inclusão / alteração.
• Se o país for “Brasil” (105), o campo “CNPJ” deverá ser preenchido, caso não seja, não poderá realizar a inclusão / alteração.
• Se o país não for “Brasil”, o CNPJ não é obrigatório. 
7 – Desenvolva uma rotina para que ao incluir um novo Cadastro de Fornecedor, o campo “LOJA” seja preenchido automaticamente antes da abertura da tela de cadastro, ou seja, quando a tela carregar, o campo LOJA já estará preenchido. O número da loja deverá ser gerado automaticamente e estar entre 01 e 09
8 – Crie uma rotina que apresentará mensagens diferentes em cada uma das seguintes situações dos Cadastros de Fornecedores:
• Inclusão:
• Mensagem: Seja Bem vindo(a) ao Cadastro de Fornecedores!
• Alteração:
• Mensagem: Você está prestes a alterar o cadastro do fornecedor NomeFornecedor!
• Exclusão:
• Mensagem: Cuidado, você está prestes a excluir o fornecedor NomeFornecedor!
9 - Implemente uma validação na exclusão de Cadastros de Fornecedores. O sistema deverá perguntar se o usuário confirma a exclusão do cadastro, se ele confirmar, o cadastro deverá ser excluído, caso contrário, deverá permanecer na tela de exclusão.
10 – Acrescente um botão à rotina de Cadastros de Fornecedores, para que seja possível acessar os Cadastros de Produtos.
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
                Help(NIL, NIL, "ATENÇÃO!", NIL, "Informações de País incompletas!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha no formulário para efeturar o cadastro."})
                xRet := .F.

            elseif (M->A2_PAIS == "105") .and. Vazio(M->A2_CGC)
                Help(NIL, NIL, "ATENÇÃO!", NIL, "CNPJ/CPF incompletos!", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Preencha no formulário para efeturar o cadastro."})
                xRet := .F.

            // Validação de exclusão 
            elseif (ALTERA == .F.) .AND. (INCLUI == .F.)
                xRet := MsgYesNo("Deseja realmente excluir esse registro?", "Atenção!")
            endif

        elseif cIdPonto == "MODELVLDACTIVE"

            if INCLUI
                MsgAlert("Bem vindo(a) ao cadastro de fornecedores!", "Cadastro de Fornecedores")
            elseif ALTERA
                MsgAlert("Você está prestes a alterar o cadastro do fornecedor " + alltrim(SA2->(A2_NOME)), "Alteração de Cadastro")
            else
                MsgAlert("Atenção! Você está prestes a excluir o fornecedor " + alltrim(SA2->(A2_NOME)), "Exclusão de Cadastro")
            endif


        ElseIf cIdPonto == "BUTTONBAR"
            xRet := {{"Cad.Produtos", "Test2", {||u_mBrowSB1()}}}

            oObj:GetModel("SA2MASTER"):LoadValue("A2_LOJA", cNum)
            oView := FwViewActive()
            oView:Refresh()

        endif

    EndIf

Return xRet
