#INCLUDE "TOTVS.CH" 

User Function MA410LEG()

Local aLegenda := PARAMIXB

aLegenda := {}

AADD(aLegenda,{"CHECKOK" ,"Pedido de Venda em aberto"})
AADD(aLegenda,{"BR_CANCEL" ,"Pedido de Venda encerrado"})
AADD(aLegenda,{"GCTPIMSE" ,"Pedido de Venda liberado"})
AADD(aLegenda,{"BR_AZUL" ,"Pedido Bloqueado por Regra"})
AADD(aLegenda,{"BR_LARANJA" ,"Pedido Bloqueado por Verba"})

Return(aLegenda)
