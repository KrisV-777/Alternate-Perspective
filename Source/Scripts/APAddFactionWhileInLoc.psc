Scriptname APAddFactionWhileInLoc extends ReferenceAlias  

Faction Property FactionToAdd Auto
{The faction to add to this actor while they are in the specified location}

Location Property LocationToCheck Auto
{The location at which the specified faction is being added}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If (LocationToCheck == akNewLoc)
		Actor ref = GetReference() as Actor
    ref.AddToFaction(FactionToAdd)
		ref.StopCombatAlarm()
  ElseIf (LocationToCheck == akOldLoc)
    GetActorRef().RemoveFromFaction(FactionToAdd)
  EndIf
EndEvent
