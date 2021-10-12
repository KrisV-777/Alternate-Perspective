Scriptname APSkipIntro extends ObjectReference

Message Property SkipIntroMsg  Auto

Message Property chooseSideMsg  Auto

Quest Property MQ101  Auto

ObjectReference Property toPort  Auto

Actor Property PlayerRef  Auto

ObjectReference[] Property postCGMarkers Auto

Event OnActivate(ObjectReference akActionRef)
	If(akActionRef == PlayerRef)
		MQ101QuestScript mainScr = MQ101 as MQ101QuestScript
		If(SkipIntroMsg.Show() == 0) ; Imperials
			mainScr.FactionPath = 1
			PrepHelgen()
			(MQ101 as QF_MQ101_0003372B).MQ102A.setStage(3)
			ObjectReference Hadvar = (MQ101 as QF_MQ101_0003372B).Alias_Hadvar.GetReference()
			Hadvar.MoveTo(toPort)
			Hadvar.Enable()
		Else ; Stormcloaks
			mainScr.FactionPath = 2
			PrepHelgen()
			(MQ101 as QF_MQ101_0003372B).MQ102B.setStage(3)
			ObjectReference  Ralof = (MQ101 as QF_MQ101_0003372B).Alias_Ralof.GetReference()
			Ralof.MoveTo(toPort)
			Ralof.Enable()
		EndIf
	EndIf
EndEvent

Function PrepHelgen()
	Debug.Trace("AP: MQ101 Setting Stages..")
	MQ101.SetStage(145)
	MQ101.SetStage(180)
	MQ101.SetStage(190)
	MQ101.SetStage(195)
	MQ101.SetStage(720)

	Debug.Trace("AP: Destroying Helgen...")
	QF_MQ101_0003372B  qstScr = MQ101 as QF_MQ101_0003372B ; Get MQ101 Quest Script
	qstScr.HelgenDisEnabMarker.DisableNoWait() ; Disable all AP specific NPC

	QF_MQ101DragonAttack_000D0593 drScr = (qstScr.MQ101DragonAttack as Quest) as  QF_MQ101DragonAttack_000D0593

	;Clutter
	drScr.PostCGAreaBClutter.enableNoWait()
	drScr.PostCGOutsideClutter.disableNoWait()
	drScr.dunCGHelgenGatesMarker.enableNoWait()

	;Small Watchtower, break Wall open
	drScr.CollisionInnMarker.enable()
	drScr.Alias_TowerCollision.GetRef().Disable()

	; Near Keep
	drScr.HouseBlockerMarker.enableNoWait()
	drScr.SetStage(200)

	postCGMarkers[0].Enable()	; Major Clutter
	postCGMarkers[1].Enable()	; Major FX
	postCGMarkers[2].Enable()	; E Clutter Marker
	postCGMarkers[3].Enable()	; E Marker
	postCGMarkers[4].Enable()	; A Clutter Marker
	postCGMarkers[5].Enable()	; A Marker
	postCGMarkers[6].Disable()	; Cleanup Marker
	postCGMarkers[7].Disable()	; Gates Marker
	

	PlayerRef.MoveTo(toPort)
	Utility.Wait(2)
EndFunction
