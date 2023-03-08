#INCLUDE 'TOTVS.CH'

User Function Ex017_1()

    local nSort := 0
    local nNumb := 0
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
            FwAlertSuccess("Parece que voce acertou amigo!" + CRLF + "O numero sorteado era: " + Alltrim(Str(nSort)) + ".","Meus parabens!")

            lLoop := .T.        

        ENDIF

    ENDDO

Return

