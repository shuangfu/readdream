package com.readdream.as3.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class MatchReveal_TabbarEvent extends Event 
	{
		public static const TabButton_CLICK:String="tabbutton_click";
		public function MatchReveal_TabbarEvent(eventType:String) 
		{
			super(eventType);
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