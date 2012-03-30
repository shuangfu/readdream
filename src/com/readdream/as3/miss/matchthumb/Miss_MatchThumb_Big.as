package com.readdream.as3.miss.matchthumb
{
	import adobe.utils.CustomActions;
	import com.greensock.easing.Linear;
	import com.greensock.TweenLite;
	import com.readdream.as3.miss.Miss_Arrow;
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
	public class Miss_MatchThumb_Big extends Sprite
	{
		private const defaultBackground:uint = 0xF8F8F8; //默认背景颜色
		private const activateBackground:uint = 0xECECEC; //激活背景颜色
		private const SprCompHeight:Number = 100;
		private const compPicWidth:Number = 460; //大图片 宽度
		private const compPicHeight:Number = 340; //小图片 高度	
		private const sizeWidth:Number = 480;
		private const sizeHeight:Number = 400;
		private const matchTitleX:Number = 15;
		private const matchTitleY:Number = 360
		private const SprCompY:Number = 350;
		
		private var matchTitle:TextField;
		private var matchComp:TextField;
		private var matchFrom:TextField;
		private var vrPic:Array = new Array();
		private var index:int = 0;
		private var masker:Sprite;
		private var sprLine:Shape = new Shape;
		private var sprComp:Sprite = new Sprite();
		private var sprPic:Sprite = new Sprite();
		private var sprPicContainer:Sprite = new Sprite();
		private var maskerInfo:Sprite;
		private var sprInfo:Sprite = new Sprite();
		private var sprArrow:Miss_Arrow;
		private var vo:Vo_Match;
		
		public function Miss_MatchThumb_Big(vo:Vo_Match)
		{
			this.opaqueBackground = defaultBackground;
			this.cacheAsBitmap = true;
			
			initData(vo);
			initStyle();
			setupImage();
			
		}
		
		private function initData(vo:Vo_Match):void
		{
			this.vo = vo;
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
			sprLine.graphics.drawRect(0, 0, 478, 0.1);
			sprLine.graphics.endFill();
			sprLine.opaqueBackground = 0xFFFFFF;
			
			masker = Mr_Dresser.getMasker(460, 340);
			masker.x = masker.y = 10;
			
			maskerInfo = Mr_Dresser.getMasker(sizeWidth, SprCompHeight, 0xFF0000);
			
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
			objComp.push({stuff: matchComp, xPos: matchTitleX, yPos: 10 + matchTitle.textHeight + matchFrom.height + 15});
			Mr_Layouter.layouter(sprComp, objComp);
			
			sprComp.y = 50;
			sprInfo.addChild(sprComp);
			sprInfo.addChild(maskerInfo);
			
			sprInfo.y = 300;
			addChild(sprPicContainer);
			
			addChild(sprInfo);
			
			sprComp.mask = maskerInfo;
			
			sprPic.x = sprPic.y = 10;
			
			sprPicContainer.addChild(sprPic);
			sprPicContainer.addChild(masker);
			sprArrow = new Miss_Arrow(0, ((290 - Miss_Arrow.arrowHeight) / 2), masker.width-24, (290 - Miss_Arrow.arrowHeight) / 2);
			sprArrow.leftSelect.x -= 1;
			sprPic.mask = masker;
			
			sprPic.addChild(vrPic[0]);
			sprPic.addChild(sprArrow);
			var objArr:Array = new Array();
			objArr.push({stuff: sprLine, xPos: 1, yPos: 1});
			Mr_Layouter.layouter(this, objArr);
			
			addEventListener(MouseEvent.ROLL_OVER, mouseRollOverHandler);
			addEventListener(MouseEvent.ROLL_OUT, mouseRollOutHandler);
			sprArrow.leftSelect.addEventListener(MouseEvent.CLICK, leftMouseClickHandler);
			sprArrow.rightSelect.addEventListener(MouseEvent.CLICK, rightMouseClickHandler);
		}
		
		private function rightMouseClickHandler(e:MouseEvent):void
		{
			rightMove();
		}
		
		private function leftMouseClickHandler(e:MouseEvent):void
		{
			leftMove();
		}
		
		private function mouseRollOverHandler(e:MouseEvent):void
		{
			sprLine.opaqueBackground = 0xD8D8D8;
			
			TweenLite.to(sprComp, 0.15, {y: 0, delay: 0.2, onStart: onStartHandler, onComplete: onColorCompleteHandler});
		}
		
		private function onColorCompleteHandler():void
		{
			TweenLite.to(sprArrow.leftNoSelect, 0.15, {x: -1});
			TweenLite.to(sprArrow.rightNoSelect, 0.15, {x: (masker.width - Miss_Arrow.arrowWidth)});
		}
		
		private function onStartHandler():void
		{
			opaqueBackground = activateBackground;
			sprComp.opaqueBackground = activateBackground;
		}
		
		private function mouseRollOutHandler(e:MouseEvent):void
		{
			TweenLite.to(sprArrow.leftNoSelect, 0.15, {x: -24});
			TweenLite.to(sprArrow.rightNoSelect, 0.15, {x: (masker.width), onComplete: onRollOutCompleteHandler});
			
			TweenLite.to(sprComp, 0.15, {y: 50});
		}
		
		private function onRollOutCompleteHandler():void
		{
			opaqueBackground = defaultBackground;
			sprComp.opaqueBackground = defaultBackground;
			sprLine.opaqueBackground = 0xFFFFFF;
			//vrPic[0].x = 0;
			//index = 0;
		}
		
		private function leftMove():void
		{
			sprArrow.leftSelect.removeEventListener(MouseEvent.CLICK, leftMouseClickHandler);
			sprArrow.rightSelect.removeEventListener(MouseEvent.CLICK, rightMouseClickHandler);
			index--;
			if (index < 0)
			{
				index = vo.picture.length - 1;				
			}
			
			if (vrPic[index] == null)
			{
				vrPic[index] = Mr_Dresser.drawBorder(new Robot_PicLoader(vo.picture[index], 0, 0, compPicWidth - 1, compPicHeight - 1), 0xDDDDDD, 1, false)
				vrPic[index].x = -460;
				vrPic[index].y = 0;
				sprPic.addChildAt(vrPic[index],0);
			}
			else
			{
				vrPic[index].x = -460;
				vrPic[index].y = 0;
			}
			TweenLite.to(vrPic[(index + 1) % vo.picture.length], 0.5, {x: 460});
			TweenLite.to(vrPic[index], 0.5, {x: 0, onComplete: onCompleteMoveHandler});
		
		}
		
		private function rightMove():void
		{
			sprArrow.leftSelect.removeEventListener(MouseEvent.CLICK, leftMouseClickHandler);
			sprArrow.rightSelect.removeEventListener(MouseEvent.CLICK, rightMouseClickHandler);
			index++;
			index = index % vo.picture.length;
			
			if (vrPic[index] == null)
			{
				vrPic[index] = Mr_Dresser.drawBorder(new Robot_PicLoader(vo.picture[index], 0, 0, compPicWidth - 1, compPicHeight - 1), 0xDDDDDD, 1, false)
				vrPic[index].x = 460;
				vrPic[index].y = 0;
				sprPic.addChildAt(vrPic[index % vo.picture.length],0);
			}
			else
			{
				vrPic[index].x = 460;
				vrPic[index].y = 0;
			}
			
			TweenLite.to(vrPic[index], 0.5, {x: 0, y: 0, onComplete: onCompleteMoveHandler});
			if (index == 0)
			{
				TweenLite.to(vrPic[(vo.picture.length - 1)], 0.5, {x: -460, y: 0});
			}
			else
			{
				TweenLite.to(vrPic[index - 1], 0.5, {x: -460, y: 0});
			}
		}
		
		private function onCompleteMoveHandler():void
		{
			sprArrow.leftSelect.addEventListener(MouseEvent.CLICK, leftMouseClickHandler);
			sprArrow.rightSelect.addEventListener(MouseEvent.CLICK, rightMouseClickHandler);
		}
	
	}

}