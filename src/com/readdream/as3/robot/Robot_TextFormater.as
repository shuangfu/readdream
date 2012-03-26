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
					textFont.size = 12;
					textFont.color = 0x989898;
					textFont.font = "宋体";
					return textFont;
				default: 
					return null;
			}
		}
	}

}