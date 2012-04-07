package com.readdream.as3.miss
{
	import com.greensock.TweenMax;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.robot.Robot_TextFormater;
	import flash.display.CapsStyle;
	import flash.display.GradientType;
	import flash.display.JointStyle;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_Button extends Sprite
	{
		private var sprDefault:Sprite;
		private var txtText:TextField;
		private var sprBorder:Sprite;
		public function Miss_Button(str:String, sizeWidth:Number, sizeHeight:Number)
		{
			initStyle(str, sizeWidth, sizeHeight);
		}
		
		private function initStyle(str:String, sizeWidth:Number, sizeHeight:Number):void
		{
			sprDefault = new Sprite();
			var matix:Matrix = new Matrix();
			sprBorder = new Sprite();
			
			txtText = new TextField();
			txtText.text = str;
			txtText.autoSize =  TextFieldAutoSize.LEFT;
			txtText.width = sizeWidth;
			txtText.height = sizeHeight;
			txtText.selectable = false;
			txtText.y = (sizeHeight - txtText.height) / 2;
			txtText.x = (sizeWidth - txtText.width) / 2;
			txtText.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.BUTTON_TEXT));
			
			matix.createGradientBox(70, 40, Math.PI / 2, 0, 0);
			sprDefault.graphics.beginGradientFill(GradientType.LINEAR, [0x5588D8, 0x4D7BD6], [1, 1], [0x00, 0xFF], matix);
			sprDefault.graphics.drawRect(1, 3, sizeWidth, sizeHeight - 3);
			sprDefault.graphics.endFill();
			addChild(sprDefault);
			sprDefault.addChild(txtText);
			
			//Mr_Dresser.drawBorderByLine(sprDefault, new Point(0, 0), new Point(sizeWidth, 0), new Point(sizeWidth, sizeHeight), new Point(0, sizeHeight), 0.5, 0x2D53AF);
			Mr_Dresser.drawLine(sprDefault, 1, 1, sizeWidth, 1, 0.5, 0x6090DD, 1);
			Mr_Dresser.drawLine(sprDefault, 1, 2, sizeWidth, 2, 0.5, 0x608FDD, 1);
			
			
			sprBorder.graphics.lineStyle(0.5, 0x2D53AF, 1,true, "normal", CapsStyle.ROUND, JointStyle.ROUND);
			sprBorder.graphics.drawRoundRectComplex(0, 0, sizeWidth, sizeHeight, 3, 2, 2, 2);
			addChild(sprBorder);
			
			sprDefault.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
			sprDefault.addEventListener(MouseEvent.ROLL_OUT, rollOutHandler);
			sprDefault.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			sprDefault.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
		
		private function mouseUpHandler(e:MouseEvent):void 
		{
			TweenMax.to(sprDefault, 0, { colorTransform: { exposure:1.125 }} );
			TweenMax.to(sprDefault, 0, {bevelFilter:{blurX:0, blurY:0, strength:1, angle:0, distance:0}});
		}
		
		private function mouseDownHandler(e:MouseEvent):void 
		{
			TweenMax.to(sprDefault, 0, { colorTransform: { exposure:1 }} );
			TweenMax.to(sprDefault, 0, {bevelFilter:{blurX:5, blurY:5, strength:0.8, angle:270, distance:2}});
		}
		
		private function rollOutHandler(e:MouseEvent):void 
		{
			TweenMax.to(sprDefault, 0, {colorTransform:{ exposure:1}});
		}
		
		private function rollOverHandler(e:MouseEvent):void
		{
			TweenMax.to(sprDefault, 0, {colorTransform:{ exposure:1.125}});
		}
	
	}

}