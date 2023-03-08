#INCLUDE "TOTVS.CH"

User Function EX25()

    
    local nI        := 1
    local nNum      := 0
    local nSoma     := 0


    while nI <= 5
        
        nNum := Val(FwInputBox("Digite um valor: ",""))

        nSoma := nSoma + nNum

        nI++

    end

    MSGINFO( "Agora veja a soma dos numeros que você informou" )
    MSGALERT( "A soma ficou: " + Alltrim(Str(nSoma)) + "." )

Return 

