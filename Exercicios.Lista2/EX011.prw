#INCLUDE 'TOTVS.CH'

User Function Ex011()


    Local nCont     := 0
    Local cArmazena := ""
    local cOpcao    := ""

    cOpcao := upper(FwInputBox("Escolha fazer o exercicio com o For ou While (F/W): ", cOpcao))

    if cOpcao == "F"

        cArmazena := 'Utilizando o For:' + CRLF
        for nCont := 1 to 50
            cArmazena += ALLTRIM(STR(RANDOMIZE( 10, 99))) + ' | '
        NEXT

    elseif cOpcao == "W"
            
        cArmazena += CRLF+CRLF+ 'Utilizando o While:' + CRLF
        while nCont != 50
            cArmazena += ALLTRIM(STR(RANDOMIZE( 10, 99))) + ' | '
            nCont++
        end

    ENDIF

    FwAlertInfo(cArmazena)

Return
