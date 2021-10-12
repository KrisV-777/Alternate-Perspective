;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_LeftForDeadWinterhold_0634FA20 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor PlayerRef = Alias_Player.GetReference() as Actor

PlayerRef.DamageAV("Health", PlayerRef.GetActorValue("Health") - 10)

; PlayerRef.RemoveAllitems()
; PlayerRef.AddItem(ClothesFarmClothesVariant03, abSilent = true)
; PlayerRef.EquipItemEx(ClothesFarmClothesVariant03, equipSound = false)

PlayerRef.AddSpell(diseaseSpell)

PlayerRef.MoveTo(dedMarker)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property ClothesFarmClothesVariant03  Auto

SPELL Property diseaseSpell  Auto

ObjectReference Property dedMarker  Auto
