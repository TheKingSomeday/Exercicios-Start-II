#INCLUDE "TOTVS.CH"

User Function Exemplo02()

    cBase   := ""
    cAltura := ""
    nArea   := 0

    cBase   := FwInputBox("Digite a Base de um triangulo: ", cBase)
    cAltura := FwInputBox("Digite a Altura de um triangulo: ", cAltura)
    
    cBase   := Val(cBase) 
    cAltura := Val(cAltura) 

    nArea   := (cBase*cAltura)/2   

    FwAlertSuccess("A area do triangulo é : " + CvaltoChar(nArea), "Resultado")
    
    
Return 

