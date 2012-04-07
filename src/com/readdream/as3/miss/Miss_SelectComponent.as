package com.readdream.as3.miss
{
	import com.greensock.TweenMax;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.robot.Robot_TextFormater;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_SelectComponent extends Sprite
	{
		private var sizeW:Number;
		private var sizeH:Number;
		private const borderColor:Number = 0xDCDCDC;
		public var mutiChoose:Boolean;
		private var selectAreaFlag:Boolean;
		
		private var tempForTry:Sprite;
		private var sprDefaultPanel:Sprite;
		private var data:Vector.<String> = new Vector.<String>;
		private var vrSprData:Vector.<TextField> = new Vector.<TextField>;
		private var sprData:Sprite = new Sprite();
		private var txtContent:TextField = new TextField();
		private var _prompt:String = "请选择";
		private var vrSelected:Vector.<String> = new Vector.<String>;
		private var tftDefault:TextFormat;
		private var focusFlag:Boolean = true;;
		
		public function Miss_SelectComponent(sizeWidth:Number = 200, sizeHeight:Number = 30, objData:Vector.<String> = null, mutiChoose:Boolean = false)
		{
			this.mutiChoose = mutiChoose;
			sizeW = sizeWidth;
			sizeH = sizeHeight;
			data = objData;
			initStyle();
			addData();
			setupImage();
			this.addEventListener(Event.ADDED_TO_STAGE, addEvent);
			
		}
		
		private function addEvent(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, addEvent);
			parent.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function initStyle():void
		{
			sprDefaultPanel = new Sprite();
			sprDefaultPanel.opaqueBackground = 0xf2f2f2;
			sprDefaultPanel.graphics.beginFill(0x000000, 0);
			sprDefaultPanel.graphics.drawRect(0, 0, sizeW - 2, sizeH - 2);
			sprDefaultPanel.graphics.endFill();
			sprDefaultPanel.name = "sprDefaultPanel";
			tempForTry = sprDefaultPanel;
			sprDefaultPanel = Mr_Dresser.drawBorder(sprDefaultPanel, borderColor, 1, false);
			
			
			
			txtContent.text = prompt;
			txtContent.autoSize = TextFieldAutoSize.LEFT;
			txtContent.selectable = false;
			txtContent.mouseEnabled = false;
			
			tftDefault = txtContent.defaultTextFormat;
			txtContent.x = 10;
			txtContent.y = (sprDefaultPanel.height - txtContent.height) / 2;
			
			
			sprDefaultPanel.addChild(txtContent);
			sprDefaultPanel.name = "select";
			sprData.name = "select";
			txtContent.name = "select";
			sprDefaultPanel.addEventListener(MouseEvent.CLICK, sprDefaultPanelmouseClickHandler);
			sprDefaultPanel.addEventListener(MouseEvent.ROLL_OVER, sprDefaultPanelRollOverHandler);
			sprDefaultPanel.addEventListener(MouseEvent.ROLL_OUT, sprDefaultPanelRollOutHandler);
		}

		
		private function addData():void
		{
			var i:int = 0;
			
			for (i = 0; i < data.length; i++)
			{
				vrSprData[i] = new TextField();
				vrSprData[i].text = "     " + data[i];
				vrSprData[i].width = sizeW;
				vrSprData[i].height = sizeH;
				vrSprData[i].x = 0;
				vrSprData[i].name = "select";
				vrSprData[i].y = vrSprData[i].height * i;
				vrSprData[i].selectable = false;
				vrSprData[i].opaqueBackground = 0xFFFFFF;
				sprData.addChild(vrSprData[i]);
				
				if (mutiChoose)
				{
					vrSprData[i].addEventListener(MouseEvent.CLICK, vrSprDataMutiMouseClickHandler);
					var txtSubmit:TextField = new TextField();
					var txtReset:TextField = new TextField();
					
					txtReset.text = "重置";					
					txtReset.width = sizeW/2;
					txtReset.height = sizeH;
					txtReset.x = 0;
					txtReset.name = "select";
					txtReset.y = vrSprData[0].height * data.length;
					txtReset.selectable = false;
					txtReset.opaqueBackground = 0xFFFFFF;
					txtReset.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.SELECTCOMPONENT_BUTTONRESET));
					
					txtSubmit.text = "确定";
					txtSubmit.width = sizeW/2;
					txtSubmit.height = sizeH;
					txtSubmit.x = sizeW/2;
					txtSubmit.name = "select";
					txtSubmit.y = vrSprData[0].height * data.length;
					txtSubmit.selectable = false;
					txtSubmit.opaqueBackground = 0xFFFFFF;
					txtSubmit.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.SELECTCOMPONENT_BUTTONSUBMIT));
					
					//sprReset.graphics.lineStyle(0.5, 0xD14836, 1);
					//sprReset.graphics.beginFill(0xD74937);
					//sprReset.graphics.drawRect(0, 0, 65, sizeH-4);
					//sprReset.graphics.endFill();
					//sprReset.x = (sizeW / 4) - (65 / 2);
					//sprReset.y = (sizeH - sprReset.height) / 2;
//
					//sprSubmit.graphics.lineStyle(0.5, 0x3079ED, 1);
					//sprSubmit.graphics.beginFill(0x427EDD);
					//sprSubmit.graphics.drawRect(0, 0, 65, sizeH-4);
					//sprSubmit.graphics.endFill();
					//sprSubmit.x = (sizeW / 4) * 3 - (65 / 2);
					//sprSubmit.y = (sizeH - sprReset.height) / 2;
					sprData.addChild(txtReset);
					sprData.addChild(txtSubmit);
					txtReset.addEventListener(MouseEvent.ROLL_OVER, vrSprDataRollOverHandler);
					txtReset.addEventListener(MouseEvent.ROLL_OUT, vrSprDataRollOutHandler);
					txtSubmit.addEventListener(MouseEvent.ROLL_OVER, vrSprDataRollOverHandler);
					txtSubmit.addEventListener(MouseEvent.ROLL_OUT, vrSprDataRollOutHandler);
					txtReset.addEventListener(MouseEvent.CLICK, txtResetClickHandler);
					txtSubmit.addEventListener(MouseEvent.CLICK,txtSubmitClickHandler);
					
				}
				else
				{
					vrSprData[i].addEventListener(MouseEvent.CLICK, vrSprDataMouseClickHandler);
				}
				
				
				vrSprData[i].addEventListener(MouseEvent.ROLL_OVER, vrSprDataRollOverHandler);
				vrSprData[i].addEventListener(MouseEvent.ROLL_OUT, vrSprDataRollOutHandler);
				
			}
			var sprBorder:Sprite = new Sprite();
			
			
			Mr_Dresser.drawBorderByLine(sprBorder, new Point(0, 0), new Point(sprData.width, 0), new Point(sprData.width, sprData.height), new Point(0, sprData.height), 0.5, 0xCBCBCB);
			//sprBorder.graphics.beginFill(0xff0000, 0);
			//sprBorder.graphics.drawRect(0, 0, sizeW, sizeH);
			//sprBorder.graphics.endFill();
			sprData.addChild(sprBorder);
			sprData.visible = false;
		}
		
		
		private function sprDataFocusOutHandler(e:FocusEvent):void 
		{
			sprData.visible = false;
		}
		
		
		private function setupImage():void
		{
			var objArr:Array = new Array();
			objArr.push({stuff: sprDefaultPanel, xPos: 0, yPos: 0});
			objArr.push({stuff: sprData, xPos: 0, yPos: 0});
			
			Mr_Layouter.layouter(this, objArr);
		}
		
		public function hideSprData():void {
			sprData.visible = false;

		}
		
		//////////////////////////////
		//单选点击内容事件
		private function vrSprDataMouseClickHandler(e:MouseEvent):void
		{
			txtContent.text = e.currentTarget.text;
			sprData.visible = false;
		}
		
		/////////////////////////////
		//点击组件展开内容选择框
		private function sprDefaultPanelmouseClickHandler(e:MouseEvent):void
		{
			focusFlag = true;
			sprData.visible = true;
		}
		
		//////////////////////////
		//鼠标从选择元素移出事件。
		private function vrSprDataRollOutHandler(e:MouseEvent):void
		{
			focusFlag = false;
			e.currentTarget.opaqueBackground = 0xFFFFFF;
			Mouse.cursor = MouseCursor.AUTO;
		}
		
		//////////////////////////////
		//鼠标移入选择元素事件。
		private function vrSprDataRollOverHandler(e:MouseEvent):void
		{
			focusFlag = true;
			e.currentTarget.opaqueBackground = 0xEEEEEE;
			Mouse.cursor = MouseCursor.BUTTON;
		}
		
		//////////////////////////////
		//默认状态下组件移动出去恢复原样
		private function sprDefaultPanelRollOutHandler(e:MouseEvent):void
		{
			sprDefaultPanel.opaqueBackground = 0xDCDCDC;
			TweenMax.to(sprDefaultPanel, 0, {dropShadowFilter: {color: 0x000000, alpha: 0, blurX: 0, blurY: 0, strength: 0, angle: 0, distance: 0}});
		}
		
		//////////////////////////////
		//默认状态下组件移动进来改变样式
		private function sprDefaultPanelRollOverHandler(e:MouseEvent):void
		{
			sprDefaultPanel.opaqueBackground = 0xC6C6C6;
			TweenMax.to(sprDefaultPanel, 0, {dropShadowFilter: {color: 0x000000, alpha: 0.65, blurX: 1, blurY: 3, strength: 0.25, angle: 90, distance: 1}});
		}
		
		
		
		private function vrSprDataMutiMouseClickHandler(e:MouseEvent):void
		{
			if (vrSelected.indexOf(Mr_Dresser.trim(e.currentTarget.text)) == -1)
			{
				e.currentTarget.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.SELECTCOMPONENT_SELECTED));
				vrSelected.push(Mr_Dresser.trim(e.currentTarget.text));
			}
			else
			{
				e.currentTarget.setTextFormat(tftDefault);
				vrSelected.splice(vrSelected.indexOf(Mr_Dresser.trim(e.currentTarget.text)), 1);
			}		
		}
		
		private function clickHandler(e:MouseEvent):void 
		{
			if (focusFlag == false) {
				sprData.visible = false;
			}
		}
		
		private function txtSubmitClickHandler(e:MouseEvent):void
		{
			if (vrSelected.length != 0) {
				if (vrSelected.length >= 4) {
					txtContent.text = "您选择了 " + vrSelected.length + " 项";
				}else{
					txtContent.text = vrSelected.toString();
				}
			}else {
				txtContent.text = prompt;
			}
			sprData.visible = false;
		}
		
		private function txtResetClickHandler(e:MouseEvent):void 
		{
			vrSelected.splice(0, vrSelected.length);
			for each (var txt:TextField in vrSprData) 
			{
				txt.setTextFormat(tftDefault);
				
			}
			txtContent.text = prompt;
		}
		
		public function get prompt():String
		{
			return _prompt;
		}
		
		public function set prompt(value:String):void
		{
			_prompt = value;
			txtContent.text = prompt;
		}	
	}

}