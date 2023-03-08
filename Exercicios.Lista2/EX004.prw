#INCLUDE "TOTVS.CH"

User Function Ex004()

   local nNum1   := 0
   local nNum2   := 0
   local nDiff   := 0
   local nQuad   := 0


    nNum1    := Val(FwInputBox("Digite um numero: ", ""))
    nNum2    := Val(FwInputBox("Digite outro numero: ",""))

    nDiff    := nNum1 / nNum2
    nQuad    := nDiff ** 2


    FwAlertSuccess("O quadrado da diferença do valor primeiro pelo o segundo e: " + alltrim(Str(nQuad)) , "Resultado")


Return
