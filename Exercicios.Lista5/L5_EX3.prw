#INCLUDE 'TOTVS.CH'

User Function L5_EX3()

    Local aNum      := {} 
    Local nI        := 0
    local nCont     := 0
    local cExibe    := ""

    FOR nI := 1 to 30

        aAdd(aNum,nI)

    NEXT

for nCont := 1 to LEN(aNum)

        if nCont < len(aNum)
            cExibe += alltrim(Str(aNum[nCont])) + ", "
        elseif nCont = 30
            cExibe +=  alltrim(Str(aNum[nCont])) + ". "
        endif


    NEXT nCont

     MSGALERT( cExibe, "Resultado" )

Return
