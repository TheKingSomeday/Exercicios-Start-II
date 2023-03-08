#INCLUDE "TOTVS.CH"

User Function l4_EX5()

    local nNum1   := space(30)
    local nNum2   := space(30)

    Private cResult1  :=""
    Private oResult1 
    Private oCalc 


    FWAlertinfo("Nesse programa vamos calcular o valor do seu aluguel.","LocalRick")

    DEFINE MSDIALOG oCalc TITLE "Aluguel do Carro" FROM 000, 000 to 300, 330 PIXEL 
    @ 020, 010 SAY "Digite a quantidade de dias alugados: " SIZE 80, 14 OF oCalc Pixel
    @ 017, 090 MSGET nNum1                                         SIZE 60, 11 OF oCalc PIXEL Picture "@E 9999999999"

    @ 040, 010 SAY "Digite a quantidade de KMs rodados: " SIZE 80, 14 OF oCalc Pixel
    @ 037, 090 MSGET nNum2                                       SIZE 60, 11 OF oCalc PIXEL Picture "@E 9999999999"

    @ 060, 025 BUTTON "Pressione para ver o Resultado!"  SIZE 120, 11 OF oCalc Pixel;
    ACTION (OP(nNum1, nNum2))

    @ 085, 050 SAY "O valor total do aluguel deu: " SIZE 80, 11 OF oCalc Pixel
    @ 095, 025 MSGET oResult1 VAR cResult1  Size 120, 11 OF oCalc PIXEL
    oResult1:lActive := .F.

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function OP(nDias, nKM)

    local nSomaDia     := 0
    local nSomaKm      := 0
    local nTotal       := 0

    nSomaDia   := Val(nDias) * 60

    nSomaKm    := Val(nKM) * 0.15

    nTotal     := nSomaDIa + nSomaKm
 
    cResult1 := alltrim(STR(nTotal)) + " R$"
    oResult1:Refresh()
    
Return 
