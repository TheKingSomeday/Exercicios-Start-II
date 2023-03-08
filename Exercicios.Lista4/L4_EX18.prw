#INCLUDE 'TOTVS.CH'


User Function l4_EX18()

    Local cAlias := 'ZZ1', cTitulo := 'Cadastros de Cursos'

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return

