#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function l4_EX15()

    Local cTitle := 'BUSCA PRODUTO', cTexto := 'Insira o código do produto: ', cCod := Space(15)
    Local nOpcao := 0
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 100, 450 PIXEL
    
    @ 014, 010 SAY    cTexto     SIZE 120, 12 OF oDlg PIXEL
    @ 010, 090 MSGET  cCod       SIZE 55, 11 OF oDlg PIXEL
    @ 010, 160 BUTTON 'Buscar'   SIZE 55, 11 OF oDlg PIXEL ACTION BuscaProduto(cCod)
    @ 035, 160 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return


Static Function BuscaProduto(cCod)

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := '', cMsg := '', cResposta := ''
	Local nI := 0

    rpcsetenv('99', '01')

    cQuery := "SELECT "   + CRLF
    cQuery += "B1_COD "   + CRLF
    cQuery += ",B1_DESC " + CRLF
    cQuery += ",B1_PRV1 " + CRLF
    cQuery += "FROM "     + RetSqlName('SB1') + CRLF
    cQuery += " ORDER BY B1_DESC ASC "


    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cCod := ALLTRIM(cCod)

    While &(cAlias)->(!EOF())

      If cCod == ALLTRIM(&(cAlias)->(B1_COD))
        cMsg += 'Código: '    + &(cAlias)->(B1_COD) + CRLF +; 
                'Descrição: ' + &(cAlias)->(B1_DESC) + CRLF +;
                'Preço de venda: R$' + Alltrim(STR(&(cAlias)->(B1_PRV1))) + CRLF+;
                '_______________________' + CRLF + CRLF
        nI++
      Endif

      &(cAlias)->(DbSkip())
    Enddo

    If nI > 0
      FwAlertSuccess(cMsg, 'Dados do Produto')
    Else
		  FwAlertError('Código de produto inexistente no sistema')
      cResposta := UPPER(FwInputBox('Deseja inserir um novo produto no sistema? (S/N) '))
    
      if cResposta == 'N'
        FWAlertInfo('OKAY! Fim do programa', 'FIM DO PROGRAMA')
        BREAK
      elseif cResposta == 'S'
        InserirProduto()
      endif
    Endif

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return

