#INCLUDE 'TOTVS.CH'

User Function L5_EX2()

    Local aSemana := {}
    Local cVal := ""
    Local nI := 1

    FOR nI := 1 to 10

        cVal := FwInputBox("Digite o "+ ALLTRIM(STR(nI)) +"º valor(texto/numero): ","")
        aAdd(aSemana,cVal)

    NEXT

    FOR nI := 10 to 1 STEP -1

        FwAlertInfo("O valor do array na posicao "+ALLTRIM(STR(nI)) +" e: "+ ALLTRIM(aSemana[nI]) +".")

    NEXT


Return
