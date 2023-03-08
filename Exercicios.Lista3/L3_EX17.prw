#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX17()

    local cNome     := ""
    local cConcat   := ""
    local nCount    := 0

    cNome := upper(FwInputBox("Digite um nome: ", cNome))

    For nCount := 1 to len(cNome)
        cConcat += substr(cNome, nCount, 1) + CRLF
    Next

    FwAlertInfo(cConcat, "Nome")

    
Return


