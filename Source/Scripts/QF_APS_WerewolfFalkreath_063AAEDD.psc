;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_WerewolfFalkreath_063AAEDD Extends Quest Hidden

;BEGIN ALIAS PROPERTY portMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalkHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FalkHold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

; turn player into werewolf 
; make you immune to disease, remove existing diseases
if (Player.HasKeyword(VampireKeyword))
    (PlayerVampireQuest as PlayerVampireQuestScript).VampireCure(Player)
endif
WerewolfCureDisease.Cast(Player)

; give you the spells
Player.AddSpell(Immunity, false)
Player.AddSpell(BeastForm, false)

; and turn them into a doggo
BeastForm.Cast(Player)
Utility.Wait(3)
GameTime.SetValue(21)

; then move you into position \o/
Player.MoveTo(Alias_portMarker.GetReference())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property Immunity  Auto  

SPELL Property BeastForm  Auto  

SPELL Property WerewolfCureDisease  Auto  

Keyword Property VampireKeyword  Auto  

Quest Property PlayerVampireQuest  Auto  

GlobalVariable Property gametime  Auto  
