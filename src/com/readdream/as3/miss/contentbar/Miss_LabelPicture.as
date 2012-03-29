package com.readdream.as3.miss.contentbar 
{
	import com.greensock.easing.Linear;
	import com.greensock.TweenLite;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_LabelPicture extends Sprite 
	{
		private const contentBarPicWidth:int = 636;
		private const contentBarPicHeight:int = 396;
		
		private const contentBarPicX:Number = 42;
		private const contentBarPicY:Number = 42;
		
		
		private var loader:Vector.<Robot_PicLoader> = new Vector.<Robot_PicLoader>;
		private var lblPicture:Sprite = new Sprite();

		
		public function Miss_LabelPicture(vo:Vo_Match) 
		{
			initLabelPicture(vo);
			setupPicture();
		}
		

		
		private function initLabelPicture(vo:Vo_Match):void 
		{
			/////////////////////////
			//去掉首页第一张展示图
			vo.picture.shift();	
			
			////////////////////////
			//图片加载进入loader
			for each (var temp:String in vo.picture)
			{
				loader.push(new Robot_PicLoader(temp, 0, 0, contentBarPicWidth, contentBarPicHeight));
			}
		
			///////////////////////
			//遮罩图片显示框
			lblPicture.graphics.beginFill(0xFFFFFF);
			lblPicture.graphics.drawRect(0, 0, contentBarPicWidth, contentBarPicHeight);
			lblPicture.graphics.endFill();
			var masker:Sprite = Mr_Dresser.getMasker(contentBarPicWidth, contentBarPicHeight);
			lblPicture.addChild(masker);
			lblPicture.mask = masker;
		
		}
		
		
		private function setupPicture():void 
		{
			/////////////////////////
			//把图片加载到lblPicture
			for each (var i:Robot_PicLoader in loader)
			{
				lblPicture.addChild(i);
			}
			
			///////////////////
			//摆放图片位置
			for (var index:int = 0; index < loader.length; index++)
			{
				TweenLite.to(loader[index], 0.1,{ x:(loader[index].width  * index), y:0 } );
				//loader[index].x = loader[index].width  * index;
				//loader[index].y = 0;
			}
			addChild(lblPicture);
		}
		
		
		public function movePicture(i:int):void {
			var location :int = 0;
			location = location - i;
			for (var index:int = 0; index < loader.length; index ++ ) {
				TweenLite.to(loader[index], 0.35, { x: (loader[index].width * location), y: 0 } );
				location++;
			}
		}		
	}

}