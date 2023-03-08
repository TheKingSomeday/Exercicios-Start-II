#INCLUDE 'TOTVS.CH'

User Function Ex017_2()

    local nSort := 0
    local nNumb := 0
    local nCont := 0
    local lLoop := .F.

    nSort := RANDOMIZE( 1 , 100 )

    FwAlertInfo("Vamos fazer um joguinho de advinha agora!")
    FwAlertInfo("Um numero foi sorteado entre 1 e 100, adivinhe qual é!")

    while lLoop == .F.

        nNumb := val(FwInputBox("Escolha um numero de 1 a 100: "))

        if nNumb > nSort 
            FwAlertError("O Numero sorteado é menor.","KKKK Tu errou")
           

        elseif nNumb < nSort
            FwAlertError("O Numero sorteado é maior.","KKKK Tu errou")  

        else
        
            NumeroDeTentativas(nSort, nCont)

            lLoop := .T.        

        ENDIF

        nCont++

    ENDDO
    
Return


Static Function NumeroDeTentativas(nSort, nCont)

    local nQuant := nCont
    local cResp  := ""

    if nQuant < 5
        cResp := FwAlertSuccess("Voce e muito bom, acertou em "+ alltrim(Str(nQuant)) + " tentativas." + CRLF + "O numero sorteado era: " + Alltrim(Str(nSort)) + ".","Meus parabens!")

    elseif nQuant > 5 .and. nQuant < 9
        cResp := FwAlertSuccess("Voce e bom, acertou em "+ alltrim(Str(nQuant)) + " tentativas." + CRLF + "O numero sorteado era: " + Alltrim(Str(nSort)) + ".","Meus parabens!")    

    elseif nQuant > 9 .and. nQuant < 13
        cResp := FwAlertSuccess("Voce e mediano, acertou em "+ alltrim(Str(nQuant)) + " tentativas." + CRLF + "O numero sorteado era: " + Alltrim(Str(nSort)) + ".","Meus parabens!")   

    elseif nQuant > 13
        cResp := FwAlertSuccess("Voce e muito fraco, acertou em "+ alltrim(Str(nQuant)) + " tentativas." + CRLF + "O numero sorteado era: " + Alltrim(Str(nSort)) + ".","Meus parabens!")    

    ENDIF    
    
Return cResp

