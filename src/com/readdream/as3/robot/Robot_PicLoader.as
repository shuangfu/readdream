package com.readdream.as3.robot 
{
	import flash.display.Sprite;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.data.ImageLoaderVars;
	import com.greensock.loading.ImageLoader;
	import com.greensock.TweenLite;
	
	/**
	 * 图片加载器
	 * 参数: 
	 *		图片路径	pUrl:String
	 * 		图片X坐标	xPos:int
	 * 		图片Y坐标	picY:int
	 * 		图片宽度	picWidth:int
	 * 		图片高度	picHeight:int
	 * @author evstar
	 */
	public class Robot_PicLoader extends Sprite 
	{
		public var loader:ImageLoader;
		public var sec:int;
		
		/**
		*图片加载器 
		*图片路径 String | 图片X坐标 int | 图片Y坐标 int | 图片宽度 int | 图片高度 int
		*/
		public function Robot_PicLoader(pUrl:String, xPos:Number = 0 , yPos:Number = 0 , picWidth:Number = 0 , picHeight:Number = 0, sec:int = 0 ) 
		{
			this.sec = sec;
			loader = new ImageLoader(pUrl, { name: "photo1", container: this, x: xPos, y: yPos, width: picWidth, height: picHeight,onComplete: onImageLoad } );
			loader.load();
			
			function onImageLoad(event:LoaderEvent):void
			{
				TweenLite.from(event.target.content, 0.3, { alpha:0 } );
			}		
		}
		
	}

}