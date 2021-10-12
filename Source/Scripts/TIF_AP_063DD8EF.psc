;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF_AP_063DD8EF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
FadeToBlackHoldImod.Apply()
Game.DisablePlayerControls()
Quest.GetQuest("APS_MQSkipRalof").Start()
Game.EnablePlayerControls()
FadeToBlackHoldImod.Remove()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  
