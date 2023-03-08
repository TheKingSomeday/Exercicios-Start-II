#INCLUDE 'TOTVS.CH'

User function Ex39()
    local aNomes  := {'Natan','Stephani','Daniele','','Edison','Ruan',;
                      'Gabriela','Giulliana','Quirino','João','Gustavo',;
                      'Tamíris','Pintor','Henrique','Lucas','Fábio'}
    local nSorteio:= 0

    nSorteio := RANDOMIZE( 1, len(aNomes))

    MSGINFO("O nome sorteado foi "+ aNomes[nSorteio] + ".")


Return

