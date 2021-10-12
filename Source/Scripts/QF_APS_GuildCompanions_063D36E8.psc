;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_GuildCompanions_063D36E8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY portLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

; Companion Quest starts 60 seconds after gamestart
; I dont want to edit anything of that questline so bringing in some artificial delay here 
; Just to get closer to those 60 second zzz
Utility.Wait(4)

C00Fight.Stop()
TG01.SetStage(20)
TG01.SetStage(30)
TG01.SetStage(40)
GameHour.Value = 13
; Alias_Skjor.GetReference().MoveTo(Alias_SkjorLoc.GetReference())

  int Parts = myOutfit.GetNumParts()
  While(Parts)
    Parts -= 1
    Form equipMe = myOutfit.GetNthPart(Parts)
    If(equipMe)
      Player.AddItem(equipMe, abSilent = true)
      Player.EquipItemEx(equipMe, equipSound = false)
    EndIf
  EndWhile
Player.AddItem(shield, abSilent = true)
Player.AddItem(sword, abSilent = true)

Player.MoveTo(Alias_portLoc.GetReference())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TG01  Auto  

Quest Property C00Fight  Auto  

GlobalVariable Property GameHour  Auto  

Outfit Property myOutfit  Auto  

WEAPON Property Sword  Auto  

Armor Property SHIELD  Auto  
