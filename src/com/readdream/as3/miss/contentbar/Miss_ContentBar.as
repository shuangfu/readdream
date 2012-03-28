package com.readdream.as3.miss.contentbar
{
	import com.greensock.easing.Linear;
	import com.greensock.TweenLite;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_ContentBar extends Sprite
	{
		private const barWidth:int = 980;
		private const barHeight:int = 560;

		private const lblListX:Number = 40;
		private const lblListY:Number = 470;
		private const contentBarPicX:Number = 40;
		private const contentBarPicY:Number = 40;
		
		private var sprOverview:Sprite;
		private var sprDetails:Sprite;
		private var sprRelated:Sprite;
		
		private var matchComp:TextField;
		private var matchContent:TextField;
		private var lblPicture:Miss_LabelPicture;

		
		private var lblList:Miss_LabelPictureList;
		private var temp:Number;
		
		public function Miss_ContentBar(vo:Vo_Match)
		{
			graphics.beginFill(0xF1F1F1);
			graphics.drawRect(0, 1, barWidth, barHeight);
			graphics.endFill();
			
			initData(vo);
			setupImage();
			
		}
		
		
		private function initData(vo:Vo_Match):void
		{
			lblPicture = new Miss_LabelPicture(vo);
			lblList = new Miss_LabelPictureList(vo);			
		
		}
		
	
		private function setupImage():void 
		{
			var objArr:Array = new Array();
			objArr[0] = { stuff:lblPicture, xPos:contentBarPicX, yPos:contentBarPicY };
			objArr[1] = { stuff:lblList, xPos:40, yPos:470 };
			Mr_Layouter.layouter(this, objArr);
		}
		
		
		
	
	}

}

			