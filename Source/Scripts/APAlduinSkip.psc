Scriptname APAlduinSkip extends ObjectReference Hidden

Message Property confirmMsg Auto
int Property myStage Auto

Event OnTriggerEnter(ObjectReference akActionRef)
  If(akActionRef == Game.GetPlayer())
    If(confirmMsg.Show() == 1)
      Quest.GetQuest("MQ101").SetStage(myStage)
    EndIf
  EndIf
EndEvent
