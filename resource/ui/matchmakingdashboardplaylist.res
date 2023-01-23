#base "MatchMakingDashboardSidePanel.res"

"Resource/UI/MatchMakingDashboardPlayList.res"
{
	"ExpandableList"
	{
		"fieldName"		"ExpandableList"
		"xpos"			"r0"
		"ypos"			"25"
		"zpos"			"1001"
		"wide"			"280"
		"tall"			"436"
		"visible"		"1"
		"proportionaltoparent"	"1"
		
		"BelowDarken_2"
		{
			"ControlName"	"EditablePanel"
			"fieldname"		"BelowDarken_2"
			"xpos"			"0"
			"ypos"			"f"
			"zpos"			"1"
			"wide"			"f0"
			"tall"			"f0"
			"visible"		"1"	
			"PaintBackgroundType"	"0"
			"proportionaltoparent"	"1"
			"mouseinputenabled"	"0"
			"bgcolor_override"	"40 40 45 255"
		}
	}
	
	"line_fix"
	{
		"ControlName"	"EditablePanel"
		"fieldname"		"motd_small_orange_line_5"
		"xpos"			"0"
		"ypos"			"437-2"
		"zpos"			"10000"
		"wide"			"f0"
		"tall"			"2"
		"visible"		"1"	
		"PaintBackgroundType"	"0"
		"proportionaltoparent"	"1"
		"mouseinputenabled"	"0"
		"bgcolor_override"	"247 128 42 255"
	}

	"Title"
	{
		"ControlName"		"Label"
		"fieldName"		"Title"
		"xpos"		"8"
		"ypos"		"20"
		"zpos"		"99"
		"wide"		"f0"
		"tall"		"20"
		"proportionaltoparent"	"1"
		"labeltext"		"#TF_Matchmaking_HeaderModeSelect"
		"textAlignment"	"west"
		"font"			"HudFontMediumBigBold"
		"fgcolor_override"	"Orange"
		"visible"		"1"
		
		"mouseinputenabled"	"0"
	}

	"playlist"
	{
	//	"ControlName"	"CTFPlaylistPanel"
		"fieldName"		"playlist"
		"xpos"			"8"
		"ypos"			"50"
		"zpos"			"100"
		"wide"			"255"
		"tall"			"465"
		"visible"		"1"
		"proportionaltoparent"	"0"
	}

	"PlayListDropShadow"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"PlayListDropShadow"
		"xpos"			"8"
		"ypos"			"50"
		"zpos"			"1000"
		"wide"			"255"
		"tall"			"298"
		"visible"		"0"
		"PaintBackgroundType"	"2"
		"border"		"InnerShadowBorder"
		"proportionaltoparent"	"1"
		"mouseinputenabled"	"0"
	}
}
