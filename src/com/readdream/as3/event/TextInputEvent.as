package com.readdream.as3.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author fs
	 */
	public class TextInputEvent extends Event 
	{
		public static const INPUT_COMPLETE:String="input_complete";
		
		public var text:String;
		
		public function TextInputEvent(eventType:String,text:String) 
		{
			super(eventType)
			this.text = text;
		}
		override public function clone():flash.events.Event 
		{
			return super.clone();
		}
		override public function toString():String 
		{
			return super.toString();
		}
	}

}