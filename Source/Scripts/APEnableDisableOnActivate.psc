Scriptname APEnableDisableOnActivate extends ObjectReference  

ObjectReference Property JailWall  Auto  

Event OnActivate(ObjectReference akActionRef)
  ObjectReference link = GetLinkedRef()
  If(link.IsEnabled())
    DisableLinkChain()
    ; While(link != none)
    ;   link.Disable()
    ;   link.GetLinkedRef()
    ; EndWhile
  Else
    EnableLinkChain()
    ; While(link != none)
    ;   link.Enable()
    ;   link.GetLinkedRef()
    ; EndWhile
  EndIf
EndEvent
