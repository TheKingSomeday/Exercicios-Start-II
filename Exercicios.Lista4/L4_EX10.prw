#INCLUDE "TOTVS.CH"


User Function l4_EX10()

    Local nOpcao := 0
    Local nHora := Space(10), nQtdHoras := Space(3)
    Local oDlg := NIL

    FWAlertinfo("Folha de Pagamento","Rickzzard")

    DEFINE MSDIALOG oDlg TITLE "Folha de Pagamento" FROM 000,000 TO 200, 450 PIXEL
    @ 014, 010 SAY    'Informe o valor da hora: '           SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  nHora                                 SIZE 55, 11 OF oDlg  PIXEL

    @ 034, 010 SAY    'Informe a quantidade de horas: '     SIZE 120, 12 OF oDlg PIXEL
    @ 030, 090 MSGET  nQtdHoras                             SIZE 55, 11 OF oDlg  PIXEL

    @ 010, 160 BUTTON 'Calcular'                            SIZE 55, 11 OF oDlg  PIXEL ACTION FolhaPagamento(nHora, nQtdHoras)
    @ 075, 160 BUTTON 'Cancelar'                            SIZE 55, 11 OF oDlg  PIXEL ACTION (nOpcao := 2, oDlg:End())

    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function FolhaPagamento(nHora, nQtdHoras) 
    
    Local nSalarioBruto     := 0
    Local nIR               := 0
    Local nINSS             := 0
    Local nFGTS             := 0
    Local nTotalDescontos   := 0
    Local nSalarioLiquido   := 0
    Local cIR               := ''

    nHora := VAL(nHora); nQtdHoras := VAL(nQtdHoras)

    // Cálculo do salário bruto
    nSalarioBruto := nHora*nQtdHoras 

    if nSalarioBruto > 1200 .and. nSalarioBruto <= 1800   
        nIR := 0.05 * nSalarioBruto 
        cIR := '5%'
    elseif nSalarioBruto > 1800 .and. nSalarioBruto <= 2500 
        nIR := 0.10 * nSalarioBruto 
        cIR := '10%'
    elseif nSalarioBruto > 2500 
        nIR := 0.20 * nSalarioBruto 
        cIR := '20%'
    else
        FwAlertInfo('O valor informado não tem desconto IR!')
        nIR := 1 * nSalarioBruto
    endif

    // Calculo do nInss
    nINSS := 0.10 * nSalarioBruto     

    // Calculo do nFGTS         
    nFGTS := 0.11 * nSalarioBruto     

    nTotalDescontos := nIR + nINSS // Cálculo do desconto total 

    nSalarioLiquido := nSalarioBruto-nTotalDescontos //  Cálculo do salário líquido

    FwAlertInfo('Salário bruto (' + ALLTRIM(STR(nHora)) + '*' + ALLTRIM(STR(nQtdHoras)) + '): R$ ' + ALLTRIM(StrZero(nSalarioBruto,7,2))+CRLF+CRLF+;
                'DESCONTOS!'+CRLF+;
                ' IR ('+ALLTRIM(cIR)+'): R$ '+ALLTRIM(StrZero(nIR,5,2))+CRLF+;
                ' INSS (10%): R$ '+ALLTRIM(StrZero(nINSS,6,2))+CRLF+;
                ' FGTS (11%): R$ '+ALLTRIM(StrZero(nFGTS,6,2))+CRLF+;
                ' Total de descontos: R$ '+ALLTRIM(StrZero(nTotalDescontos,6,2))+CRLF+CRLF+;
                'Salário Líquido: R$ '+ALLTRIM(StrZero(nSalarioLiquido,7,2)))
Return
