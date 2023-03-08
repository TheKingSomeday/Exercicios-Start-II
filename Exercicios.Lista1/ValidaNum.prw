#INCLUDE "TOTVS.CH"

User Function ValidaNumero(nNumero)
    Local lTudoCerto := .F.

    if nNumero >= 1 .and. nNumero <= 9999
        lTudoCerto := .T.
    ENDIF    

Return lTudoCerto
