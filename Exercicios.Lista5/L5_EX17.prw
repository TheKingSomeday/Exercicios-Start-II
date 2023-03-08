#INCLUDE 'TOTVS.CH'

User Function L5_EX17()

    Private aA         := {} 
    private cGetResult := ''
    private cGetArray  := ''
    Private nJanAltu   := 380
    private nJanLarg   := 300 

DEFINE MSDIALOG oDLG TITLE "Login" FROM 000, 000  TO nJanAltu, nJanLarg COLORS 0, 16777215 PIXEL
        //Grupo de Login
        @ 003, 001     GROUP oGrpTela TO (nJanAltu/15)-1, (nJanLarg/2)-3         PROMPT "Resultados: "     OF oDLG COLOR 0, 16777215 PIXEL
            @ 0010, 006   MSGET oGetResult VAR    cGetResult            SIZE (nJanLarg/2)-12, 010 OF oGrpTela COLORS 0, 16777215 NO BORDER PIXEL 
            oGetResult:lActive := .F.
   
        @ 023, 001     GROUP oGrpArray TO (nJanAltu/15)-1, (nJanLarg/2)-3         PROMPT "Array: "     OF oDLG COLOR 0, 16777215 PIXEL
            @ 025, 006   MSGET oGetArray VAR    cGetArray               SIZE (nJanLarg/2)-12, 012 OF oGrpArray COLORS 0, 16777215 NO BORDER PIXEL 
            oGetArray:lActive := .F.

        @ 040, 001 GROUP oGrpBotoes TO (nJanAltu/2.3)-1, (nJanLarg/2)-3         PROMPT "Ações: "     OF oDLG COLOR 0, 16777215 PIXEL
            @ 060, 006   BUTTON oBtnConf PROMPT "Carregar"      SIZE 055, 015 OF oDLG ACTION (ADDARRAY()) PIXEL
            @ 060, 088   BUTTON oBtnConf PROMPT "Exibir"        SIZE 055, 015 OF oDLG ACTION (MostraArray()) PIXEL
            @ 075, 006   BUTTON oBtnConf PROMPT "Crescente"     SIZE 055, 015 OF oDLG ACTION (CresArray()) PIXEL
            @ 075, 088   BUTTON oBtnConf PROMPT "Decrescente"   SIZE 055, 015 OF oDLG ACTION (DescArray()) PIXEL
            @ 090, 006   BUTTON oBtnConf PROMPT "Pesquisar"     SIZE 055, 015 OF oDLG ACTION (SearchVal()) PIXEL
            @ 090, 088   BUTTON oBtnConf PROMPT "Somatoria"     SIZE 055, 015 OF oDLG ACTION (SomaArray()) PIXEL
            @ 105, 006   BUTTON oBtnConf PROMPT "Média"         SIZE 055, 015 OF oDLG ACTION (MedArray()) PIXEL
            @ 105, 088   BUTTON oBtnConf PROMPT "Maior/Menor"   SIZE 055, 015 OF oDLG ACTION (Mn_Array()) PIXEL
            @ 120, 006   BUTTON oBtnConf PROMPT "Embaralha"     SIZE 055, 015 OF oDLG ACTION (Shuff()) PIXEL
            @ 120, 088   BUTTON oBtnConf PROMPT "Repete"        SIZE 055, 015 OF oDLG ACTION (Repeat()) PIXEL

        @ (nJanAltu/2)-18, 006 BUTTON oBtnConf PROMPT "Limpar" SIZE (nJanLarg/2)-12, 015 OF oDLG ACTION (Clear()) PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function ADDARRAY()

    aA := {}
    
    cGetResult := aA
    oGetResult:Refresh()

    local nI := 0

    FOR nI := 1 to 8

        aAdd(aA,RANDOMIZE( 0, 100 ))

    NEXT

    cGetArray := ArrTokStr(aA, ", ")
    oGetArray:Refresh()
Return 

