"GameMenu" [$WIN32]
{
	"VRModeButton"
	{
		"label" "#MMenu_VRMode_Activate"
		"command" "engine vr_toggle"
		"subimage" "glyph_vr"
		"OnlyWhenVREnabled" "1"
	}

	// These buttons are only shown while in-game
	// and also are positioned by the .res file
	"CallVoteButton"
	{
		"label"			""
		"command"		"callvote"
		"OnlyInGame"	"1"
		"subimage" "replay/thumbnails/icons/icon_vote"
		"tooltip" "#MMenu_CallVote"
	}
	"MutePlayersButton"
	{
		"label"			""
		"command"		"OpenPlayerListDialog"
		"OnlyInGame"	"1"
		"subimage" "replay/thumbnails/icons/icon_mute"
		"tooltip" "#MMenu_MutePlayers"
	}
	"RequestCoachButton"
	{
		"label"			""
		"command"		"engine cl_coach_find_coach"
		"OnlyInGame"	"0"
		"subimage" "icon_whistle"
		"tooltip" "Request A Coach"
	}
	"CoachPlayersButton_new"
	{
		"label"			""
		"command"		"engine cl_coach_toggle"
		"OnlyInGame"	"0"
		"subimage" "glyph_commentary"
		"tooltip" "Be A Coach"
	}
	"ReportPlayerButton"
	{
		"label"			""
		"command"		"OpenReportPlayerDialog"
		"OnlyInGame"	"1"
		"subimage"		"replay/thumbnails/icons/icon_report"
		"tooltip"		"#MMenu_ReportPlayer"
	}
	"RetryButton"
	{
		"label"			""
		"command"		"engine retry"
		"OnlyInGame"	"1"
		"subimage"		"replay/thumbnails/icons/icon_RCONN"
		"tooltip"		"retry connection"
	}	
	"VguiButton"
	{
		"label"			"> Vgui_DrawTree (sv_cheats)"
		"command"		"engine toggle  sv_cheats 1; vgui_drawtree 1 0"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_OHUD"
		"tooltip"		"dev : vgui menu"
	}
	"ConsoleButton"
	{
		"label"			"> Console"
		"command"		"engine toggleconsole"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_console"
		"tooltip"		"Open Console"
	}
	"StoressButton"
	{
		"label"			"> Store"
		"command"		"engine open_store"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_store"
		"tooltip"		"Open Valve Store"
	}
	"backpacktfButton"
	{
		"label"			""
		"command"		"url https://backpack.tf/"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_backpacktf"
		"tooltip"		"Url: Backpack.tf"
	}
	"ServerBrowser"
	{
		"label"			"> Server Browser"
		"command"		"engine gamemenucommand OpenServerBrowser"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_serverbrowser"
		"tooltip"		"Community Server Browser"
	}
	"AdvSButton"
	{
		"label"			"> Adv. settings"
		"command"		"opentf2options"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_AdvSettings"
		"tooltip"		"Advanced Settings"
	}
	"SettButton"
	{
		"label"			"> settings"
		"command"		"OpenOptionsDialog"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_Settings"
		"tooltip"		"Game Settings"
	}
	"itemssButton"
	{
		"label"			"> items"
		"command"		"engine open_charinfo"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_items"
		"tooltip"		"Items & loadout"
	}
	"QuitButton_new"
	{
		"label"			"> Quit"
		"command"		"quit"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_exit"
		"tooltip"		""
	}
	"DisconnectButton_new"
	{
		"label"			"> Disconnect"
		"command"		"engine disconnect"
		"OnlyInGame"	"1"
		"subimage"		"replay/thumbnails/icons/icon_exit"
		"tooltip"		""
	}
	"bugfixButton"
	{
		"label"			""
		"command"		"engine +bugfix"
		"OnlyInGame"	"1"
		"subimage"		"glyph_bug"
		"tooltip"		"Fixes various visual, audio and hud bugs."
	}
	"Itemtest"
	{
		"label"			""
		"command"		"engine itemtest"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_OHUD"
		"tooltip"		"Item Testing Menu"
	}
	"itemtestMap"
	{
		"label"			""
		"command"		"engine map itemtest"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_OHUD"
		"tooltip"		"Item Testing Map"
	}
	"WorkshopButton"
	{
		"label"			""
		"command"		"engine OpenSteamWorkshopDialog"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_Workshop"
		"tooltip"		"Workshop Menu"
	}
	"ReplayButton"
	{
		"label"			""
		"command"		"engine replay_reloadbrowser"
		"OnlyInGame"	"0"
		"subimage"		"glyph_tv"
		"tooltip"		"Replay menu"
	}
	"hudstfButton"
	{
		"label"			""
		"command"		"url https://huds.tf/"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_HUDStf"
		"tooltip"		"Url: Huds.tf"
	}
	"MarketplacetfButton"
	{
		"label"			""
		"command"		"url https://marketplace.tf/"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_markerplacetf"
		"tooltip"		"Url: Marketplace.tf"
	}
	"OHUDDiscordButton"
	{
		"label"			""
		"command"		"url https://discord.gg/Dq3bCuv"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_OHUDDC"
		"tooltip"		"Url: OrangeHUD Discord"
	}
	"AchievementsButton"
	{
		"label"			""
		"command"		"engine gamemenucommand OpenAchievementsDialog"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_OHUD"
		"tooltip"		"Achievements"
	}
	
	"ReloadHUDButton"
	{
		"label"			""
		"command"		"engine toggle mat_antialias 0 1; coreload"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_RLHUD"
		"tooltip"		"Reload HUD"
	}
	
	//__________________________________________________
	//____________________ tooltips ____________________
	//--------------------------------------------------
	
	"UtilButton_tooltip"
	{
		"label"			""
		"command"		"engine"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_QM"
		"tooltip"		"Hud Utility and Settings"
	}
	
	//__________________________________________________
	//__________________ Logo button ___________________
	//--------------------------------------------------
	
	"LogoButton"
	{
		"label"			""
		"command"		"engine clear; Orange; +con"
		"OnlyInGame"	"0"
		"subimage"		"replay/thumbnails/icons/icon_QM"
		"tooltip"		"Hud Utility and Settings"
	}
}
