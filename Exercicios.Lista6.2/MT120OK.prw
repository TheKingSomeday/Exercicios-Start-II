/* 1 � Utilizando Ponto de Entrada, fa�a uma valida��o na inclus�o / altera��o dos Pedidos de Compra, onde n�o ser� poss�vel adicionar um novo item (nova linha no grid) caso o campo �Tipo de Entrada� n�o esteja preenchido. A cada tentativa de adicionar um novo item, se o Tipo de Entrada n�o estiver preenchido, uma mensagem de erro deve ser apresentada. */

#INCLUDE 'PROTHEUS.CH'

user function MT120PCOL
    local lRet := .T.
    local nOper := PARAMIXB[1]

    if nOper == 1 .or. nOper == 2

        if ExistBlock('ValLinha')
            lRet := ExecBlock('ValLinha', .F., .F.)
        endif
    endif 

Return lRet
