#INCLUDE "TOTVS.CH"

User Function l4_EX4()

    local nNum1   := space(30)
    local nNum2   := space(30)

    Private cResult1  :=""
    Private oResult1 
    Private cResult2  :=""
    Private oResult2 
    Private oCalc 


    FWAlertinfo("Nesse programa usaremos como base que um litro de tinta pinta 2m².","RickColors")

    DEFINE MSDIALOG oCalc TITLE "Pintura da Parede" FROM 000, 000 to 300, 330 PIXEL 
    @ 020, 010 SAY "Digite a altura da parede que deseja pintar: " SIZE 80, 14 OF oCalc Pixel
    @ 017, 090 MSGET nNum1                                         SIZE 60, 11 OF oCalc PIXEL Picture "@E 9999999999"

    @ 040, 010 SAY "Digite a base da parede que deseja pintar: " SIZE 80, 14 OF oCalc Pixel
    @ 037, 090 MSGET nNum2                                       SIZE 60, 11 OF oCalc PIXEL Picture "@E 9999999999"

    @ 060, 025 BUTTON "Pressione para ver o Resultado!"  SIZE 120, 11 OF oCalc Pixel;
    ACTION (OP(nNum1, nNum2))

    @ 075, 060 SAY "Sua parede tem: " SIZE 80, 11 OF oCalc Pixel
    @ 085, 025 MSGET oResult2 VAR cResult2  Size 120, 11 OF oCalc PIXEL
    oResult2:lActive := .F.

    @ 105, 057 SAY "Você vai precisar de: " SIZE 80, 11 OF oCalc Pixel
    @ 115, 025 MSGET oResult1 VAR cResult1  Size 120, 11 OF oCalc PIXEL
    oResult1:lActive := .F.

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function OP(nAltura, nBase)

    local nMetro     := 0
    local nTinta     := 0

    nMetro   := Val(nAltura) * Val(nBase)

    nTinta   := nMetro / 2
 
    cResult1 := alltrim(STR(nTinta)) + " Litros de Tinta"
    oResult1:Refresh()

    cResult2 := alltrim(STR(nMetro)) + " Metros quadrados"
    oResult2:Refresh()
    
Return 
