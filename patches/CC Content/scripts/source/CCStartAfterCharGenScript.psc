Scriptname CCStartAfterCharGenScript extends Quest  

Quest Property MQ101  Auto
Int Property CharGenStageToWatch = 1000 Auto  
Int Property MyQuestStageToSet  Auto 
Float Property SecondsBetweenChecks = 30.0 Auto

Event OnInit()
	CheckStageToStart()
EndEvent

Event OnUpdate()
	;CheckStageToStart()
	CheckStageToStartUpdate()
EndEvent

Function CheckStageToStart()
	;if MQ101.GetStageDone(ChargenStageToWatch) == true
	;	SetStage(MyQuestStageToSet)
	;else
		RegisterForSingleUpdate(SecondsBetweenChecks)
	;endif
EndFunction

Function CheckStageToStartUpdate()
	SetStage(MyQuestStageToSet)
EndFunction