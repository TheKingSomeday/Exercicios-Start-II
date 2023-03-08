#INCLUDE 'TOTVS.CH'

User Function Ex010()
    Local aNumeros      := {}
    Local nI            := 0
    local nCont         := 0
    local cMenor        := ""
    local cMaior        := ""

    for nCont := 1 to 5

        nI := Val(FwInputBox("Digite valores 5 valores inteiros : " + CVALTOCHAR(nCont) +  "/5", ""))
        AADD(aNumeros,nI)

    next nCont

    ASORT(aNumeros)

    MSGINFO( "Agora veja o menor e o maior deles." )

    cMenor := alltrim(str(aNumeros[1]))
    cMaior := alltrim(Str(aNumeros[5]))

    FwAlertSuccess('O menor numero foi o ' + cMenor + ' e o maior foi ' + cMaior + '.')

Return
