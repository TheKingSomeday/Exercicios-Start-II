#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function nomeFunction
    (long_description)
    @type  Function
    @author user
    @since 25/04/2023
    /*/
User Function L13_EX4()

    CriaPasta()

    CopiaTXT()

Return

Static Function CriaPasta()

  Local cCaminho   := "\" //? Criação de uma pasta no protheus data
  Local cNomePasta := "Lista 13\" //? Nome da pasta que será criada
  //? Verificando se a pasta já existe
  if !ExistDir(cCaminho + cNomePasta)
    //? Criando a pasta
    if MakeDir(cCaminho + cNomePasta) == 0
      //? Chamando a função que criará um arquivo de texto dentro da pasta criada.
        if ExistBlock("Escreve")
            ExecBlock("Escreve", .F., .F., cCaminho + cNomePasta)
        endif

        if ExistBlock("EscrCSV")
            ExecBlock("EscrCSV", .F., .F., cCaminho + cNomePasta)
        endif
    else
      FwAlertError("Houve um erro ao criar a pasta " + cNomePasta, "Atenção")
    endif
    
    else
    if ExistBlock("Escreve")
        ExecBlock("Escreve", .F., .F., cCaminho + cNomePasta)
    endif

    if ExistBlock("EscrCSV")
        ExecBlock("EscrCSV", .F., .F., cCaminho + cNomePasta)
    endif

  endif
    
Return 

Static Function CopiaTXT()
    Local cPastaOri  := 'C:\Windows\Temp\lista 13 - ex1\'
    Local cPastaDest := '\lista 13\'
    Local aArquivos  := Directory(cPastaOri + '*.*', 'D', , , 1)
    Local nI         := 0
    Local nTamanho   := LEN(aArquivos)
    if nTamanho > 0
        for nI := 3 to nTamanho
            if !CPYT2S(cPastaOri + aArquivos[nI][1], cPastaDest)
                MsgStop('Houve um erro ao copiar o arquivo!' + aArquivos[nI][1])
            endif
        next
        
        FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Concluído!')
    else
        FwAlertInfo('A pasta não contém nenhum arquivo ou subpasta!', 'Atenção!')
    endif
Return
