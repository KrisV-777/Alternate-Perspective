Scriptname APMQ101Controller extends Quest  
{Script holds Stage Data cause MQ101 Quest Script is apparently bugged?}

Function destroyHelgen() global
	Debug.Trace("[Alternate Perspective] destroying Helgen..")
	
	QF_MQ101_0003372B_new q101scr = Game.GetFormFromFile(0x03372B, "Skyrim.esm") as QF_MQ101_0003372B_new
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

QF_MQ101_0003372B_new Property Fragment
  QF_MQ101_0003372B_new Function Get()
    return (Self as Quest) as QF_MQ101_0003372B_new
  EndFunction
EndProperty

Actor Property PlayerRef Auto
APDialogueHelgen Property DialogueHelgenScr Auto
Quest Property DialogueWhiterunGuardGateStop Auto ; Whiterun Guard will approach the PlayerRef if trying to enter Whiterun
Formlist Property StopAfterIntroList Auto
ObjectReference Property dunHunterDoor Auto

ObjectReference Property HelgenGunnarDoor Auto

ObjectReference Property SkaleiPlazzaSeat  Auto  
ObjectReference Property GunnarIntroPos Auto

ObjectReference Property HelgenWatchtower Auto
ObjectReference Property HelgenKeep Auto

GlobalVariable Property MQQuickStart Auto
ObjectReference Property CharGenFXTrigger Auto

ObjectReference Property TulliusStartMarker Auto
ObjectReference Property TulliusHorseMarker Auto
ObjectReference Property Cart1 Auto
ObjectReference Property Cart1HorseMarker Auto
ObjectReference Property Cart1SoldierMarker Auto
ObjectReference Property Cart2UlfricMarker Auto
ObjectReference Property Cart1Prisoner02Marker Auto
ObjectReference Property Cart1Prisoner03Marker Auto
ObjectReference Property Cart1Prisoner04Marker Auto
ObjectReference Property Cart2 Auto
ObjectReference Property Cart2HorseMarker Auto
ObjectReference Property Cart2SoldierMarker Auto
ObjectReference Property Cart2RalofMarker Auto
ObjectReference Property Cart2Prisoner01Marker Auto
ObjectReference Property Cart2PlayerMarker Auto
ObjectReference Property Cart1Prisoner01Marker Auto
ObjectReference Property HadvarMarker Auto
ObjectReference Property HadvarHorseMarker Auto

Cell Property StartCell Auto
bool Property isintrotransition Auto Hidden

Function Stage1000()
  DialogueWhiterunGuardGateStop.SetStage(5)
	dunHunterDoor.SetLockLevel(0)
	dunHunterDoor.Lock(false)

	int i = StopAfterIntroList.GetSize()
	While(i > 0)
		i -= 1
		Quest tmp = StopAfterIntroList.GetAt(i) as Quest
		If(tmp && tmp.IsRunning())
			tmp.Stop()
		EndIf
	EndWhile
EndFunction

Function QuickStartKeep(bool imperials)
  If(imperials)
    ObjectReference Hadvar = Fragment.Alias_Hadvar.GetReference()
    Hadvar.Enable()
    Hadvar.MoveTo(Fragment.HadvarKeepMarker1)
    
    Fragment.Alias_TrophyRoomPrisoner01.TryToEnable()
    Fragment.Alias_TrophyRoomPrisoner02.TryToEnable()

    PlayerRef.MoveTo(Fragment.PlayerImperialKeepMarker1)
  Else
    Actor Ralof = Fragment.Alias_Ralof.GetReference() as Actor
    Ralof.Enable()
    Ralof.MoveTo(Fragment.RalofKeepMarker1)
    Ralof.UnequipItem(Fragment.PrisonerCuffs)
    Utility.Wait(0.1)
    Ralof.RemoveItem(Fragment.PrisonerCuffs)

    Fragment.Alias_BarracksRoomSoldier01.TrytoEnable()
    Fragment.Alias_BarracksRoomSoldier02.TrytoEnable()    

    PlayerRef.MoveTo(Fragment.PlayerSonKeepMarker1)
  EndIf
  Utility.Wait(1)
  ; Disable Helgen Guards
  Fragment.HelgenDisEnabMarker.DisableNoWait()
  ; disable stuff around Helgen
  Fragment.FortNeugradEnableMarker.Disable()
  ; disable temp end gate
  Fragment.TempEndGate.Disable()
  ; destroy Helgen
  SetStage(145)
  SetStage(180)
  SetStage(190)
  SetStage(195)

  ;make sure the right controls are enabled/disabled
  Game.DisablePlayerControls(abCamSwitch = True)
  Game.EnablePlayerControls(abFighting= false, abCamSwitch = false, abActivate = false)
EndFunction
