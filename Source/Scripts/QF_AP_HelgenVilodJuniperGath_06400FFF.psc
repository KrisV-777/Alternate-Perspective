;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_AP_HelgenVilodJuniperGath_06400FFF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vilod
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vilod Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; collected all Berries, return to Vilod
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Vilod died or Helgen got destroyed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BerryGlobal.Value = Game.GetPlayer().GetItemCount(JuniperBerries)
UpdateCurrentInstanceGlobal(BerryGlobal)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Returned to Vilod with Berries
Actor Player = Game.GetPlayer()
Actor Vilod = Alias_Vilod.GetActorRef()

Player.RemoveItem(JuniperBerries, 20)
Player.AddItem(Gold001, 200)
If(Vilod.GetRelationshipRank(Player) < 1)
Vilod.SetRelationshipRank(Player, 1)
EndIf

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

GlobalVariable Property BerryGlobal  Auto  

Ingredient Property JuniperBerries  Auto  
