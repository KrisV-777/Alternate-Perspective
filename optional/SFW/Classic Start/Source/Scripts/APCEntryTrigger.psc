Scriptname APCEntryTrigger extends ObjectReference

APMain Property Main Auto

Auto State CharGen
  Event OnTriggerLeave(ObjectReference akActionRef)
    Main.SetActors()
    GotoState("Done")
    Disable()
    DeleteWhenAble()
  EndEvent
EndState

State Done
EndState
