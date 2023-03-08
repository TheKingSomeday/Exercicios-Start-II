#INCLUDE 'TOTVS.CH'

User function Ex38()

    local aIdades            := {}
    local nCont              := 0
    local nPessoas           := 0
    local cExibe             := ""

    
    For nCont := 1 to 10
        nIdade  := Val(FwInputBox("Digite a idade de 10 pessoas: " + cvaltochar(nCont) + "/10"))
        
        if nIdade >= 18
            nPessoas++
            aadd(aIdades , nPessoas)
        ENDIF

        
    next

    for nCont := 1 to LEN(aIdades)

        if nCont == len(aIdades)
            cExibe += alltrim(Str(aIdades[nCont]))
        endif

    NEXT nCont

     MSGINFO("São " + cExibe + " pessoas que tem 18 anos ou mais.", "Resultado" )

Return

