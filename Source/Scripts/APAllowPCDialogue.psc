Scriptname APAllowPCDialogue extends ObjectReference

Actor Property DRAGON  Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	If(akActionRef == Game.GetPlayer())
		dragon.AllowPCDialogue(true)
		dragon.SetRestrained(true)
	EndIf
EndEvent
