#INCLUDE "TOTVS.CH"
#DEFINE cUser "Rickzinho"
#DEFINE cPass "TheK1ng!"

User Function l4_EX6()

    local cUser2    := space(30)
    local nPass2    := space(30)

    Private cResult1  :=""
    Private oResult1 
    Private oCalc 


    FWAlertinfo("Tela de Login.","Rickzzard")

    DEFINE MSDIALOG oCalc TITLE "Login" FROM 000, 000 to 300, 330 PIXEL 
    @ 020, 010 SAY "Digite o seu usarname: " SIZE 80, 14 OF oCalc Pixel
    @ 017, 090 MSGET cUser2                  SIZE 60, 11 OF oCalc PIXEL 

    @ 040, 010 SAY "Digite a sua senha: " SIZE 80, 14 OF oCalc Pixel
    @ 037, 090 MSGET nPass2               SIZE 60, 11 OF oCalc PIXEL Password

    @ 060, 025 BUTTON "Pressione para acessar!"  SIZE 120, 11 OF oCalc Pixel;
    ACTION (Confirm(Alltrim(cUser2), Alltrim(nPass2)))

    ACTIVATE MSDIALOG oCalc CENTERED

Return 

Static Function Confirm(cUserTeste, cPassTeste)

    If cUserTeste == cUser .and. cPassTeste == cPass

        FwAlertSuccess("Acesso permitido!")
        oCalc:END()
    else

        FWAlertError("Usuário ou senha inválido.")
    ENDIF        
    
Return 
