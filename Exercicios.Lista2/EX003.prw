#INCLUDE "TOTVS.CH"

User Function Ex003()

   local nTemp             := 0
   local nVelo             := 0
   local nDist             := 0
   local nLitros           := 0
   local nLitrosUsados     := 0

    nTemp    := Val(FwInputBox("Digite o Tempo que levou a viagem: ", ""))
    nVelo    := Val(FwInputBox("Digite a sua velocidade media: ",""))
    nLitros    := Val(FwInputBox("Digite quantos KM seu carro faz por litro: ",""))

    nDist             := nTemp * nVelo
    nLitrosUsados     := nDist / nLitros

    MSGINFO( "Agora vamos para as informacoes." )

    FwAlertSuccess("A velociade media foi " + alltrim(Str(nVelo)) + " KM/HR.", "Resultado")
    FwAlertSuccess("O tempo gasto na viagem foi " + alltrim(Str(nTemp)) + " Horas." , "Resultado")
    FwAlertSuccess("A distancia percorrida foi " + alltrim(Str(nDist)) + " Kilometros.", "Resultado")
    FwAlertSuccess("A quantidade de litros utilzado foi " + alltrim(Str(nLitrosUsados)) + " litros." , "Resultado")

Return 
