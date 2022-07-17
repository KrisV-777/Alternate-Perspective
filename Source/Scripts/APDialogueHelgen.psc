Scriptname APDialogueHelgen extends Quest  

ObjectReference Property MatlaraStart Auto
ObjectReference Property TorolfStart Auto
ObjectReference Property TorriStart Auto
ObjectReference Property GunnarStart Auto
ObjectReference Property VilodStart Auto
ObjectReference Property IngridStart Auto

Quest Property SkaleiRequest  Auto  
Quest Property VilodFavor  Auto  

Event OnInit()
	SetPositions()
EndEvent

Function SetPositions()
    ; Cant assign Helgens Vanilla NPC to a new Editor Loc cause mod conflicts are a thing, zzz
    (GetAliasByName("RestingPilgrimOwner") as ReferenceAlias).GetReference().MoveTo(MatlaraStart)
    (GetAliasByName("RestingPilgrimBackup") as ReferenceAlias).GetReference().MoveTo(TorolfStart)
    (GetAliasByName("Haming") as ReferenceAlias).GetReference().MoveTo(TorriStart)
    (GetAliasByName("Blacksmith") as ReferenceAlias).GetReference().MoveTo(GunnarStart)
    (GetAliasByName("Meadery") as ReferenceAlias).GetReference().MoveTo(VilodStart)
    (GetAliasByName("Ingrid") as ReferenceAlias).GetReference().MoveTo(IngridStart)
EndFunction


Function ShutDown()
	(GetAliasByName("Messenger") as ReferenceAlias).GetReference().Disable()

	If SkaleiRequest.IsRunning() && SkaleiRequest.GetStage() >= 10
		SkaleiRequest.SetStage(100)
	EndIf
	If VilodFavor.IsRunning()
		VilodFavor.SetStage(100)
	EndIf
	
	Stop()
EndFunction

