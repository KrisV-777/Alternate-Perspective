Scriptname APStartIntroBedScript extends ObjectReference

bool Property StartIntro = false Auto Hidden

Actor Property PlayerRef Auto
Quest Property MQ101 Auto
ObjectReference Property helgenInnMarker Auto
ImageSpaceModifier Property FadeToBlackHoldImod Auto
ImageSpaceModifier Property Woozy Auto
GlobalVariable Property GameHour Auto
Idle Property WakeUp Auto

Event OnActivate(ObjectReference akActionRef)
  If(StartIntro)
    RegisterForSleep()
  EndIf
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
  If(PlayerRef.GetDistance(Self) < 500)
    FadeToBlackHoldImod.Apply()
    PlayerRef.MoveTo(helgenInnMarker)
    Game.DisablePlayerControls(ablooking = true, abCamSwitch = true)
    Game.ForceFirstPerson()
    FadeToBlackHoldImod.PopTo(Woozy)
    MQ101.SetStage(3)
    Utility.Wait(0.2)
    PlayerRef.PlayIdle(WakeUp)
    Utility.Wait(11.3)
    Game.EnablePlayerControls()
  EndIf
EndEvent
