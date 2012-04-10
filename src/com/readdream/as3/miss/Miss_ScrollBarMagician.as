package com.readdream.as3.miss
{
	import com.greensock.TweenLite;
	import flash.display.CapsStyle;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.JointStyle;
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
		private var autoResize:Boolean;
		private var scrollBarX:Number;
		private var yGapToTop:Number;
		private var memoryOfProportion:Number = 1;
		private var mouseFlag:Boolean = false;
		private var rollFlag:Boolean = false;
		
		public function Miss_ScrollBarMagician(contentObj:DisplayObjectContainer, _maskerHeight :Number = 0, scrollBarX:Number = 0, autoResize:Boolean = false, yGapToTop:Number = 40)
		{
			
			trace("内容的高度是:" + contentObj.height + ",宽度是:" + contentObj.width);
			trace("显示区域高度是:" + _maskerHeight);
			this.yGapToTop = yGapToTop;
		
			this.autoResize = autoResize;
			

			trace("滑动条位置：" + scrollBarX);
			
			this._maskerHeight = _maskerHeight;
			this.contentObj = contentObj;
			this.scrollBarX = scrollBarX;
			
			//this.opaqueBackground = 0xffff00;
			this.addEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			
			trace("我的宽度：" + this.width);
			trace("我的高度：" + this.height);
		}
		
		private function addToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			this.stage.addEventListener(Event.RESIZE,changeHandler);
			if (autoResize) {
				_maskerHeight = this.stage.stageHeight - yGapToTop;
			}
			this.addEventListener(MouseEvent.ROLL_OVER, wheelHandler);
			this.addEventListener(MouseEvent.ROLL_OUT, mouseWheelRemoveHandler);
			var backgroundSprite:Sprite = new Sprite();
			backgroundSprite.graphics.beginFill(0x00ff00, 0);
			backgroundSprite.graphics.drawRect(0, 0, contentObj.width, _maskerHeight);
			backgroundSprite.graphics.endFill();
			addChild(backgroundSprite);
			initStuff();
		}
		
		private function mouseWheelRemoveHandler(e:MouseEvent):void 
		{
			this.stage.removeEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
			
			TweenLite.to(scrollBar, 0.3, { alpha:0 });
			TweenLite.to(scrollButton, 0.3, { alpha:0 ,onComplete:scrollButtonAlphaToZero} );
			
			
			scrollBar.removeEventListener(MouseEvent.CLICK,scrollBarClickHandler);
			scrollButton.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			scrollButton.removeEventListener(MouseEvent.ROLL_OVER, scrollButtonRollOverHandler);
			scrollButton.removeEventListener(MouseEvent.ROLL_OUT, scrollButtonRollOutHandler);
		}
		
		private function scrollButtonAlphaToZero():void 
		{
			//scrollButton.visible = false;
			//scrollBar.visible = false;
		}
		
		private function wheelHandler(e:MouseEvent):void 
		{
			scrollBar.visible = true;
			scrollButton.visible = true; 
			TweenLite.to(scrollButton,0.3,{alpha:0.7});
			TweenLite.to(scrollBar,0.3,{alpha:0.7});
			scrollBar.addEventListener(MouseEvent.CLICK,scrollBarClickHandler);
			scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			scrollButton.addEventListener(MouseEvent.ROLL_OVER, scrollButtonRollOverHandler);
			scrollButton.addEventListener(MouseEvent.ROLL_OUT, scrollButtonRollOutHandler);
			this.stage.addEventListener(MouseEvent.MOUSE_WHEEL,mouseWheelHandler);
		}
		
		
		private function initStuff():void 
		{
			
			scrollButton = new Sprite();  
			//scrollButton.graphics.lineStyle();
			scrollButton.graphics.beginFill(0xb1b1b1);
			scrollButton.graphics.drawRoundRect(0,0,10,_maskerHeight,5,5);
			//scrollButton.opaqueBackground = 0xE9E9E9;
			scrollButton.graphics.endFill();
			//scrollButton.graphics.lineStyle(1, 0xA6A6A6, 1, true, "normal", CapsStyle.ROUND, JointStyle.ROUND)
			//scrollButton.graphics.drawRoundRectComplex(0, 0, 10, _maskerHeight+4, 15, 15, 15, 15);
			//scrollButton.graphics.lineStyle();
			//scrollButton.graphics.beginFill(0xE9E9E9,0);
			//scrollButton.graphics.drawRect(1, 3, 10, _maskerHeight);
			//scrollButton.opaqueBackground = 0xE9E9E9;
			//scrollButton.graphics.endFill();
			scrollBar = new Sprite();
		
			scrollBar.graphics.lineStyle(2, 0xc6c6c6);
			//scrollBar.graphics.drawRoundRectComplex(0, 0, 10, _maskerHeight, 15, 15, 15, 15);
			scrollBar.graphics.moveTo(5, 0);
			scrollBar.graphics.lineTo(5, _maskerHeight);
			scrollBar.graphics.lineStyle();
		
			
			masker = new Sprite();
			masker.graphics.beginFill(0x00ff00);
			masker.graphics.drawRect(0, 0, contentObj.width, _maskerHeight);
			masker.graphics.endFill();
			
			//this.addEventListener(Event.ADDED_TO_STAGE, hanler);
			
			if (scrollBarX == 0) 
			{
				scrollBar.x = contentObj.width +10;
				scrollButton.x = contentObj.width + 10;
			} else {
				scrollButton.x = scrollBarX - 10;
				scrollBar.x = scrollBarX - 10;
			}
			
			
			contentObj.mask = masker;

			addChild(masker);
			addChild(contentObj);

			if (((_maskerHeight > 0) && (contentObj.height > _maskerHeight)) || (autoResize && contentObj.height > stage.stageHeight - yGapToTop ))
			{
				scrollButton.height = scrollBar.height * (_maskerHeight / contentObj.height);
				addChild(scrollBar);
				addChild(scrollButton); 
				scrollBar.addEventListener(MouseEvent.CLICK,scrollBarClickHandler);
				scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				scrollButton.addEventListener(MouseEvent.ROLL_OVER, scrollButtonRollOverHandler);
				scrollButton.addEventListener(MouseEvent.ROLL_OUT, scrollButtonRollOutHandler);
			}
		}
		
		
		private function scrollBarClickHandler(e:MouseEvent):void 
		{
			var clickYPosition:Number = e.localY * e.target.scaleY;
			//trace(e.target.scaleY);
			var tempMoveDistance:Number;
			if (autoResize) {
				tempMoveDistance = this.stage.stageHeight - yGapToTop;
			} else {
				tempMoveDistance = _maskerHeight;
			}
			if (clickYPosition < scrollButton.y) {
				trace("click: " + clickYPosition);
				trace("button: " + scrollButton.y);
				trace("高头");
				if ( -contentObj.y <= tempMoveDistance) {
					contentObj.y = 0;
					scrollButton.y = 0;
				} else {
					contentObj.y += tempMoveDistance;
					scrollButton.y = -(contentObj.y * scrollBar.height) / contentObj.height;
				}
			} else if(clickYPosition > scrollButton.y + scrollButton.height){
				trace("click: " + clickYPosition);
				trace("button: " + scrollButton.y);
				trace("底哈");
				if (contentObj.height - _maskerHeight - (-contentObj.y) < tempMoveDistance) {
					contentObj.y = _maskerHeight - contentObj.height;
					scrollButton.y = scrollBar.height - scrollButton.height;
				} else {
					contentObj.y -= tempMoveDistance;
					scrollButton.y = -(contentObj.y * scrollBar.height) / contentObj.height;
				}
			}
		}


		private function mouseDownHandler(e:MouseEvent):void 
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			if (scrollBarX == 0) {
				scrollButton.startDrag(false, new Rectangle(contentObj.width + 50, 0, 0, _maskerHeight - scrollButton.height));
			} else {
				scrollButton.startDrag(false, new Rectangle(scrollBarX - 10, 0, 0, _maskerHeight - scrollButton.height));
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
			contentObj.y = - (scrollButton.y * (contentObj.height - _maskerHeight)) / (scrollBar.height - scrollButton.height);
		}
		
		private function changeHandler(e:Event):void 
		{
			if (autoResize) {
				memoryOfProportion = scrollButton.y / (scrollBar.height - scrollButton.height);
				_maskerHeight = this.stage.stageHeight - yGapToTop;
				masker.height = _maskerHeight;
				scrollBar.height = _maskerHeight;
				scrollButton.height = scrollBar.height * (_maskerHeight / contentObj.height);
				scrollButton.y = memoryOfProportion * (scrollBar.height - scrollButton.height);
				contentObj.y = - (scrollButton.y * (contentObj.height - _maskerHeight)) / (scrollBar.height - scrollButton.height);
			}

			trace(scrollBar.stage);
			trace("----"+contentObj.height);
		
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

			
			if (contentObj.height > _maskerHeight && scrollBar.stage == null) 
			{
				trace("加滚动条");
				//trace("=-=-=-" + masker.height);
				//stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				addChild(masker);
				addChild(scrollBar);
				addChild(scrollButton);
			} else if(contentObj.height <= _maskerHeight && scrollBar.stage != null) {
				trace("移除滚动条");
				contentObj.y = 0;
				scrollButton.y = 0;
				//trace("=-=-=-" + masker.height);
				//stage.removeEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);
				scrollButton.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
				scrollBar.removeEventListener(MouseEvent.CLICK,scrollBarClickHandler);
				removeChild(masker);
				removeChild(scrollBar);
				removeChild(scrollButton);
			}
			//if (scrollButton.y > (this.stage.stageHeight - 30)) {
				//scrollButton.y = this.stage.stageHeight - 30 - yGapToTop;
				//contentObj.y = - (scrollButton.y * (contentObj.height - _maskerHeight)) / (scrollBar.height - scrollButton.height);
			//}
		}
		
		private function mouseWheelHandler(e:MouseEvent):void 
		{

			var _delta:int = e.delta;
			var newYpos:Number = scrollButton.y + -_delta * 15;
			trace(newYpos);

			if (newYpos >= 0 && newYpos < _maskerHeight - scrollButton.height) {

				//trace("not bottom");
				//trace(newYpos);
				//trace(_maskerHeight);
				//trace(contentObj.height);
				//trace(contentObj.y);
				//trace(_maskerHeight - scrollButton.height);
				scrollButton.y = newYpos;
				//TweenLite.to(scrollButton,0.2,{y:newYpos,overwrite:true});
				contentObj.y = - contentObj.height * (scrollButton.y / _maskerHeight);
				//TweenLite.to(contentObj,0.2,{y:- contentObj.height * (scrollButton.y / _maskerHeight),overwrite:true});
			}
			if (newYpos >= _maskerHeight - scrollButton.height) 
			{
				//trace("bottom");
				//trace(newYpos);
				//trace(_maskerHeight);
				//trace(contentObj.height);
				//trace(contentObj.y);
				//trace(_maskerHeight - scrollButton.height);
				scrollButton.y = _maskerHeight - scrollButton.height;
				contentObj.y = _maskerHeight - contentObj.height;
				//TweenLite.to(scrollButton, 0.2, { y:_maskerHeight - scrollButton.height ,overwrite:true} );
				//TweenLite.to(contentObj, 0.2, { y:_maskerHeight - contentObj.height ,overwrite:true} );
			}
			if (newYpos < 0)
			{
				contentObj.y = 0;
				
				scrollButton.y = 0;
			}
		}
		private function scrollButtonRollOutHandler(e:MouseEvent):void 
		{
			rollFlag = false;
			if (!mouseFlag) {
				TweenLite.to(scrollButton, 0, { alpha:0.7 } );
			}
			
		}
		
		private function scrollButtonRollOverHandler(e:MouseEvent):void 
		{
			rollFlag = true;
			TweenLite.to(scrollButton, 0, { alpha:1 } );
		}
	}
}