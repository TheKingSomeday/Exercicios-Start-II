#INCLUDE "TOTVS.CH"

User Function EX04()

    local nSalario := 0
    local nAumento := 0
    local nPercent := 0
    

    nSalario := Val(FwInputBox("Digite o seu salário: ", ""))
    nPercent := Val(FwInputBox("Digite o percentual de reajuste: ", ""))
    
    nPercent := nPercent / 100

    nAumento := nSalario*nPercent 

    nSalario := nSalario + nAumento


    MSGALERT( "O Reajuste do seu salário é: " + Alltrim(Str(nSalario)) + "." )
    
    
Return 



