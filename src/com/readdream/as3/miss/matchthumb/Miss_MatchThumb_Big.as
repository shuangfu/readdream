package com.readdream.as3.miss.matchthumb 
{
	import com.greensock.TweenLite;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.robot.Robot_TextFormater;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;



	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.utils.Timer;

	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_MatchThumb_Big extends Sprite 
	{
		private const defaultBackground:uint = 0xF8F8F8; 		//默认背景颜色
		private const activateBackground:uint = 0xECECEC;		//激活背景颜色

		private const SprCompHeight:Number = 100;
		private const compPicWidth:Number = 460; 					//大图片 宽度
		private const compPicHeight:Number = 340; 					//小图片 高度	
		private const sizeWidth:Number = 480;
		private const sizeHeight:Number = 400;
		private const matchTitleX:Number = 15;
		private const matchTitleY:Number = 360
		private const SprCompY:Number = 350;
		
 
		
		private var matchTitle:TextField;
		private var matchComp:TextField;
		private var matchFrom:TextField;
		private var vrPic:Vector.<Sprite> = new Vector.<Sprite>;
		private var index:int = 0;
		private var masker:Sprite;
		private var sprLine:Sprite = new Sprite;
		private var sprComp:Sprite = new Sprite();
		private var sprPic:Sprite = new Sprite();
		private var myTimer:Timer = new Timer(300, 1);
		
		
		public function Miss_MatchThumb_Big(vo:Vo_Match) 
		{
			opaqueBackground = defaultBackground;
			sprComp.opaqueBackground = defaultBackground;
			
			initData(vo);
			initStyle();
			setupImage();
		}
		
		
		private function initData(vo:Vo_Match):void 
		{
			vrPic[index] = Mr_Dresser.drawBorder(new Robot_PicLoader(vo.picture[index], 0, 0, compPicWidth - 1, compPicHeight - 1), 0xDDDDDD, 1, false);
			
			matchTitle = new TextField();
			matchTitle.text = vo.matchTitle;
			
			matchFrom = new TextField();
			matchFrom.text = vo.matchFrom;
			
			matchComp = new TextField();			
			matchComp.text = vo.matchComp.slice(0, 75);
			
		}
		
				
		private function initStyle():void 
		{
			Mr_Dresser.drawBorderByLine(this, new Point(0, 0), new Point(480, 0), new Point(480, 400), new Point(0, 400), 1, 0xC6C6C6, 1);
			sprLine.graphics.beginFill(0xffffff, 0);
			sprLine.graphics.drawRect(0, 0, 479, 1);
			sprLine.graphics.endFill();
			sprLine.opaqueBackground = 0xFFFFFF;
			
			masker = Mr_Dresser.getMasker(460, 289);
			masker.x = masker.y = 10;
			addChild(masker);
			//mask = masker;
			
			var masker1:Sprite = Mr_Dresser.getMasker(sizeWidth, sizeHeight, 0xFF0000);
			masker.x = masker.y = 1;
			//addChild(masker1);
			//this.mask = masker;
			trace(width);
			trace(height);
			
			sprComp.graphics.beginFill(0xffffff, 0);
			sprComp.graphics.drawRect(0, 0, 480, 100);
			sprComp.graphics.endFill();
			
			matchTitle.autoSize = TextFieldAutoSize.LEFT;
			matchTitle.selectable = false;
			matchTitle.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.MATCHTHUMB_MATCHTITLE));
			
			matchFrom.autoSize = TextFieldAutoSize.LEFT;
			matchFrom.selectable = false;
			matchFrom.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.MATCHTHUMB_MATCHFROM));
			
			matchComp.autoSize = TextFieldAutoSize.LEFT;
			matchComp.selectable = false;
			matchComp.type = TextFieldType.DYNAMIC;
			matchComp.wordWrap = true;
			matchComp.width = 455;
			matchComp.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.MATCHTHUMB_MATCHCOMP));
			
		}
		
		private function setupImage():void 
		{
			var objComp:Array = new Array();
			objComp.push({stuff: matchTitle, xPos: matchTitleX, yPos: 10})
			objComp.push({stuff: matchFrom, xPos: matchTitleX, yPos: 10 + matchTitle.textHeight + 5});
			objComp.push({stuff: matchComp, xPos: matchTitleX, yPos: 10 + matchTitle.textHeight + matchFrom.height + 15 });
			Mr_Layouter.layouter(sprComp, objComp);
			
			sprPic.addChild(vrPic[0]);
			var objArr:Array = new Array();
			objArr.push({stuff:sprLine, xPos:1, yPos:1}) ;
			objArr.push({stuff: sprPic, xPos: 10, yPos: 10});
			objArr.push({stuff: sprComp, xPos: 0, yPos: 350});
			Mr_Layouter.layouter(this, objArr);
			

			
			addEventListener(MouseEvent.ROLL_OVER, MouseRollOverHandler);
			addEventListener(MouseEvent.ROLL_OUT, MouseRollOutHandler);
			myTimer.addEventListener(TimerEvent.TIMER, TimerCompleteHandler);			
		}
		
		private function TimerCompleteHandler(e:Event):void 
		{
			opaqueBackground = activateBackground;
			sprComp.opaqueBackground = activateBackground;
			TweenLite.to(sprComp, 0.3, { y: 300 } );
		}
		
		private function MouseRollOverHandler(e:MouseEvent):void 
		{
			sprLine.opaqueBackground = 0xD8D8D8;			
			
			myTimer.start();
		}
		
		private function MouseRollOutHandler(e:MouseEvent):void 
		{
			opaqueBackground = defaultBackground;
			sprComp.opaqueBackground = defaultBackground;
			sprLine.opaqueBackground = 0xFFFFFF;
			TweenLite.to(sprComp, 0.3, { y: 350 } );
			
			myTimer.stop();
		}
		
	}

}