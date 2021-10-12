Scriptname APKawooshEntry extends ObjectReference  

Quest Property KawooshQ  Auto  

Actor Property palyerRef Auto

Event OnClose(ObjectReference akActionRef)
	If(akActionRef == palyerRef)
		RemoveAllItems(palyerRef)
		KawooshQ.Start()
	EndIf
EndEvent