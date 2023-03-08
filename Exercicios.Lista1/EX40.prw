#INCLUDE 'TOTVS.CH'

User Function EX40() 
    
    Local nSalarioBruto:= 0, nIR:= 0, nINSS:= 0, nFGTS:= 0, nTotalDescontos:= 0, nSalarioLiquido:= 0, nHora := 0, nQtdHoras := 0
    Local cIR := ''

    nHora      := VAL(FWInputBox('Informe o valor da hora: '))
    nQtdHoras  := VAL(FWInputBox('Informe a quantidade de horas: '))

    nSalarioBruto := nHora*nQtdHoras //*                      Cálculo do salário bruto

    if nSalarioBruto > 1200 .and. nSalarioBruto <= 1800   //* Definição dos valores do IR
        nIR := 0.05 * nSalarioBruto //*         5%
        cIR := '5%'
    elseif nSalarioBruto > 1800 .and. nSalarioBruto <= 2500 
        nIR := 0.10 * nSalarioBruto //*         10%
        cIR := '10%'
    elseif nSalarioBruto > 2500 
        nIR := 0.20 * nSalarioBruto //*         20%
        cIR := '20%'
    else
        FwAlertInfo('O valor informado não tem desconto IR!')
        nIR := 1 * nSalarioBruto
    endif

    nINSS := 0.10 * nSalarioBruto //*         10%                Definição do valor do INSS      
             
    nFGTS := 0.11 * nSalarioBruto //*         11%                Definição do valor do INSS    

    nTotalDescontos := nIR + nINSS //*                           Cálculo do desconto total 

    nSalarioLiquido := nSalarioBruto-nTotalDescontos //*         Cálculo do salário líquido

    FwAlertInfo('Salário bruto (' + ALLTRIM(STR(nHora)) + '*' + ALLTRIM(STR(nQtdHoras)) + ')_______: R$ ' + ALLTRIM(StrZero(nSalarioBruto,7,2))+CRLF+;
                '( – ) IR ('+ALLTRIM(cIR)+')_______________: R$ '+ALLTRIM(StrZero(nIR,5,2))+CRLF+;
                '( – ) INSS (10%)____________: R$ '+ALLTRIM(StrZero(nINSS,6,2))+CRLF+;
                'FGTS (11%)_______________: R$ '+ALLTRIM(StrZero(nFGTS,6,2))+CRLF+;
                'Total de descontos__________: R$ '+ALLTRIM(StrZero(nTotalDescontos,6,2))+CRLF+;
                'Salário Líquido_____________: R$ '+ALLTRIM(StrZero(nSalarioLiquido,7,2)))


Return
