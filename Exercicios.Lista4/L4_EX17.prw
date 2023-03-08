#INCLUDE 'TOTVS.CH'


User Function l4_EX17()

    Local cAlias := 'ZZ2'
    local cTitulo := 'Cadastro de alunos '

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return

