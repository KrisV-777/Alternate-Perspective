Scriptname APEnterGameTrigger extends ObjectReference

APMessengerUtil Property Main  Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor PlayerRef = Game.GetPlayer()
  If(akActionRef == PlayerRef) ; In case the Dragon Buddy flies in here
    GotoState("Done")
    Disable()
    Delete()
    Main.enterGame()
  EndIf
EndEvent

State Done
  Event OnTriggerEnter(ObjectReference akActionRef)
    ;
  EndEvent
EndState

ObjectReference Property PlayerStartMarker  Auto
