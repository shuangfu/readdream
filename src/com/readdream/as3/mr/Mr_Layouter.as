package com.readdream.as3.mr 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author fs
	 */
	public class Mr_Layouter 
	{
		public function Mr_Layouter() 
		{
			
		}
		public static function layouter(_container:DisplayObjectContainer,dataArr:Array) :void {
			if (_container != null && dataArr != null) 
			{
				for each (var obj:Object in dataArr) 
				{
					_container.addChild(obj.stuff);
					(obj.stuff as DisplayObject).x = obj.xPos;
					(obj.stuff as DisplayObject).y = obj.yPos;
				}
			}
		}
	}

}