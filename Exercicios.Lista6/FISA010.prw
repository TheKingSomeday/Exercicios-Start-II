#INCLUDE "TOTVS.CH" 

User Function FISA010()
    local aParam   := PARAMIXB
    local lRet     := .T.
    local oObj     := NIL
    local cIdPonto := ""
    local cIdModel := ""

    if aParam <> NIL
          oObj := aParam[1]         // Objeto do formulário ou do modelo, conforme o caso.
          cIDPonto := aParam[2]     // ID do local de execução do ponto de entrada.
          cIDModel := aParam[3]     // ID do formulário.

        If (cIDPonto == "MODELPOS")       // Na validação total do modelo.
            if ExistBlock('CadMun')
                lRet := ExecBlock('CadMun', .F.)
            endif
        endif
     EndIf

Return lRet
