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
	 * 		图片X坐标	picX:int
	 * 		图片Y坐标	picY:int
	 * 		图片宽度	picWidth:int
	 * 		图片高度	picHeight:int
	 * @author evstar
	 */
	public class Robot_PicLoader extends Sprite 
	{
		public var loader:ImageLoader;
		
		/**
		*图片加载器 
		*图片路径 String | 图片X坐标 int | 图片Y坐标 int | 图片宽度 int | 图片高度 int
		*/
		public function Robot_PicLoader(pUrl:String,picX:int = 0 , picY:int = 0 , picWidth:int = 0 , picHeight:int = 0) 
		{
			loader = new ImageLoader(pUrl, { name: "photo1", container: this, x: picX, y: picY, width: picWidth, height: picHeight, onComplete: onImageLoad } );
			loader.load();
			
			function onImageLoad(event:LoaderEvent):void
			{
				TweenLite.from(event.target.content, 1, { alpha:0 } );
			}		
		}
		
	}

}