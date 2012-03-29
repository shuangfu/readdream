package com.readdream.as3.miss.contentbar 
{
	import com.readdream.as3.event.MatchReveal_TabbarEvent;
	import com.readdream.as3.miss.contentbar.Miss_TabButton;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.mr.Mr_Layouter;
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_TabBar extends Sprite 
	{
		private const barWidth:int = 980;
		private const barHeight:int = 40;
		
		public var btnOverview:Miss_TabButton;
		public var btnDetails:Miss_TabButton;
		public var btnRelated:Miss_TabButton;
		private var border:Sprite;
		private var background:Sprite;
		private var activateFlag:Miss_TabButton;
		
		public function Miss_TabBar() 
		{
			initData();
			setupButton();
		}
		
		private function initData():void 
		{
			btnOverview = new Miss_TabButton("概述");
			btnDetails = new Miss_TabButton("详情");
			btnRelated = new Miss_TabButton("相关");
			btnOverview.name = "sprOverview";
			btnDetails.name = "sprDetails";
			btnRelated.name = "sprRelated";
			
			activateFlag = btnOverview;
			activateFlag.setActivate();
			///////////////////
			//regist event
			btnOverview.addEventListener(MatchReveal_TabbarEvent.TabButton_CLICK, tabButtonClickHandler);
			btnDetails.addEventListener(MatchReveal_TabbarEvent.TabButton_CLICK, tabButtonClickHandler);
			btnRelated.addEventListener(MatchReveal_TabbarEvent.TabButton_CLICK, tabButtonClickHandler);
			
			border = new Sprite();
			Mr_Dresser.drawLine(border, btnOverview.width * 3, 40, 980, 40, 1, 0xE5E5E5, 1);
			
			background = new Sprite();
			var matix:Matrix = new Matrix();
			matix.createGradientBox(70, 40, Math.PI / 2, 0, 0);
			background.graphics.beginGradientFill(GradientType.LINEAR,[0xFFFFFF,0xF4F4F4] , [ 1, 1 ], [ 0x00, 0xFF ], matix);
			background.graphics.drawRect(0, 0, 980, 39);
			background.graphics.endFill();			
		}
		
		private function tabButtonClickHandler(e:MatchReveal_TabbarEvent):void 
		{
			if(activateFlag != (e.currentTarget as Miss_TabButton)){
				activateFlag.setDefault();
				activateFlag = (e.currentTarget as Miss_TabButton);
			}
			var btnName:String = e.currentTarget.name;
			var event1:MatchReveal_TabbarEvent = new MatchReveal_TabbarEvent(MatchReveal_TabbarEvent.TABBAR_CHANGE,btnName);
			dispatchEvent(event1);
		}
		
		private function setupButton():void 
		{
			var objArr:Array = new Array();
			objArr[0] = { stuff:background, xPos:0, yPos:1 };
			objArr[1] = { stuff:btnOverview, xPos:0, yPos:0 };
			objArr[2] = { stuff:btnDetails, xPos: btnOverview.width, yPos:0 };
			objArr[3] = { stuff:btnRelated, xPos: btnOverview.width * 2, yPos:0 };
			objArr[4] = { stuff:border, xPos:0, yPos:0 };
			Mr_Layouter.layouter(this, objArr);
		}
		
		
		
	}

}

