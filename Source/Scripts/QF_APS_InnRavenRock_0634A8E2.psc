;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_InnRavenRock_0634A8E2 Extends Quest Hidden

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
DLC2RRGjalundInit.SetValue(1)
DLC2RRASForce.SetValue(1)
DLC2Init.SetStage(100)
; TODO: Add these
RRShipRide.FirstTimeToSolstheim = false
DLC2RRArrivalScene.SetStage(200)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property InnMarker  Auto

MiscObject Property Gold001  Auto

LeveledItem Property myWeap  Auto

GlobalVariable Property DLC2RRGjalundInit  Auto  

GlobalVariable Property DLC2RRASForce  Auto  

Quest Property DLC2Init  Auto  

DLC2DialogueRRQuestScript Property RRShipRide Auto

Quest Property DLC2RRArrivalScene Auto
