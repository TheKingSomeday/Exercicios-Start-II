#Include 'PROTHEUS.CH'

User Function Item()
    local aParam   := PARAMIXB
    local lRet     := .T.
    local oObj     := NIL
    local cIdPonto := ""
    local cIdModel := ""

    if aParam != NIL
        oObj     := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]

        if cIdPonto == "MODELCOMMITTTS"
            if ExistBlock('AddCad')
                lRet := ExecBlock('AddCad', .F., .F.)
            endif
        endif
    endif

Return lRet