Static Function MostraArray()

    Local cMostra := ''
    Local nCont   := 0

    For nCont := 1 to Len(aA)
        If nCont < 8
            cMostra += cValToChar(aA[nCont]) + ', '
        Else 
            cMostra += cValToChar(aA[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Conteúdo do Array')

    cGetResult := cMostra
    oGetResult:Refresh()
Return

Static Function CresArray()
    
    if Len(Aa) == 0
        FwAlertInfo("O Array está vazio, fazor gerar um.","Vazio")
    else
        asort(aA)   
    ENDIF

    cGetResult := ArrTokStr(aA, ", ") + "."
    oGetResult:Refresh()
    
Return

Static Function DescArray()

    if Len(Aa) == 0
        FwAlertInfo("O Array está vazio, fazor gerar um.","Vazio")
    else
        cGetResult := ASORT(aA,,, { |x, y| x > y } )   
    ENDIF

    cGetResult := ArrTokStr(aA, ", ") + "."
    oGetResult:Refresh()

    
Return

Static Function SearchVal()
    local nNum  := 0
    local nCont := 0
    local cMsg  := ""

    nNum := Val(FwInputBox("Coloque aqui um numero para encontrar a posição",""))

    for nCont := 1 to len(aA)
        
        if nNum == aA[nCont] 
            cMsg := "O numero " + Alltrim(str(nNum)) + " foi encontrado na posição: " + Alltrim(str(nCont)) + CRLF
        ENDIF



    Next

    if cMsg == " "
        FwAlertInfo("Não foi encontrado o numero dentro do array!")    
    else
        FwAlertSuccess(cMsg, "O valor foi encontrado")    
    ENDIF

    cGetResult := cMsg
    oGetResult:Refresh()
 
Return 

Static Function SomaArray()
    local nCont := 0
    local nSoma := 0

    for nCont := 1 to len(aA)
        nSoma := nSoma + aA[nCont] 
    
    Next

    cGetResult := nSoma
    oGetResult:Refresh()

Return nSoma

Static Function MedArray()

    local nMedia := 0
    local nCont  := 0
    local nSoma  := 0

    for nCont := 1 to len(aA)
        nSoma := nSoma + aA[nCont] 
    
    Next

    cGetResult := nSoma

    nMedia:= nSoma / 8
    
    cGetResult := nMedia
    oGetResult:Refresh()
Return 

Static Function Mn_Array()
    local nMaior := 0
    local nMenor := 0
    local cMsg   := ""

    ASORT(aA)

    nMaior := ATAIL( aA )
    nMenor := aA[1]
    cMsg := "O maior numero é: " + Alltrim(Str(nMaior)) + ". O menor numero é: " + alltrim(Str(nMenor))

    cGetResult := cMsg
    oGetResult:Refresh()
Return 

Static Function Shuff()
    Local nCount   := 0
    Local nPosRan  := 0 // Posição aleatória
    Local nPosicao := 0 // Pesquisa de posição
    Local aPosicao := {} 
    Local aAux     := {}


    For nCount := 1 to 8
        nPosRan := RANDOMIZE(1, 9)
        nPosicao := aScan(aPosicao, nPosRan)
        if nPosicao == 0
            aadd(aPosicao, nPosRan)
            aadd(aAux, aA[nPosRan])
        else
            nCount--
        endif
    Next

    cGetResult := "Array Embaralhado: " + ArrTokStr(aAux, ", ")
    oGetResult:Refresh()

Return 

Static Function Repeat()
    local nCount   := 0
    local nCount2  := 0
    local cRepete  := ""

    for nCount := 1 to len(aA)
        for nCount2 := (nCount + 1) to len(aA)
            if aA[nCount] == aA[nCount2]
                cRepete += CRLF + 'O número ' + cvaltochar(aA[nCount]) + ' se encontra nas posições ' + ALLTRIM(STR(nCount)) + ' e '+ ALLTRIM(STR(nCount2))
            endif
        next
    next

    MsgInfo(cRepete)

    cGetResult := cRepete
    oGetResult:Refresh()
    
Return 

Static Function Clear()
    aA := {}

    cGetArray  := ""
    cGetResult := ""

    oGetArray:Refresh()
    oGetResult:Refresh()
    
Return 
