Scriptname APEnableDisableOnActivate extends ObjectReference  

ObjectReference Property JailWall  Auto  

Event OnActivate(ObjectReference akActionRef)
  ObjectReference link = GetLinkedRef()
  If(link.IsEnabled())
    DisableLinkChain()
  Else
    EnableLinkChain()
  EndIf
EndEvent
