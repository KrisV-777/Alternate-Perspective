Scriptname APKawooshEntry extends ObjectReference  

Quest Property KawooshQ  Auto  

Actor Property palyerRef Auto

Event OnLoad() ; The Event requires SKSE. If the Player doesnt have it the Chest will be disabled. Rather no Kawoosh than a broke one.. and no kawoosh without the Arena!
	If(SKSE.GetVersion() == 0.0)
		Disable()
	EndIf
EndEvent

Event OnClose(ObjectReference akActionRef)
	If(akActionRef == palyerRef)
		RemoveAllItems(palyerRef)
		KawooshQ.Start()
	EndIf
EndEvent