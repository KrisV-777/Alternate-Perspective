Scriptname APMain extends Quest Conditional

import StorageUtil
import PapyrusUtil
; ---------------------------- Properties
UIListMenu Property UIList Auto
Quest Property DialogueWhiterunGuardGateStop  Auto
Quest Property HousePurchase Auto
Quest Property MQ101 Auto
Message Property TempChooseSidesMessage2 Auto
ReferenceAlias[] Property questAliases Auto
ObjectReference[] Property startLocs Auto
{Matlara, Torolf, Haming, Gunnar, Vilod, Ingrid}
ObjectReference Property helgenInnMarker Auto
ObjectReference Property dunHunterDoor Auto
MiscObject Property Gold001 Auto
ImageSpaceModifier Property FadeToBlackHoldImod Auto
ImageSpaceModifier Property FadeToBlackBackImod Auto
Scene Property introScene Auto
; ---------------------------- Framework Variables
Quest[] Property startingQuests Auto
Actor Property TheMessenger Auto
int defaultAlgorithm = 0
Quest entryQuest = none
; ---------------------------- Helgen Quest Variables

Function destroyHelgen() global
	Debug.Trace("[Alternate Perspective] destroying Helgen..")
	
	QF_MQ101_0003372B q101scr = Game.GetFormFromFile(0x03372B, "Skyrim.esm") as QF_MQ101_0003372B
	; Stage10
	; disable stuff around Helgen & temp end gate
	q101scr.FortNeugradEnableMarker.Disable()
	q101scr.TempEndGate.Disable()
	q101scr.HelgenDisEnabMarker.Disable()
	q101scr.CollisionWall.Disable()
	; Stage20
	q101scr.CartPathAmbientMarker.disable()

	q101scr.SetStage(145)
	q101scr.SetStage(200)
EndFunction

