/* 3 – Desenvolva uma rotina utilizando um PE para que ao incluir ou alterar um Pedido de Venda, todos os produtos desse pedido fiquem com a observação “Inc. PE - ” antes da descrição.
• Exemplo:
• Item 1: Inc. PE – Creatina
• Item 2: Inc. PE – Whey Protein */

#INCLUDE 'PROTHEUS.CH'

User Function MTA410I()
    Local lRet := .T.
    Local nPosQuant := Ascan(Aheader, {|x| Alltrim(x[2]) == 'C6_DESCRI'})

    If acols[n][nPosQuant] != 'Inc. Pe - '
        SC6->C6_DESCRI := ALLTRIM('Inc. PE - ' + SC6->C6_DESCRI)
    Endif

Return lRet
