ScriptName APAddToQueue Extends Quest
{This script is redundant with the 4.0 Update. Please use the .json schema instead.
See the github Wiki (linked on the Alternate Perspective Nexus Forum Page) for more information}

import StorageUtil
; ---------------------------- Properties
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

int Function MakeOptionEntry(int n, String text)
  int ret = JMap.object()
  int qid = introQuests[n].GetFormID()
  int idx = Math.RightShift(qid, 24)
  int formid
  String mod
  If (idx == 0xFE)
    idx = Math.LogicalAnd(Math.RightShift(qid, 12), 0xFFF)
    mod = Game.GetLightModName(idx)
    formid = Math.LogicalAnd(0xFFF, qid)
  Else
    mod = Game.GetModName(idx)
    formid = Math.LogicalAnd(0xFFFFFF, qid)
  EndIf
  JMap.setStr(ret, "mod", mod)
  JMap.setInt(ret, "id", Math.LogicalAnd(formid, qid))
  JMap.setStr(ret, "text", text)
  return ret
EndFunction

Event OnInit()
  String filename = "__LEGACY_" + mainHeadline + ".json"
  String filepath = APDialoguePlayer.GetEventPath() + filename
  If (JContainers.fileExistsAtPath(filepath))
    return
  EndIf
  Debug.Messagebox("[Alternate Perspective]\nWith V4.0, the Helper script used to register starting-events has been made redundant in favor of a .json registration format. Alternate Perspective will use the data stored in this script to create a sporadic, minimal .json for use with V4.0. Once this has completed you will gain another messagebox to confirm the completion of this process.\n\nYou will see this notification once for every instance of this helper script.\nDo NOT talk to the Messenger until ALL confirmation messages have been received.\nInstance Headline: " + mainHeadline)

  int root = JValue.retain(JArray.object(), "AP_Update")
  int rootobj = MakeOptionEntry(0, mainHeadline);
  JArray.addObj(root, rootobj)

  If (introQuests.Length > 1)
    int jArr = JArray.object()
    If (allowRandom)
      int jIt = JMap.object()
      JMap.setInt(jIt, "id", 0)
      JMap.setStr(jIt, "text", "$AltPersp_Random")
      JArray.addObj(jArr, jIt)
    EndIf
    int i = 0
    While (i < introQuests.Length)
      int jIt = MakeOptionEntry(i, subHeadlines[i])
      JArray.addObj(jArr, jIt)
      i += 1
    EndWhile
    JMap.setObj(rootobj, "suboptions", jArr)
  EndIf

  JValue.writeToFile(root, filepath)
  JValue.release(root)

  Debug.Messagebox("[Alternate Perspective]\nUpdated instance with headline: " + mainHeadline + " Filename: " + filename + "\n\nEnsure that all key values are in lowercase letters.\nRemember to delete this file once the associated project has updated to V4.0")

  If(stopQuestWhenDone)
    RegisterForSingleUpdate(5)
  EndIf
EndEvent

Event OnUpdate()
  Stop()
EndEvent
