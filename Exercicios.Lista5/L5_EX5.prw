#INCLUDE 'TOTVS.CH'

User Function L5_EX5()

    Local aA        := {} 
    Local aB        := {} 
    Local aC        := {} 
    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    FOR nI := 1 to 20 

        aAdd(aA, RANDOMIZE( 0, 50 ))
        aAdd(aB, RANDOMIZE( 5, 30 ))

    NEXT

    FOR nI := 1 to 20 

        aAdd(aC,(aA[nI]) + (aB[nI]))

    NEXT

for nCont := 1 to LEN(aC)

        if nCont < len(aC)
            cExibe += alltrim(Str(aC[nCont])) + ", "
        elseif nCont < 21
            cExibe +=  alltrim(Str(aC[nCont])) + ". "
        endif

    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return
