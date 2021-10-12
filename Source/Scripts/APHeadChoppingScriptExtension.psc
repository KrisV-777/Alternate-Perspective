Scriptname APHeadChoppingScriptExtension extends HeadChopBlockHookupSCRIPT
{Script to override the chopping stuff. I wont edit the original script to avoid conflicting with other mods that want to use this Furniture in some way
Every Game.GetPlayer() instance has been replaced with Prisoner02}

import utility
import Debug


Actor Property Prisoner02 Auto

ObjectReference executionerActor

ObjectReference executioneeActor

ObjectReference executionGuardActor

;*****************************************

auto STATE readyToChop

Event OnActivate( ObjectReference akActionRef )
; 	debug.trace(self + " OnActivate: " + akActionRef)
	if ( akActionRef.HasKeyword( executionerKeyword ) )
; 		debug.trace(self+ "The executioner is in place: " + akActionRef )
		executionerActor = akActionRef
	elseif ( akActionRef.HasKeyword( executionGuardKeyword ) )
; 		debug.trace(self+ "The execution guard is in place: " + akActionRef )
		executionGuardActor = akActionRef
	elseif (akActionRef == Prisoner02 || akActionRef == Game.GetPlayer())
		;Make sure the player can't look around during the execution
; 		debug.trace(self+ "The victim is in place: " + akActionRef )
		executioneeActor = akActionRef
	else
; 		debug.trace(self+ "The victim is in place: " + akActionRef )
		executioneeActor = akActionRef
	endif


	;if it's ready, then do the chop!
	if ( executioneeActor != none && executionGuardActor != none && executionerActor != none )
		gotoState("chopping")
; 		debug.trace(self+ "Both in place, ready to chop" )
		RegisterForSingleUpdate(0.5)
	endif
endEvent

endState

STATE chopping
	; do nothing for now
endState

Event OnUpdate()
; 	debug.trace(self + " OnUpdate")
	;if it's ready, then do the chop!
	if ( executioneeActor != none && executionerActor != none )
; 		debug.trace(self+ "CHOPPING START" )
		wait(0.5)

		;set up the relationship
		if ( !executioneeActor.AddDependentAnimatedObjectReference( executionerActor ) || !executioneeActor.AddDependentAnimatedObjectReference( executionGuardActor ) )
			Notification( "dependence broken." )
		endif

		;play the idle and wait..
		Actor myExecutionee = executioneeActor as Actor
		Actor myExecutioner = executionerActor as Actor
		; do NOT kill the player!
		if myExecutionee == Prisoner02 || myExecutionee == Game.GetPlayer()
			If (!myExecutioner.PlayIdle( playerAnimIdle) )
; 				debug.trace(self+ "executioner  play idle failed" )
			EndIf

			if ( !myExecutionee.PlayIdle( playerAnimIdle ) )
; 				debug.trace(self+ "player play idle failed" )
			endif
			wait(5)
			MQ101.SetStage(98)
		else
			if ( !myExecutionee.PlayIdle( animIdle ) )
; 				debug.trace(self+ " play idle failed" )
			endif
			wait(2)
		endif

		;Now clean up.  Set the executionee to NULL, since he's no longer needed...
		executioneeActor.RemoveDependentAnimatedObjectReference( executionerActor )
		executioneeActor.RemoveDependentAnimatedObjectReference( executionGuardActor )
		executioneeActor = none
		gotoState("readyToChop")
; 		debug.trace(self+ "CHOPPING END" )
	endif
endEvent
