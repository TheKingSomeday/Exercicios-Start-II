#INCLUDE "TOTVS.CH"

User Function EX24()

    
    local nI     := 1
    local nNum   := 0
    local nDent  := 0
    local nFora  := 0


    while nI <= 10
        
        nNum := Val(FwInputBox("Digite um valor, positivo ou negativo: ",""))

            if nNum >= 10 .and. nNum <= 20
                nDent++

            else
                nFora++

            endif

        nI++

    end

    MSGINFO( "Agora veja quais numeros estão no intervalo entre 10 e 20" )
    MSGALERT( "Você informou "+ Alltrim(Str(nDent))+ " numeros estão entre 10 e 20." )

Return 

