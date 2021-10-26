Scriptname APFrokisDoor extends ObjectReference

Message Property msg Auto

Event OnActivate(ObjectReference akActionRef)
  If((Game.GetFormFromFile(0x03372B, "Skyrim.esm") as Quest).GetStage() < 1000)
    msg.Show()
  EndIf
EndEvent
