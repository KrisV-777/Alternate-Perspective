;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_APMQ101PreIntroScene_042000FA Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Matlara.MoveTo(MatlaraStartMarker)
Torri.MoveTo(TorriStartMarker)
Torolf.MoveTo(TorolfStartMarker)
GetOwningQuest().SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Matlara.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property TorriStartMarker  Auto

ObjectReference Property TorolfStartMarker  Auto

ObjectReference Property MatlaraStartMarker  Auto

Actor Property Torolf  Auto

Actor Property Torri  Auto

Actor Property Matlara  Auto

Actor Property PlayerRef  Auto
