#INCLUDE 'TOTVS.CH'

User Function L5_EX8()

    Local aA        := {} 
    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    FOR nI := 8 to 1 step -1

        aAdd(aA,nI)

    NEXT

    ASORT(aA)

for nCont := 1 to LEN(aA)

        if nCont < len(aA)
            cExibe += alltrim(Str(aA[nCont])) + ", "
        elseif nCont == 8
            cExibe +=  alltrim(Str(aA[nCont])) + ". "
        endif

    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return
