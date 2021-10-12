;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_APS_VampireHaemarsShame_063B50DF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Actor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor01000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor01000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor03000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor03000000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor03000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor03000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor02000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor02000000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor00
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor00 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor01000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor01000000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor01001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor01001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor02001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor02001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor04000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor04000000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor04000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor04000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor02000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor02000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tpMark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tpMark Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor03001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor03001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor04001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor04001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor11 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

; Player.RemoveAllitems()
int Parts = VampArmor.GetNumParts()
While(Parts)
  Parts -= 1
  Form equipMe = VampArmor.GetNthPart(Parts)
  If(equipMe)
    Player.AddItem(equipMe, abSilent = true)
    Player.EquipItemEx(equipMe, equipSound = false)
  EndIf
EndWhile
; Player.AddItem(Gold001, Utility.RandomInt(75, 300), true)

VampireQ.VampireChange(Player)

Player.MoveTo(Alias_tpMark.GetReference())
RegisterForModEvent("AP_IntroStart", "IntroStart")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
string hlpEvent = "APStmp"
Help_Msg.ShowAsHelpMessage(hlpEvent, 3, 0, 1)
Utility.Wait(4.0)

Message.ResetHelpMessage(hlpEvent)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

PlayerVampireQuestScript Property VampireQ  Auto

Event IntroStart(string eventName, string strArg, float numArg, Form sender)
	Stop()
EndEvent

Outfit Property VampArmor  Auto

MiscObject Property Gold001  Auto

Message Property Help_Msg  Auto  
