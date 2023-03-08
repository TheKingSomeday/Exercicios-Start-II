#INCLUDE "TOTVS.CH"

User Function EX21()

    Local nI     := 1
    local aDesc  := {}
    local nCont  := 0
    local cExibe := ""
    local nNum   := ""

    nNum := Val(FwInputBox("Digite um numero: ",""))

    MSGINFO("Agora veja a sequencia do 1 até o seu numero")

    WHILE nI <= nNum

        AADD( aDesc, nI )
        
        nI++

    ENDDO

    for nCont := 1 to LEN(aDesc)

        if nCont <= len(aDesc)
            cExibe += alltrim(Str(aDesc[nCont])) + ". "
            
        endif


    NEXT nCont

     MSGALERT( cExibe, "Resultado" )    

Return 

