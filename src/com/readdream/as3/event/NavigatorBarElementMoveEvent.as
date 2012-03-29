package com.readdream.as3.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author fs
	 */
	public class NavigatorBarElementMoveEvent extends Event 
	{
		public static const BEGIN_TO_MOVE:String = "BEGIN_TO_MOVE";
		
		public function NavigatorBarElementMoveEvent(eventType:String) 
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
