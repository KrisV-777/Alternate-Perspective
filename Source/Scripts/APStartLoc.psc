Scriptname APStartLoc Hidden

ObjectReference Function GetStartLoc() global
  return Game.GetFormFromFile(0x317E97, "AlternatePerspective.esp") as ObjectReference
  ; return Game.GetFormFromFile(0x075134, "AlternatePerspective.esp") as ObjectReference ; Classic Start Marker
EndFunction