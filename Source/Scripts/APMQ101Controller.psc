Scriptname APMQ101Controller extends Quest  
{Script holds Stage Data cause MQ101 Quest Script is apparently bugged?}

APMain Property Main Auto
QF_MQ101_0003372B_new Property Fragment
  QF_MQ101_0003372B_new Function Get()
    return (Self as Quest) as QF_MQ101_0003372B_new
  EndFunction
EndProperty

Actor Property PlayerRef Auto
Quest Property HelgenDialogue Auto
Quest Property DialogueWhiterunGuardGateStop Auto ; Whiterun Guard will approach the Player if trying to enter Whiterun
Formlist Property StopAfterIntroList Auto
ObjectReference Property dunHunterDoor Auto

ObjectReference Property HelgenGunnarDoor Auto

ObjectReference Property SkaleiPlazzaSeat  Auto  

ObjectReference Property HelgenWatchtower Auto
ObjectReference Property HelgenKeep Auto

Function Stage1000()
  Fragment.Alias_ImperialSoldierHelgen01.GetReference().Disable()
  Fragment.Alias_ImperialSoldierHelgen02.GetReference().Disable()

  Fragment.Alias_CivilianGunnar.GetReference().Disable()
  Fragment.Alias_CivilianIngrid.GetReference().Disable()
  Fragment.Alias_CivilianMatlara.GetReference().Disable()
  Fragment.Alias_CivilianTorolf.GetReference().Disable()
  Fragment.Alias_CivilianTorri.GetReference().Disable()
  Fragment.Alias_CivilianVilod.GetReference().Disable()

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
  
	HelgenDialogue.Stop()
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

Function Stage145()
	Fragment.Alias_CivilianTorolf.GetActorRef().GetActorBase().SetEssential(false)
	Fragment.Alias_CivilianSkalei.GetReference().DisableNoWait()
	; HelgenGunnarDoor.Reset()
	; float posZ = HelgenGunnarDoor.Z - 2000
	; HelgenGunnarDoor.SetPosition(HelgenGunnarDoor.X, HelgenGunnarDoor.Y, posZ)
  ; HelgenGunnarDoorStatic.Disable()
EndFunction

Function Stage5()
  Fragment.Alias_CivilianSkalei.GetReference().MoveTo(SkaleiPlazzaSeat)
  Fragment.Alias_Priest.GetReference().MoveTo(HelgenWatchtower)
  Fragment.Alias_Headsman.GetReference().MoveTo(HelgenKeep)
EndFunction
