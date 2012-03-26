package com.readdream.as3.miss 
{
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
		private var _psw:Boolean;
		private var _textSize:Number;
		private var borderShape:Shape;
		private var _defaultText:String;
		
		private var textField:TextField;
		
		
		public function Miss_TextInput(_tiWidth:Number = 120, _tiHeight:Number = 35 , _psw:Boolean = false, _textSize:Number = 12,_defaultText:String = "默认文本") 
		{
			this._tiWidth = _tiWidth;
			this._tiHeight = _tiHeight;
			this._psw = _psw;
			this._textSize = _textSize;
			this._defaultText = _defaultText;
			
			drawBorder();
			addTextField();
			registerEvent();
		}
		
		private function registerEvent():void 
		{
			textField.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler);
			this.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			//this.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
			//this.addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
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
		}
		
		private function mouseClickHandler(e:MouseEvent):void 
		{
			stage.focus = textField;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			////////////////////
			//apply border effect
			
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
			//textField.autoSize = TextFieldAutoSize.LEFT;
			textField.autoSize = TextFieldAutoSize.NONE;
			
			//textField.border = true;
			textField.maxChars = Math.floor((_tiWidth - 40) / _textSize * 2);
			//trace(textField.maxChars);
			textField.multiline = false;
			textField.type = TextFieldType.INPUT;

			textField.displayAsPassword = _psw;
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
			var dropShadow:DropShadowFilter = new DropShadowFilter(2,75,0x000000,0.8,4,4,0.3,1); 
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
		
		public function get psw():Boolean 
		{
			return _psw;
		}
		
		public function set psw(value:Boolean):void 
		{
			_psw = value;
		}
		
		public function get textSize():Number 
		{
			return _textSize;
		}
		
		public function set textSize(value:Number):void 
		{
			_textSize = value;
		}
	}
}