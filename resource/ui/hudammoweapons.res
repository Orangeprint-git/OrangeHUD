"Resource/UI/HudAmmoWeapons.res"
{
	"HudWeaponAmmoBG"
	{
		"ControlName"	"CTFImagePanel"
		"fieldName"		"HudWeaponAmmoBG"
		"xpos"			"4"
		"xpos_minbad"	"28"
		"ypos"			"0"
		"ypos_minbad"	"7"
		"zpos"			"1"
		"wide"			"300"
		"tall"			"300"
		"visible"		"0"
		"enabled"		"1"
		"image"			"../hud/ammo_blue_bg"
		"scaleImage"	"1"	
		"teambg_2"		"../hud/ammo_red_bg"
		"teambg_2_lodef"	"../hud/ammo_red_bg_lodef"
		"teambg_3"		"../hud/ammo_blue_bg"
		"teambg_3_lodef"	"../hud/ammo_blue_bg_lodef"			
	}
	
	"Background_new"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"Background_new"
		"xpos"			"0"
		"ypos"			"10"
		"zpos"			"0"
		"wide"			"300"
		"tall"			"300"
		"visible"		"0"
		"enabled"		"1"
		"PaintBackgroundType"	"3"
		"BgColor_override" "40 40 45 180"
		
		"motd_orange_line_1"
		{
			"ControlName"	"EditablePanel"
			"fieldname"		"motd_orange_line_1"
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
			"bgcolor_override_minmode"	"247 128 42 180"
		}
	}
	
	"HudAmmoClock"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"HudAmmoClock"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"-100"
		"wide"			"120"
		"wide_minmode"			"0"
		"tall"			"120"
		"visible"		"1"
		"enabled"		"1"
		"image"			"replay/thumbnails/detail/ammoclock000"
		"scaleImage"	"1"	
	}
	
	"HudTimerAnim"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"HudTimerAnim"
		"xpos"			"73"
		"ypos"			"rs1-412+1"
		"zpos"			"5"
		"wide"			"46"
		"tall"			"46"
		"visible"		"1"
		"enabled"		"1"
		"image"			"replay/thumbnails/detail/timer"
		"scaleImage"	"1"	
	}
	
	"HudTimerAnim_minmode"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"HudTimerAnim_minmode"
		"xpos"			"cs-0.5-177"
		"ypos"			"cs-0.5+190"
		"zpos"			"-10"
		"wide"			"0"
		"tall"			"0"
		"wide_minmode"			"70"
		"tall_minmode"			"70"
		"visible"		"1"
		"enabled"		"1"
		"image"			"replay/thumbnails/detail/timer"
		"scaleImage"	"1"	
	}
	
	"medicbar3d_screen_lines_anim"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"medicbar3d_screen_lines_anim"
		"xpos"			"5"
		"ypos"			"11"
		"zpos"			"101"
		"wide"			"110"
		"wide_minmode"			"0"
		"tall"			"125"
		"visible"		"0"
		"visible_minbad"		"1"
		"enabled"		"1"
		"image"			"/replay/thumbnails/detail/medicbar3d_screen_lines_anim.vtf"
		"scaleImage"	"1"	
	}
	
	"AmmoTextLabel"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoTextLabel"
		"font"			"DSDigital"
		"fgcolor"		"TanLight"
		"xpos"			"50"
		"xpos_minbad"	"8"
		"ypos"			"24"
		"ypos_minbad"	"2"
		"zpos"			"5"
		"xpos_minmode"			"cs-0.5-30"
		"ypos_minmode"			"cs-0.5+70"
		"wide"			"55"
		"wide_minmode"			"0"
		"tall"			"40"
		"tall_minbad"	"38"
		"tall_lodef"	"45"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"south-east"	
		"labelText"		"Am:mo"
		
	}
	
	"AmmoTextLabel_shadow"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoTextLabel_shadow"
		"font"			"DSDigital"
		"fgcolor"		"40 40 45 255"
		"xpos"			"52"
		"xpos_minbad"	"8"
		"ypos"			"24"
		"ypos_minbad"	"2"
		"zpos"			"5"
		"xpos_minmode"			"cs-0.5-29"
		"ypos_minmode"			"cs-0.5+70"
		"wide"			"55"
		"wide_minmode"			"0"
		"tall"			"40"
		"tall_minbad"	"38"
		"tall_lodef"	"45"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"south-east"	
		"labelText"		"Am:mo"
		
	}
	
	"AmmoTextLabel_Line"
	{
		"ControlName"	"EditablePanel"
		"fieldname"		"AmmoTextLabel_Line"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"100"
		"wide"			"0"
		"wide_minmode"			"30"
		"xpos_minmode"			"cs-0.5+165"
		"ypos_minmode"			"cs-0.5+80"
		"tall"			"1"
		"visible"		"1"	
		"PaintBackgroundType"	"0"
		"proportionaltoparent"	"1"
		"mouseinputenabled"	"0"
		"bgcolor_override"	"Orange"
	}
	
	"AmmoTextLabel_Line_shadow"
	{
		"ControlName"	"EditablePanel"
		"fieldname"		"AmmoTextLabel_Line_shadow"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"100"
		"wide"			"0"
		"wide_minmode"			"30"
		"xpos_minmode"			"cs-0.5+167"
		"ypos_minmode"			"cs-0.5+80"
		"tall"			"1"
		"visible"		"1"	
		"PaintBackgroundType"	"0"
		"proportionaltoparent"	"1"
		"mouseinputenabled"	"0"
		"bgcolor_override"	"TransparentBlack"
	}
	
	"AmmoTextLabeldots"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoTextLabeldots"
		"font"			"DSDigitalmedium"
		"fgcolor"		"TanLight"
		"xpos"			"19"
		"xpos_minbad"	"8"
		"ypos"			"50"
		"ypos_minbad"	"2"
		"zpos"			"5"
		"xpos_minmode"			"cs-0.5-57"
		"ypos_minmode"			"cs-0.5+90"
		"wide"			"55"
		"tall"			"40"
		"tall_minbad"	"38"
		"tall_lodef"	"45"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"south-east"	
		"labelText"		":"
		
	}
	
	"AmmoTextLabeldots_shadow"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoTextLabeldots_shadow"
		"font"			"DSDigitalmedium"
		"fgcolor"		"40 40 45 255"
		"xpos"			"22"
		"xpos_minbad"	"8"
		"ypos"			"50"
		"ypos_minbad"	"2"
		"zpos"			"5"
		"xpos_minmode"			"cs-0.5-55"
		"ypos_minmode"			"cs-0.5+90"
		"wide"			"55"
		"tall"			"40"
		"tall_minbad"	"38"
		"tall_lodef"	"45"
		"visible"		"1"
		"enabled"		"1"
		"textAlignment"	"south-east"	
		"labelText"		":"
		
	}
	
	"HudWeaponLowAmmoImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"HudWeaponLowAmmoImage"
		"xpos"			"0"
		"xpos_minbad"	"28"
		"ypos"			"12"
		"ypos_minmode"			"30"
		"ypos_minbad"	"7"
		"zpos"			"0"
		"wide"			"120"
		"wide_minmode"			"0"
		"tall"			"122"
		"tall_minmode"			"15"
		"visible"		"0"
		"enabled"		"1"
		"image"			"replay/thumbnails/detail/ammoclock000_screen"
		"scaleImage"	"1"	
	}
	"cornerdarken"
	{
		"ControlName"	"EditablePanel"
		"fieldname"		"cornerdarken"
		"xpos"					"10"
		"ypos"					"85"
		"zpos"					"-1001"
		"wide"			"145"
		"wide_minmode"			"0"
		"tall"			"12"
		"visible"		"1"	
		"PaintBackgroundType"	"0"
		"proportionaltoparent"	"1"
		"mouseinputenabled"	"0"
		"bgcolor_override"	"40 40 45 255"
	}
	"AmmoInClip"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoInClip"
		"font"			"DSDigitalBig"
		"fgcolor"		"TanLight"
		"xpos"			"12"
		"xpos_minbad"	"8"
		"ypos"			"55"
		"ypos_minbad"	"2"
		"zpos"			"5"
		"xpos_minmode"			"cs-0.5-63"
		"ypos_minmode"			"cs-0.5+100"
		"wide"			"55"
		"tall"			"40"
		"tall_minbad"	"38"
		"tall_lodef"	"45"
		"visible"		"0"
		"enabled"		"1"
		"textAlignment"	"south-east"	
		"labelText"		"%Ammo%"
		
	}		
	"AmmoInClipShadow"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoInClipShadow"
		"font"			"DSDigitalBig"
		"fgcolor"		"40 40 45 255"
		"xpos"			"16"
		"xpos_minbad"	"9"
		"xpos_hidef"	"2"
		"ypos"			"56"
		"ypos_minbad"	"2"
		"ypos_hidef"	"2"
		"ypos_lodef"	"2"
		"zpos"			"1"
		"xpos_minmode"			"cs-0.5-61"
		"ypos_minmode"			"cs-0.5+100"
		"wide"			"55"
		"tall"			"40"
		"tall_minbad"	"39"
		"tall_lodef"	"45"
		"visible"		"0"
		"enabled"		"1"
		"textAlignment"	"south-east"	
		"labelText"		"%Ammo%"
		
	}						
	"AmmoInReserve"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoInReserve"
		"font"			"DSDigitalMedium"
		"font_lodef"	"DSDigitalMedium"
		"font_minbad"	"DSDigitalMedium"
		"fgcolor"		"TanLight"
		"xpos"			"73"
		"xpos_minbad"	"65"
		"ypos"			"62"
		"ypos_lodef"	"10"
		"zpos"			"7"
		"xpos_minmode"			"cs-0.5-10"
		"ypos_minmode"			"cs-0.5+100"
		"wide"			"40"
		"tall"			"27"
		"tall_lodef"	"30"
		"visible"		"0"
		"enabled"		"1"
		"textAlignment"	"south-west"		
		"labelText"		"%AmmoInReserve%"
	}		
	"AmmoInReserveShadow"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoInReserveShadow"
		"font"			"DSDigitalMedium"
		"font_lodef"	"DSDigitalMedium"
		"font_minbad"	"DSDigitalMedium"
		"fgcolor"		"40 40 45 255"
		"xpos"			"76"
		"xpos_minbad"	"66"
		"ypos"			"63"
		"ypos_lodef"	"11"
		"zpos"			"7"
		"xpos_minmode"			"cs-0.5-8"
		"ypos_minmode"			"cs-0.5+100"
		"wide"			"40"
		"tall"			"27"
		"tall_lodef"	"30"
		"visible"		"0"
		"enabled"		"1"
		"textAlignment"	"south-west"		
		"labelText"		"%AmmoInReserve%"
	}									
	"AmmoNoClip"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoNoClip"
		"font"			"DSDigitalBig"
		"fgcolor"		"TanLight"
		"xpos"			"-15"
		"xpos_minbad"	"8"
		"ypos"			"55"
		"zpos"			"5"
		"xpos_minmode"			"cs-0.5-79"
		"ypos_minmode"			"cs-0.5+100"
		"wide"			"84"
		"wide_lodef"	"83"
		"tall"			"40"
		"tall_minbad"	"36"
		"tall_lodef"	"45"
		"visible"		"0"
		"enabled"		"1"
		"textAlignment"	"south-east"		
		"labelText"		"%Ammo%"
		
	}	
	"AmmoNoClipShadow"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"AmmoNoClipShadow"
		"font"			"DSDigitalBig"
		"fgcolor"		"40 40 45 255"
		"xpos"			"-10"
		"xpos_hidef"	"2"
		"xpos_lodef"	"2"
		"ypos"			"56"
		"ypos_hidef"	"4"
		"ypos_lodef"	"4"
		"zpos"			"5"
		"xpos_minmode"			"cs-0.5-77"
		"ypos_minmode"			"cs-0.5+100"
		"wide"			"84"
		"wide_lodef"	"83"
		"tall"			"40"
		"tall_minbad"	"36"
		"tall_lodef"	"45"
		"visible"		"0"
		"enabled"		"1"
		"textAlignment"	"south-east"		
		"labelText"		"%Ammo%"
		
	}

	"TransparentRefract"
	{
		"ControlName"			"ImagePanel"
		"fieldName"				"TransparentRefract"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"1"
		"wide"					"f0"
		"wide_minmode"			"0"
		"tall"					"480"
		"visible"				"1"
		"enabled"				"1"
		"image"					"replay/thumbnails/transparent_hud"
		"scaleImage"			"1"
	}	
}
