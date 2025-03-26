Scriptname APSetRestrainedWhenSeated extends Actor  

Event OnSit(ObjectReference furniture)
	SetRestrained(True)
EndEvent

Event OnGetUp(ObjectReference furniture)
	SetRestrained(False)
EndEvent
