Scriptname APFrokisDoor extends ObjectReference

Message Property msg Auto
Quest Property MQ101 Auto

Event OnActivate(ObjectReference akActionRef)
  If(MQ101.GetStage() < 1000)
    msg.Show()
  EndIf
EndEvent
