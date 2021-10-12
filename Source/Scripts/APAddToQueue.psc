ScriptName APAddToQueue Extends Quest
{Helper Script to add Intro Options to Alternate Perspective
This Script may be copied and shipped with your own mod

Requires PapyrusUtil}

import StorageUtil
; ---------------------------- Properties+
string Property mainHeadline Auto
{What the Player sees when they first talk to The Messanger
Think of this as your Intros headline, try to keep it below 25 Characters}

string Property modPrefix Auto
{Your mods Prefix, should be at least 3 Characters}

Quest[] Property introQuests Auto
{The Introquests for your headline
-> 126 Entries Allowed
-> Must line up with the order of your subHeadlines}

String[] Property subHeadlines Auto
{Headlines for your subOptions, the Player only sees this if there is more than 1 Option
-> 126 Entries Allowed
-> Must line up with the Order of your introQuests}

bool Property allowRandom Auto
{Only applies if there is more than 1 Intro Quest. Should there be a "Random" Option be implemented in your subHeadlines to choose randomly between one of your Options?}

bool Property stopQuestWhenDone Auto
{Stop this Quest when this Script finished processing your data?
QoL Option to allow stopping the Quest without an additional Script if all this Quest is intended to do is adding Options to Alternate Perspective's Start}

; =========================================================
; ============================== ADD TO QUEUE
; =========================================================
Event OnInit()
  string qElem = mainHeadline + ";" + modPrefix
  If(allowRandom)
    qElem += "_Random"
  EndIf
  int i = 0
  While(i < subHeadlines.length)
    qElem += "_" + subHeadlines[i]
    SetFormValue(none, modPrefix + subHeadlines[i], introQuests[i])
    i += 1
  EndWhile
  StringListAdd(none, "APS_queue", qElem, false)
  If(stopQuestWhenDone)
    RegisterForSingleUpdate(5)
  EndIf
EndEvent

Event OnUpdate()
  Stop()
EndEvent
