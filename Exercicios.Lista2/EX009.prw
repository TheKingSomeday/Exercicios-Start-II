#INCLUDE 'TOTVS.CH'

User Function Ex009()
    local aMes      := {"Janeiro", "Fevereiro", "Mar�o", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
    Local aDias     := {'31','28','31','30','31','30','31','31','30','31','30','31'}
    Local nDia      := 0
    Local cRespDia  := ''
    Local cRespMes  := ''

    While nDia <= 0 .or. nDia > 12
        nDia := Val(FwInputBox("Digite valores de 1 a 12, para ver quantos dias tem o mes correspondente: ", ""))
    Enddo

    cRespDia := aDias[nDia]
    cRespMes := aMes[nDia]

    FwAlertSuccess('O m�s de ' + cRespMes + ' tem ' + cRespDia + ' dias.')

Return
