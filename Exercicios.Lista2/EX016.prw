#INCLUDE 'TOTVS.CH'

User Function Ex016()

    Local cUsername      := ""
    local cArmazena      := ""
    local cPassword      := ""
    local cConfirmacao   := ""
    local lValido        := .F.
    local lSenhaInvalida := .F.
    local nCont          := 0
    local nSoma          := 0


    cUsername := FwInputBox("Crie um username com mais de 5 caracteres: ")

    while LEN(cUsername) < 5  //* Solicita o username tá OK
        FwAlertInfo("Username deve ter mais de 5 caracteres.")
        cUsername := FwInputBox("Digite um username com mais de 5 caracteres: ")
    end
    FwAlertInfo("O Username escolhido ficou perfeito")


    while lSenhaInvalida == .F.
        nSoma:=0; cArmazena :='' ; lValido := .F. //*RESTAURANDO OS PARÂMETROS

        cPassword := FwInputBox('Digite uma senha com pelo menos 6 caracteres: ') //* SE A SENHA tá OK

        while len(cPassword) < 6 
            FwAlertInfo('Senha inválida. A senha deve ter pelo menos 6 caracteres.')
            cPassword := FwInputBox('Digite uma senha com pelo menos 6 caracteres: ')
        end

        for nCont:= 1 to len(cPassword)
            if (asc(SubStr(cPassword, nCont)) >= 65 .and. asc(SubStr(cPassword, nCont)) <= 90) .and. lValido == .F.
                cArmazena += 'Contém letra maiúscula! ' + CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        lValido := .F.
        for nCont:= 1 to len(cPassword)
            if lValido  == .F. .and. (asc(SubStr(cPassword, nCont)) >= 33 .and. asc(SubStr(cPassword, nCont)) <= 47) .or.(asc(SubStr(cPassword, nCont)) >=58 .and. asc(SubStr(cPassword, nCont)) <=64) .or. (asc(SubStr(cPassword, nCont)) >= 91 .and. asc(SubStr(cPassword, nCont)) <= 96) .or. (asc(SubStr(cPassword, nCont)) >= 123 .and. asc(SubStr(cPassword, nCont)) <= 126)
                cArmazena += 'Contém símbolo!'+ CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        lValido := .F.
        for nCont:= 1 to len(cPassword)
            if lValido == .F. .and. (asc(SubStr(cPassword, nCont)) >= 48 .and. asc(SubStr(cPassword, nCont)) <= 57)
                cArmazena += 'Contém valor numérico!'+ CRLF
                nSoma++
                lValido := .T.
            end if
        NEXT

        if nSoma == 3
            FwAlertInfo(cArmazena+ CRLF+ CRLF+ 'A SENHA É VÁLIDA!')
        else
            FwAlertInfo('Senha inválida!' +CRLF+CRLF+ 'A senha deve conter ao menos uma letra maiúscula, um dígito numérico e um símbolo.' )
        endif


        cConfirmacao := FwInputBox('Digite a senha novamente para confirmação: ') //* SE A SENHA tá OK

        if cConfirmacao == cPassword
            lSenhaInvalida := .T.
            FwAlertInfo("USUÁRIO CADASTRADO COM SUCESSO! ")
        else
            while cConfirmacao <> cPassword
                cConfirmacao := FwInputBox("Digite a senha novamente para confirmação")
                if cConfirmacao == 'R'
                    lSenhaInvalida := .F.
                    exit
                endif
            end
        endif
    end


Return

