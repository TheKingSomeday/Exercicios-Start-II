#INCLUDE 'TOTVS.CH'

User Function L5_Ex14()
    Local aArray := {}
    Local cLetra   := 0
    Local nRepete := 0

    While Len(aArray) <= 12
        cLetra := CHR(RANDOMIZE(97, 122))
        nRepete := ASCAN(aArray, cLetra, 1, Len(aArray))

            If nRepete == 0
                AADD(aArray, cLetra)
            Endif
    Enddo

    MostraArray(aArray)
Return 

Static Function MostraArray(aArray)
    Local cMostra := ''
    Local nCont   := 0

    For nCont := 1 to Len(aArray)
        If nCont < 12
            cMostra += cValToChar(aArray[nCont]) + ', '
        Else 
            cMostra += cValToChar(aArray[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Conteúdo do Array')
Return
