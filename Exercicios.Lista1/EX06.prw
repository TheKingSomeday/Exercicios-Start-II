#INCLUDE "TOTVS.CH"

User Function EX06()

    local nFahrenheit := 0
    local nCelcius    := 0


    nFahrenheit := Val(FwInputBox("Digite uma temperatura em Fahrenheit: ", ""))

    MSGINFO("Ela será agora convertida para Celcius")
    
    nCelcius  := (nFahrenheit -32) * 5/9 


    MSGALERT( "A temperatura em Celcius é: " + Alltrim(Str(nCelcius)) + "." )
    
    
Return 

