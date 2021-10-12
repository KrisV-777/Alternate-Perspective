;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_APS_HouseMarkarth_063A5DD8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY homeCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_homeCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY playerHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_playerHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarl Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("Tirggered Fragment")
Alias_Housecarl.GetActorRef().AddToFaction(PotentialMarriageFaction)

HousePurchaseScript purScript = purchaseHouse as HousePurchaseScript
purScript.Purchasehouse(house, housekey, guide, purScript.HPWhiterun)
purScript.whiterunhousevar=1

If FavorQ.GetStageDone(10)
  FavorQ.SetStage(15)
EndIf

;For BYOH - Notify Adoptable that a house has been purchased.
(RelationshipAdoptable as BYOHRelationshipAdoptableScript).UpdateHouseStatus()
Debug.Trace("Done with Vanilla Base")
;Enable House Upgrades
(purchaseHouse as BYOHRelationshipAdoptionHousePurchase).Markarth_EnableChildBedroomAlternative()
int i = 0
While(i < enableMarkers.length)
  enableMarkers[i].enable()
  i += 1
EndWhile

Debug.Trace("Enable House stuff")

Game.GetPlayer().MoveTo(Alias_homeCenter.GetReference())

Debug.Trace("Move player")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FavorQ  Auto

Quest Property PurchaseHouse  Auto

Quest Property RelationshipAdoptable  Auto

Faction Property PotentialMarriageFaction  Auto

Key Property HouseKey  Auto

Cell Property house  Auto

Book Property guide  Auto

ObjectReference[] Property enableMarkers  Auto

ObjectReference[] Property disableMarkers  Auto
