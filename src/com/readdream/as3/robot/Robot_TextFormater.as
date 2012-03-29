package com.readdream.as3.robot
{
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author fs
	 */
	public final class Robot_TextFormater
	{
		public static const TEXTINPUT_UNFOCUS:String = "textinput_unfocus";
		public static const TEXTINPUT_FOCUS:String = "textinput_focus";
		public static const HOTTHUMB_MATCHTITLE:String = "hotthumb_matchtitle";
		public static const HOTTHUMB_MATCHCOMP:String = "hotthumb_matchcomp";
		public static const TABBUTTON_TEXT:String = "tabbutton_text";

		public static const NAVIGATOR_NORMAL_BOLD:String = "navigator_normal_bold";
		public static const NAVIGATOR_NORMAL_REGULAR:String = "navigator_normal_regular";
		public static const NAVIGATOR_ACTIVED_BOLD:String = "navigator_actived_bold";
		public static const NAVIGATOR_ACTIVED_REGULAR:String = "navigator_actived_regular";
		public static const NAVIGATOR_MOUSEON_BOLD:String = "navigator_mouseOn_bold";
		public static const NAVIGATOR_MOUSEON_REGULAR:String = "navigator_mouseOn_regular";
		public static const NAVIGATOR_ACTIVED_SPECIAL:String = "navigator_actived_special";
		
		public function Robot_TextFormater()
		{
		
		}
		public static function getTextFormat(formatType:String):TextFormat
		{
			var textFont :TextFormat;
			switch (formatType)
			{
				case "textinput_unfocus": 
					//font settings
					textFont = new TextFormat();
					textFont.size = 14;
					textFont.color = 0xa1a1a1;
					textFont.font = "宋体";
					return textFont;
				case "textinput_focus":
					//font settings
					textFont = new TextFormat();
					textFont.size = 14;
					textFont.color = 0x000000;
					textFont.font = "宋体";
					return textFont;
				case "hotthumb_matchtitle":
					//font settings
					textFont = new TextFormat();
					textFont.size = 21;
					textFont.bold = true;
					textFont.color = 0xFFFFFF;
					textFont.font = "宋体";
					return textFont;
				case "hotthumb_matchcomp":
					//font settings
					textFont = new TextFormat();
					textFont.size = 14;
					textFont.color = 0x989898;
					textFont.font = "宋体";
					return textFont;
				case "tabbutton_text":
					//font settings
					textFont = new TextFormat();
					textFont.size = 14;
					textFont.color = 0x000000;
					textFont.bold = true;
					textFont.font = "宋体";
					return textFont;
				case "navigator_normal_bold":
					//font settings
					textFont = new TextFormat();
					textFont.size = 13;
					textFont.color = 0x000000;
					textFont.font = "宋体";
					textFont.bold = true;
					return textFont;
				case "navigator_normal_regular":
					//font settings
					textFont = new TextFormat();
					textFont.size = 13;
					textFont.color = 0x000000;
					textFont.font = "宋体";
					return textFont;
				case "navigator_actived_bold":
					//font settings
					textFont = new TextFormat();
					textFont.size = 13;
					textFont.color = 0xffffff;
					textFont.font = "宋体";
					textFont.bold = true;
					return textFont;
				case "navigator_actived_special":
					//font settings
					textFont = new TextFormat();
					textFont.size = 13;
					textFont.color = 0x1c5ac4;
					textFont.font = "宋体";
					//textFont.bold = true;
					return textFont;
				case "navigator_actived_regular":
					//font settings
					textFont = new TextFormat();
					textFont.size = 13;
					textFont.color = 0xffffff;
					textFont.font = "宋体";
					return textFont;
				case "navigator_mouseOn_bold":
					//font settings
					textFont = new TextFormat();
					textFont.size = 13;
					textFont.color = 0x5080D8;
					textFont.font = "宋体";
					textFont.bold = true;
					return textFont;
				case "navigator_mouseOn_regular":
					//font settings
					textFont = new TextFormat();
					textFont.size = 13;
					textFont.color = 0x5080D8;
					textFont.font = "宋体";
					return textFont;
				default: 
					return null;
			}
		}
	}

}


				
