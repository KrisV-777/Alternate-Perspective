Scriptname APDialoguePlayer extends ReferenceAlias  

String Property MENUPATH = "AlternatePerspectiveMenu" AutoReadOnly Hidden
Quest Property StartingQuest Auto Hidden

String Function GetEventPath() global
	return "Data/SKSE/AlternatePerspective/"
EndFunction

Event OnInit()
  OnPlayerLoadGame()
EndEvent

Event OnPlayerLoadGame()
	RegisterForModEvent("AP_MessengerMenuOpen", "MenuOpen")
	RegisterForModEvent("AP_MessengerMenuSelect", "MenuSelect")
	RegisterForModEvent("AP_MessengerMenuStart", "QuestStart")
EndEvent

Event MenuOpen(string asEventName, string asStringArg, float afNumArg, form akSender)
  UI.OpenCustomMenu(MENUPATH)
	If (SKSE.GetPluginVersion("JContainers64") == -1)
		Debug.MessageBox("[Alternate Perspective]\nMissing JContainers. Only default start options will be available.")
		UI.Invoke("CustomMenu", "_root.main.openMenu")
	Else
		String[] files = JContainers.contentsOfDirectoryAtPath(GetEventPath(), ".json")
		UI.InvokeStringA("CustomMenu", "_root.main.openMenu", files)
	EndIf
EndEvent

Event MenuSelect(string asEventName, string asStringArg, float afNumArg, form akSender)
	If (afNumArg == -1)
		startingQuest = none
		Debug.Trace("[Alternate Perspective] Default (None) Quest selected")
		return
	ElseIf (Game.GetModByName(asStringArg) == 255)
		Debug.Trace("[Alternate Perspective] Quest selected from unloaded mod: " + asStringArg + "/" + afNumArg as int)
		return
	EndIf
	startingQuest = Game.GetFormFromFile(afNumArg as int, asStringArg) as Quest
	If (!startingQuest)
		Debug.Trace("[Alternate Perspective] Unable to find selected Quest: " + asStringArg + "/" + afNumArg as int)
	Else
		Debug.Trace("[Alternate Perspective] Quest selected: " + asStringArg + "/" + afNumArg as int + " / Name (May be empty):" + startingQuest.GetName())
	EndIf
EndEvent

