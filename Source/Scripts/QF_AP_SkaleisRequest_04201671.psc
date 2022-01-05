;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_AP_SkaleisRequest_04201671 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gift
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gift Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gift2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gift2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skalei
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skalei Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Shahvee
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Shahvee Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Delivering the Package after Helgen got destroyed
Game.GetPlayer().RemoveItem(Alias_Gift.GetReference())
SetObjectiveCompleted(5)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Delivering the Package before Helgen got destroyed
Game.GetPlayer().RemoveItem(Alias_Gift.GetReference())
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
Alias_Shahvee.GetReference().RemoveItem(Alias_Gift2.GetReference(), akOtherContainer = Game.GetPLayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Delivering Sahvees Package to Skalei
Game.GetPlayer().RemoveItem(Alias_Gift2.GetReference())
CompleteAllObjectives()
Alias_Skalei.GetActorReference().SetRelationShipRank(Game.GetPlayer(), 2)

Game.GetPlayer().AddItem(GoldReward)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Skalei.GetReference().RemoveItem(Alias_Gift.GetReference(), akOtherContainer = Game.GetPLayer())

SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property GoldReward  Auto  
