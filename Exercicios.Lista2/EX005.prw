#INCLUDE "TOTVS.CH"

User Function Ex005()

   local nDolar           := 0
   local nCot             := 0    
   local nReal            := 0

    nCot             := Val(FwInputBox("Digite a cotacao atual do dolar: ", ""))
    nDolar           := Val(FwInputBox("Digite quantos dolares voce tem: ", ""))

    nReal := nCot * nDolar

    FwAlertSuccess("A quantidade de dolares em reais que voce tem e " + alltrim(Str(nReal)) + "R$.", "Resultado")


Return
