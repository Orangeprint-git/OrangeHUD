"Resource/UI/GlobalChat.res"
{
	"partychat"
	{
		"fieldName"				"partychat"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"5"
		"ypos"					"15"
		"zpos"					"99"
		"wide"					"200"
		"tall"					"200"
		"proportionaltoparent"	"1"
		"keyboardinputenabled"	"1"
		"mouseinputenabled"		"1"
		"border"		"QuickplayBorder"

		"log_font_small"			"DSDigitalMedium"
		"log_font_medium"			"DSDigitalMedium"
		"log_font_large"			"DSDigitalMedium"

		"chat_color_default"		"255 255 255 255"
		"chat_color_player_name"	"255 255 0 255"
		"chat_color_chat_text"		"255 255 255 255"
		"chat_color_party_event"	"Orange"

		"collapsed_height"		"0"
		"expanded_height"		"200"
		"resize_time"	"0.1"
		"invalidate_parent_on_resize"	"0"
	}

	"chatlog"
	{
		"ControlName"	"richtext"
		"fieldName"		"chatlog"
		"xpos"			"cs-0.5"
		"ypos"			"5"
		"zpos"			"1"
		"wide"			"f0"
		"tall"			"f20"
		"visible"		"1"
		"proportionaltoparent"	"1"
		"RoundedCorners"	"0"
		"font"			"DSDigitalKSMedium"
		
		"bgcolor_override"	"0 0 0 0"

		"pinCorner"		"2"
		"autoResize"	"1"

		"ScrollBar"
		{
			"FieldName"		"ScrollBar"
			"xpos"			"rs1-1"
			"ypos"			"0"
			"tall"			"f0"
			"wide"			"5" // This gets slammed from client schme.  GG.
			"zpos"			"1000"
			"nobuttons"		"1"
			"proportionaltoparent"	"1"

			"Slider"
			{
				"fgcolor_override"	"Orange"
			}
		
			"UpButton"
			{
				"ControlName"	"Button"
				"FieldName"		"UpButton"
				"visible"		"0"
			}
		
			"DownButton"
			{
				"ControlName"	"Button"
				"FieldName"		"DownButton"
				"visible"		"0"
			}
		}
	}

	"chatentry"
	{
		"ControlName"	"TextEntry"
		"fieldName"		"chatentry"
		"xpos"					"6"
		"ypos"					"rs1+19"
		"zpos"			"1"
		"wide"			"f2"
		"tall"			"13"
		"visible"		"1"
		"proportionaltoparent"	"1"
		"bgcolor_override"	"0 0 0 255"
		"RoundedCorners"	"0"
		"font"			"DSDigitalKSMedium"
		"alpha"			"0"
		"mouseinputenabled"	"0"

		"pinCorner"		"2"
		//"autoResize"	"1"
	}

	"EntryShadow"
	{
		"ControlName"	"Panel"
		"fieldName"		"EntryShadow"
		"xpos"			"cs-0.5"
		"ypos"			"rs1"
		"zpos"			"2"
		"wide"			"f0"
		"tall"			"15"
		"visible"		"1"
		"proportionaltoparent"	"1"
		"bgcolor_override"	"0 0 0 0"
		"RoundedCorners"	"0"
		"border"		"QuickplayBorder"

		"keyboardinputenabled"	"0"
		"mouseinputenabled"		"0"

		"pinCorner"		"2"
	}
	
	"bgshadow"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"bgshadow"
		"xpos"			"cs-0.5"
		"ypos"			"rs1"
		"zpos"			"-1"
		"wide"			"f0"
		"tall"			"f0"
		"visible"		"1"
		"proportionaltoparent"	"1"
		"bgcolor_override"	"0 0 0 255"
		"RoundedCorners"	"0"

		"keyboardinputenabled"	"0"
		"mouseinputenabled"		"0"

		"pinCorner"		"2"
	}
}
