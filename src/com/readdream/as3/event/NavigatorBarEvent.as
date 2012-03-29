package com.readdream.as3.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author fs
	 */
	public class NavigatorBarEvent extends Event 
	{
		public static const NAVIGATOR_ELEMENT_CLICK:String = "navigator_element_click";
		public static const NEW_KID_IN_TOWN:String = "new_kid_in_town";
		public static const WE_LOST_HIM:String = "we_lost_him";
		public static const BEGIN_TO_MOVE:String = "BEGIN_TO_MOVE";
		
		public var nodeSerial:int;
		
		public function NavigatorBarEvent(eventType:String,nodeSerial:int = -1) 
		{
			this.nodeSerial = nodeSerial;
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