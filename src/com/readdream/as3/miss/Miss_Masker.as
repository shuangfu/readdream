package com.readdream.as3.miss 
{
	import flash.display.Shape;
	
	/**
	 * 遮罩
	 * @author evstar
	 */
	public class Miss_Masker extends Shape 
	{
		
		public function Miss_Masker(sizeWidth:Number,sizeHeight:Number) 
		{
			graphics.beginFill(0xff0000);
			graphics.drawRect(0, 0, sizeWidth, sizeHeight );
			graphics.endFill();
		}
		
	}

}