;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_GuildMages_063D36E6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY portLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

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
  Player.EquipItem(uniform[i], abSilent = true)
  i += 1
EndWhile

TG01.SetStage(30)
ObjectReference p = Alias_portLoc.GetReference()
Player.MoveTo(p)
Player.SetAngle(p.X - 180, p.Y, p.Z)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TG01  Auto  

Outfit Property o  Auto  

Armor[] Property uniform Auto