#INCLUDE 'TOTVS.CH'

User Function Ex015()

    Local nCont :=0
    local nNum := 0
    local nSoma:=0
    Local cArmazena := ""
    Local aFib:={0,1}

    nNum := VAL(FwInputBox("Digite quantos números de Fibonacci você quer gerar? "))

    while nNum <= 0
        FwAlertInfo("Digite apenas números inteiro e positivo.")
        nNum := VAL(FwInputBox("Quantos números de Fibonacci você quer gerar? "))
    end

    for nCont:= 3 to nNum
        nSoma := aFib[nCont-1] + aFib[nCont-2]
        AADD(aFib, nSoma)  
    NEXT

    for nCont:= 1 to nNum
        cArmazena += STR(aFib[nCont]) + " | "
    NEXT

    FwAlertInfo("Os "+ALLTRIM(STR(nNum))+" primeiro números da série Fibonacci são:" +CRLF+CRLF+ ALLTRIM(cArmazena))


Return

