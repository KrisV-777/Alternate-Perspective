Scriptname APAddFactionWhileInLoc extends ReferenceAlias  

Faction Property FactionToAdd Auto
{The faction to add to this actor while they are in the specified location}

Location Property LocationToCheck Auto
{The location at which the specified faction is being added}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If (LocationToCheck == akNewLoc)
    GetActorReference().AddToFaction(FactionToAdd)
  ElseIf (LocationToCheck == akOldLoc)
    GetActorReference().RemoveFromFaction(FactionToAdd)
  EndIf
EndEvent
