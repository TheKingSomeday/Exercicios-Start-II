#INCLUDE "TOTVS.CH"


User Function l4_EX9()

    local nNum1      := space(6)
    local nNum2      := space(6)
    local nNum3      := space(6)
    local cSexo      := space(1)

    Private cResult1 :=""
    Private oResult1
    Private oCalc 

    FWAlertinfo("Calculo da Taxa Metabólica Basal.","Rick's Health")

    DEFINE MSDIALOG oCalc TITLE "Informações" FROM 000, 000 to 300, 400 PIXEL 
    @ 020, 010 SAY "Digite a sua altura(Cm): "      SIZE 70, 14 OF oCalc Pixel
    @ 017, 067 MSGET nNum1                          SIZE 17, 11 OF oCalc PIXEL 

    @ 020, 110 SAY "Digite o seu peso(KG): "        SIZE 70, 14 OF oCalc Pixel
    @ 017, 167 MSGET nNum2                          SIZE 17, 11 OF oCalc PIXEL 

    @ 042, 010 SAY "Digite sua idade: "             SIZE 70, 14 OF oCalc Pixel
    @ 042, 067 MSGET nNum3                          SIZE 17, 11 OF oCalc PIXEL 

    @ 042, 110 SAY "Digite o seu sexo(M/F): "       SIZE 70, 14 OF oCalc Pixel
    @ 040, 167 MSGET cSexo                          SIZE 25, 11 OF oCalc PIXEL

    @ 070, 045 BUTTON "Calcule a sua TMB!"          SIZE 120, 11 OF oCalc Pixel;
    ACTION (TMB(nNum1, nNum2, nNum3, cSexo))

    @ 090, 085 SAY "A sua TMB é: "                  SIZE 80, 11 OF oCalc Pixel
    @ 100, 045 MSGET oResult1 VAR cResult1          SIZE 120, 11 OF oCalc PIXEL
    oResult1:lActive := .F.

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function TMB(nAltura,nPeso,nIdade,cSexo)

    local nTMB  := 0

    cSexo := Upper(cSexo)

    if cSexo == "M"

        nTMB = 66.5 + (13.75 * Val(nPeso)) + (5.003 * Val(nAltura)) - (6.75 * Val(nIdade))
        cResult1 := alltrim(STR(nTMB))
        oResult1:Refresh()

    elseif cSexo == "F"   

        nTMB = 655.1 + (9.563 * Val(nPeso)) + (1.850 * Val(nAltura)) - (4.676 * Val(nIdade))
        cResult1 := alltrim(STR(nTMB))
        oResult1:Refresh()

    else

        FWAlertError("Sexo inválido.")    

    ENDIF    
    
RETURN 
