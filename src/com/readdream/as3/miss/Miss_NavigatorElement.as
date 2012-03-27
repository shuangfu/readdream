package com.readdream.as3.miss
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.readdream.as3.robot.Robot_TextFormater;
	import com.readdream.as3.VO.Vo_NavigatorElement;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_NavigatorElement extends Sprite
	{
		private var _vo:Vo_NavigatorElement;
		private var textField:TextField;
		private var backgroundShape:Shape;
		private var _textSize:Number;
		private var _activedFlag:Boolean;
		public function Miss_NavigatorElement(vo:Vo_NavigatorElement)
		{
			this._vo = _vo;
			drawBackground();
			addTextField();
			registerEvent();
			turnThisToNormal();
			_activedFlag = false;
		}
		
		private function registerEvent():void 
		{
			this.addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
			this.addEventListener(MouseEvent.ROLL_OUT,rollOutHandler);
			this.addEventListener(MouseEvent.CLICK,clickHandler);
		}
		
		private function rollOverHandler(e:MouseEvent):void 
		{
			//set text font style
			if (!_activedFlag) 
			{
				textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_MOUSEON_REGULAR));
			}
			
			//set background
		}
		
		private function rollOutHandler(e:MouseEvent):void 
		{
			//set text font style
			if (!_activedFlag) 
			{
				textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_NORMAL_REGULAR));
			}
			//set background
		}
		
		private function clickHandler(e:MouseEvent):void 
		{
			//set text font style
			textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_ACTIVED_REGULAR));
			turnThisToActived();
			_activedFlag = true;
			//_activedFlag = !_activedFlag;
			//if (_activedFlag) {
			//} else {
				//textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_NORMAL_REGULAR));
				//turnThisToNormal();
			//}
		}
		
		private function drawBackground():void 
		{
			backgroundShape = new Shape();
			backgroundShape.graphics.beginFill(0xffffff);
			backgroundShape.graphics.drawRoundRect(0, 0, 215, 30, 5, 5);
			backgroundShape.graphics.endFill();
			addChild(backgroundShape);
		}
		
		private function turnThisToActived():void {
			TweenLite.to(backgroundShape, 0.3, { tint:0x5080D8 } );
			TweenMax.to(textField, 0.3, { dropShadowFilter: { color:0x000000, alpha:0.3, blurX:2, blurY:2, angle:270, distance:1 }} );
		}
		private function turnThisToNormal():void {
			TweenLite.to(backgroundShape, 0.3, { tint:0xECECEC } );
			TweenMax.to(textField, 0.3, { dropShadowFilter: { color:0xffffff, alpha:1, blurX:2, blurY:2, angle:90, distance:1 }} );
		}
		
		private function addTextField():void
		{
			//get the size of font
			var tempTextFormat:TextFormat = Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_NORMAL_REGULAR);
			_textSize = tempTextFormat.size.toString();
			
			textField = new TextField();
			textField.type = TextFieldType.DYNAMIC;
			textField.autoSize = TextFieldAutoSize.NONE;
			textField.selectable = false;
			//textField.maxChars = Math.floor((_tiWidth - 40) / _textSize * 2);
			//trace(textField.maxChars);
			textField.multiline = false;
			textField.text = _vo.lable;
			textField.setTextFormat(tempTextFormat);
			//textField.border = true;
			textField.width = 215 - 40;
			textField.height = _textSize + 4;
			textField.y = (30 - textField.height) / 2;
			
			
			
			//place it
			if (_vo.fatherNid == 0) 
			{
				textField.x = 20;
					
			} else {
				textField.x = 40;
				textField.width = 215 - 40 - 20;
			}

			addChild(textField);
		}
		
		public function get activedFlag():Boolean 
		{
			return _activedFlag;
		}
		
		public function set activedFlag(value:Boolean):void 
		{
			_activedFlag = value;
		}
		
		public function get vo():Vo_NavigatorElement 
		{
			return _vo;
		}
		
		public function set vo(value:Vo_NavigatorElement):void 
		{
			_vo = value;
		}
	
	}

}