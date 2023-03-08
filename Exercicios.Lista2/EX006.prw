#INCLUDE "TOTVS.CH"

User Function Ex006()

   local nNumb  := 0
   local nCont  := 0    
   local cExibe := ""

    for nCont := 1 to 4

        nNumb := Val(FwInputBox("Digite valores inteiro ", ""))

        if nNumb % 2 == 0 .and. nNumb % 3 == 0
            cExibe += Alltrim(Str(nNumb)) + "."

        ENDIF


    next nCont

    FwAlertSuccess("Os numeros divisiveis por 2 e 3 sao: " + cExibe, "Resultado")

Return
