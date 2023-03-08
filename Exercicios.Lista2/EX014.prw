#INCLUDE 'TOTVS.CH'

User Function Ex014()

    local nLimit    := 0
    local nSoma     := 0
    local cOpcao    := ""
    local nCont     := 0

    nLimit  := Val(FwInputBox("Digite um número para definir o limite: "))
    cOpcao  := upper(FwInputBox("Digite (P/I) para executar com numeros pares ou impares: "))

    while cOpcao <> "P" .AND. cOpcao <> "I"
        MSGALERT( "Entre somente com ' P ' ou ' I '." )
        cOpcao  := upper(FwInputBox("Digite (P/I) para executar com numeros pares ou impares: "))

    ENDDO
    
    if cOpcao == "P"

        for nCont := 1 to (nLimit*2)

            if nCont % 2 == 0
        
                nSoma := nSoma + nCont
                
            ENDIF

        next nCont

        MSGINFO( "A soma dos " + alltrim(Str(nLimit)) + " primeiros numeros naturais pares e: " + alltrim(STR((nSoma))),"Resutado" )

    elseif cOpcao == "I"    

        for nCont := 1 to (nLimit*2) step 2

            if nCont % 2 != 0
        
                nSoma := nSoma + nCont

            ENDIF

        next nCont

        MSGINFO( "A soma dos " + alltrim(Str(nLimit)) + " primeiros numeros naturais Impares e: " + alltrim(STR((nSoma))),"Resutado" )

    ENDIF    


Return

