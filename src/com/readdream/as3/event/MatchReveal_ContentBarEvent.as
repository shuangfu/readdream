package com.readdream.as3.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class MatchReveal_ContentBarEvent extends Event 
	{
		public static const PICTURE_CHANGE:String = "picture_change";
		
		public var serial:int;
		
		public function MatchReveal_ContentBarEvent(eventType:String,serial:int = -1) 
		{
			this.serial = serial;
			super(eventType);
		}
		
	}

}