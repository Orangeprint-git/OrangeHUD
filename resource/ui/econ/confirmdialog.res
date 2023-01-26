"Resource/UI/ConfirmDialog.res"
{
	"ConfirmDialog" //made this size of whole screen and transparent, eveything below this are tied to this.
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"ConfirmDialog"
		"xpos"			"0"
		"ypos"			"140"
		"wide"			"850"
		"tall"			"480"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"0"
		"enabled"		"0"
		"tabPosition"		"0"
		"settitlebarvisible"	"0"
		"PaintBackgroundType"	"0"
		"paintbackground"		"1"
		"bgcolor_override"	"0 0 0 0"
		"keyboardinputenabled" "0"		//removes esc closing this panel, and enter closing the game
		"paintborder"		"0"			//removes standard tf2 panel background border.
	}
	
	"bgpanel" 	//new panel since ConfirmDialog cannot be moved.
	{			//this meanwhile can be moved and everything tied to this
				
		"ControlName"	"EditablePanel"
		"fieldName"		"bgpanel"
		"xpos"			"c-152"
		"ypos"			"140"
		"wide"			"324"
		"tall"			"200"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"		"0"
		"settitlebarvisible"	"0"
		"PaintBackgroundType"	"2"
		"paintbackground"		"1"
		"bgcolor_override"	"40 40 45 245"
		"keyboardinputenabled" "0"
		
		"top_line"
		{
			"ControlName"	"EditablePanel"
			"fieldname"		"top_line"
			"xpos"			"0"
			"ypos"			"0"
			"zpos"			"100"
			"wide"			"f0"
			"tall"			"2"
			"visible"		"1"	
			"PaintBackgroundType"	"0"
			"proportionaltoparent"	"1"
			"mouseinputenabled"	"0"
			"bgcolor_override"	"Orange"
		}
		
		"Settings_Label"
		{
			"ControlName"	"CExLabel"
			"fieldName"		"Settings_Label"
			"font"			"DSDigital"
			"labelText"		"HUD Settings and Utilitites"
			"textAlignment"	"north-west"
			"xpos"			"7"
			"ypos"			"5"
			"zpos"			"115"
			"wide"			"300"
			"tall"			"15"
			"autoResize"	"0"
			"pinCorner"		"0"
			"visible"		"1"
			"enabled"		"1"
			"fgcolor"		"247 128 41 255"
		}
		
		"PLHDR1"
		{
			"ControlName"	"CExButton"
			"fieldName"		"PLHDR1"
			"xpos"			"10"
			"ypos"			"35"
			"zpos"			"20"
			"wide"			"70"
			"tall"			"25"
			"autoResize"	"0"
			"pinCorner"		"0"
			"visible"		"1"
			"enabled"		"1"
			"tabPosition"	"0"
			"labelText"		"plhdr"
			"font"			"EconFontSmall"
			"textAlignment"	"center"
			"textinsetx"	"50"
			"dulltext"		"0"
			"brighttext"	"0"
			"Command"		"engine buttest"
			"tooltip"		"tooltip"
			"actionsignallevel" "3"
			"sound_depressed"			"UI/buttonclick.wav"
			"sound_released"			"UI/buttonclickrelease.wav"
			"defaultFgColor_override" "244 232 198 255"
			"armedFgColor_override" "244 232 198 255"
			"depressedFgColor_override" "40 40 45 255"
			"armedBgColor_override"	"Orange"
				
			"image_drawcolor"	"235 226 202 255"
			"image_armedcolor"	"235 226 202 255"
		}
		
		"CalculatorButton"
		{
			"ControlName"	"EditablePanel"
			"fieldName"		"CalculatorButton"
			"xpos"			"10"
			"ypos"			"60"
			"zpos"			"100"
			"wide"			"85"
			"tall"			"20"
			"BgColor_override"	"0 0 0 80"
			"PaintBackgroundType"	"2"
			
			
		
			"calculator"
			{
				"ControlName"	"URLLabel"
				"fieldName"		"calculator"
				"xpos"			"0"
				"ypos"			"0"
				"zpos"			"100"
				"wide"			"80"
				"tall"			"25"
				"labeltext"		"Calculator"
				"textinsetx"	"15"
				"textinsety"	"-5"
				"textAlignment"	"west"
				"font"			"DSDigital"
				"urltext"		"C:\Windows\System32\calc.exe"
				"FgColor_override" "244 232 198 255"
			}
		}
		
		"HudUpdateButton"
		{
			"ControlName"	"EditablePanel"
			"fieldName"		"HudUpdateButton"
			"xpos"			"10"
			"ypos"			"80"
			"zpos"			"100"
			"wide"			"85"
			"tall"			"20"
			"BgColor_override"	"0 0 0 80"
			"PaintBackgroundType"	"2"
			
			
		
			"Updater"
			{
				"ControlName"	"URLLabel"
				"fieldName"		"Updater"
				"xpos"			"0"
				"ypos"			"0"
				"zpos"			"100"
				"wide"			"80"
				"tall"			"25"
				"labeltext"		"Hud Update"
				"textinsetx"	"15"
				"textinsety"	"-5"
				"textAlignment"	"west"
				"font"			"DSDigital"
				"urltext"		"tf\custom\OrangeHUD-main\HudUpdate.bat"
				"FgColor_override" "244 232 198 255"
			}
		}
	}
	
	"CancelButton_new"
	{
		"ControlName"	"CExButton"
		"fieldName"		"CancelButton_new"
		"xpos"			"-5"
		"ypos"			"-170"
		"zpos"			"20"
		"wide"			"70"
		"tall"			"25"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"labelText"		"Back"
		"font"			"EconFontSmall"
		"textAlignment"	"center"
		"textinsetx"	"50"
		"dulltext"		"0"
		"brighttext"	"0"
		"Command"		"cancel"
		"sound_depressed"			"UI/buttonclick.wav"
		"sound_released"			"UI/buttonclickrelease.wav"
		"defaultFgColor_override" "244 232 198 255"
		"armedFgColor_override" "244 232 198 255"
		"depressedFgColor_override" "40 40 45 255"
		"armedBgColor_override"	"Orange"
			
		"image_drawcolor"	"235 226 202 255"
		"image_armedcolor"	"235 226 202 255"
		"pin_to_sibling" "bgpanel"
	}
}
