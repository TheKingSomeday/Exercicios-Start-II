#INCLUDE 'TOTVS.CH'

User function Ex36()
    Local nNum    := 0
    Local nI      := 0
    Local nResult := 0

    nNum := Val(FwInputBox('Digite aqui um n�mero para saber seu fatorial.')) 

    nResult := nNum

    For nI := nNUm to 2 step -1

            nResult := nResult * (nI-1)
    NEXT

   
   if nNum == 0
     FwAlertSuccess('O resultado de ' + cValToChar(nNum) + '! �: 1')
   else 
     FwAlertSuccess('O resultado de ' + cValToChar(nNum) + '! �: ' + cValToChar(nResult))
    ENDIF
    
RETURN
