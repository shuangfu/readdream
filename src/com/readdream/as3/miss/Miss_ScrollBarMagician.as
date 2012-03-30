package com.readdream.as3.miss
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_ScrollBarMagician extends Sprite
	{
		private var masker:Sprite;
		private var scrollButton:Sprite;
		private var scrollBar:Sprite;
		private var contentObj:DisplayObjectContainer;
		private var _maskerHeight:Number;
		private var tempMouseY:Number = 0;

		private var scrollBarX:Number;
		public function Miss_ScrollBarMagician(contentObj:DisplayObjectContainer,_maskerHeight:Number,scrollBarX:Number = 0) 
		{
			trace("1 " + contentObj.height);
			trace("content object width",contentObj.width);
			this.opaqueBackground = 0xffff00;
			if (scrollBarX == 0) {
				scrollBarX = contentObj.width;
			}
			this.scrollBarX = scrollBarX;
			masker = new Sprite();
			scrollButton = new Sprite();
			scrollBar = new Sprite();
			this._maskerHeight = _maskerHeight;
			trace(_maskerHeight);
			this.contentObj = contentObj;
			masker.graphics.beginFill(0x00ff00);
			masker.graphics.drawRect(0, 0, contentObj.width, _maskerHeight);
			masker.graphics.endFill();
			
			scrollButton.graphics.beginFill(0xff0000);
			scrollButton.graphics.drawRect(0,0,10,_maskerHeight);
			scrollButton.graphics.endFill();
			scrollButton.x = scrollBarX;
			
			
			
			scrollBar.graphics.beginFill(0x00ff00);
			scrollBar.graphics.drawRect(0,0,4,_maskerHeight);
			scrollBar.graphics.endFill();
			scrollBar.x = scrollBarX+3;

			
			addChild(contentObj);
			if (contentObj.height > _maskerHeight) 
			{
				contentObj.mask = masker;
				scrollButton.height = scrollBar.height * (_maskerHeight / contentObj.height);
				addChild(scrollButton);
				addChild(masker);
				addChild(scrollBar);
				scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			}
			//contentObj.addEventListener(MouseEvent.CLICK, changeHandler);
			trace(scrollBar.height);
			trace("3 " + contentObj.height);
			trace(_maskerHeight);
		}

		private function changeHandler(e:MouseEvent):void 
		{
			//trace(stage.hasEventListener(MouseEvent.MOUSE_WHEEL));

			//if(!stage.hasEventListener(MouseEvent.MOUSE_WHEEL)){
					//stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				//}
			trace(scrollBar.stage);
			trace("----"+contentObj.height);
			if (contentObj.height > _maskerHeight && scrollBar.stage == null) 




			scrollButton.height = scrollBar.height * (_maskerHeight / contentObj.height);
			if (contentObj.height + contentObj.y <  _maskerHeight && contentObj.y < 0) {

				//如果变小了，并且比滑动区域小，就改变坐标
				contentObj.y =  _maskerHeight - contentObj.height;
				scrollButton.y = scrollBar.height - scrollButton.height;
			}
			if (contentObj.height + contentObj.y > _maskerHeight && contentObj.y > 0) 

			{
				contentObj.y = 0;
				scrollButton.y = 0;
			}
			//trace(scrollBar.stage);
			//trace("----"+contentObj.height);
			trace("点了");
			if (contentObj.height > _maskerHeight && scrollBar.stage == null) 
			{
				trace("加滚动条");
				//trace("=-=-=-" + masker.height);
				stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				addChild(masker);
				addChild(scrollBar);
				addChild(scrollButton);
			} else if(contentObj.height <= _maskerHeight && scrollBar.stage != null) {
				trace("移除滚动条");
				contentObj.y = 0;
				scrollButton.y = 0;
				//trace("=-=-=-" + masker.height);
				stage.removeEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				scrollButton.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				removeChild(masker);
				removeChild(scrollBar);
				removeChild(scrollButton);
			}
		}
		
		private function mouseDownHandler(e:MouseEvent):void 
		{
			if (stage != null) {
				stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
				stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
				scrollButton.startDrag(false, new Rectangle(scrollBarX, 0, 0, _maskerHeight - scrollButton.height));
				//tempMouseY = e.stageY;
			}
		}
		
		private function mouseWheelHandler(e:MouseEvent):void 
		{
			//var _delta:int = e.delta;
			//var newYpos:Number = scrollButton.y + -_delta * 3;
			//trace(newYpos);
//
			//if (newYpos >= 0 && newYpos < _maskerHeight - scrollButton.height) {
//
				//trace("not bottom");
				//trace(newYpos);
				//trace(_maskerHeight);
				//trace(contentObj.height);
				//trace(contentObj.y);
				//trace(_maskerHeight - scrollButton.height);
				//scrollButton.y = newYpos;
				//contentObj.y =- contentObj.height * (scrollButton.y / _maskerHeight);
			//}
			//if (newYpos >= _maskerHeight - scrollButton.height) 
			//{
				//trace("bottom");
				//trace(newYpos);
				//trace(_maskerHeight);
				//trace(contentObj.height);
				//trace(contentObj.y);
				//trace(_maskerHeight - scrollButton.height);
				//scrollButton.y = _maskerHeight - scrollButton.height;
				//contentObj.y = _maskerHeight - contentObj.height;
			//}
			//if (newYpos < 0)
			//{
				//contentObj.y = 0;
				//scrollButton.y = 0;
			//}
		}
		private function mouseUpHandler(e:MouseEvent):void 
		{
			scrollButton.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			//tempMouseY = 0;
		}
		
		private function mouseMoveHandler(e:MouseEvent):void 
		{
			//contentObj.y = - contentObj.height * (scrollButton.y / _maskerHeight);
			contentObj.y = - (scrollButton.y * (contentObj.height - _maskerHeight)) / (scrollBar.height - scrollButton.height);
			//scrollButton.y = tempMouseY + e.localY;
			
		}
	}
}