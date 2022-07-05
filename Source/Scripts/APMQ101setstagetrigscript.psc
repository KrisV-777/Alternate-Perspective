Scriptname APMQ101setstagetrigscript extends ObjectReference  
{trigger looking for a particular base actor
 to set a quest stage

 custom made for MQ101, listening for MQQuickstart
}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

int property stage auto
{ stage to set}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

ActorBase property TriggerActor01 auto
{actor that trigger is looking for, if MQQuickstart == 7}

ActorBase property TriggerActor02 auto
{actor that trigger is looking for, if MQQuickstart < 7}

bool property disableWhenDone = true auto
{ disable myself after I've been triggered. Defaults to true }

bool property onlyOnce = true auto
{ stage will be set only once. Defaults to true }

GlobalVariable Property MQQuickStart Auto

auto STATE waitingForActor
	EVENT onTriggerEnter(objectReference triggerRef)
		; check for correct actor
		actor actorRef = triggerRef as actor
		if actorRef == None || prereqStageOPT > -1 && MyQuest.getStageDone(prereqStageOPT) != 1
			return
		endif
		if MQQuickStart.Value == 7 && actorRef.GetActorBase() == TriggerActor01 \
			|| MQQuickStart.Value < 7 && actorRef.GetActorBase() == TriggerActor02
			myQuest.setStage(stage)
			if onlyOnce
				gotoState("hasBeenTriggered")
			endif
			if disableWhenDone
				Disable()
			endif
			; trace(self+" triggered by "+actorRef)
		else
			; trace(self+" didn't trigger for base actor " + actorRef.GetActorBase() + " <> " + TriggerActor)
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

