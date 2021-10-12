scriptName dunPostHelgenEnableScript extends ObjectReference

float property myDaysPassed auto
GlobalVariable property gGameDaysPassed auto
Location property myLocation auto
ObjectReference property myBridgeDebris auto
ObjectReference property myBridge auto
ObjectReference myLink

quest property MQ101 auto

;****************************

Event onLoad()
	myLink = getLinkedRef() as ObjectReference
	if (myDaysPassed <= gGameDaysPassed.getValue()) && (game.getPlayer().IsInLocation(myLocation) == false)
		if (MQ101.IsCompleted())
			myLink.enable()
			myBridge.disable()
			myBridgeDebris.disable()
			disable()
		else
			myDaysPassed = gGameDaysPassed.getValue() + 4;
		endif
	endif
endEvent

;****************************