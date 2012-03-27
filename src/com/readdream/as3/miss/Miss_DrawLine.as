package com.readdream.as3.miss 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	/**
	 * 画直线工具
	 * @author evstar
	 */
	public final class Miss_DrawLine  
	{
		
		
		private var _container : Sprite;
		

		public function Miss_DrawLine() 
		{

		}
		
		/**
		 * 画直线工具
		 * 容器 | 起点x坐标 Number | 起点Y坐标 Number | 结尾x坐标 Number | 结尾Y坐标 Number | 粗细 Number | 颜色 uint | 透明 Number)
		 * @param	xPos1
		 * @param	yPos1
		 * @param	xPos2
		 * @param	yPos2
		 * @param	thickness
		 * @param	color
		 * @param	alpha
		 */
		public static function drawLine(_container:Sprite, xPos1:Number, yPos1:Number, xPos2:Number, yPos2:Number, thickness:Number = NaN, color:uint = 0, alpha:Number = 1 ):void
		{
			_container.graphics.lineStyle(thickness, color, alpha, true);
			_container.graphics.moveTo(xPos1, yPos1);
			_container.graphics.lineTo(xPos2, yPos2);
		}
		
		public function get container():Sprite 
		{
			return _container;
		}
		
		public function set container(value:Sprite):void 
		{
			_container = value;
		}
		

		
	}

}