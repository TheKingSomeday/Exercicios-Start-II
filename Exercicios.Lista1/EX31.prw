#INCLUDE 'TOTVS.CH'

User Function EX31()

    Local aCresc := {}
    local nI     := 0
    local cExibe := ""
    local nCont  := 0

    for nCont := 1 to 10

        nI := val(FwInputBox("Digite um numero: ",""))

        AADD( aCresc, nI )
        

    NEXT

    ASORT( aCresc )

    for nCont := 1 to LEN(aCresc)

        if nCont < len(aCresc)
            cExibe += alltrim(Str(aCresc[nCont])) + ", "
        elseif nCont = 10
            cExibe +=  alltrim(Str(aCresc[nCont])) + ". "
        endif


    NEXT nCont

     MSGALERT( cExibe, "Resultado" )
Return
