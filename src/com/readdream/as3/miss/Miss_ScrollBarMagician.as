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
		private var _height:Number;
		private var tempMouseY:Number = 0;
		public function Miss_ScrollBarMagician(contentObj:DisplayObjectContainer,_height:Number) 
		{
			masker = new Sprite();
			scrollButton = new Sprite();
			scrollBar = new Sprite();
			this._height = _height;
			
			this.contentObj = contentObj;
			masker.graphics.beginFill(0x00ff00);
			masker.graphics.drawRect(0, 0, contentObj.width, _height);
			masker.graphics.endFill();
			
			scrollButton.graphics.beginFill(0xff0000);
			scrollButton.graphics.drawRect(0,0,10,_height);
			scrollButton.graphics.endFill();
			scrollButton.x = contentObj.width - 10;
			
			
			
			scrollBar.graphics.beginFill(0x00ff00);
			scrollBar.graphics.drawRect(0,0,4,_height);
			scrollBar.graphics.endFill();
			scrollBar.x = contentObj.width - 7;
			
			addChild(contentObj);
			if (contentObj.height > _height) 
			{
				trace("need scroll");
				addChild(masker);
				addChild(scrollBar);
				addChild(scrollButton);
				scrollButton.height = scrollBar.height * (masker.height / contentObj.height);
				stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			}
			contentObj.mask = masker;
			contentObj.addEventListener(MouseEvent.CLICK, changeHandler);
		}
		
		private function changeHandler(e:MouseEvent):void 
		{
			
			trace(scrollBar.stage);
			trace("----"+contentObj.height);
			scrollButton.height = scrollBar.height * (masker.height / contentObj.height);
			if (contentObj.height > _height && scrollBar.stage == null) 
			{
				trace("=-=-=-" + masker.height);
				stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				addChild(masker);
				addChild(scrollBar);
				addChild(scrollButton);
				
			} else if(contentObj.height <= _height && scrollBar.stage != null) 
			{
				contentObj.y = 0;
				scrollButton.y = 0;
				trace("=-=-=-" + masker.height);
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
				scrollButton.startDrag(false, new Rectangle(contentObj.width - 10, 0, 0, masker.height - scrollButton.height));
				//tempMouseY = e.stageY;
			}
		}
		
		private function mouseWheelHandler(e:MouseEvent):void 
		{
			var _delta:int = e.delta;
			var newYpos:Number = scrollButton.y + -_delta * 3;
			trace(newYpos);
			if (newYpos >= 0 && newYpos <= masker.height - scrollButton.height) {
				trace("not bottom");
				scrollButton.y = newYpos;
				contentObj.y =- contentObj.height * (scrollButton.y / masker.height);
			}
			if (newYpos >= masker.height - scrollButton.height) 
			{
				trace("bottom");
				
				scrollButton.y = masker.height - scrollButton.height;
				contentObj.y = masker.height - contentObj.height;
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
			contentObj.y = - contentObj.height * (scrollButton.y / masker.height);
			//scrollButton.y = tempMouseY + e.localY;
		}
	}
}