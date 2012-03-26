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
				default: 
					return null;
			}
		}
	}

}