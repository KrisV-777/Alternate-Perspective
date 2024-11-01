;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_DocksRavenRock_0634F9F0 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
PlayerRef.MoveTo(dockMarker)

; PlayerRef.RemoveItem(ClothesFarmClothes02, abSilent = true)
; PlayerRef.AddItem(ClothesFarmClothesVariant04, abSilent = true)
; PlayerRef.EquipItemEx(ClothesFarmClothesVariant04, equipSound = false)

; PlayerRef.AddItem(Gold001, Utility.RandomInt(57, 200), abSilent = true)
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

MiscObject Property Gold001  Auto

LeveledItem Property myWeap  Auto

ObjectReference Property dockMarker  Auto

Armor Property ClothesFarmClothesVariant04  Auto

Armor Property ClothesFarmClothes02  Auto

GlobalVariable Property DLC2RRGjalundInit  Auto  

GlobalVariable Property DLC2RRASForce  Auto  

Quest Property DLC2Init  Auto  

DLC2DialogueRRQuestScript Property RRShipRide Auto

Quest Property DLC2RRArrivalScene Auto
