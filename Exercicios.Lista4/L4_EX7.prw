#INCLUDE "TOTVS.CH"


User Function l4_EX7()

    local cUser2     := space(30)
    local nPass2     := space(30)
    local nPass3     := space(30)

    Private oCalc 

    FWAlertinfo("Tela de Cadastro.","Rickzzard")

    DEFINE MSDIALOG oCalc TITLE "Login" FROM 000, 000 to 300, 330 PIXEL 
    @ 020, 010 SAY "Digite o seu usarname: " SIZE 80, 14 OF oCalc Pixel
    @ 017, 090 MSGET cUser2                  SIZE 60, 11 OF oCalc PIXEL 

    @ 040, 010 SAY "Digite a sua senha: "    SIZE 80, 14 OF oCalc Pixel
    @ 037, 090 MSGET nPass2                  SIZE 60, 11 OF oCalc PIXEL 

    @ 060, 010 SAY "Confirme a senha: "      SIZE 80, 14 OF oCalc Pixel
    @ 057, 090 MSGET nPass3                  SIZE 60, 11 OF oCalc PIXEL 

    @ 090, 025 BUTTON "Realizar Cadastro!"   SIZE 120, 11 OF oCalc Pixel;
    ACTION (Confirm(Alltrim(cUser2), Alltrim(nPass2), Alltrim(nPass3)))

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function Confirm(cUsername, cPassword, cPass3)

    local nI    := 0 
    local lDigt := .F.
    local lNum  := .F.
    local lUp   := .F.

    if  LEN(cUsername) < 5  //* Solicita o username tá OK
        FWAlertError("Username deve ter mais de 5 caracteres.")
    else
        FwAlertSuccess("O Username escolhido ficou perfeito")    
    endif

    if len(cPassword) < 6  
        FwAlertInfo("Senha inválida!" +CRLF+CRLF+ "A senha deve conter 6 caracteres.")
    ENDIF

    // Verifica Letra maiuscula
    FOR nI := 1 TO len(cPassword)
    IF isUpper(SubStr(cPassword, nI , 1))
        lUp := .T.
        EXIT
    ENDIF
    NEXT nI

    // Verifica numero
    for nI := 1 to len(cPassword)
    IF IsDigit(SubStr(cPassword, nI , 1))
        lNum := .T.
        EXIT 
    ENDIF
    NEXT nI

    // Verifica Simbolo
    for nI := 1 to len(cPassword)
    IF (asc(SubStr(cPassword, nI, 1)) >= 33 .and. asc(SubStr(cPassword, nI, 1)) <= 47) .or.(asc(SubStr(cPassword, nI, 1)) >=58 .and. asc(SubStr(cPassword, nI, 1)) <=64) .or. (asc(SubStr(cPassword, nI, 1)) >= 91 .and. asc(SubStr(cPassword, nI, 1)) <= 96) .or. (asc(SubStr(cPassword, nI, 1)) >= 123 .and. asc(SubStr(cPassword, nI, 1)) <= 126)
        lDigt := .T.
        EXIT  
    ENDIF
    NEXT nI

    // Valida a senha
    IF lUp .AND. lNum .AND. lDigt

        FwAlertSuccess("A senha escolhida está perfeita.")

        // Compara a senha
        if cPass3 == cPassword
            FwAlertSuccess("Acesso Permitido!")
            oCalc:END()
        else
            FWAlertError("As senhas não conhecidem.") 
        ENDIF

    else
        FWAlertError("A senha deve possuir uma letra maiuscula, um numero e um simbolo")      
    ENDIF

RETURN .F.
       

    