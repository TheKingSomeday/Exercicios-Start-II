#INCLUDE 'TOTVS.CH'
#DEFINE NOME_ALUNO 1
#DEFINE NOTA1_ALUNO 2
#DEFINE NOTA2_ALUNO 3
#DEFINE NOTA3_ALUNO 4
#DEFINE MEDIA_ALUNO 5

User Function L5_Ex16()
    Local aArray := {{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0},{0,0,0,0,0}}
    Local nContador := 0
    Local nContador2 := 0
    Local cMSG := ''

    For nContador := 1 to 4
        For nContador2 := 1 to 5
            If nContador2 == 1
                aArray[nContador, NOME_ALUNO] := FwInputBox('Digite aqui o nome do ' + cValToChar(nContador) + 'º aluno:')
                cMSG += 'Nome:' + aArray[nContador, NOME_ALUNO] + CRLF

            Elseif nContador2 > 1 .and. nContador2 < 5
                aArray[nContador, nContador2] := Val(FwInputBox('Digite aqui a ' + cValToChar(nContador2 - 1) + 'ª nota do aluno:'))
                cMSG += cValToChar(nContador2) + 'ª nota: ' + cValToChar(aArray[nContador, nContador2])
            Else
                aArray[nContador, MEDIA_ALUNO] := ((aArray[nContador, NOTA1_ALUNO] + aArray[nContador, NOTA2_ALUNO] + aArray[nContador, NOTA3_ALUNO]) / 3)
                cMSG += 'Media: ' +  cValToChar(aArray[nContador, MEDIA_ALUNO]) + CRLF + '-----------------------------------------------' + CRLF
            Endif
        Next
    Next

    FwAlertInfo(cMSG)
RETURN    
