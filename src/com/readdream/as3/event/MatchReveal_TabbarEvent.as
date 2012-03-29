package com.readdream.as3.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class MatchReveal_TabbarEvent extends Event 
	{
		public static const TabButton_CLICK:String = "tabbutton_click";
		public static const TABBAR_CHANGE:String = "tabbar_change";
		
		public var btnName:String;
		
		public function MatchReveal_TabbarEvent(eventType:String, btnName:String = null ) 
		{
			this.btnName = btnName;
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