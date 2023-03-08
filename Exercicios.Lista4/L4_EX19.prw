#INCLUDE 'TOTVS.CH'


User Function l4_EX19()

    Local cAlias := 'ZZ1', cTitulo := 'Cadastros de Cursos', lFunExc := 'U_BloqueiaExcluir()'

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, lFunExc, NIL)

Return

User Function BloqueiaExcluir()
    
    Local lRet := .F.

    FwAlertError('Não é possível excluir cursos cadastrados!')
    lRet := .F.

Return lRet

