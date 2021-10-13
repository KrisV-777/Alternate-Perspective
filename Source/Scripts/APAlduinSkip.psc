Scriptname APAlduinSkip extends ObjectReference Hidden

; Crashes the Game

Message Property confirmMsg Auto
Quest Property MQ101 Auto
int Property myStage Auto

Event OnTriggerEnter(ObjectReference akActionRef)
  If(akActionRef == Game.GetPlayer())
    If(confirmMsg.Show() == 1)
      MQ101.SetStage(myStage)
    EndIf
  EndIf
EndEvent
