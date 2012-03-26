package com.readdream.as3.robot 
{
	import flash.display.Sprite;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.data.ImageLoaderVars;
	import com.greensock.loading.ImageLoader;
	import com.greensock.TweenLite;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Robot_PicLoader extends Sprite 
	{
		public var loader:ImageLoader;
		public function Robot_PicLoader(picX:int = 0 , picY:int = 0 , picWidth:int = 0 , picHeight:int = 0) 
		{
			loader = new ImageLoader(pUrl, { name: "photo", container: this, x: picX, y: picY, width: picWidth, height: picHeight, onComplete: onImageLoad } );
			loader.load();
			
			function onImageLoad(event:LoaderEvent):void
			{
				TweenLite.from(event.target.content, 1, {alpha:0});
			}		
		}
		
	}

}