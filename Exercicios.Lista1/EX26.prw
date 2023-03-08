#INCLUDE "TOTVS.CH"

User Function EX26()

    
    local nI        := 15
    local nSoma     := 0


    while nI <= 100

        nSoma := nSoma + nI

        nI++

    end

    nSoma := nSoma/85

    MSGINFO( "Agora veja a soma dos numeros que você informou" )
    MSGALERT( "A soma ficou: " + Alltrim(Str(nSoma)) + "." )

Return 

