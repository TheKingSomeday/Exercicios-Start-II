#INCLUDE "TOTVS.CH"

#DEFINE cUser "Rickzinho-C137"
#DEFINE cPass "Dimensional"

User Function Ex008()

    local cUserLog := ""
    local cPassLog := ""
    local lLoop    := .F.


    cUserLog := FwInputBox("Digite o login: ", cUserLog)
    cPassLog := FwInputBox("Digite a senha: ", cPassLog)

   
    while lLoop == .F.

        if cUserLog == cUser .and. cPassLog == cPass

            FwAlertSuccess("Acesso Permitido.")
            MSGINFO( "Bem Vindo Criador." )

            lLoop := .T.
        else
            
            FwAlertError("Usuário ou senha inválido.")
            
            cUserLog := FwInputBox("Digite o login: ", cUserLog)
            cPassLog := FwInputBox("Digite a senha: ", cPassLog)

        ENDIF    

    end

Return
