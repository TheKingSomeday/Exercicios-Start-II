#INCLUDE "TOTVS.CH"

User Function EX19()

    Local nI     := 10
    local aDesc  := {}
    local nCont  := -1
    local cExibe := ""


    WHILE nI >= 0

        AADD( aDesc, nI )
        
        nI--

    ENDDO

    for nCont := 1 to LEN(aDesc)

        if nCont < len(aDesc)
            cExibe += alltrim(Str(aDesc[nCont])) + ". "

        endif


    NEXT nCont

     MSGALERT( cExibe, "Resultado" )    

Return 
