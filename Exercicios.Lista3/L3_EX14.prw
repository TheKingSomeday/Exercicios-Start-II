#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX14()

    local aNumeros := {}
    local nUser    := 0
    local nCount   := 0
    
    For nCount := 1 to 5
        nUser := int(val(FwInputBox("Digite um n�mero: " + cvaltochar(nCount) + "/5")))

        aAdd(aNumeros, nUser)
    Next

    MostraArray(aNumeros)

Return 

Static Function MostraArray(aArray)
    local nCount := 0
    local cExibe := ""

    For nCount := 1 to 5
        if nCount < 5
            cExibe += cvaltochar(aArray[nCount]) + ", "
        else
            cExibe += cvaltochar(aArray[nCount]) + "."
        endif
    Next

    MsgInfo(cExibe, "Array")
Return


