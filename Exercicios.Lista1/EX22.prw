#INCLUDE "TOTVS.CH"

User Function EX22()

    local lLoop         :=.F.
    local nCont         := 0
    local nNum          := 0

   
    while lLoop == .F.

        if nNum < 1 .or. nNum > 10

            nNum := Val(FwInputBox("Digite um numero entre 1 e 10: ",""))

        else
            lLoop := .T.    
        
        endif    

    end
   
    MSGINFO("Agora veja a tabuada do numero escolhido.")

    for nCont = 1 to 10
        MSGINFO( alltrim(Str(nNum * nCont)))

    NEXT

Return 

