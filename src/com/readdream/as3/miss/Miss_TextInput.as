package com.readdream.as3.miss 
{
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.readdream.as3.robot.Robot_TextFormater;
	import flash.display.LineScaleMode;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_TextInput extends Sprite 
	{
		private var _tiWidth:Number;
		private var _tiHeight:Number
		private var _textSize:Number;
		private var borderShape:Shape;
		private var _defaultText:String;
		private var _contentType:String;
		private var textField:TextField;
		
		
		public function Miss_TextInput(_tiWidth:Number = 120, _tiHeight:Number = 35 , _textSize:Number = 12,_defaultText:String = "默认文本",_contentType:String = "normal") 
		{
			this._tiWidth = _tiWidth;
			this._tiHeight = _tiHeight;
			this._textSize = _textSize;
			this._defaultText = _defaultText;
			this._contentType = _contentType;
			TweenPlugin.activate([TintPlugin]);
			drawBorder();
			addTextField();
			registerEvent();
			
		}
		
		private function registerEvent():void 
		{
			textField.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler);
			this.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			this.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
			this.addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
		}
		
		private function rollOverHandler(e:MouseEvent):void 
		{
			if (stage.focus != textField) 
			{
				TweenLite.to(borderShape, 0.3, {tint:0xa1a1a1});
			}
		}
		
		private function rollOutHandler(e:MouseEvent):void 
		{
			if (stage.focus != textField) 
			{
				TweenLite.to(borderShape, 0.3, {tint:0x000000});
			}
		}
		
		private function focusOutHandler(e:FocusEvent):void 
		{
			//remove KEY_DOWN event listener
			if (this.stage) 
			{
				if (stage.hasEventListener(KeyboardEvent.KEY_DOWN)) {
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
				}
			}
			
			//whether has content
			if (textField.text == null || textField.text == "") 
			{
				//set font style to UNFOCUS
				textField.text = _defaultText;
			}
			textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.TEXTINPUT_UNFOCUS));
			////////////////////
			//apply border effect
			TweenLite.to(borderShape, 0.3, {tint:0x000000});
		}
		
		private function mouseClickHandler(e:MouseEvent):void 
		{
			////////////////////
			//apply border effect
			TweenLite.to(borderShape, 0.3, { tint:0x5080D8 } );
			
			stage.focus = textField;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			
			////////////////////
			//apply text font style
			textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.TEXTINPUT_FOCUS));
			textField.defaultTextFormat = Robot_TextFormater.getTextFormat(Robot_TextFormater.TEXTINPUT_FOCUS);
			if (textField.text == _defaultText) 
			{
				textField.text = "";
			}
			
		}
		
		private function keyDownHandler(e:KeyboardEvent):void 
		{
			////////////////////
			//manage enter event
			
			//a key was pressed, check if it was Enter => charCode 13.
			if( e.charCode == 13 ){
			  //ok, enter was pressed. Do your thing.
				trace("We pressed enter, doSomething" );
			}
		}
		
		private function addTextField():void 
		{
			//text field init
			textField = new TextField();
			//content type email / password / normal
			switch (_contentType) 
			{
				case "email":
					textField.restrict = "a-zA-Z0-9_\\-@\\.";
				break;
				case "password":
					textField.displayAsPassword = true;
				break;
				case "normal":
					
				break;
				default:
			}
			
			//textField.autoSize = TextFieldAutoSize.LEFT;
			textField.autoSize = TextFieldAutoSize.NONE;
			
			//textField.border = true;
			textField.maxChars = Math.floor((_tiWidth - 40) / _textSize * 2);
			//trace(textField.maxChars);
			textField.multiline = false;
			textField.type = TextFieldType.INPUT;

			
			//textField.border = true;
			
			textField.width = _tiWidth - 40;
			textField.height = _textSize + 6;
			textField.y = (_tiHeight - textField.height) / 2;
			textField.x = 20;
			addChild(textField);
			
			//init text style
			focusOutHandler(null);
		}
		
		private function drawBorder():void {
			//draw border
			borderShape = new Shape();
			borderShape.graphics.lineStyle(1, 0x5080D8, 1, true, LineScaleMode.NONE);
			borderShape.graphics.moveTo(0, 0);
			borderShape.graphics.lineTo(_tiWidth,0);
			borderShape.graphics.lineTo(_tiWidth,_tiHeight);
			borderShape.graphics.lineTo(0,_tiHeight);
			borderShape.graphics.lineTo(0, 0);
			addChild(borderShape);
			
			//add filter
			var dropShadow:DropShadowFilter = new DropShadowFilter(2,75,0x000000,0.8,4,4,0.4,1); 
			var filtersArray:Array = new Array(dropShadow); 
			borderShape.filters = filtersArray;
		}
		

		public function get tiHeight():Number 
		{
			return _tiHeight;
		}
		
		public function set tiHeight(value:Number):void 
		{
			_tiHeight = value;
		}
		
		public function get tiWidth():Number 
		{
			return _tiWidth;
		}
		
		public function set tiWidth(value:Number):void 
		{
			_tiWidth = value;
		}
		
		public function get textSize():Number 
		{
			return _textSize;
		}
		
		public function set textSize(value:Number):void 
		{
			_textSize = value;
		}
		
		public function get contentType():String 
		{
			return _contentType;
		}
		
		public function set contentType(value:String):void 
		{
			_contentType = value;
		}
	}
}