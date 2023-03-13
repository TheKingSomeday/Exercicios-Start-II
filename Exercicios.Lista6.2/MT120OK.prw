/* 1 – Utilizando Ponto de Entrada, faça uma validação na inclusão / alteração dos Pedidos de Compra, onde não será possível adicionar um novo item (nova linha no grid) caso o campo “Tipo de Entrada” não esteja preenchido. A cada tentativa de adicionar um novo item, se o Tipo de Entrada não estiver preenchido, uma mensagem de erro deve ser apresentada. */

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
