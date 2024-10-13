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
	bool j0 = SKSE.GetPluginVersion("JContainers64") == -1
	bool j1 = SKSE.GetPluginVersion("JContainersGOG") == -1
	bool j2 = SKSE.GetPluginVersion("JContainersVR") == -1
	If (j0 && j1 && j2)
		Debug.MessageBox("[Alternate Perspective]\nMissing JContainers. Only default start options will be available.")
		UI.Invoke("CustomMenu", "_root.main.openMenu")
	Else
		String[] files = JContainers.contentsOfDirectoryAtPath(GetEventPath(), ".json")
		UI.InvokeStringA("CustomMenu", "_root.main.openMenu", files)
	EndIf
EndEvent

Event MenuSelect(string asEventName, string asStringArg, float afNumArg, form akSender)
	String msgErr = "[Alternate Perspective]\nInvalid Intro Quest:\n\n"
	If (afNumArg == -1)
		startingQuest = none
		Debug.Trace("[Alternate Perspective] Default (None) Quest selected")
		return
	ElseIf (Game.GetModByName(asStringArg) == 255)
		Debug.MessageBox(msgErr + "The mod " + asStringArg + " is not loaded into your game.")
		Debug.Trace("[Alternate Perspective] Quest selected from unloaded mod: " + asStringArg + "/" + afNumArg as int)
		return
	EndIf
	startingQuest = Game.GetFormFromFile(afNumArg as int, asStringArg) as Quest
	If (!startingQuest)
		Debug.MessageBox(msgErr + "The FormID " + (afNumArg as int) + " does not reference a quest in " + asStringArg + ".")
		Debug.Trace("[Alternate Perspective] Unable to find selected Quest: " + asStringArg + "/" + afNumArg as int)
	Else
		Debug.Trace("[Alternate Perspective] Quest selected: " + asStringArg + "/" + afNumArg as int + " / Name (May be empty):" + startingQuest.GetName())
	EndIf
EndEvent

