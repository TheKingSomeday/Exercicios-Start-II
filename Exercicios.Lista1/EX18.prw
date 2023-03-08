#INCLUDE "TOTVS.CH"

User Function EX18()

    Local aCresc := {}
    local cExibe := ""
    local nCont  := 0

    for nCont := 1 to 10 

        AADD( aCresc, nCont )
        

    NEXT

    ASORT( aCresc )

    for nCont := 1 to LEN(aCresc)

        if nCont < len(aCresc)
            cExibe += alltrim(Str(aCresc[nCont])) + ", "
        elseif nCont = 10
            cExibe +=  alltrim(Str(aCresc[nCont])) + ". "
        endif


    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return 
