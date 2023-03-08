#INCLUDE "TOTVS.CH"


User Function l4_EX8()

    local nNum1     := space(30)
    local nNum2     := space(30)

    Private cResult1  :=""
    Private oResult1 

    Private cResult2  :=""
    Private oResult2 
    Private oCalc 

    FWAlertinfo("Calculo de IMC.","Rick's Health")

    DEFINE MSDIALOG oCalc TITLE "Informações" FROM 000, 000 to 300, 330 PIXEL 
    @ 020, 010 SAY "Digite a sua altura(Cm): "  SIZE 80, 14 OF oCalc Pixel
    @ 017, 090 MSGET nNum1                  SIZE 60, 11 OF oCalc PIXEL 

    @ 040, 010 SAY "Digite o seu peso(KG): "    SIZE 80, 14 OF oCalc Pixel
    @ 037, 090 MSGET nNum2                  SIZE 60, 11 OF oCalc PIXEL 

    @ 060, 025 BUTTON "Calcular o IMC!"     SIZE 120, 11 OF oCalc Pixel;
    ACTION (IMC(nNum1, nNum2))

    @ 080, 065 SAY "O seu IMC é: "                  SIZE 80, 11 OF oCalc Pixel
    @ 090, 025 MSGET oResult1 VAR cResult1          SIZE 120, 11 OF oCalc PIXEL
    oResult1:lActive := .F.

    @ 105, 050 SAY "O seu grau de obesidade é: "    SIZE 80, 11 OF oCalc Pixel
    @ 115, 025 MSGET oResult2 VAR cResult2          SIZE 120, 11 OF oCalc PIXEL
    oResult1:lActive := .F.

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function IMC(nAltura,nPeso)

    local nImc := 0

    nImc :=  (Val(nPeso) ** 2)
    nImc :=  nImc / Val(nAltura)

    if nImc < 18.5
        cResult1 := alltrim(STR(nIMC))
        oResult1:Refresh()

        cResult2 := "Magreza – Obesidade (Grau): 0"
        oResult2:Refresh()

    elseif nImc>= 18.5 .and. nImc <= 24.9     
        cResult1 := alltrim(STR(nIMC))
        oResult1:Refresh()

        cResult2 := "Normal – Obesidade (Grau): 0"
        oResult2:Refresh()

    elseif nImc>= 25 .and. nImc <= 29.9     
        cResult1 := alltrim(STR(nIMC))
        oResult1:Refresh()

        cResult2 := "Sobrepeso – Obes. (Grau): I"
        oResult2:Refresh()

    elseif nImc>= 30 .and. nImc <= 39.9     
        cResult1 := alltrim(STR(nIMC))
        oResult1:Refresh()

        cResult2 := "Obesidade – Obes. (Grau): II"
        oResult2:Refresh()

    elseif nImc>= 40      
        cResult1 := alltrim(STR(nIMC))
        oResult1:Refresh()

        cResult2 := "Obes. Grave - Obes. (Grau): III"
        oResult2:Refresh()

    ENDIF    
    
RETURN 
       

    