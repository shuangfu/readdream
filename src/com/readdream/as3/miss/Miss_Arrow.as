package com.readdream.as3.miss 
{
	import com.readdream.as3.robot.Robot_PicLoader;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_Arrow extends Sprite 
	{
		public static var arrowWidth:int = 24;
		public static var arrowHeight:int = 46;
		
		private var LeftNoSelect:Robot_PicLoader;
		public var LeftSelect:Robot_PicLoader;
		private var RightNoSelect:Robot_PicLoader;
		public var RightSelect:Robot_PicLoader;
		
		/**
		 * 翻页箭头
		 * 左边箭头X坐标 int | 右箭头Y坐标 int | 右箭头X坐标 int | 右箭头Y坐标 int
		 * 
		 * */		
		public function Miss_Arrow(leftArrowX:int,leftArrowY:int,rightArrowX:int,rightArrowY:int) 
		{
			LeftNoSelect = new Robot_PicLoader("assets/LeftCircleNoSelect.png",leftArrowX, leftArrowY, 24, 46);
			LeftSelect = new Robot_PicLoader("assets/LeftCircleSelect.png",leftArrowX, leftArrowY, 24, 46);
			RightNoSelect = new Robot_PicLoader("assets/RightCircleNoSelect.png",rightArrowX, rightArrowY, 24, 46);
			RightSelect = new Robot_PicLoader("assets/RightCircleSelect.png", rightArrowX, rightArrowY, 24, 46);
			addChild(LeftSelect);
			addChild(LeftNoSelect);
			addChild(RightSelect);
			addChild(RightNoSelect);			
			
			LeftNoSelect.addEventListener(MouseEvent.ROLL_OVER, LeftNoSelectRollOverHandler);
			LeftSelect.addEventListener(MouseEvent.ROLL_OUT, LeftSelectRollOutHandler);
			RightNoSelect.addEventListener(MouseEvent.ROLL_OVER, RightNoSelectRollOverHandler);
			RightSelect.addEventListener(MouseEvent.ROLL_OUT, RightSelectRollOutHandler);
		}
		
		private function RightSelectRollOutHandler(e:MouseEvent):void 
		{
			RightSelect.visible = false;
			RightNoSelect.visible = true;
		}
		
		private function RightNoSelectRollOverHandler(e:MouseEvent):void 
		{
			RightNoSelect.visible = false;
			RightSelect.visible = true;
		}
		
		
		private function LeftSelectRollOutHandler(e:MouseEvent):void 
		{
			LeftSelect.visible = false;
			LeftNoSelect.visible = true;
		}
		
		private function LeftNoSelectRollOverHandler(e:MouseEvent):void 
		{
			LeftNoSelect.visible = false;
			LeftSelect.visible = true;
		}
		
	}

}