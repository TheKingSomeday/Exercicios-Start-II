#INCLUDE 'TOTVS.CH'

User Function Ex012()

    local cResp := ""
    local nCont := 0


    for nCont := 1 to 100

        if nCont % 3 == 0
    
            cResp += ALLTRIM(Str(nCont)) + " | " 

        ENDIF

    next nCont

    MSGINFO( "Os numeros disivei por 3 sao: "+cResp,"Resutado" )
Return
