#INCLUDE 'TOTVS.CH'

User Function Ex013()

    local nLimit := 0
    local nNumb  := 0
    local cResp  := ""
    local nCont  := 0

    nLimit := Val(FwInputBox("Digite um n�mero para definir o limite: "))
    nNumb  := Val(FwInputBox("Digite um n�mero para saber quais s�o os multiplos dele: "))

    cArmazena := 'Os M�ltiplos de '+ ALLTRIM(STR(nNumb)) +', de 1 a '+ ALLTRIM(STR(nLimit)) +':' + CRLF

    for nCont := 1 to nLimit

        if nCont % nNumb == 0
    
            cResp += ALLTRIM(Str(nCont)) + " | " 

        ENDIF

    next nCont

    MSGINFO( "Os numeros disivei por " + alltrim(Str(nNumb)) + " sao: " + cResp,"Resutado" )
Return

