Scriptname APEnableDisableLinkedRefSpec extends ObjectReference  

ObjectReference Property triggerRef Auto

bool property enable auto


Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == triggerRef
		If enable
			GetLinkedRef().Enable()
		Else
			GetLinkedRef().Disable()
		EndIf
	EndIf
EndEvent