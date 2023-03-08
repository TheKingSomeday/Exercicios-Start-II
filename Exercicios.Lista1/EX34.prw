#INCLUDE 'TOTVS.CH'

User Function EX34()

    local aPesos          := {}
    local nCont           := 0
    local nPessoas        := 0
    local nPeso           := 0
    local nIdade          := 0
    local nIdadeTotal     := 0
    local nDiv            := 0
    local cExibe          := ""

    
    For nCont := 1 to 7
        nPeso   := Val(FwInputBox("Digite o peso de 7 pessoas: " + cvaltochar(nCont) + "/7"))
        nIdade  := Val(FwInputBox("Digite a idade de 7 pessoas: " + cvaltochar(nCont) + "/7"))
        
        if nPeso >= 90
            nPessoas++
            aadd(aPesos, nPessoas)
        ENDIF

        nIdadeTotal := nIdade + nIdadeTotal

    next

    nDiv := nIdadeTotal / 7

    for nCont := 1 to LEN(aPesos)

        if nCont <= len(aPesos)
            cExibe += alltrim(Str(aPesos[nCont])) + ", "
        elseif nCont = 7
            cExibe +=  alltrim(Str(aPesos[nCont])) + ". "
        endif

    NEXT nCont

     MSGINFO("O numero de pessoas que pesam mais de 90KG é: " + cExibe + ".", "Resultado" )
     MSGINFO( "A média de idade das 7 pessoas é: " + alltrim(Str(nDiv)) + " anos.")

Return
