#INCLUDE 'TOTVS.CH'


User Function L4_EX20()

    Local cAlias := 'ZZ2',  cFiltro   := ''

    Local aCores := { { 'ZZ2->ZZ2_DATNAS < Date()-6570' , 'ENABLE' },; // 6570 dias = 8 anos
                      { 'ZZ2->ZZ2_DATNAS > Date()-6570' , 'DISABLE' } }

    Private cCadastro := 'Cadastro de alunos '
    Private aRotina := {{ 'Pesquisar' ,    'AxPesqui' ,     0, 1 },;
                        { 'Visualizar' ,   'AxVisual' ,     0, 2 },;
                        { 'Incluir' ,      'AxInclui' ,     0, 3 },;
                        { 'Alterar' ,      'AxAltera' ,     0, 4 },;
                        { 'Excluir' ,      'AxDeleta' ,     0, 5 },;
                        { 'Alunos' ,       'U_CadZZ2' ,     0, 6 }}

    DbSelectArea('ZZ2')
    DbSetOrder(1)

    MBrowse(,,,,cAlias,,,,,,aCores,,,,,,,,cFiltro)     

    DbCloseArea()

Return
