Scriptname APDefaultGatherIngredientAlias extends ReferenceAlias  

GlobalVariable Property objCount  Auto
{Global displaying Object Count}
Ingredient Property Gatherer Auto
{Object to collect}

int Property toGather Auto
{How many Objects to gather to complete the Quest}
int Property stageToSet Auto
{Stage to set the Quest once "toGather" objects have been collected}
int Property gatherObjective Auto
{Quest Objective showing num collected Forms to the Player}

Event OnInit()
  checkProgress()
  AddInventoryEventFilter(Gatherer)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
  checkProgress()
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
  checkProgress()
EndEvent

Function checkProgress()
  Quest owningQ = GetOwningQuest()
  If(owningQ.GetStage() >= stageToSet)
    return
  else
    int numForms = Game.GetPlayer().GetItemCount(Gatherer)
    objCount.Value = numForms
    owningQ.UpdateCurrentInstanceGlobal(objCount)
    owningQ.SetObjectiveDisplayed(gatherObjective, true, true)
    If(numForms >= toGather)
        owningQ.SetStage(stageToSet)
    EndIf
  EndIf
EndFunction