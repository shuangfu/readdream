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
		private var _container : DisplayObjectContainer;
		public function Mr_Layouter(_container:DisplayObjectContainer,dataArr:Array) 
		{
			this._container = _container;
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
		
		public function get container():DisplayObjectContainer 
		{
			return _container;
		}
		
		public function set container(value:DisplayObjectContainer):void 
		{
			_container = value;
		}
		
	}

}