; =========================================================
; ============================== STARTUP & CLOSE
; =========================================================
; Startup
Event OnInit()
	Game.GetPlayer().AddItem(Gold001, 72, true)

	string[] mainListUI = new string[12]
	mainListUI[0] = " Default"
	mainListUI[1] = "Random"
	mainListUI[2] = " Regular at an Inn"
	mainListUI[3] = " From Overseas"
	mainListUI[4] = " A wanted criminal"
	mainListUI[5] = " Robbed and barely alive"
	mainListUI[6] = " Shipwrecked"
	mainListUI[7] = " I live in my own house"
	mainListUI[8] = " I'm part of a Vampire Clan"
	mainListUI[9] = " I hunt in Hircine's Name"
	mainListUI[10] = " Member of a Guild"
	mainListUI[11] = " The Dragonborn"


	string[] mainString = new string[12]
	mainString[0] = "APS_Pilgerer" ; Quickstart_SkipAlduin_SkipIntro
	mainString[1] = "APS_Random"
	mainString[2] =	"APSI_Random_The Bannared Mare_The Bee And Barb_The Winking Skeever_Silver-Blood Inn_Candlehearth Hall_Dead Man's Drink_Moorside Inn_The Frozen Hearth_Windpeak Inn_The Retching Netch_The Sleeping Giant Inn_Frostfruit Inn_Vilemyr Inn_Old Hroldan Inn_Four Shields Tavern_Nightgate Inn_Braidwood Inn"
	mainString[3] = "APSD_Random_East Empire Company_Windhelm Docks_Dawnstar's Shore_Raven Rock Docks"
	mainString[4] = "APSW_Random_..in Whiterun_..in the Rift_..in the Pale_..in Winterhold"
	mainString[5] = "APSLfD_Random_..in the Rift_..in the Reach_..in Winterhold"
	mainString[6] = "APSS_Shipwrecked"
	mainString[7] = "APSH_Random_..in Whiterun_..in Solitude_..in Riften_..in Markarth"
	mainString[8] = "APSV_Random_Pinemoon Cave_Bloodlet Throne_Movarth's Lair_Haermar's Shame"
	mainString[9] = "APSW_Falkreath"
	mainString[10] = "APSG_Random_College of Winterhold_Thieves Guild_Dark Brotherhood_Companions"
	mainstring[11] = "APSM_Escaped with Hadvar_Escaped with Ralof"

	StringListCopy(none, "APS_mainListUI", mainListUI)
	StringListCopy(none, "APS_mainListIntern", mainString)

	SetFormValue(none, "APSIThe Bannared Mare", startingQuests[0]) ; Inns
	SetFormValue(none, "APSIThe Bee And Barb", startingQuests[1])
	SetFormValue(none, "APSIThe Winking Skeever", startingQuests[2])
	SetFormValue(none, "APSISilver-Blood Inn", startingQuests[3])
	SetFormValue(none, "APSICandlehearth Hall", startingQuests[4])
	SetFormValue(none, "APSIDead Man's Drink", startingQuests[5])
	SetFormValue(none, "APSIMoorside Inn", startingQuests[6])
	SetFormValue(none, "APSIThe Frozen Hearth", startingQuests[7])
	SetFormValue(none, "APSIWindpeak Inn", startingQuests[8])
	SetFormValue(none, "APSIThe Retching Netch", startingQuests[9])
	SetFormValue(none, "APSIThe Sleeping Giant Inn", startingQuests[10])
	SetFormValue(none, "APSIFrostfruit Inn", startingQuests[11])
	SetFormValue(none, "APSIVilemyr Inn", startingQuests[12])
	SetFormValue(none, "APSIOld Hroldan Inn", startingQuests[13])
	SetFormValue(none, "APSIFour Shields Tavern", startingQuests[14])
	SetFormValue(none, "APSINightgate Inn", startingQuests[15])
	SetFormValue(none, "APSIBraidwood Inn", startingQuests[16])

	SetFormValue(none, "APSDEast Empire Company", startingQuests[17]) ; Docks
	SetFormValue(none, "APSDWindhelm Docks", startingQuests[18])
	SetFormValue(none, "APSDDawnstar's Shore", startingQuests[19])
	SetFormValue(none, "APSDRaven Rock Docks", startingQuests[20])

	SetFormValue(none, "APSW..in Whiterun", startingQuests[21]) ; Wanted
	SetFormValue(none, "APSW..in the Rift", startingQuests[22])
	SetFormValue(none, "APSW..in the Pale", startingQuests[23])
	SetFormValue(none, "APSW..in Winterhold", startingQuests[24])

	SetFormValue(none, "APSLfD..in the Rift", startingQuests[25]) ; Left For Dead
	SetFormValue(none, "APSLfD..in the Reach", startingQuests[26])
	SetFormValue(none, "APSLfD..in Winterhold", startingQuests[27])

	SetFormValue(none, "APSSShipwrecked", startingQuests[28]) ; Shipwrecked

	SetFormValue(none, "APSH..in Whiterun", startingQuests[29]) ; Owned House
	SetFormValue(none, "APSH..in Solitude", startingQuests[30])
	SetFormValue(none, "APSH..in Riften", startingQuests[31])
	SetFormValue(none, "APSH..in Markarth", startingQuests[32])

	SetFormValue(none, "APSVPinemoon Cave", startingQuests[33]) ; Vampire
	SetFormValue(none, "APSVBloodlet Throne", startingQuests[34])
	SetFormValue(none, "APSVMovarth's Lair", startingQuests[35])
	SetFormValue(none, "APSVHaermar's Shame", startingQuests[36])

	SetFormValue(none, "APSWFalkreath", startingQuests[37]) ; Werewolf

	SetFormValue(none, "APSGCollege of Winterhold", startingQuests[38]) ; Guilds
	SetFormValue(none, "APSGThieves Guild", startingQuests[39])
	SetFormValue(none, "APSGDark Brotherhood", startingQuests[40])
	SetFormValue(none, "APSGCompanions", startingQuests[41])

	SetFormValue(none, "APSMEscaped with Hadvar", startingQuests[42]) ; Mainquest Skip
	SetFormValue(none, "APSMEscaped with Ralof", startingQuests[43])
EndEvent

; Cleanup
Function StopQuest()
	DialogueWhiterunGuardGateStop.SetStage(5)
	dunHunterDoor.SetLockLevel(0)
	dunHunterDoor.Lock(false)
	SendModEvent("AP_IntroStart")
	Stop()
EndFunction

