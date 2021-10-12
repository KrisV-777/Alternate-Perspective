Scriptname APFrokisDoor extends ObjectReference

Message Property msg Auto

Event OnActivate(ObjectReference akActionRef)
  If(Quest.GetQuest("MQ101").GetStage() < 1000)
    msg.Show()
  EndIf
EndEvent
