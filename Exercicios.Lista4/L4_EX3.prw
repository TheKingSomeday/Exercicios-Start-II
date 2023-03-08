#INCLUDE "TOTVS.CH"

User Function l4_EX3()

    local nNum1   := space(30)
    local nNum2   := space(30)

    Private cResult1  :=""
    Private oResult1 
    Private oCalc 


    DEFINE MSDIALOG oCalc TITLE "Reajuste" FROM 000, 000 to 300, 330 PIXEL 
    @ 020, 010 SAY "Digite seu salário: " SIZE 80, 11 OF oCalc Pixel
    @ 017, 090 MSGET nNum1                            SIZE 60, 11 OF oCalc PIXEL Picture "@E 9999999999"

    @ 040, 010 SAY "Digite o valor inteiro do reajuste: " SIZE 80, 11 OF oCalc Pixel
    @ 037, 090 MSGET nNum2                            SIZE 60, 11 OF oCalc PIXEL Picture "@E 9999999999"

    @ 060, 025 BUTTON "Pressione para ter o seu reajuste!"  SIZE 120, 11 OF oCalc Pixel;
    ACTION (OP(nNum1, nNum2))

    @ 090, 045 SAY "O seu salário com o reajuste é: " SIZE 80, 11 OF oCalc Pixel
    @ 100, 025 MSGET oResult1 VAR cResult1   Size 120, 11 OF oCalc PIXEL
    oResult1:lActive := .F.

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function OP(nValor1, nValor2)

    local nResult       := 0
    local nReajust      := 0

    nReajust    := val(nValor2) / 100

    nResult     := Val(nValor1) * nReajust

    nResult     := Val(nValor1) + nResult
 
    cResult1    := alltrim(STR(nResult)) + " R$"
    oResult1:Refresh()
    
Return 
