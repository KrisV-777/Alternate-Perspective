;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_GuildThievesguild_063CE5E5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY bryn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bryn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY portLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY brynloc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_brynloc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

TG00.SetObjectiveDisplayed(8)
TG00.SetObjectiveDisplayed(10)
TG00.SetObjectiveDisplayed(20)
TG00.SetObjectiveDisplayed(30)
TG00.CompleteAllObjectives()
TG00.SetStage(200)
; TG01.SetStage(10)
Alias_bryn.GetReference().MoveTo(Alias_brynLoc.GetReference())

; int Parts = o.GetNumParts()
; While(Parts)
;   Parts -= 1
;   Form equipMe = o.GetNthPart(Parts)
;   If(equipMe)
;     Player.AddItem(equipMe, abSilent = true)
;     Player.EquipItemEx(equipMe, equipSound = false)
;   EndIf
; EndWhile

int i = 0
While(i < uniform.length)
  Player.AddItem(uniform[i], abSilent = true)
  Player.EquipItemEx(uniform[i], equipSound = false)
  i += 1
EndWhile

Player.AddItem(dagger, abSilent = true)

Player.MoveTo(Alias_portLoc.GetReference())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TG01  Auto  

Quest Property TG00  Auto  

Outfit Property o  Auto  

WEAPON Property Dagger  Auto  

Armor[] Property uniform Auto
