#INCLUDE 'TOTVS.CH'

User Function L5_EX9()

    Local aA        := {} 
    Local aB        := {} 

    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    FOR nI := 1 to 8 

        aAdd(aA,nI)

    NEXT

    FOR nI := 1 to 8 

    
        aAdd(aB,aA[nI] * 3)

    NEXT

for nCont := 1 to LEN(aB)

        if nCont < len(aB)
            cExibe += alltrim(Str(aB[nCont])) + ", "
        elseif nCont == 8
            cExibe +=  alltrim(Str(aB[nCont])) + ". "
        endif

    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return
