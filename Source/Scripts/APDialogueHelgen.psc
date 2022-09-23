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

Event OnInit()
	If(!IsRunning())
		return
	Endif
	; I dont know why, I dont know how, but this quest can start without filling its required alises
	; COMEBACK: might have to manually fill them in
	RegisterForSIngleUpdate(1)
EndEvent
Event OnUpdate()
	; Delay by 1 sec cause Aliases arent filled by the time OnInit fires
	; Cant assign Helgens Vanilla NPC to a new Editor Loc cause mod conflicts are a thing, zzz
	RestingPilgrimOwner.GetReference().MoveTo(MatlaraStart)
	RestingPilgrimBackup.GetReference().MoveTo(TorolfStart)
	Haming.GetReference().MoveTo(TorriStart)
	Blacksmith.GetReference().MoveTo(GunnarStart)
	Vilod.GetReference().MoveTo(VilodStart)
	Ingrid.GetReference().MoveTo(IngridStart)
EndEvent

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

