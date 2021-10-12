Scriptname APTestReset extends ObjectReference  

ObjectReference[] Property Subjects  Auto  


Event OnActivate(ObjectReference akActionRef)
	int count = Subjects.Length
	While(Count)
		count -= 1
		Subjects[count].Reset()
	EndWhile
EndEvent