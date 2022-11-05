Scriptname APMQ101 extends Quest

import Game
; ---------------------------- Properties
MQ101QuestScript Property qstScr Auto
APStartIntroBedScript Property introBedScr Auto
Actor Property PlayerRef Auto
Quest Property HousePurchase Auto
Quest Property DialogueHelgen Auto
Outfit Property FarmClothesOutfit02 Auto
Armor Property ClothesFarmClothes02 Auto
Armor property ClothesFarmBoots02 Auto
MiscObject Property Gold001 Auto
; ImageSpaceModifier Property FadeToBlackBackImod Auto
ImageSpaceModifier Property FadeToBlackHoldImod Auto
ImageSpaceModifier Property FadeUpFromBlack Auto
Idle Property IdleDLC1BossExplosion1stP Auto
Idle Property TG05_GetUp Auto
SoundCategory Property Master Auto
ObjectReference Property titleSequenceMarker Auto
{Marker to move the Player to during Title Sequence to (to get rid of the Subtitles)}
ObjectReference Property kdMarker2 Auto
{Where to port the Player after Title Sequence}
ObjectReference Property enterTrigger Auto
{Triggerbox to get the player out of start cell. Have to enable it after the Character Creation, otherwise it would activate when the player spawns in the cell}
ObjectReference Property APMarker Auto
{Enable This Marker to Disable AP Pre-Destoryed Objects}
; ==================================================
; ============================= GAME START
; ==================================================
Function GameStart()
  ; Debug.Trace("AP: Gamestart")
  ; FadeToBlackHoldImod.Apply()
  ; PrecacheCharGen()
  DisablePlayerControls(abMovement = True, abFighting = True, abCamSwitch = True, abLooking = True, abSneaking = True, abMenu = True, abJournalTabs = True) ; .. so the player doesnt do anything stupid
  PlayerRef.RemoveAllItems()
  ; Boots need to be equipped before the clothes, otherwise game ctds, i dunno why
  PlayerRef.AddItem(ClothesFarmBoots02, 1, true)
  PlayerRef.EquipItem(ClothesFarmBoots02, abSilent = true)
  PlayerRef.AddItem(ClothesFarmClothes02, 1, true)
  PlayerRef.EquipItem(ClothesFarmClothes02, abSilent = true)
  PlayerRef.AddItem(Gold001, 72, true)
  PlayerRef.MoveTo(APStartLoc.GetStartLoc())
  While(!PlayerRef.Is3DLoaded())
    Utility.Wait(0.05)
  EndWhile
  ; FadeToBlackBackImod.Apply()
  ; Utility.Wait(1.5)
  ShowRaceMenu()
  Utility.Wait(0.3) ; Will pause the script until Player exits RaceMenu
  qstScr.AddRaceSpells()
  Utility.Wait(0.1)
  SetInCharGen(false, false, false)
  ; PrecacheCharGenClear()
  EnablePlayerControls()
  enterTrigger.Enable()
	; Misc Stuff
  RequestSave()
  Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
  If(!DialogueHelgen.Start())
    Debug.MessageBox("Failed to start Dialogue Quest")
    Debug.Trace("[AP] Failed to start Dialogue Quest")
  Else
    (DialogueHelgen as APDialogueHelgen).SetPositions()
  EndIf
	HousePurchase.SetStage(5)
EndFunction

; ==================================================
; ============================= PREPARE INTRO
; ==================================================
Function prepareIntro()
  SetStage(1)
  introBedScr.StartIntro = true
EndFunction

; ==================================================
; ============================= DESTROY HELGEN
; ==================================================
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
  if (akSource == qstScr.Alduin.GetActorRef()) && (asEventName == "TowerLandImpact") && !GetStageDone(4)
		Debug.SendAnimationEvent(PlayerRef, "StaggerStart")
	EndIf
EndEvent

