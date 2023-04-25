#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function Escreve
  Função para exemplificar como criar/escrever arquivos de texto
  @type  Function
  @author Henrique O
  @since 24/04/2023
  /*/
User Function L13_EX3()
  
  Local cPasta    := 'C:\Windows\Temp\lista 13 - ex1\'
  Local cArquivo  := 'Arq_EX2.txt'
  Local oArq      := FWFileReader():New(cPasta + cArquivo)
  Local cTxtLinha := ''
 
  //? Verificando de se o arquivo pode ser aberto
  if oArq:Open()
    //? Verificando se é o fim do arquivo. Se não for, entra no if
    if !oArq:EoF()
      //? Fazendo a leitura enquanto houverem linhas a serem lidas
      while (oArq:HasLine())
          //? Capturando o texto da linha atual
          cTxtLinha += oArq:GetLine(.T.)
      enddo
    endif
     
    //? Fechando o arquivo (Isso indica o fim do processamento)
    oArq:Close()
  endif
  //? Apresentando texto do arquivo em uma mensagem
  FwALertInfo(cTxtLinha, 'Conteúdo do arquivo:')
Return
