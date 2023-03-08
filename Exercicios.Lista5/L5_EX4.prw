#INCLUDE 'TOTVS.CH'

User Function L5_EX4()

    Local aNum   := {} 
    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    FOR nI := 2 to 20 step 2
        aAdd(aNum,nI)

    NEXT

for nCont := 1 to LEN(aNum)

        if nCont < len(aNum)
            cExibe += alltrim(Str(aNum[nCont])) + ", "
        elseif nCont < 20
            cExibe +=  alltrim(Str(aNum[nCont])) + ". "
        endif

    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return