Function knockoutPlayer()
  ; For recap: Were currently using a Weak Blur which has been applied by Alduins second shout (a custom Storm Call)
  ; This here will knock down the Player to give a fluent transition from Alduins appearance to Helgens Destruction
  qstScr.CGDragonAttackBlurLong.PopTo(qstScr.PlayerAlduinIMOD) ; Swap soft blurr with strong one
  DisablePlayerControls(abCamSwitch = true, abLooking = true)
  Utility.Wait(0.3) ; Imod
  ForceFirstPerson()
  SetHudCartMode()
  PlayerRef.PlayIdle(IdleDLC1BossExplosion1stP)
  Utility.Wait(3) ; Imod
  Master.Mute()
  Utility.Wait(2) ; Imod completely blacks out the game
  qstScr.PlayerAlduinIMOD.PopTo(FadeToBlackHoldImod)
  PlayerRef.MoveTo(titleSequenceMarker, abMatchRotation = false) ; Move player away from fighting NPC to get rid of Subtitles
  ShowTitleSequenceMenu() ; Vanilla Title Sequence (Bethesda presents..)
  RegisterForSingleUpdate(4)
  ; Second part of the Intro starts now
  SetStage(145) ; destory Helgen
  Utility.Wait(35) ; Title Sequence Duration
  PlayerRef.MoveTo(kdMarker2) ; back to Helgen
  Master.UnMute()
  Utility.Wait(5)
  PlayerRef.ResetHealthAndLimbs()
  FadeToBlackHoldImod.PopTo(FadeUpFromBlack) ; fade the Screen back in
  PlayerRef.PlayIdle(TG05_GetUp)
  ; Utility.Wait(1.5)
  ; Player should be free to move now & escape Helgen. Yay.
EndFunction

