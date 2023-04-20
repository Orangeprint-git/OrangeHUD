"Resource/UI/HudItemEffectMeter_Demoman.res"
{
	HudItemEffectMeter
	{
		"fieldName"		"HudItemEffectMeter"
		"visible"		"1"
		"enabled"		"1"
		"xpos"			"r227"	[$WIN32]
		"ypos"			"r88"	[$WIN32]
		"xpos_minbad"	"r70"	[$WIN32]
		"ypos_minbad"	"r74"	[$WIN32]
		"xpos"			"r194"	[$X360]
		"ypos"			"r74"	[$X360]
		"wide"			"140"
		"tall"			"140"
		"MeterFG"		"White"
		"MeterBG"		"Gray"
	}
	
	"ItemEffectMeterBG"
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"ItemEffectMeterBG"
		"xpos"			"12"
		"ypos"			"-60"
		"zpos"			"0"
		"wide"			"76"
		"tall"			"44"
		"visible"		"0"
		"visible_minbad"	"0"
		"enabled"		"1"
		"image"			"../hud/misc_ammo_area_blue"
		"scaleImage"	"1"	
		"teambg_2"		"../hud/misc_ammo_area_red"
		"teambg_2_lodef"	"../hud/misc_ammo_area_red_lodef"
		"teambg_3"		"../hud/misc_ammo_area_blue"
		"teambg_3_lodef"	"../hud/misc_ammo_area_blue_lodef"				
	}
	
	"demoheadsbg"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"demoheadsbg"
		"xpos"			"12"
		"ypos"			"0d"
		"zpos"			"-100"
		"wide"			"120"
		"wide_minmode"			"0"
		"tall"			"120"
		"visible"		"1"
		"enabled"		"1"
		"image"			"replay/thumbnails/detail/screensmall"
		"scaleImage"	"1"	
	}
	
	"demoheads_eyelander"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"demoheads_eyelander"
		"xpos"					"81"
		"ypos"					"45"
		"zpos"			"5"
		"wide"			"35"
		"wide_minmode"			"0"
		"tall"			"35"
		"visible"		"1"
		"enabled"		"1"
		"image"			"replay/thumbnails/detail/eyelander"
		"scaleImage"	"1"	
	}
	
	"ItemEffectMeterLabel"
	{
		"ControlName"			"CExLabel"
		"fieldName"				"ItemEffectMeterLabel"
		"xpos"					"15"
		"ypos"					"7"
		"zpos"					"2"
		"wide"					"41"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"2"
		"visible"				"0"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				"#TF_Ball"
		"textAlignment"			"center"
		"dulltext"				"0"
		"brighttext"			"0"
		"font"					"DSDigital"
		"fgcolor"		"Orange"
	}
	
	"ItemEffectMeterLabel_orange"
	{
		"ControlName"			"CExLabel"
		"fieldName"				"ItemEffectMeterLabel_orange"
		"xpos"					"55"
		"ypos"					"42"
		"zpos"					"2"
		"wide"					"41"
		"tall"					"15"
		"autoResize"			"1"
		"pinCorner"				"2"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				"H:eads"
		"textAlignment"			"center"
		"dulltext"				"0"
		"brighttext"			"0"
		"font"					"DSDigital"
		"fgcolor"		"Orange"
	}

	"ItemEffectMeter"
	{	
		"ControlName"			"ContinuousProgressBar"
		"fieldName"				"ItemEffectMeter"
		"font"					"Default"
		"xpos"					"25"
		"ypos"					"23"
		"ypos_minbad"			"0"
		"xpos_minbad"			"0"
		"zpos"					"2"
		"wide"					"40"
		"wide_minbad"			"50"
		"tall"					"6"				
		"autoResize"			"0"
		"pinCorner"				"0"
		"visible"				"0"
		"enabled"				"0"
		"textAlignment"			"Left"
		"dulltext"				"0"
		"brighttext"			"0"
	}					
	
	"ItemEffectMeterCount"
	{
		"ControlName"			"CExLabel"
		"fieldName"				"ItemEffectMeterCount"
		"xpos"					"60"
		"ypos"					"55"
		"zpos"					"2"
		"wide"					"40"
		"tall"					"40"	
		"pinCorner"				"2"
		"visible"				"1"
		"enabled"				"1"
		"tabPosition"			"0"
		"labelText"				"%progresscount%"
		"textAlignment"			"north"
		"dulltext"				"0"
		"brighttext"			"0"
		"font"					"DSDigitalMedium"
	}
	
	"TransparentRefract"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"TransparentRefract"
		"xpos"					"33"
		"ypos"					"0"
		"zpos"					"-100"
		"wide"					"78"
		"tall"					"480"
		"wide_minmode"			"0"
		"visible"				"1"
		"enabled"				"1"
		"image"					"replay/thumbnails/transparent_hud"
		"scaleImage"			"1"
	}
}
