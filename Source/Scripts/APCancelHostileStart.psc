Scriptname APCancelHostileStart extends Quest  

Quest Property CancelQuest Auto
{The quest to stop when this quest starts}

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
  CancelQuest.Stop()
  Stop()
EndEvent

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
  CancelQuest.Stop()
  Stop()
EndEvent
