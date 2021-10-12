;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_APS_MQSkip_063D36E9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY portLoc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_portLoc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.GetPlayer()

(MQ101 as MQ101QuestScript).FactionPath = 1
APMain.DestroyHelgen()
MQ101.SetStage(500)
MQ101.SetStage(800)
MQ101.SetStage(1000)
MQ101.CompleteAllObjectives()
MQ101.CompleteQuest()
MQ105.SetStage(1)
Player.MoveTo(Alias_portLoc.GetReference())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ105  Auto

Quest Property MQ101  Auto
