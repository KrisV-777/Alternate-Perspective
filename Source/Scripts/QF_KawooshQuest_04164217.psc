;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_KawooshQuest_04164217 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Fourth Wave done, completing Quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Spawning fhourth Wave
SendModEvent("AP_SpawnNow")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Spawning second Wave
SendModEvent("AP_SpawnNow")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Spawning first Wave
SendModEvent("AP_SpawnNow")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
FadeBlack.Apply()
Utility.Wait(5)
FadeBlack.PopTo(FadeBlackHold)
PlayerRef.RemoveAllItems(TmpChest)
PlayerRef.MoveTo(Arena)
Utility.Wait(2)
Game.RequestSave()
PlayerRef.AddPerk(DefPerk)
FadeBlackHold.PopTo(FadeBlackBackImod)
Utility.Wait(10)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Spawning third Wave
SendModEvent("AP_SpawnNow")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Spawn TmpChest on Quest End
myX.PlaceAtMe(summonsFX)
Utility.Wait(0.1)
TmpChest.MoveTo(myX)
PlayerRef.RemovePerk(DefPerk)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int DeathCounter = 0

Function getDead()
	DeathCounter += 1
	If(DeathCounter >= 16)
		DeathCounter = 0
		SetStage(GetStage() + 10)
	EndIf
EndFunction


Actor Property PlayerRef  Auto

ImageSpaceModifier Property FadeBlack  Auto

ImageSpaceModifier Property FadeBlackBackImod  Auto

ImageSpaceModifier Property FadeBlackHold  Auto

ObjectReference Property Arena  Auto

ObjectReference Property TmpChest  Auto

ObjectReference Property myX  Auto

Perk Property DefPerk  Auto  

Activator Property summonsFX  Auto  
