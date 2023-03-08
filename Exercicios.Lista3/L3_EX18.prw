#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX18()

    local cNome         := ""
    local cConcatena    := ""
    local nCount        := 0

    cNome := Upper(FwInputBox("Digite seu nome:", cNome))

    For nCount := 1 to len(cNome)
        cConcatena += substr(cNome, 1, nCount) + CRLF
    Next

    FwAlertInfo(cConcatena, "Escadinha!")

    
Return


