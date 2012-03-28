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
		private const contentBarPicWidth:int = 640;
		private const contentBarPicHeight:int = 400;
		
		private const contentBarPicX:Number = 40;
		private const contentBarPicY:Number = 40;
		
		
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
				loader.push(new Robot_PicLoader(temp, 2, 2, contentBarPicWidth - 4, contentBarPicHeight - 4));
			}
		
			///////////////////////
			//遮罩图片显示框
			lblPicture.graphics.beginFill(0xFFFFFF);
			lblPicture.graphics.drawRect(0, 0, contentBarPicWidth, contentBarPicHeight);
			lblPicture.graphics.endFill();
			var masker:Sprite = Mr_Dresser.getMasker(contentBarPicWidth, contentBarPicHeight);
			lblPicture.addChild(masker);
			lblPicture.mask = masker;
		
			/////////////////////////
			//为lblPicture添加阴影
			var filter:BitmapFilter = getBitmapFilter();
			var myFilters:Array = new Array();
			myFilters.push(filter);
			lblPicture.filters = myFilters;
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
				loader[index].x = (loader[index].width + 2) * index;
				loader[index].y = 0;
			}
			addChild(lblPicture);
		}
		
		private function getBitmapFilter():BitmapFilter
		{
			var color:Number = 0x000000;
			var angle:Number = 90;
			var alpha:Number = 0.65;
			var blurX:Number = 4;
			var blurY:Number = 8;
			var distance:Number = 4;
			var strength:Number = 0.65;
			var inner:Boolean = false;
			var knockout:Boolean = false;
			var quality:Number = BitmapFilterQuality.HIGH;
			return new DropShadowFilter(distance, angle, color, alpha, blurX, blurY, strength, quality, inner, knockout);
		}
		
		private function movePicture(i:int):void {
			var location :int = 0;
			location = location - i;
			for (var index:int = 0; index < loader.length; index ++ ) {
				TweenLite.to(loader[index], 0.35, { x: (loader[index].width * location), y: 0, ease: Linear.easeNone } )
				location++;
			}
		}		
	}

}