#INCLUDE "TOTVS.CH"

User Function EX10()

    local cNumero   := ""
    local cExibe    := ""
    local aOrdem    := {}
    local nVal      := 0
    local nCont     := 0

    for nCont := 1 to 3

        cNumero := FwInputBox("Digite o " + ALLTRIM(str(nCont)) + "º numero: ", cNumero)
        nVal    := Val(cNumero)
        cUser   := ""

        AADD( aOrdem, nVal )

    next nCont

    ASORT(aOrdem)

    for nCont := 1 to LEN(aOrdem)

        if nCont < len(aOrdem)
            cExibe += alltrim(Str(aOrdem[nCont])) + ", "
        elseif nCont = 3
            cExibe +=  alltrim(Str(aOrdem[nCont])) + ". "
        endif


    NEXT nCont

    MSGALERT( cExibe, "Resultado" )
Return 

