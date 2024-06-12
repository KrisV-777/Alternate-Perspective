Scriptname APAddFactionWhileInLoc extends ReferenceAlias  

Faction Property FactionToAdd Auto
{The faction to add to this actor while they are in the specified location}
Faction Property FactionToAdd2 Auto

Location Property LocationToCheck Auto
{The location at which the specified faction is being added}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If (LocationToCheck == akNewLoc)	
	Actor ref = GetActorRef()
	ref.AddToFaction(FactionToAdd)
	If (FactionToAdd2)
		ref.AddToFaction(FactionToAdd2)
	EndIf
  ElseIf (LocationToCheck == akOldLoc)
	Actor ref = GetActorRef()
	ref.RemoveFromFaction(FactionToAdd)
	If (FactionToAdd2)
		ref.RemoveFromFaction(FactionToAdd2)
	EndIf	
  EndIf
EndEvent
