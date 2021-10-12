Scriptname APSFriendTillHit extends ReferenceAlias

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
  If(akTarget == Game.GetPlayer() && aeCombatState == 1)
    GetOwningQuest().Stop()
  EndIf
EndEvent

Event OnDying(Actor akKiller)
  If(akKiller == Game.GetPlayer())
    GetOwningQuest().Stop()
  EndIf
EndEvent
