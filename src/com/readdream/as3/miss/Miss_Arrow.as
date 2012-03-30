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
		
		public var leftNoSelect:Robot_PicLoader;
		public var leftSelect:Robot_PicLoader;
		public var rightNoSelect:Robot_PicLoader;
		public var rightSelect:Robot_PicLoader;
		
		/**
		 * 翻页箭头
		 * 左边箭头X坐标 int | 右箭头Y坐标 int | 右箭头X坐标 int | 右箭头Y坐标 int
		 * 
		 * */		
		public function Miss_Arrow(leftArrowX:Number,leftArrowY:Number,rightArrowX:Number,rightArrowY:Number) 
		{
			leftNoSelect = new Robot_PicLoader("assets/LeftCircleNoSelect.png",0, 0, 24, 46);
			leftSelect = new Robot_PicLoader("assets/LeftCircleSelect.png",0, 0, 24, 46);
			rightNoSelect = new Robot_PicLoader("assets/RightCircleNoSelect.png",0, 0, 24, 46);
			rightSelect = new Robot_PicLoader("assets/RightCircleSelect.png", 0, 0, 24, 46);
			leftNoSelect.x = leftArrowX;
			leftNoSelect.y = leftArrowY;
			leftSelect.x = leftArrowX+24;
			leftSelect.y = leftArrowY;
			rightNoSelect.x = rightArrowX;
			rightNoSelect.y = rightArrowY;
			rightSelect.x = rightArrowX - 24;
			trace(rightSelect.x);
			rightSelect.y = rightArrowY;
			
			rightSelect.visible = false;
			leftSelect.visible = false;
			
			addChild(leftNoSelect);
			addChild(leftSelect);
			addChild(rightNoSelect);
			addChild(rightSelect);
			
			leftNoSelect.addEventListener(MouseEvent.ROLL_OVER, leftNoSelectRollOverHandler);
			leftSelect.addEventListener(MouseEvent.ROLL_OUT, leftSelectRollOutHandler);
			rightNoSelect.addEventListener(MouseEvent.ROLL_OVER, rightNoSelectRollOverHandler);
			rightSelect.addEventListener(MouseEvent.ROLL_OUT, rightSelectRollOutHandler);
		}
		
		private function rightSelectRollOutHandler(e:MouseEvent):void 
		{
			rightSelect.visible = false;
			//rightNoSelect.visible = true;
		}
		
		private function rightNoSelectRollOverHandler(e:MouseEvent):void 
		{
			//rightNoSelect.visible = false;
			rightSelect.visible = true;
		}
		
		
		private function leftSelectRollOutHandler(e:MouseEvent):void 
		{
			leftSelect.visible = false;
			//leftNoSelect.visible = true;
		}
		
		private function leftNoSelectRollOverHandler(e:MouseEvent):void 
		{
			//leftNoSelect.visible = false;
			leftSelect.visible = true;
		}
		
	}

}