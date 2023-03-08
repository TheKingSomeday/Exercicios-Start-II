#INCLUDE 'TOTVS.CH'

User Function L3_EX13()

    local aDias := {"Domingo", "Segunda-Feira", "Ter�a-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "S�bado"}
    local nUser := 0
    local lLoop := .t.

    While lLoop
        nUser := val(FwInputBox("Digite um n�mero entre 1 e 7."))

            if nUser <= 0 .or. nUser > 7
                MsgStop("Digite um n�mero v�lido!!")
                loop
            else
                lLoop := MsgYesNo("O dia informado foi " + aDias[nUser] + "." + CRLF +;
                                  "Deseja visualizar outro dia?", "Dia da Semana")
            endif
    End While

    MsgInfo("Fim da Execu��o", "Fim")

Return


