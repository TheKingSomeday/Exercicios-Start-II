#INCLUDE 'Protheus.ch'

#DEFINE CLR_RGB_ROSA_PASTEL RGB(255,203,219)
#DEFINE CLR_RGB_GREY31 RGB(79,79,79)

User Function MBlkColor()
    aRet := {}

    aAdd(aRet, (CLR_RGB_GREY31)  )
    aAdd(aRet, (CLR_RGB_ROSA_PASTEL))

Return aRet
