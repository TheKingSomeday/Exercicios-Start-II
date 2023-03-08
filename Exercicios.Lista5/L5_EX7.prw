#INCLUDE 'TOTVS.CH'

User Function L5_EX7()

    Local aA        := {} 
    Local aB        := {} 
    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    FOR nI := 1 to 15

        aAdd(aA,nI)

    NEXT
    FOR nI := 15 to 1 step - 1

        aAdd(aB,nI)

    NEXT

for nCont := 1 to LEN(aB)

        if nCont < len(aB)
            cExibe += alltrim(Str(aB[nCont])) + ", "
        elseif nCont == 15
            cExibe +=  alltrim(Str(aB[nCont])) + ". "
        endif

    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return
