Scriptname APInnSolitudeExecutionTrig extends ReferenceAlias  

Location Property SolitudeLocation Auto
Location Property SolitudeWinkingSkeeverLocation Auto

Quest Property SolitudeOpening Auto ; Roggvir Execution

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If (akNewLoc == SolitudeWinkingSkeeverLocation)
    return
  ElseIf (akOldLoc == SolitudeWinkingSkeeverLocation && akNewLoc == SolitudeLocation && !SolitudeOpening.GetStageDone(10))
    SolitudeOpening.SetStage(10)
  EndIf
  ; If first loc change after entering winking skever isnt solitude, then
  ; player tped out someplace else and will trigger execution through vanilla means
  GetOwningQuest().SetStage(10)
  GoToState("Done")
EndEvent

State Done
  Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  EndEvent
EndState

