#INCLUDE 'PROTHEUS.CH'

// Fun��o que valida se o "Tipo de entrada" est� preenchido nos Pedidos de Venda.
User Function ValLinha()
    local aArea := GetArea()
    local lRetorno := .T.
    local nTES  := aScan(aHeader,{|x| Alltrim(x[2]) == "C7_TES"})

    if Empty(aCols[n,nTES])
        MsgStop("Deve preencher o campo 'Tipo de Entrada'", "Aten��o!")
        lRetorno := .F.
    endif

    RestArea(aArea)

Return lRetorno

// Fun��o que retorna uma mensagem ao clicar no bot�o da rotina MT120BRW.
User Function Botao()
    FwAlertSucess("Bot�o acionado com sucesso!", "Parab�ns!")
Return
