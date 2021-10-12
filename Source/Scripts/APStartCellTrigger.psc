Scriptname APStartCellTrigger extends ObjectReference

Quest Property startCellQ Auto

Event OnTriggerEnter(ObjectReference akActionRef)
  Utility.Wait(0.7)
  ; startCellQ.Start()
  startCellQ.SetObjectiveDisplayed(0)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  startCellQ.CompleteAllObjectives()
  startCellQ.Stop()
EndEvent
