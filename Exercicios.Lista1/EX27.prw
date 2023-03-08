#INCLUDE "TOTVS.CH"

User Function EX27()

    local nCont      := 1
    local nCont2     := 1
    local cResult    := ""
    local cLinha     := ""

    For nCont := 1 to 10
        cLinha := ""
        cLinha += alltrim(Str(nCont)) + " - "
        For nCont2 := 1 to 10
            if nCont2 < 10
                cLinha += alltrim(Str(nCont2)) + " "

            else
                cLinha += alltrim(Str(nCont2)) + ". "   

            endif    
        NEXT
        cResult += cLinha + CHAR(13)    
    NEXT        

    FwAlertInfo("Resultado do processamento" + CRLF + cResult)

Return 

