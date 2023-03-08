#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX15()

    local aMes   := {"Janeiro", "Fevereiro", "Mar�o", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
    local aTemp  := {}
    local cExibe := ""
    local nUser  := 0
    local nMedia := 0
    local nSoma  := 0
    local nCount := 0

    For nCount := 1 to 12
        nUser := Val(FwInputBox("Digite a temperatura m�dia do m�s de " + aMes[nCount]))
        aAdd(aTemp, nUser)

        nSoma += nUser
    Next

    nMedia := (nSoma / 12)

    For nCount := 1 to 12
        if aTemp[nCount] > nMedia
            cExibe += aMes[nCount] + ": " + cvaltochar(aTemp[nCount]) + "�C" + CRLF
        endif
    Next

    FwAlertInfo(cExibe,"M�dia Anual: " + cvaltochar(nMedia) + "�C")
    
Return


