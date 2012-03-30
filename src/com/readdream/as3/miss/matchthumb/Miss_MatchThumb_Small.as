package com.readdream.as3.miss.matchthumb
{
	import com.greensock.TweenLite;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.robot.Robot_TextFormater;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Shape;
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
	public class Miss_MatchThumb_Small extends Sprite
	{
		private const defaultBackground:uint = 0xF8F8F8; //默认背景颜色
		private const activateBackground:uint = 0xECECEC; //激活背景颜色
		private const sizeWidth:Number = 240; //容器宽度
		private const sizeHeight:Number = 200; //容器高度
		public const compPicWidth:Number = 220; //小图片 宽度
		public const compPicHeight:Number = 140; //小图片 高度
		
		private var matchTitle:TextField;
		private var matchTitle2:TextField;
		private var matchComp:TextField;
		private var matchIcon:Robot_PicLoader;
		private var matchFrom:TextField;
		private var matchFrom2:TextField;
		private var matchPicture:Sprite;
		private var sprMatchComp:Sprite;
		private var sprContent:Sprite = new Sprite();
		private var sprLine:Sprite = new Sprite();
		private var sprUpLine:Sprite = new Sprite();
		
		public function Miss_MatchThumb_Small(vo:Vo_Match)
		{
			sprContent.opaqueBackground = defaultBackground;
			
			
			
			initData(vo);
			initStyle();
			setupImage();
			
			trace(this.x," ||| ",this.y);
			trace(this.width, "|||---|||" ,this.height);
			
		}
		
		private function initData(vo:Vo_Match):void
		{
			matchTitle = new TextField();
			matchTitle.text = vo.matchTitle;
			
			matchTitle2 = new TextField();
			matchTitle2.text = vo.matchTitle;
			
			matchFrom = new TextField();
			matchFrom.text = vo.matchFrom;
			
			matchFrom2 = new TextField();
			matchFrom2.text = vo.matchFrom;
			
			matchComp = new TextField();			
			matchComp.text = vo.matchComp.slice(0, 70);
			
			matchIcon = new Robot_PicLoader(vo.matchIcon, 0, 0, 40, 40);
			
			matchPicture = Mr_Dresser.drawBorder(new Robot_PicLoader(vo.picture[0], 0, 0, compPicWidth - 1, compPicHeight - 1), 0xDDDDDD, 1, false);
		
		}
		
		private function initStyle():void
		{
			Mr_Dresser.drawBorderByLine(sprContent, new Point(0, 0), new Point(240, 0), new Point(240, 400), new Point(0, 400), 0.5, 0xC6C6C6, 1);
			sprLine.graphics.beginFill(0xffffff, 0);
			sprLine.graphics.drawRect(0, 0, 239, 0.5);
			sprLine.graphics.endFill();
			sprLine.opaqueBackground = 0xFFFFFF;
			
			sprUpLine.graphics.beginFill(0xffffff, 0);
			sprUpLine.graphics.drawRect(0, 0, 240, 1);
			sprUpLine.graphics.endFill();
			sprUpLine.opaqueBackground = 0xC6C6C6;
			
			Mr_Dresser.drawLine(sprContent, 1, 200, 240, 200, 1, 0xc5c5c5, 1);

			Mr_Dresser.drawLine(sprContent, 1, 201, 240, 201, 1, 0xD8D8D8, 1);

			
			
			sprContent.graphics.beginFill(0x000000, 0);
			sprContent.graphics.drawRect(0, 0, 240, 400);
			sprContent.graphics.endFill();
			
			var masker:Sprite = Mr_Dresser.getMasker(241, 201, 0xFFFFFF);
			masker.x = masker.y = 0;
			addChild(masker);
			sprContent.mask = masker;
			
			matchTitle.autoSize = TextFieldAutoSize.LEFT;
			matchTitle.selectable = false;
			matchTitle.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.MATCHTHUMB_MATCHTITLE));
			
			matchTitle2.autoSize = TextFieldAutoSize.LEFT;
			matchTitle2.selectable = false;
			matchTitle2.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.MATCHTHUMB_MATCHTITLE));
			
			matchFrom.autoSize = TextFieldAutoSize.LEFT;
			matchFrom.selectable = false;
			matchFrom.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.MATCHTHUMB_MATCHFROM));
			
			matchFrom2.autoSize = TextFieldAutoSize.LEFT;
			matchFrom2.selectable = false;
			matchFrom2.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.MATCHTHUMB_MATCHFROM));
			
			matchComp.autoSize = TextFieldAutoSize.LEFT;
			matchComp.selectable = false;
			matchComp.type = TextFieldType.DYNAMIC;
			matchComp.wordWrap = true;
			matchComp.width = 210;			
			matchComp.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.MATCHTHUMB_MATCHCOMP));
			
			Mr_Dresser.addShadowFilter(matchIcon, 0, 90, 0.65, 4, 8, 2);
		
		}
		
		private function setupImage():void
		{
			var objArr:Array = new Array();
			objArr.push({stuff:sprLine, xPos:1, yPos:1}) ;
			objArr.push({stuff: matchPicture, xPos: 10, yPos: 10});
			objArr.push({stuff: matchTitle, xPos: 20, yPos: 160})
			objArr.push({stuff: matchFrom, xPos: 20, yPos: 160 + matchTitle.textHeight + 5});
			objArr.push({stuff: matchTitle2, xPos: 20, yPos: 225});
			objArr.push({stuff: matchFrom2, xPos: 20, yPos: 225 + matchTitle2.textHeight + 10});
			objArr.push({stuff: matchIcon, xPos: 180, yPos: 225});
			objArr.push({stuff: matchComp, xPos: 18, yPos: 290});
			
			Mr_Layouter.layouter(sprContent, objArr);
			addChild(sprContent);
			//sprUpLine.x = 20;
			//sprUpLine.y = 20;
			addChild(sprUpLine);

			sprContent.addEventListener(MouseEvent.ROLL_OVER, MouseRollOverHandler);
			sprContent.addEventListener(MouseEvent.ROLL_OUT, MouseRollOutHandler);
		}
		
			
		private function MouseRollOverHandler(e:MouseEvent):void
		{
			sprLine.opaqueBackground = 0xD8D8D8;
			
			TweenLite.to(sprContent, 0, { delay:0.3, onStart:onStart} );
		}
		
		private function onStart():void 
		{
			sprContent.opaqueBackground = activateBackground; 
			TweenLite.to(sprContent, 0.3, { y: -200} );
		}
		
		private function MouseRollOutHandler(e:MouseEvent):void 
		{
			sprContent.opaqueBackground = defaultBackground;
			sprLine.opaqueBackground = 0xFFFFFF;
			TweenLite.to(sprContent, 0.2, { y: 0 ,overwrite:true} );
			
			
		}
	}

}
