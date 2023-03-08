#INCLUDE 'TOTVS.CH'

User Function L5_EX1()

    Local aDias     := {'Domingo','Segunda-Feira','Terca-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sabado'}
    Local nDia      := 0
    Local cRespDia  := ''

    While nDia <= 0 .or. nDia > 7
        nDia := Val(FwInputBox("Digite valores de 1 a 7, para ver o dia da semana correspondente: ", ""))

    Enddo

    cRespDia := aDias[nDia]

    FwAlertSuccess('Você escolheu o numero ' + Alltrim(Str(nDia)) + ', corresponde a ' + Alltrim(Str(cRespDia)) + '.')

Return
