#INCLUDE 'TOTVS.CH'

User Function EX35()

    local nIdade          := -1
    local nIdadeTotal     := 0
    local nDiv            := 0
    local ncont           := 0

    While nIdade != 0

        nIdade := Val(FwInputBox("Digite aqui a idade da pessoa, ou coloque 0 para finalizar e calcular a m�dia " ))
        
        If nIdade <> 0
         nIdadeTotal := nIdade + nIdadeTotal
         nCont++
        Endif

    ENDDO

    nDiv := nIdadeTotal / nCont

     MSGINFO( "A m�dia de idade pessoas �: " + alltrim(Str(nDiv)) + " anos.")

Return
