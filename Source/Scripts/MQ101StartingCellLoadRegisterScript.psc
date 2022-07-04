Scriptname MQ101StartingCellLoadRegisterScript extends ReferenceAlias  
{one in each starting cell to notify quest when cells are loaded}

GlobalVariable Property MQQuickstart Auto

auto state waiting
Event OnCellLoad()
; 	debug.trace(self + ": OnCellLoad")
	if MQQuickstart.Value >= 7
		return
	endif
	MQ101QuestScript myQuest = GetOwningQuest() as MQ101QuestScript
	if myQuest.GetStage() < 15
		gotoState("done")
		myQuest.RegisterStartingCellLoad()
	endif
endEvent
endState

state done
endState