; =========================================================
; ============================== ENTRANCE SELECTION
; =========================================================
Function SetEntry()
	UIList.ResetMenu()
	; Reset the queue
	string[] queue = StringListToArray(none, "APS_queue")
	int p = 0
	While(p < queue.length)
		string[] tmp = StringUtil.Split(queue[p], ";")
		StringListAdd(none, "APS_mainListUI", tmp[0])
		StringListAdd(none, "APS_mainListIntern", tmp[1])
		p += 1
	EndWhile
	StringListClear(none, "APS_queue")

	; Then do menu stuff
	string[] mainListUI = StringListToArray(none, "APS_mainListUI")
	string[] mainString = StringListToArray(none, "APS_mainListIntern")
	int i = 0
	While(i < mainListUI.length)
		; Add Main Entry
		int pos = UIList.AddEntryItem(mainListUI[i])
		; Analyze Sub Entry String (Prefix + SubOptions)
		string[] subListUI = StringUtil.Split(mainString[i], "_")
		string prefix = subListUI[0]
		If(subListUI.length == 2) ; No Childs
			FormListAdd(TheMessenger, "APS_Quests", GetFormValue(none, prefix + subListUI[1]))
		ElseIf(subListUI.length > 2) ; Has Childs
			FormListAdd(TheMessenger, "APS_Quests", none) ; Set the Parent Option to none
			UIList.SetPropertyIndexBool("hasChildren", pos, true)
			int n = 1 ; Skip first Line, thats the Prefix
			While(n < subListUI.length)
				UIList.AddEntryItem(subListUI[n], pos, i)
				FormListAdd(TheMessenger, "APS_Quests", GetFormValue(none, prefix + subListUI[n]))
				n += 1
			EndWhile
		else ; Invalid Line, set to none and use the Default if the Player selects it
			FormListAdd(TheMessenger, "APS_Quests", none)
		EndIf
		i += 1
	EndWhile
	UIList.OpenMenu()
	If(UIList.GetResultInt() == 0) ; Default
		defaultAlgorithm = UIList.GetResultInt()
		entryQuest = none
	ElseIf(UIList.GetResultString() == "Random") ; Sublist Random
		int callBack = UIList.GetResultFloat() as int
		If(callBack == -1) ; All Random
			callBack = Utility.RandomInt(2, mainListUI.length) ; 0 is Default, 1 is All Random
		; else
		; 	callBack = UIList.GetResultFloat() as int
		EndIf
		string[] subList = StringUtil.Split(mainString[callBack], "_")
		string prefix = subList[0]
		entryQuest = GetFormValue(none, prefix + subList[Utility.RandomInt(2, subList.length - 1)]) as Quest ; 0 is Prefix, 1 is "random" by definition
	else ; Base stuff.. yay!
		entryQuest = FormListGet(TheMessenger,  "APS_Quests", UIList.GetResultInt()) as Quest
	EndIf
	FormListClear(TheMessenger, "APS_Quests")
	UIList.ResetMenu()
EndFunction

Function enterGame()
	Game.DisablePlayerControls()
	FadeToBlackHoldImod.Apply()
	bool doMoving = true
	If(entryQuest == none)
		If(defaultAlgorithm == 3) ; Skip Intro
			doMoving = false
			MQ101.SetStage(3)
		ElseIf(defaultAlgorithm == 2) ; Quickstart Intro
			doMoving = false
			Game.GetPlayer().MoveTo(helgenInnMarker)
			Utility.Wait(0.7)
			introScene.Start()
		Else ; Default no Quest
			Game.GetPlayer().MoveTo(helgenInnMarker)
		EndIf
	ElseIf(entryQuest.Start() == false)
		Game.GetPlayer().MoveTo(helgenInnMarker)
	EndIf
	Game.EnablePlayerControls()
	If(doMoving)
		int i = 0
		While(i < startLocs.length)
			questAliases[i].GetReference().MoveTo(startLocs[i])
			i += 1
		EndWhile
	EndIf
	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	; Clean up the StorageUtil stuff since we dont need it anymore
	StringListClear(none, "APS_mainListUI")
	string[] mainString = StringListToArray(none, "APS_mainListIntern")
	int i = 0
	While(i < mainString.length)
		string[] subListUI = StringUtil.Split(mainString[i], "_")
		string prefix = subListUI[0]
		int n = 1 ; Skip first Line, is Prefix
		While(n < subListUI.length)
			If(StringUtil.GetNthChar(subListUI[n], 0) == "~")
				string[] tmp = StringUtil.Split(subListUI[n], "~")
				tmp = StringUtil.Split(tmp[0], ":")
				FormListClear(none, tmp[1])
			EndIf
			SetFormValue(none, prefix + subListUI[n], none)
			n += 1
		EndWhile
		i += 1
	EndWhile
	HousePurchase.SetStage(5)
	StringListClear(none, "APS_mainListIntern")
	SendModEvent("AP_GameStarted")
	Game.RequestSave()
EndFunction
