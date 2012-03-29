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
		private var _maskeHeight:Number;
		private var tempMouseY:Number = 0;
		public function Miss_ScrollBarMagician(contentObj:DisplayObjectContainer,_maskeHeight:Number) 
		{
			masker = new Sprite();
			scrollButton = new Sprite();
			scrollBar = new Sprite();
			this._maskeHeight = _maskeHeight;
			trace(_maskeHeight);
			this.contentObj = contentObj;
			masker.graphics.beginFill(0x00ff00);
			masker.graphics.drawRect(0, 0, contentObj.width, _maskeHeight);
			masker.graphics.endFill();
			
			scrollButton.graphics.beginFill(0xff0000);
			scrollButton.graphics.drawRect(0,0,10,_maskeHeight);
			scrollButton.graphics.endFill();
			scrollButton.x = contentObj.width - 10;
			
			
			
			scrollBar.graphics.beginFill(0x00ff00);
			scrollBar.graphics.drawRect(0,0,4,_maskeHeight);
			scrollBar.graphics.endFill();
			scrollBar.x = contentObj.width - 7;
			
			addChild(contentObj);
			if (contentObj.height > _maskeHeight) 
			{
				//trace("need scroll");
				addChild(masker);
				addChild(scrollBar);
				addChild(scrollButton);
				scrollButton.height = scrollBar.height * (_maskeHeight / contentObj.height);
				stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			}
			contentObj.mask = masker;
			contentObj.addEventListener(MouseEvent.CLICK, changeHandler);
		}

		private function changeHandler(e:MouseEvent):void 
		{
			scrollButton.height = scrollBar.height * (_maskeHeight / contentObj.height);
			if (contentObj.height + contentObj.y <  _maskeHeight && contentObj.y < 0) {
				//如果变小了，并且比滑动区域小，就改变坐标
				contentObj.y =  _maskeHeight - contentObj.height;
				scrollButton.y = scrollBar.height - scrollButton.height;
			}
			if (contentObj.height + contentObj.y > _maskeHeight && contentObj.y > 0) 
			{
				contentObj.y = 0;
				scrollButton.y = 0;
			}
			//trace(scrollBar.stage);
			//trace("----"+contentObj.height);
			trace("点了");
			if (contentObj.height > _maskeHeight && scrollBar.stage == null) 
			{
				trace("加滚动条");
				//trace("=-=-=-" + masker.height);
				stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				addChild(masker);
				addChild(scrollBar);
				addChild(scrollButton);
			} else if(contentObj.height <= _maskeHeight && scrollBar.stage != null) {
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
				scrollButton.startDrag(false, new Rectangle(contentObj.width - 10, 0, 0, _maskeHeight - scrollButton.height));
				//tempMouseY = e.stageY;
			}
		}
		
		private function mouseWheelHandler(e:MouseEvent):void 
		{
			var _delta:int = e.delta;
			var newYpos:Number = scrollButton.y + -_delta * 3;
			//trace(newYpos);
			if (newYpos >= 0 && newYpos < _maskeHeight - scrollButton.height) {
				trace("not bottom");
				trace(newYpos);
				trace(_maskeHeight);
				trace(contentObj.height);
				trace(contentObj.y);
				trace(_maskeHeight - scrollButton.height);
				scrollButton.y = newYpos;
				contentObj.y =- contentObj.height * (scrollButton.y / _maskeHeight);
			}
			if (newYpos >= _maskeHeight - scrollButton.height) 
			{
				trace("bottom");
				trace(newYpos);
				trace(_maskeHeight);
				trace(contentObj.height);
				trace(contentObj.y);
				trace(_maskeHeight - scrollButton.height);
				scrollButton.y = _maskeHeight - scrollButton.height;
				contentObj.y = _maskeHeight - contentObj.height;
			}
			if (newYpos < 0)
			{
				contentObj.y = 0;
				scrollButton.y = 0;
			}
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
			contentObj.y = - contentObj.height * (scrollButton.y / _maskeHeight);
			//scrollButton.y = tempMouseY + e.localY;
		}
	}
}