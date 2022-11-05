Scriptname APDialogueHelgen extends Quest  

ReferenceAlias Property RestingPilgrimOwner Auto
ReferenceAlias Property RestingPilgrimBackup Auto
ReferenceAlias Property Haming Auto
ReferenceAlias Property Blacksmith Auto
ReferenceAlias Property Vilod  Auto
ReferenceAlias Property Ingrid Auto

ObjectReference Property MatlaraStart Auto
ObjectReference Property TorolfStart Auto
ObjectReference Property TorriStart Auto
ObjectReference Property GunnarStart Auto
ObjectReference Property VilodStart Auto
ObjectReference Property IngridStart Auto

Quest Property SkaleiRequest  Auto  
Quest Property VilodFavor  Auto  

Function SetPositions()
	RestingPilgrimOwner.GetReference().MoveTo(MatlaraStart)
	RestingPilgrimBackup.GetReference().MoveTo(TorolfStart)
	Haming.GetReference().MoveTo(TorriStart)
	Blacksmith.GetReference().MoveTo(GunnarStart)
	Vilod.GetReference().MoveTo(VilodStart)
	Ingrid.GetReference().MoveTo(IngridStart)
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

