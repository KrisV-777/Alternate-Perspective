Scriptname APEnterGameTrigger extends ObjectReference

APMain Property Main  Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor PlayerRef = Game.GetPlayer()
  If(akActionRef == PlayerRef) ; In case the Dragon Buddy flies in here
    Main.enterGame()
    GotoState("Done")
    Disable()
    Delete()
  EndIf
EndEvent

State Done
  Event OnTriggerEnter(ObjectReference akActionRef)
    ;
  EndEvent
EndState

ObjectReference Property PlayerStartMarker  Auto
