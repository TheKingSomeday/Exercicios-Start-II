#INCLUDE "TOTVS.CH"

User Function Ex007()

   local nHoraI     := 0
   local nHoraF     := 0
   local Totaltime  := 0

    nHoraI := Val(FwInputBox("Digite a hora que comecou o jogo de poker. ", ""))
    nHoraF := Val(FwInputBox("Digite a hora que acabou o jogo de poker. ", ""))

    Totaltime := nHoraI - nHoraF
    
    if nHoraI >= nHoraF
        Totaltime := ( nHoraF - nHoraI ) + 24

        FwAlertSuccess("O jogo levou " + alltrim(Str(Totaltime)) + " horas.", "Resultado")   

    else
        Totaltime := ( nHoraF - nHoraI )     

        FwAlertSuccess("O jogo levou " + alltrim(Str(Totaltime)) + " horas.", "Resultado")
    ENDIF    



Return
