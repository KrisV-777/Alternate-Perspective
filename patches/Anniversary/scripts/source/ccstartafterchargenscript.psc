;/ Decompiled by Champollion V1.0.1
Source   : CCStartAfterCharGenScript.psc
Modified : 2021-04-19 21:20:51
Compiled : 2021-11-18 09:50:44
User     : builds
Computer : RKVBGSBUILD11
/;
scriptName CCStartAfterCharGenScript extends Quest

;-- Properties --------------------------------------
Int property MyQuestStageToSet auto
Int property optionalRequiredPlayerLevel = 1 auto
{Optional: The level the player must be (at least) in order for the quest to start. Default: 1}
Quest property MQ101 auto
Int property CharGenStageToWatch = 1000 auto
Float property SecondsBetweenChecks = 30.0000 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

; Skipped compiler generated GotoState

function CheckStageToStart()

	;if MQ101.GetStageDone(CharGenStageToWatch) == true && game.GetPlayer().GetLevel() >= optionalRequiredPlayerLevel
	if game.GetPlayer().GetLevel() >= optionalRequiredPlayerLevel
		self.SetStage(MyQuestStageToSet)
	else
		self.RegisterForSingleUpdate(SecondsBetweenChecks)
	endIf
endFunction

function OnUpdate()

	self.CheckStageToStart()
endFunction

function OnInit()

	self.CheckStageToStart()
endFunction
