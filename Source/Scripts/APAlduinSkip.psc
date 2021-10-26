Scriptname APAlduinSkip extends ObjectReference Hidden

Message Property confirmMsg Auto
int Property myStage Auto

Event OnTriggerEnter(ObjectReference akActionRef)
  If(akActionRef == Game.GetPlayer())
    If(confirmMsg.Show() == 1)
      (Game.GetFormFromFile(0x03372B, "Skyrim.esm") as Quest).SetStage(myStage)
    EndIf
  EndIf
EndEvent
