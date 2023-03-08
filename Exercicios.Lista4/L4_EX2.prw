#INCLUDE "TOTVS.CH"

User Function l4_EX2()

    local nNum1   := space(30)
    local nNum2   := space(30)

    Private cResult1  :=""
    Private oResult1 
    Private oCalc 


    DEFINE MSDIALOG oCalc TITLE "Conversor" FROM 000, 000 to 300, 330 PIXEL 
    @ 020, 010 SAY "Digite a cotação atual do Dolar:" SIZE 80, 11 OF oCalc Pixel
    @ 017, 090 MSGET nNum1                            SIZE 60, 11 OF oCalc PIXEL Picture "@E 9999999999"

    @ 040, 010 SAY "Digite uma quantia em dolares: " SIZE 80, 11 OF oCalc Pixel
    @ 037, 090 MSGET nNum2                           SIZE 60, 11 OF oCalc PIXEL Picture "@E 99999999999"

    @ 060, 025 BUTTON " Pressione para Converter para real!"  SIZE 120, 11 OF oCalc Pixel;
    ACTION (OP(nNum1, nNum2))

    @ 100, 025 MSGET oResult1 VAR cResult1   Size 120, 11 OF oCalc PIXEL
    oResult1:lActive := .F.

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function OP(nValor1, nValor2)

    local nMult    := 0

    nMult   := Val(nValor1) * Val(nValor2)

    cResult1   := alltrim(STR(nMult)) + " R$"
    oResult1:Refresh()
    
Return 
