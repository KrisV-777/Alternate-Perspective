Scriptname APKawooshTmp extends ObjectReference

weapon Property Kawoosh Auto

Actor Property PlayerRef Auto

ObjectReference Property Keep Auto

Event OnCellLoad()
  AddInventoryEventFilter(Kawoosh)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
  If(akBaseItem == Kawoosh)
    RemoveItem(akBaseItem, 1, abSilent = false, akOtherContainer = PlayerRef)
    PlayerRef.EquipItem(akBaseItem)
  EndIf
EndEvent

Event OnClose(ObjectReference akActionRef)
	If(akActionRef == PlayerRef)
		RemoveAllItems(PlayerRef)
		PlayerRef.MoveTo(Keep)
	EndIf
EndEvent
