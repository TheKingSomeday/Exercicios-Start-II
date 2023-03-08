#INCLUDE "TOTVS.CH"

User Function EX20()

    Local nI     := 101
    local aDesc  := {}
    local nCont  := 0
    local cExibe := ""


    WHILE nI < 112

        AADD( aDesc, nI )
        
        nI++

    ENDDO

    for nCont := 1 to LEN(aDesc)

        if nCont < len(aDesc)
            cExibe += alltrim(Str(aDesc[nCont])) + ". "
            
        endif


    NEXT nCont

     MSGALERT( cExibe, "Resultado" )    

Return 
