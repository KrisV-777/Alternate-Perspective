Scriptname APStartCellDoor extends ObjectReference  
{Unused}

ObjectReference[] Property customStartLoc = none Auto
{The Location(s) this Door should lead to}

Quest Property customIntroQst = none Auto
{The Quest to start upon using this Door}

Actor Property PlayerRef Auto
{Autofill me}

Message Property AP_ReadyMsg Auto
{Autofill me}

Event OnOpen(ObjectReference akActionRef)
  If(akActionRef == PlayerRef)
    If(AP_ReadyMsg.Show() == 1)
	PlayerRef.MoveTo(customStartLoc[Utility.RandomInt(0, (customStartLoc.Length - 1))])
	Utility.Wait(0.5)
	If(customIntroQst != none)
	  customIntroQst.Start()
	EndIf
    else
      SetOpen(false)
    EndIf
  EndIf
EndEvent