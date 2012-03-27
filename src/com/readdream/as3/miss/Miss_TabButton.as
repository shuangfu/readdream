package com.readdream.as3.miss 
{
	import com.greensock.TweenLite;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.robot.Robot_TextFormater;
	import flash.display.GradientType;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_TabButton extends Sprite 
	{
		
		private const buttonWidth:Number = 160;
		private const buttonHeight:Number = 40;
		
		private var defaultShape:Shape;
		private var activateShape:Shape;
		private var sprDefault:Sprite = new Sprite();
		private var sprActivate:Sprite = new Sprite();
		private var i:int = 1;
		
		
		public function Miss_TabButton(text:String) 
		{
			setDefault();
			initData(text);
			addEventListener(MouseEvent.CLICK, sprDefaultCLICKHandler);
			trace(width);
			trace(height);
		}
		
		private function initData(str:String):void 
		{
			var txt:TextField = new TextField();
			txt.text = str;
			txt.selectable = false;
			txt.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.TABBUTTON_TEXT));
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.x = (this.width / 2) - (txt.width / 2);
			txt.y = (this.height / 2) - (txt.height / 2);
			addChildAt(txt, 1);
		}
		
		private function sprDefaultCLICKHandler(e:MouseEvent):void 
		{
				setActivate();
		}
		
		
		private function setDefault():void {
			defaultShape = new Shape();
			var matix:Matrix = new Matrix();
			matix.createGradientBox(70, 40, Math.PI / 2, 0, 0);
			defaultShape.graphics.beginGradientFill(GradientType.LINEAR,[0xFFFFFF,0xF4F4F4] , [ 1, 1 ], [ 0x00, 0xFF ], matix);
			defaultShape.graphics.drawRect(2, 1, buttonWidth-3, buttonHeight-1);
			defaultShape.graphics.endFill();
			sprDefault.addChild(defaultShape);
			addChildAt(sprDefault,0);
			
			///////////
			//绘制边框
			Miss_DrawLine.drawLine(sprDefault, 0, 0, 0, buttonHeight, 1, 0xCCCCCC); 							//左边框
			Miss_DrawLine.drawLine(sprDefault, buttonWidth, 0, buttonWidth, buttonHeight, 1, 0xCCCCCC);			//右边框
			Miss_DrawLine.drawLine(sprDefault, 2, buttonHeight, buttonWidth - 2, buttonHeight, 1, 0xE5E5E5);	//下边框
			Miss_DrawLine.drawLine(sprDefault, 0, 0, buttonWidth, 0, 1, 0xCCCCCC);								//上边框
			
			sprActivate.visible = false;
			sprDefault.visible = true;
		}
		
		private function setActivate():void {
			activateShape = new Shape();
			activateShape.graphics.beginFill(0xF1F1F1);
			activateShape.graphics.drawRect(2, 3, buttonWidth-3, buttonHeight-2);
			activateShape.graphics.endFill();
			
			sprActivate.addChild(activateShape);
			addChildAt(sprActivate,0);
			
			///////////
			//绘制边框
			Miss_DrawLine.drawLine(sprActivate, 0, 0, 0, buttonHeight, 1, 0xCCCCCC); 								//左边框
			Miss_DrawLine.drawLine(sprActivate, 1, 1, 1, buttonHeight, 1, 0xE9E9E9);								//左边框内线
			Miss_DrawLine.drawLine(sprActivate, buttonWidth, 0, buttonWidth, buttonHeight, 1, 0xCCCCCC);			//右边框
			Miss_DrawLine.drawLine(sprActivate, buttonWidth - 1, 1, buttonWidth - 1, buttonHeight, 1, 0xE9E9E9);	//右边框内线
			Miss_DrawLine.drawLine(sprActivate, 0, 0, buttonWidth, 0, 1, 0xCCCCCC);									//上边框
			Miss_DrawLine.drawLine(sprActivate, 1, 1, buttonWidth - 1, 1, 1, 0xE1E1E1);								//上边框下一层
			Miss_DrawLine.drawLine(sprActivate, 1, 2, buttonWidth - 1, 2, 1, 0xE9E9E9);								//上边框下两层
			
			sprDefault.visible = false;
			sprActivate.visible = true;
		}
		
		
	}

}