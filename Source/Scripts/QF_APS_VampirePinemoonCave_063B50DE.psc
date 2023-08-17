;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_APS_VampirePinemoonCave_063B50DE Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tpMark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tpMark Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

;/ Player.RemoveAllitems()
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
/;
int i = 0
While(i < uniform.length)
  Player.AddItem(uniform[i], abSilent = true)
  Player.EquipItem(uniform[i], abSilent = true)
  i += 1
EndWhile

VampireQ.VampireChange(Player)

Player.MoveTo(Alias_tpMark.GetReference())
; RegisterForModEvent("AP_IntroStart", "IntroStart")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Game.GetPlayer().RemoveFromFaction(prisonerFac)

string hlpEvent = "APStmp"
helpMsg.ShowAsHelpMessage(hlpEvent, 3, 0, 1)
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

Message Property helpMsg  Auto  

Armor[] Property uniform  Auto  

Faction Property prisonerFac  Auto  
