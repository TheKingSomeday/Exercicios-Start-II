#INCLUDE "TOTVS.CH"

User Function Ex001()

   local nNum1   := 0
   local nNum2   := 0
   local nSoma   := 0
   local nSub    := 0
   local nMult   := 0
   local nDiv    := 0

    nNum1    := Val(FwInputBox("Digite um numero: ", ""))
    nNum2    := Val(FwInputBox("Digite outro numero: ",""))

    MSGINFO( "Agora veja a soma, subtracao, multiplicacao e divisao entre os numeros." )

    nSoma   := nNum1 + nNum2
    nSub    := nNum1 - nNum2 
    nMult   := nNum1 * nNum2
    nDiv    := nNum1 / nNum2

    FwAlertSuccess("A Soma e : " + alltrim(Str(nSoma)) , "Resultado")
    FwAlertSuccess("A Subtracao e : " + alltrim(Str(nSub)) , "Resultado")
    FwAlertSuccess("A Multiplicacao e : " + alltrim(Str(nMult)) , "Resultado")
    FwAlertSuccess("A Divisao e : " + alltrim(Str(nDiv)) , "Resultado")

Return 
