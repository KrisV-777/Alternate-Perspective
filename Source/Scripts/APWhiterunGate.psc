Scriptname APWhiterunGate extends ReferenceAlias

Quest Property MQ101 Auto

Auto State mqRunning
  Event OnCellAttach()
    If(MQ101.IsRunning())
      GetReference().Lock(false)
    else
      GetReference().Lock(true)
      GotoState("Done")
    EndIf
  EndEvent
EndState

State Done
  Event OnCellAttach()
    ;shut it
  EndEvent
EndState
