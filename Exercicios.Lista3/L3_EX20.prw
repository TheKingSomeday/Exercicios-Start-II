#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function L3_EX20()

    local cMsg := ""

    if M->B1_TIPO == "PA"

        cMsg := "PRODUTO PARA COMERCIALIZACAO"

    elseif M->B1_TIPO == "MP"

        cMsg := "MATERIA PRIMA PRODUCAO"
        
    else    

        cMsg := "OUTROS PRODUTOS"

    endif
    
Return


