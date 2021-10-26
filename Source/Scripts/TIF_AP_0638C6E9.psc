;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF_AP_0638C6E9 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int choice = split.show()

If choice == 0
return
endif

Utility.Wait(1.1)
WarpTime.Apply()
Utility.Wait(2.5)

If choice == 1
MQ101.SetStage(6)
elseif choice == 2
MQ101.SetStage(7)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; Moved into Fragment1 because choice gets reset between Fragments apparently
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ101  Auto  

Message Property Split  Auto  

ImageSpaceModifier Property WarpTime  Auto  
