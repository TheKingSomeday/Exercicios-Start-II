#INCLUDE 'PROTHEUS.CH'

// Função que valida se o "Tipo de entrada" está preenchido nos Pedidos de Venda.
User Function ValLinha()
    local aArea := GetArea()
    local lRetorno := .T.
    local nTES  := aScan(aHeader,{|x| Alltrim(x[2]) == "C7_TES"})

    if Empty(aCols[n,nTES])
        MsgStop("Deve preencher o campo 'Tipo de Entrada'", "Atenção!")
        lRetorno := .F.
    endif

    RestArea(aArea)

Return lRetorno

// Função que retorna uma mensagem ao clicar no botão da rotina MT120BRW.
User Function Botao()
    FwAlertSucess("Botão acionado com sucesso!", "Parabéns!")
Return