;/ ----------------------- Vanilla Intro Stuff
I have to admit the Vanilla Intro is remarkably complicated. I keep track of everything that happens step by step here
00) MQ101 Quest Start alongside the Scene "MQ101Scene1"
01) Stage 0 - Stage 10 & Time
02) Stage 10 - Move all Actors in Position at the end of the Road to Helgen and enable the Horses. This is also where the player Controls will be disabled, from here till ~Step 5) the Player will see the Intro Sequence Title Frame Thing "Bethesda presents.. Skyrim"
(Fun fact: Currently the Player doesnt actually exists, as in they have no model. They do however have armor & weaponry equipped)
03) Stage 10 - The Carriage horses have a Script attached to them; When they load in, they call "RegisterStartingCellLoad()" in the MQ101 Script multiple times. When this Function is called the second time, it will set the Stage to 12
04) Stage 12 - Checks that every Actor is actually loaded in and sits everyone into the cart (in Stage10 they were just AFKin next to it) also tethers the horses
05) Stage 12 - When we hit Stage12, MQ101 Scene can proceed to Phase3. This Action only holds a 2 Second Timer and will SetStage15 after thats done
(Note: The Vanilla Intro Scene (Hey, youre finally awake blabla) starts from here without interception with a 45 second timer and then Dialogue)
(Note1: While traveling down, there is a Trigger Box to enable multiple wildlife creatures & a few other Boxes to make them use some Idles)
06) Stage 15 - All Actors that are moving the Prisoners to Helgen (2 Horses, Tullius, Hadvar) evaluate their Package. Theres a Package in the Alias attached to all of them conditioned to Stage 15 which makes them move down to Helgen, following a Path of Linked Refs
07) Stage 15 - Upon getting near Helgen, SetStage 20
08) Stage 20 - The track from Stage15 ends here, open the Gate to Helgen and evaluate Package for Hadvar & Carriages to follow a new Track that leads to the Execution Plaza. The Following Stages are all triggered on this way and dont seem to have any additional interaction somewhere (yaaay its getting simple)
09) Stage 20 - Once going past the door, SetStage22
10) Stage 22 - Enabling Crowd Sounds, Tullius makes Elenwen move forward
11) Stage 25 - North Gate closed; Scene with Torri (Haming) & Torolf starts here ("I wanna watch the Soldiers - go inside cup" the short Scene with the child)
12) Stage 26 - East Gate Closed
13) Stage 30 - Disable the Civilians outside of Helgen and reassure that the Horses are executing the correct AI Package
14) Stage ?? - Once the Scene between Haming & Torolf stops, they are disabled (Before the Scene ends they go inside the House behind them which will be APs Inn)
15) Stage ?? - Within this general timeframe "MQ101Scene1" finishes, which sets the Stage to 35
16) Stage 35 - Starts Scene "MQ101Scene3" - the Scene in which he talks about the girl in Helgen and Imperial Walls so save blabla
17) Stage 37 - An additional check to ensure that the Horses are using the correct AI Package
18) Stage 40 - Precaching CharGen, Disabling some irrelevant Actors & resettings Idles to get ready for leaving the Carriage
19) Stage 40 - Our Scene3 - which is stuck on Phase6 until we hit Stage40 - can continue here
20) Stage 40 - When both Horses finish their travel Package (move to execution plaza), set stage to 41
21) Stage 41 - Scene can continue here, the Imperial Commander commands everyone off the cart; setting Stage to 42
22) Stage 42 - Setting MotionType of the 1st Cart to Keyframed (disallowing Havok to influence it in any way) and the Driver leaves cart
23) Stage 42 - When the 1st Driver (Imperial02) finished getting off the cart, set stage to 45
24) Stage 45 - Allowing the Scene to continue (Phase 10) which Sets Stage to 50
25) Stage 50 - Everyone from Cart1 gets out, Cart2 stops, executing Stage46 Script. Cart2 Motiontype to Keyframed & Driver off Cart. Scene continues simulatenously, setting Stage to 54
26) Stage 50 - Once Cart1 Prisoners get off cart, SetStage 60 (Im unsure which QuestStage were at in the following steps as this happens almost simulatenously)
27) Stage ?? - Cart2 Prisoners get off cart, this is the cart the Player & Ulfric are part of
28) Stage ?? - Scene will execute Stage62 Script which forces Hadvar & the Captain to evaluate their Package
27) Stage ?? - Once Cart2 Prisoners exited the Cart, Setage 64 which will SetStage 70
(Fun Fact: Apparently there were meant to be 4 groups of Prisoners instead of 2... whoa. Confused me quite a bit until I realized that)
28) Stage 70 - End Scene3 & Start Scene4, also the Dragon Quests starts here (ssspicy)
29) Stage 70 - Scene4 executed Stage65 Script, set CharGen & Save Game
30) Stage 70 - Scene4 executed Stage67 Script, headtracking stuff
31) Stage 70 - Very little script here, we just let the Scene play. All the Prisoners to the Block, Lokir ded blabla
32) Stage 70 - Player is asked to step forward, playing their hands bound idle & head bob enable. Setting Stage to 75 once Package completes
33) Stage 75 - Show Race Menu, Player race specific talk etc. SetStage 80 after thats done & Player walks to the Execution Plaza
34) Stage 80 - Autosave, give player Racespecific Spells n stuff. Scene plays on until 1st Dragon Roar, SetStage 82
35) Stage 82 - First Roar.. ye. Not much to tell. Continue Scene till Stage 85 hits
36) Stage 85 - Execution Nr1 \o/ Once hes dead, SetStage 90
37) Stage 90 - Empty.. we jus continue with Scene. Heres on instance where we refer to the Prisoners Race again
38) Stage 90 - Second Roar, execute Stage84 Script (only contains Dragon Roar)
39) Stage 90 - Continue with Scene until Player is asked to move to the block, SetStage 95
40) Stage 95 - Player to the Block, evaluate their Package n stuff yay. Once the Package Completed, SetStage 97
41) Stage 97 - Our best bud the guy with the Axe is bout to chop some dovakhin head. The Furniture sets Stage to 98
42) Stage 98 - Spawning Alduin which flies through a Trigger Box setting Stage to 99. This Stage restrains the Player
43) Stage 99 - Register for Anim Events when Alduin lands. Also Scene4 stops here and we start Alduins Attack Scene. Setting Stage to 100
44) Stage 100 - Alduin attacks Helgen & knocks out the Player, we rapdidly move from Stage 100 to 160 and destroy Helgen in the process
/;
