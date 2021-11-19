;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_WantedTPRDawnstar_0634FA1B Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; On Startup we add 100~400g Bounty to 5 random Holds + 300~500g to our current Hold
Actor PlayerRef = Game.GetPlayer()
; PlayerRef.RemoveAllItems()

int i = 0
While(i < 5)
  CrimeFactions[Utility.RandomInt(0, 8)].ModCrimeGold(Utility.RandomInt(0, 300))
  i += 1
EndWhile
CrimeFactions[3].ModCrimeGold(Utility.RandomInt(200, 400))

; i = ArmorStuddedSimpleOutfit.GetNumParts()
; While(i)
;   i -= 1
;   Form equipMe = ArmorStuddedSimpleOutfit.GetNthPart(i)
;   If(equipMe)
;     PlayerRef.AddItem(equipMe, abSilent = true)
;     PlayerRef.EquipItemEx(equipMe, equipSound = false)
;   EndIf
; EndWhile

i = 0
While(i < uniform.length)
  PlayerRef.AddItem(uniform[i], abSilent = true)
  PlayerRef.EquipItem(uniform[i], abSilent = true)
  i += 1
EndWhile

;
; i = 0
; While(i < banditWeaponry.length)
;   PlayerRef.AddItem(banditWeaponry[i], abSilent = true)
;   i += 1
; EndWhile
;
; PlayerRef.AddItem(Gold001, Utility.RandomInt(50,150), true)

APSWanted.Start()
PlayerRef.MoveTo(portLoc)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction[] Property CrimeFactions  Auto

Quest Property APSWanted  Auto

ObjectReference Property portLoc  Auto

LeveledItem[] Property banditWeaponry  Auto

MiscObject Property Gold001  Auto

Outfit Property ArmorStuddedSimpleOutfit Auto

Armor[] Property uniform  Auto

