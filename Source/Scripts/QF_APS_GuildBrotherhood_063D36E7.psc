;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_GuildBrotherhood_063D36E7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY portLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY astridMark
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_astridMark Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Astrid
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Astrid Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

DB01.SetObjectiveDisplayed(20)
DB01.CompleteAllObjectives()
DB01.SetStage(200)

DarkBrotherhood DBScript = DarkBrotherhoodQuest as DarkBrotherhood
DBScript.DoorDoOnce = 1
pSanctuaryDoor1.Enable()
;pSanctuaryDoor1.BlockActivation()
pSanctuaryDoor2.Disable()
DBScript.BlackDoorPass = 2

TG01.SetStage(10)
TG01.SetStage(30)
TG01.SetStage(40)
TG01.SetStage(50)

int Parts = myOutfit.GetNumParts()
While(Parts)
  Parts -= 1
  Form equipMe = myOutfit.GetNthPart(Parts)
  If(equipMe)
    Player.AddItem(equipMe, abSilent = true)
    Player.EquipItemEx(equipMe, equipSound = false)
  EndIf
EndWhile
Player.AddItem(dagger, abSilent = true)

Alias_Astrid.GetReference().moveTo(Alias_astridMark.GetReference())
Player.MoveTo(Alias_portLoc.GetReference())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property TG01  Auto

Quest Property DB01  Auto

Outfit Property myOutfit  Auto

WEAPON Property Dagger  Auto

Quest Property DarkBrotherhoodQuest  Auto  

ObjectReference Property pSanctuaryDoor1  Auto  

ObjectReference Property pSanctuaryDoor2  Auto  
