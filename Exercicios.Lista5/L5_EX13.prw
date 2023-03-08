#INCLUDE 'TOTVS.CH'

User Function L5_EX13()

    Local aA        := {} 
    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    GeraLetras(aA,nI)

for nCont := 1 to LEN(aA)

        if nCont < len(aA)
            cExibe += alltrim(aA[nCont]) + ", "
        elseif nCont == 50
            cExibe +=  alltrim(aA[nCont]) + ". "
        endif

    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return


Static Function GeraLetras(aA,nI)

    FOR nI := 1 to 50

        aAdd(aA,CHR(RANDOMIZE(65,90)))

    NEXT
         
    
Return 
