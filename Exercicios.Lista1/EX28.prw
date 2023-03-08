#INCLUDE 'TOTVS.CH'

User Function EX28()

    Local aMatriz := {}
    Local cNome := ""
    Local cTentativa := ""
    Local nI := 1
    Local lFlag := .F.

    WHILE nI <= 10

        cNome := FwInputBox("Digite um nome"+STR(nI)+": ","")
        aAdd(aMatriz,(cNome))

        nI++

    ENDDO

    nI := 1

    cTentativa := FwInputBox("Tente achar um nome: ","")

    FOR nI := 1 to 10

        IF cTentativa == aMatriz[nI]

            lFlag := .T.

        ENDIF

    NEXT 

    IF lFlag == .T. 

        MSGALERT("ACHOU!")

    ELSE

        MSGALERT("NÃO ACHOU!")

    ENDIF

Return
