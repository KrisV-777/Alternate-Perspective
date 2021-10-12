Scriptname APKawooshSpawnMe extends ObjectReference

LeveledActor[] Property Waves  Auto

Activator Property summonFX  Auto

Spell Property DeathTrack Auto

int Wave

Event OnCellLoad()
  RegisterForModEvent("AP_SpawnNow", "Spawning")
  Wave = 0
EndEvent

Event Spawning(string eventName, string strArg, float numArg, Form sender)
  Debug.Trace("AP: Spawning Actor")
  ActorBase toPlace = fetchActorInstance(Waves[Wave])
  If(!toPlace)
    return
  EndIf
  (Self as ObjectReference).PlaceAtMe(summonFX)
  Utility.Wait(0.1)
  ((Self as ObjectReference).PlaceActorAtMe(toPlace, 0)).AddSpell(DeathTrack)
  Wave += 1
EndEvent

ActorBase Function fetchActorInstance(LeveledActor instance)
  Form tmp = instance.GetNthForm(Utility.RandomInt(0, instance.GetNumForms() - 1))
  If(tmp as ActorBase)
    return tmp as ActorBase
  ElseIf(tmp as LeveledActor)
    return fetchActorInstance(tmp as LeveledActor)
  Else
    Debug.Trace("AP: fetchActorInstance returned invalid Target")
    return none
  EndIf
EndFunction
