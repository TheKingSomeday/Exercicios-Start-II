#INCLUDE "TOTVS.CH"

User Function l4_EX1()

    local nNum1   := space(30)
    local nNum2   := space(30)

    Private cResult1  :=""
    Private cResult2  :=""
    Private cResult3  :=""
    Private cResult4  :=""
    Private oResult1 
    Private oResult2 
    Private oResult3 
    Private oResult4 
    Private oCalc 


    DEFINE MSDIALOG oCalc TITLE "Operações" FROM 000, 000 to 500, 370 PIXEL 
    @ 020, 010 SAY "Digite um número: " SIZE 120, 11 OF oCalc Pixel
    @ 017, 055 MSGET nNum1              SIZE 120, 11 OF oCalc PIXEL Picture "@E 9999999999999"

    @ 040, 010 SAY "Digite um número: " SIZE 120, 11 OF oCalc Pixel
    @ 037, 055 MSGET nNum2              SIZE 120, 11 OF oCalc PIXEL Picture "@E 9999999999999"

    @ 070, 033 BUTTON " Pressione para ver as quatro operações!"  SIZE 120, 11 OF oCalc Pixel;
    ACTION (OP(nNum1, nNum2))

    @ 100, 033 MSGET oResult1 VAR cResult1   Size 120, 11 OF oCalc PIXEL
    oResult1:lActive := .F.

    @ 115, 033 MSGET oResult2 VAR cResult2   Size 120, 11 OF oCalc PIXEL
    oResult2:lActive := .F.

    @ 130, 033 MSGET oResult3 VAR cResult3   Size 120, 11 OF oCalc PIXEL
    oResult3:lActive := .F.

    @ 145, 033 MSGET oResult4 VAR cResult4   Size 120, 11 OF oCalc PIXEL
    oResult4:lActive := .F.

    ACTIVATE MSDIALOG oCalc CENTERED


Return 

Static Function OP(nValor1, nValor2)

    local nSoma    := 0
    local nSub     := 0
    local nMult    := 0
    local nDiv     := 0

    nSoma   := Val(nValor1) + val(nValor2)
    nSub    := Val(nValor1) - Val(nValor2) 
    nMult   := Val(nValor1) * Val(nValor2)
    nDiv    := Val(nValor1) / Val(nValor2)

    cResult1   := alltrim(nValor1) + " + " + alltrim(nValor2) + " = " + alltrim(STR(nSoma))
    oResult1:Refresh()
    
    cResult2   := alltrim(nValor1) + " - " + alltrim(nValor2) + " = " + alltrim(STR(nSub))
    oResult2:Refresh()

    cResult3   := alltrim(nValor1) + " * " + alltrim(nValor2) + " = " + alltrim(STR(nMult))
    oResult3:Refresh()

    cResult4   := alltrim(nValor1) + " / " + alltrim(nValor2) + " = " + alltrim(STR(nDiv))
    oResult4:Refresh()


Return 
