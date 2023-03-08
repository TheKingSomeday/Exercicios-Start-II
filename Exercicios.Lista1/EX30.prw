#INCLUDE 'TOTVS.CH'

User Function EX30()

    local aArray1    := {}
    local nI         := 0
    local cExibe     :=""


    For nI := 10 to 1 Step -1
        
        AADD( aArray1, nI )

    next nI

    for nI := 1 to LEN(aArray1)

        if nI < len(aArray1)
            cExibe += alltrim(Str(aArray1[nI])) + ", "
        elseif nI = 10
            cExibe +=  alltrim(Str(aArray1[nI])) + ". "
        endif

    NEXT nI

     MSGALERT( cExibe, "Resultado" )

Return
