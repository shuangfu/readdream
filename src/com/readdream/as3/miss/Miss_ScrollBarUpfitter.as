package com.readdream.as3.miss 
{
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_ScrollBarUpfitter extends Sprite 
	{
		private var _maskHeight:Number;
		private var _autoResize:Number;
		private var _contentObj:DisplayObject;
		private var _active:Boolean;
		
		private var scrollButton:Sprite;
		private var scrollBar:Sprite;
		private var maskSprite:Sprite;
		
		private var memoryOfProportion:Number = 1;
		private var mouseDownFlag:Boolean = false;
		private var mouseOverFlag:Boolean = false;
		
		private var mouseForHideFlag:Boolean;
		
		
		public function Miss_ScrollBarUpfitter(_contentObj:DisplayObject,_autoResize:Number,_maskHeight:Number = 0)
		{
			//_autoResize = -1 不用自动改变mask大小,不为-1时代表_maskHeight = 垂直分辨率 - _autoResize
			this._maskHeight = _maskHeight;
			this._autoResize = _autoResize;
			this._contentObj = _contentObj;
			
			
			
			_active = true;
			activationScrollSystem();
		}
		
		private function activationScrollSystem():void 
		{
			if (_contentObj != null) 
			{
				trace("++++  " + _contentObj.width);
				_contentObj.addEventListener(Event.ADDED_TO_STAGE,setupScrollSystem);
			}
		}
		
		private function setupScrollSystem(e:Event):void 
		{
			_contentObj.parent.addChildAt(this, _contentObj.parent.getChildIndex(_contentObj) + 1);
			//buildScrollStuff();
			setupResizeSystem();
			resizeHandler(null);
		}
		private function freezeScrollSystem():void {
			_contentObj.mask = null;
			unbuildScrollStuff();
			_contentObj.removeEventListener(Event.ADDED_TO_STAGE,setupScrollSystem);
		}

		private function updateScrollStuff():void {
			//更新scrollbar 和scrollbutton的大小 ， 并修正contentObj和scrollbutton的位置
			scrollBar.graphics.clear();
			scrollBar.graphics.lineStyle(2, 0xc6c6c6);
			scrollBar.graphics.moveTo(6, 0);
			scrollBar.graphics.lineTo(6, _maskHeight - 80);
			scrollBar.graphics.lineStyle();
			scrollBar.graphics.beginFill(0xff0000, 0);
			scrollBar.graphics.drawRect(0, 0, 12, _maskHeight -80);
			scrollBar.graphics.endFill();
			
			scrollButton.graphics.clear();
			scrollButton.graphics.beginFill(0xe1e1e1);
			scrollButton.graphics.drawRoundRect(0,0,12,scrollBar.height * (_maskHeight / _contentObj.height),12,12);
			scrollButton.graphics.endFill();
			
			maskSprite.graphics.clear();
			maskSprite.graphics.beginFill(0x00ff00);
			
			maskSprite.graphics.drawRect(0, 0, _contentObj.width, _maskHeight);
			maskSprite.graphics.endFill();
			
			scrollButton.y = memoryOfProportion * (scrollBar.height - scrollButton.height);
			_contentObj.y = - (scrollButton.y * (contentObj.height - _maskHeight)) / (scrollBar.height - scrollButton.height) + _autoResize;
			
		}
		//////////////////////////////////    ResizeSystem  ////////////////////////////////////
		private function setupResizeSystem():void {
			_contentObj.addEventListener(Event.RESIZE, resizeHandler);
			if (_autoResize > -1) 
			{
				this.stage.addEventListener(Event.RESIZE,resizeHandler);
			}
		}
		
		private function removeResizeSystem():void {
			_contentObj.removeEventListener(Event.RESIZE, resizeHandler); 
			if (_autoResize > -1) 
			{
				this.stage.removeEventListener(Event.RESIZE,resizeHandler);
			}
		}
		private function resizeHandler(e:Event):void 
		{
			//trace("/./.3333" + _contentObj.width);
			//确定 _maskHeight  的值
			if (_autoResize > -1) 
			{
				_maskHeight = _contentObj.stage.stageHeight - _autoResize;
				//trace("zzz  " + _maskHeight);
			}
			//确定 memoryOfProportion  的值
			if (scrollBar != null) 
			{
				memoryOfProportion = scrollButton.y / (scrollBar.height - scrollButton.height);
			}

			//判断是否需要滚动条
			if (_contentObj.height > _maskHeight) {
				if (_contentObj.mask == this.maskSprite && this.maskSprite != null) {  //如果已建立滚动条 那么刷新滚动条
					if (_contentObj.height + contentObj.y <  _maskHeight && contentObj.y < 0) {

					//如果变小了，并且比滑动区域小，就改变坐标
					_contentObj.y =  _maskHeight - contentObj.height + _autoResize;
					scrollButton.y = scrollBar.height - scrollButton.height;
					}
					if (_contentObj.height + _contentObj.y > _maskHeight && _contentObj.y > 0) 
					{
						_contentObj.y = _autoResize;
						scrollButton.y = 0;
					}

				} else {//未建立滚动条，则建立滚动条
					buildScrollStuff();
				}
				updateScrollStuff();
				_contentObj.mask = this.maskSprite;
			} else if (_contentObj.mask == this.maskSprite) {//不需要滚动条 且已建立滚动条，则移除
				unbuildScrollStuff();
				contentObj.y = 0;
				_contentObj.mask = null;
			}
		}
		/////////////////////////     ScrollStuff        ////////////////////////////////////////////
		private function unbuildScrollStuff():void 
		{
			if(scrollBar != null && scrollBar.parent != null){
				removeChild(scrollBar);
				removeChild(scrollButton);
				removeChild(maskSprite);
				
				shutdownScrollBarInteractiveSystem();
				shutdownMouseWheelSystem();
				shutdownButtonEffectSystem();
				shutdownDragSystem();
				shutdownHideScrollStuffSystem();
			}
				
		}
		
		private function buildScrollStuff():void 
		{
			if (scrollBar == null && scrollButton == null && maskSprite == null) {//首次运行
				scrollBar = new Sprite();
				scrollButton = new Sprite();
				maskSprite = new Sprite();
			
			}
			//place it
			scrollBar.x = _contentObj.width +10;
			scrollButton.x = _contentObj.width + 10;
			
			
			addChild(scrollBar);
			addChild(scrollButton);
			addChild(maskSprite);
			
			// add interactive
			setupScrollBarInteractiveSystem();
			setupMouseWheelSystem();
			setupButtonEffectSystem();
			setupDragSystem();
			setupHideScrollStuffSystem();
		}
		//////////////////////////////////    HideScrollStuffSystem    ///////////////////////////
		private function setupHideScrollStuffSystem():void {
				//addEventListener(MouseEvent.ROLL_OUT,hideRollOutHandler);
				//addEventListener(MouseEvent.ROLL_OVER,hideRollOverHandler);
			
		}
		private function shutdownHideScrollStuffSystem():void {
			//removeEventListener(MouseEvent.ROLL_OUT,hideRollOutHandler);
			//removeEventListener(MouseEvent.ROLL_OVER,hideRollOverHandler);
			
		}
		
		private function hideRollOutHandler(e:MouseEvent):void 
		{
			if (scrollBar != null) 
			{
				TweenLite.to(scrollBar,0.3,{alpha:0});
				TweenLite.to(scrollButton,0.3,{alpha:0});
			}
		}
		private function hideRollOverHandler(e:MouseEvent):void 
		{
			if (scrollBar != null) 
			{
				TweenLite.to(scrollBar,0.3,{alpha:1});
				TweenLite.to(scrollButton,0.3,{alpha:1});
			}
		}
		
		//////////////////////////////////    ScrollBarInteractiveSystem   /////////////////////
		private function setupScrollBarInteractiveSystem():void {
			scrollBar.addEventListener(MouseEvent.CLICK,scrollBarClickHandler);
		}
		private function shutdownScrollBarInteractiveSystem():void {
			scrollBar.removeEventListener(MouseEvent.CLICK,scrollBarClickHandler);
		}
		private function scrollBarClickHandler(e:MouseEvent):void 
		{
			var clickYPosition:Number = e.localY * e.target.scaleY;
			var tempMoveDistance:Number;
			tempMoveDistance = this.stage.stageHeight - _autoResize;
			if (clickYPosition < scrollButton.y) {
				if ( -contentObj.y <= tempMoveDistance) {
					contentObj.y = 0;
					scrollButton.y = 0;
				} else {
					contentObj.y += tempMoveDistance;
					scrollButton.y = -(contentObj.y * scrollBar.height) / _contentObj.height;
				}
			} else if(clickYPosition > scrollButton.y + scrollButton.height){
				if (contentObj.height - _maskHeight - (-contentObj.y) < tempMoveDistance) {
					contentObj.y = _maskHeight - _contentObj.height + _autoResize;
					scrollButton.y = scrollBar.height - scrollButton.height;
				} else {
					contentObj.y -= tempMoveDistance;
					scrollButton.y = -(contentObj.y * scrollBar.height) / _contentObj.height + _autoResize;
				}
			}
		}
		
		//////////////////////////////////    WheelSystem  ///////////////////////////////////
		private function setupMouseWheelSystem():void {
			_contentObj.addEventListener(MouseEvent.MOUSE_WHEEL,mouseWheelHandler);
		}
		private function shutdownMouseWheelSystem():void {
			_contentObj.removeEventListener(MouseEvent.MOUSE_WHEEL,mouseWheelHandler);
		}
		
		private function mouseWheelHandler(e:MouseEvent):void 
		{
			var _delta:int = e.delta;
			var newYpos:Number = scrollButton.y + -_delta * 15;
			trace(newYpos);

			if (newYpos >= 0 && newYpos < _maskHeight - scrollButton.height - 80) {
				scrollButton.y = newYpos;
				_contentObj.y = - _contentObj.height * (scrollButton.y / scrollBar.height) + _autoResize;
			}
			if (newYpos >= _maskHeight - scrollButton.height - 80) 
			{
				scrollButton.y = scrollBar.height - scrollButton.height;
				_contentObj.y = _maskHeight - _contentObj.height + _autoResize;
			}
			if (newYpos < 0)
			{
				_contentObj.y = _autoResize;
				
				scrollButton.y = 0;
			}
		}
		//////////////////////////////////    ButtonEffectSystem  ////////////////////////////
		private function setupButtonEffectSystem():void {
			scrollButton.addEventListener(MouseEvent.ROLL_OVER,scrollButtonRollOverHandler);
			scrollButton.addEventListener(MouseEvent.ROLL_OUT,scrollButtonRollOutHandler);
		}
		private function shutdownButtonEffectSystem():void {
			scrollButton.removeEventListener(MouseEvent.ROLL_OVER,scrollButtonRollOverHandler);
			scrollButton.removeEventListener(MouseEvent.ROLL_OUT,scrollButtonRollOutHandler);
		}
		private function scrollButtonRollOverHandler(e:MouseEvent):void {
			mouseOverFlag = true;
			TweenLite.to(scrollButton, 0.3, { tint: 0x8f8f8f} );
		}
		private function scrollButtonRollOutHandler(e:MouseEvent):void {
			
			if (!mouseDownFlag) {
				TweenLite.to(scrollButton, 0.3, { tint: 0xe1e1e1} );
			} else {
				mouseOverFlag = false;
			}
			
		}
		//////////////////////////////////    DragSystem  ////////////////////////////////////
		private function setupDragSystem():void {
			scrollButton.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		private function shutdownDragSystem():void {
			scrollButton.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		private function mouseDownHandler(e:MouseEvent):void {
			mouseDownFlag = true;
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			
			scrollButton.startDrag(false, new Rectangle(_contentObj.width + 10, 0, 0, _maskHeight - scrollButton.height -80));
			//scrollButton.startDrag();
		}
		
		private function mouseUpHandler(e:MouseEvent):void 
		{
			mouseDownFlag = false;
			if (!mouseOverFlag) {
				TweenLite.to(scrollButton, 0.3, { tint: 0xc1c1c1} );
			}
			scrollButton.stopDrag();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
		
		private function mouseMoveHandler(e:MouseEvent):void 
		{
			contentObj.y = - (scrollButton.y * (contentObj.height - _maskHeight)) / (scrollBar.height - scrollButton.height) + _autoResize;
		}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		public function get maskHeight():Number 
		{
			return _maskHeight;
		}
		
		public function set maskHeight(value:Number):void 
		{
			_maskHeight = value;
		}
		
		public function get autoResize():Number 
		{
			return _autoResize;
		}
		
		public function set autoResize(value:Number):void 
		{
			_autoResize = value;
		}
		
		public function get contentObj():DisplayObject 
		{
			return _contentObj;
		}
		
		public function set contentObj(value:DisplayObject):void 
		{
			_contentObj = value;
		}
		
		public function get active():Boolean 
		{
			return _active;
		}
		
		public function set active(value:Boolean):void 
		{
			_active = value;
			if (_active) 
			{
				activationScrollSystem();
			} else {
				freezeScrollSystem();
			}
		}
		
	}

}