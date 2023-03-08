#INCLUDE 'TOTVS.CH'

User Function L5_EX11()

    Local aA        := {} 
    Local aB        := {} 

    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    FOR nI := 1 to 10

        aAdd(aA,nI)

    NEXT

    FOR nI := 1 to 10
        
        aAdd(aB,aA[1] + aA[nI])

    NEXT
         

for nCont := 1 to LEN(aB)

        if nCont < len(aB)
            cExibe += alltrim(Str(aB[nCont])) + ", "
        elseif nCont == 10
            cExibe +=  alltrim(Str(aB[nCont])) + ". "
        endif

    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return
