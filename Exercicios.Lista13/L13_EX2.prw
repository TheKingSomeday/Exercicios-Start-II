#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function Escreve
  Função para exemplificar como criar/escrever arquivos de texto
  @type  Function
  @author Henrique O
  @since 24/04/2023
  /*/
User Function L13_EX2()
  Local cPasta   := "C:\Windows\Temp\lista 13 - ex1\"
  Local cArquivo := "Arq_EX2.txt"
  Local oWriter := FWFileWriter():New(cPasta + cArquivo, .T.)
    
  //? Verificando se o arquivo já existe na pasta
  if File(cPasta + cArquivo)
    FwAlertInfo("O arquivo já existe na pasta!", "Atenção")
  else
    //? Caso não consiga criar o arquivo, a mensagem será apresentada
    if !oWriter:Create()
      FwAlertError("Houve um erro ao gerar o arquivo: " + CRLF + oWriter:Error():Message, "Atenção")
    else
      //? Escrevendo no arquivo
      oWriter:Write("Olá!" + CRLF + "Esse é um teste para ver se o programa funciona!")
        
      //? Fechando o arquivo
      oWriter:Close()
        
      //? Perguntando se o usuário deseja abrir o arquivo criado
      if MsgYesNo("Arquivo gerado com sucesso (" + cPasta + cArquivo + ")!" + CRLF + "Abrir arquivo?", "Abrir?")
        ShellExecute("OPEN", cArquivo, "", cPasta, 1)
      endif
    endif
  endif
Return


