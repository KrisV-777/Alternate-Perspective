;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_APS_Forsworn_0546649F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY portLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myLoc Auto
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

Player.MoveTo(Alias_portLoc.GetReference())
; RegisterForModEvent("AP_IntroStart", "IntroStart")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(DruadachRedoubtFaction)

string hlpEvent = "APStmp"
Help_Msg.ShowAsHelpMessage(hlpEvent, 3, 0, 1)
Utility.Wait(4.0)

Message.ResetHelpMessage(hlpEvent)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor[] Property uniform Auto

Faction Property ForswornFaction  Auto  

Message Property Help_Msg  Auto  

Faction Property DruadachRedoubtFaction  Auto  
