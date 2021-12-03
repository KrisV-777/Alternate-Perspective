Scriptname APTestReset extends ObjectReference  

ObjectReference[] Property Subjects  Auto  
ObjectReference Property spawn Auto

ActorBase[] Property spawnBases Auto

Message Property spawnList Auto

ObjectReference spawned = none

Event OnActivate(ObjectReference akActionRef)
	If(!spawned)
		int c = spawnList.Show()
		If(c > 0)
			spawned = spawn.PlaceAtMe(spawnBases[c - 1])
		EndIf
	Else
		(spawned as Actor).Kill()
		spawned.Disable()
		spawned.Delete()
		spawned = none
	EndIf
EndEvent