Static Function InserirProduto()

    Local cTitle := 'Cadastro de produtos - INCLUIR', cCodigo := 'Código', cDescricao := 'Descrição', cTipo := 'Tipo', cUnidade := 'Unidade', cArmazPad := 'Armazem Pad.'
    Local cCod := Space(15), cDesc := Space(50), cTip := Space(10), cUni := Space(10), cArm := Space(10)
    Local nOpcao := 0
    Local oDlg := NIL

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 400, 1600 PIXEL
    
    @ 014, 010 SAY cCodigo SIZE 120, 12 OF oDlg PIXEL
    @ 014, 030 SAY "*" SIZE 32, 7 OF oDlg PIXEL FONT oDlg:oFont COLOR CLR_RED
    @ 024, 010 MSGET cCod SIZE 55, 11 OF oDlg PIXEL

    @ 014, 150 SAY cDescricao SIZE 120, 12 OF oDlg PIXEL
    @ 014, 180 SAY "*" SIZE 32, 7 OF oDlg PIXEL FONT oDlg:oFont COLOR CLR_RED
    @ 024, 150 MSGET cDesc SIZE 150, 11 OF oDlg PIXEL

    @ 014, 350 SAY cTipo SIZE 120, 12 OF oDlg PIXEL
    @ 014, 365 SAY "*" SIZE 32, 7 OF oDlg PIXEL FONT oDlg:oFont COLOR CLR_RED
    @ 024, 350 MSGET cTip SIZE 55, 11 OF oDlg PIXEL

    @ 014, 450 SAY cUnidade SIZE 120, 12 OF oDlg PIXEL
    @ 014, 475 SAY "*" SIZE 32, 7 OF oDlg PIXEL FONT oDlg:oFont COLOR CLR_RED
    @ 024, 450 MSGET cUni SIZE 55, 11 OF oDlg PIXEL

    @ 014, 550 SAY cArmazPad SIZE 120, 12 OF oDlg PIXEL
    @ 014, 585 SAY "*" SIZE 32, 7 OF oDlg PIXEL FONT oDlg:oFont COLOR CLR_RED
    @ 024, 550 MSGET cArm SIZE 55, 11 OF oDlg PIXEL


    @ 050, 010 SAY 'Grupo' SIZE 120, 12 OF oDlg PIXEL
    @ 060, 010 MSGET Space(5) SIZE 55, 11 OF oDlg PIXEL

    @ 050, 150 SAY 'TE Padrão' SIZE 120, 12 OF oDlg PIXEL
    @ 060, 150 MSGET Space(6) SIZE 150, 11 OF oDlg PIXEL

    @ 050, 350 SAY 'TS Padrão' SIZE 120, 12 OF oDlg PIXEL
    @ 060, 350 MSGET Space(7) SIZE 55, 11 OF oDlg PIXEL

    @ 050, 450 SAY 'Seg.Un.Medi.' SIZE 120, 12 OF oDlg PIXEL
    @ 060, 450 MSGET Space(8) SIZE 55, 11 OF oDlg PIXEL

    @ 050, 550 SAY 'Fator Conv.' SIZE 120, 12 OF oDlg PIXEL
    @ 060, 550 MSGET Space(9) SIZE 55, 11 OF oDlg PIXEL


    @ 086, 010 SAY 'Tipo de Conv' SIZE 120, 12 OF oDlg PIXEL
    @ 096, 010 MSGET Space(10) SIZE 55, 11 OF oDlg PIXEL

    @ 086, 150 SAY 'Alternativo' SIZE 120, 12 OF oDlg PIXEL
    @ 096, 150 MSGET Space(11) SIZE 150, 11 OF oDlg PIXEL

    @ 086, 350 SAY 'Preço Venda' SIZE 120, 12 OF oDlg PIXEL
    @ 096, 350 MSGET Space(12) SIZE 55, 11 OF oDlg PIXEL

    @ 086, 450 SAY 'Custo Stand.' SIZE 120, 12 OF oDlg PIXEL
    @ 096, 450 MSGET Space(13) SIZE 55, 11 OF oDlg PIXEL

    @ 086, 550 SAY 'Ult. Calculo' SIZE 120, 12 OF oDlg PIXEL
    @ 096, 550 MSGET Space(14) SIZE 55, 11 OF oDlg PIXEL

    

    @ 122, 010 SAY 'Ult. Preço' SIZE 120, 12 OF oDlg PIXEL
    @ 132, 010 MSGET Space(15) SIZE 55, 11 OF oDlg PIXEL

    @ 122, 150 SAY 'Moeda C. Std' SIZE 120, 12 OF oDlg PIXEL
    @ 132, 150 MSGET Space(16) SIZE 150, 11 OF oDlg PIXEL

    @ 122, 350 SAY 'Ult. Compra' SIZE 120, 12 OF oDlg PIXEL
    @ 132, 350 MSGET Space(17) SIZE 55, 11 OF oDlg PIXEL

    @ 122, 450 SAY 'Peso Liquido' SIZE 120, 12 OF oDlg PIXEL
    @ 132, 450 MSGET Space(18) SIZE 55, 11 OF oDlg PIXEL

    @ 122, 550 SAY 'Cta. Contabil' SIZE 120, 12 OF oDlg PIXEL
    @ 132, 550 MSGET Space(19) SIZE 55, 11 OF oDlg PIXEL


    @ 158, 010 SAY 'Centro Custo' SIZE 120, 12 OF oDlg PIXEL
    @ 168, 010 MSGET Space(20) SIZE 55, 11 OF oDlg PIXEL

    @ 158, 150 SAY 'Item Conta' SIZE 120, 12 OF oDlg PIXEL
    @ 168, 150 MSGET Space(21) SIZE 150, 11 OF oDlg PIXEL

    @ 158, 350 SAY 'Familia' SIZE 120, 12 OF oDlg PIXEL
    @ 168, 350 MSGET Space(22) SIZE 55, 11 OF oDlg PIXEL

    @ 158, 450 SAY 'Base Estrut.' SIZE 120, 12 OF oDlg PIXEL
    @ 168, 450 MSGET Space(23) SIZE 55, 11 OF oDlg PIXEL

    @ 158, 550 SAY 'Forn. Padrão' SIZE 120, 12 OF oDlg PIXEL
    @ 168, 550 MSGET Space(24) SIZE 55, 11 OF oDlg PIXEL

    @ 010, 700 BUTTON 'Salvar'   SIZE 45, 11 OF oDlg PIXEL ACTION ValidaProd(cCod, cDesc, cTip, cUni, cArm)
    @ 010, 650 BUTTON 'Cancelar' SIZE 45, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())
    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function ValidaProd(cCod, cDesc, cTip, cUni, cArm)

    if ALLTRIM(cCod) != ''.AND. ALLTRIM(cDesc) != '' .AND. ALLTRIM(cTip) != ''.AND. ALLTRIM(cUni) != '' .AND. ALLTRIM(cArm) != ''
        FWAlertSuccess('Produto cadastrado com sucesso!')
    else 
        FWAlertError('ERRO! Preencha todos os campos obrigatórios.')
    endif


Return
