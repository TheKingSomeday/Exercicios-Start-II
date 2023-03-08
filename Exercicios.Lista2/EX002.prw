#INCLUDE "TOTVS.CH"

User Function Ex002()

   local nTemp       := 0
   local nVelo       := 0
   local nDist       := 0
   local nLitros     := 0

    nTemp    := Val(FwInputBox("Digite o Tempo que levou a viagem: ", ""))
    nVelo    := Val(FwInputBox("Digite a sua velocidade media: ",""))

    nDist       := nTemp * nVelo
    nLitros     := nDist / 12

    MSGINFO( "Agora vamos para as informacoes." )

    FwAlertSuccess("A velociade media foi " + alltrim(Str(nVelo)) + " KM/HR.", "Resultado")
    FwAlertSuccess("O tempo gasto na viagem foi " + alltrim(Str(nTemp)) + " Horas." , "Resultado")
    FwAlertSuccess("A distancia percorrida foi " + alltrim(Str(nDist)) + " Kilometros.", "Resultado")
    FwAlertSuccess("A quantidade de litros utilzado foi " + alltrim(Str(nLitros)) + " litros." , "Resultado")

Return 
