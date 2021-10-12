;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_DocksWindhelm_0634F9EE Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()
; PlayerRef.RemoveItem(ClothesFarmClothes02, abSilent = true)
; PlayerRef.AddItem(ClothesFarmClothesVariant04, abSilent = true)
; PlayerRef.EquipItemEx(ClothesFarmClothesVariant04, equipSound = false)
;
; PlayerRef.AddItem(Gold001, Utility.RandomInt(57, 200), abSilent = true)
; PlayerRef.AddItem(myWeap, abSilent = true)

PlayerRef.MoveTo(dockMarker)
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
