;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_InnOldHroldan_0634A8E6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Inn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Inn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterCell
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterCell Auto
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

ObjectReference Property InnMarker  Auto

MiscObject Property Gold001  Auto

LeveledItem Property myWeap  Auto
