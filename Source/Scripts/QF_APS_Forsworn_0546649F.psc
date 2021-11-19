;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_APS_Forsworn_0546649F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Actor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000000001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000000001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00001001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00001001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00002000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00002000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00001000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00001000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY portLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00001000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00001000000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor00
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor00 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000000000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000001000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000001000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiscActor00000000000000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiscActor00000000000000 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

int i = 0
While(i < uniform.length)
  Player.AddItem(uniform[i], abSilent = true)
  Player.EquipItem(uniform[i], abSilent = true)
  i += 1
EndWhile
; Player.AddItem(Gold001, Utility.RandomInt(75, 300), true)

; AP_ForswornFaction.SetAlly(ForswornFaction)
; AP_ForswornFaction.SetAlly(DruadachRedoubtFaction)

Player.MoveTo(Alias_portLoc.GetReference())
; RegisterForModEvent("AP_IntroStart", "IntroStart")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
string hlpEvent = "APStmp"
Help_Msg.ShowAsHelpMessage(hlpEvent, 3, 0, 1)
Utility.Wait(4.0)

Message.ResetHelpMessage(hlpEvent)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor[] Property uniform Auto

Faction Property AP_ForswornFaction  Auto  

Faction Property ForswornFaction  Auto  

Message Property Help_Msg  Auto  

Faction Property DruadachRedoubtFaction  Auto  
