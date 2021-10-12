;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_AP_RiftenInn_063457D0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterCell
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterCell Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeeNBarb
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BeeNBarb Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(Alias_CenterCell.GetReference())
; PlayerRef.AddItem(Gold001, Utility.RandomInt(50, 150), abSilent = true)
; PlayerRef.AddItem(myWeap, abSilent = true)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto

LeveledItem Property myWeap  Auto
