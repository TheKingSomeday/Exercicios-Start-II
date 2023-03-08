#INCLUDE 'TOTVS.CH'

User Function L5_EX6()

    Local aA        := {} 
    Local aB        := {} 
    Local aC        := {} 
    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    FOR nI := 1 to 10

        aAdd(aA,nI)

    NEXT


    FOR nI := 1 to 10

        aAdd(aC,aA[nI])
        aAdd(aC,aB[nI])

    NEXT

for nCont := 1 to LEN(aC)

        if nCont < len(aC)
            cExibe += alltrim(Str(aC[nCont])) + ", "
        elseif nCont == 20
            cExibe +=  alltrim(Str(aC[nCont])) + ". "
        endif

    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return
