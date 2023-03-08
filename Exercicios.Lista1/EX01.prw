#INCLUDE "TOTVS.CH"

User Function EX01()

    nValor      := 0
    nAntecessor := 0
    cValor      := ""
    lCerto      := .F.

    cValor      := FwInputBox("Digite um numero, e veja seu antecessor: ", cValor)
    nValor      := val(cValor) 

    lCerto := U_ValidaNumero(nValor)
    
    if lCerto
        nAntecessor := nValor - 1
        FwAlertSuccess("Esse é numero antecessor do valor: " + CvaltoChar(nAntecessor), "Resultado")
    else
        FwAlertError("O Programa só aceita Numeros!", "ERRO")
    
    ENDIF
    
Return 

