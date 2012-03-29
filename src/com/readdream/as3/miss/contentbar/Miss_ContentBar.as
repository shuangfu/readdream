package com.readdream.as3.miss.contentbar
{
	import com.greensock.easing.Circ;
	import com.greensock.easing.Linear;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.readdream.as3.event.MatchReveal_ContentBarEvent;
	import com.readdream.as3.event.MatchReveal_TabbarEvent;
	import com.readdream.as3.miss.Miss_ScrollBarMagician;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.robot.Robot_TextFormater;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.DisplayObject;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IMEEvent;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_ContentBar extends Sprite
	{
		private const barWidth:int = 980;
		private const barHeight:int = 560;

		private const lblListX:Number = 40;
		private const lblListY:Number = 470;
		private const contentBarPicX:Number = 40;
		private const contentBarPicY:Number = 40;
		private const matchCompX:Number = contentBarPicX+640+30;
		private const matchCompY:Number = contentBarPicY;
		private const textWidth:Number = 625;
		private const matchInformationX:Number = 710;
		private const matchInformationY:Number = 50;
		private const gap:Number = 10;
		private const matchInformationWidth:Number = 220;
		
		private var sprOverview:Sprite = new Sprite();
		private var sprDetails:Sprite = new Sprite();
		private var sprRelated:Sprite = new Sprite();
		
		private var matchComp:TextField;
		private var matchContent:TextField;
		private var matchComp2:TextField;
		private var matchContent2:TextField;
		private var matchInformation1:TextField;
		private var matchInformation2:TextField;
		private var matchInformation3:TextField;
		private var matchInformation4:TextField;
		private var matchInformation5:TextField;
		private var dottedLine1:Sprite;
		private var dottedLine2:Sprite;
		private var dottedLine3:Sprite;
		private var dottedLine4:Sprite;
		private var sprRight:Sprite = new Sprite();
		private var sprRightScroll:Miss_ScrollBarMagician;
		private var txtExplain:TextField;
		private var lblPicture:Sprite;
		private var flag:String = "sprOverview";
		private var i:int = 0;

		
		private var lblList:Miss_LabelPictureList;
		private var temp:Number;
		
		public function Miss_ContentBar(vo:Vo_Match)
		{
			graphics.beginFill(0xF1F1F1);
			graphics.drawRect(0, 1, barWidth, barHeight);
			graphics.endFill();
			
			initData(vo);
			initOverview();
			initDetails();
			initRelated();
			setupImage();
			sprOverview.alpha = 1;
			sprDetails.alpha = 0;
			sprRelated.alpha = 0;			
		}
		
		
	
		
		private function initData(vo:Vo_Match):void
		{
			/////////////////
			//Init Overview
			lblPicture = Mr_Dresser.drawBorder((new Miss_LabelPicture(vo)), 0xFFFFFF, 2, true);
			
			lblList = new Miss_LabelPictureList(vo);
			lblList.addEventListener(MatchReveal_ContentBarEvent.PICTURE_CHANGE, pictureHandler);
			matchComp = new TextField();
			matchComp.text = "    "+vo.matchComp;
			
			matchContent = new TextField();
			matchContent.text = vo.matchContent;
			
			////////////////
			//Init Details
			txtExplain = new TextField();
			txtExplain.text = "说明";
			
			matchComp2 = new TextField();
			matchComp2.text = "    "+vo.matchComp;
			
			matchContent2 = new TextField();
			matchContent2.text = vo.matchContent;
			
			matchInformation1 = new TextField()
			matchInformation1.text = vo.matchInformation1;
			
			matchInformation2 = new TextField()
			matchInformation2.text = vo.matchInformation2;
			
			matchInformation3 = new TextField()
			matchInformation3.text = vo.matchInformation3;
			
			matchInformation4 = new TextField()
			matchInformation4.text = vo.matchInformation4;
			
			matchInformation5 = new TextField()
			matchInformation5.text = vo.matchInformation5;
			
			dottedLine1 = new Sprite();
			Mr_Dresser.drawLine(dottedLine1, 0, 0, 220, 0, 1, 0xc6c6c6, 1);
			dottedLine2 = new Sprite();
			Mr_Dresser.drawLine(dottedLine2, 0, 0, 220, 0, 1, 0xc6c6c6, 1);
			dottedLine3 = new Sprite();
			Mr_Dresser.drawLine(dottedLine3, 0, 0, 220, 0, 1, 0xc6c6c6, 1);
			dottedLine4 = new Sprite();
			Mr_Dresser.drawLine(dottedLine4, 0, 0, 220, 0, 1, 0xc6c6c6, 1);
			
			
		}
		
		private function pictureHandler(e:MatchReveal_ContentBarEvent):void 
		{
			(lblPicture.getChildAt(0) as Miss_LabelPicture).movePicture(e.serial);
		}
		
		private function initOverview():void 
		{
			matchComp.autoSize = TextFieldAutoSize.LEFT;
			matchComp.width = 240;
			matchComp.wordWrap = true;
			matchComp.mouseWheelEnabled = false;
			matchComp.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.CONTENTBAR_MATCHCOMP));
			matchComp.mouseWheelEnabled = false;
						
			matchContent.autoSize = TextFieldAutoSize.LEFT;
			matchContent.width = 240;
			matchContent.wordWrap = true;
			matchContent.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.CONTENTBAR_MATCHCONTENT));
			matchContent.mouseWheelEnabled = false;
<<<<<<< HEAD
=======

			matchContent.y = matchComp.height + 20;
			sprRight.addChild(matchComp);
			sprRight.addChild(matchContent);
			sprRightScroll = new Miss_ScrollBarMagician(sprRight, 480);
>>>>>>> 4e68bd25a641c9c571a9c5c39e02e8369c7ffc80
		}
		
		private function initDetails():void 
		{
			txtExplain.autoSize = TextFieldAutoSize.LEFT;
			txtExplain.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_EXPLAIN));
			
			matchComp2.autoSize = TextFieldAutoSize.LEFT;
			matchComp2.width = textWidth;
			matchComp2.wordWrap = true;
			matchComp2.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			
			matchContent2.autoSize = TextFieldAutoSize.LEFT;
			matchContent2.width = textWidth;
			matchContent2.wordWrap = true;
			matchContent2.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCONTENT));
			
			matchInformation1.autoSize = TextFieldAutoSize.LEFT;
			matchInformation1.width = matchInformationWidth;
			matchInformation1.wordWrap = true;
			matchInformation1.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHINFORMATION));
			
			matchInformation2.autoSize = TextFieldAutoSize.LEFT;
			matchInformation2.width = matchInformationWidth;
			matchInformation2.wordWrap = true;
			matchInformation2.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHINFORMATION));
			
			matchInformation3.autoSize = TextFieldAutoSize.LEFT;
			matchInformation3.width = matchInformationWidth;
			matchInformation3.wordWrap = true;
			matchInformation3.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHINFORMATION));
			
			matchInformation4.autoSize = TextFieldAutoSize.LEFT;
			matchInformation4.width = matchInformationWidth;
			matchInformation4.wordWrap = true;
			matchInformation4.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHINFORMATION));
			
			matchInformation5.autoSize = TextFieldAutoSize.LEFT;
			matchInformation5.width = matchInformationWidth;
			matchInformation5.wordWrap = true;
			matchInformation5.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHINFORMATION));
			
			
		}
		
		private function initRelated():void
		{
			sprRelated.addChild(Mr_Dresser.getMasker(640, 400));
		}
	
		private function setupImage():void 
		{
			//////////////////
			//概述界面对象装载
			var overviewArr:Array = new Array();
			overviewArr[0] = { stuff:lblPicture, xPos:contentBarPicX, yPos:contentBarPicY };
			overviewArr[1] = { stuff:lblList, xPos:lblListX, yPos:lblListY };
			overviewArr[2] = { stuff:sprRightScroll, xPos:matchCompX, yPos:matchCompY };
			Mr_Layouter.layouter(sprOverview, overviewArr);
			
			var detailsArr:Array = new Array();
			detailsArr.push( { stuff:txtExplain, xPos:contentBarPicX, yPos:contentBarPicY });
			detailsArr.push( { stuff:matchComp2, xPos:contentBarPicX, yPos:contentBarPicY + txtExplain.height + 20 }) ;
			detailsArr.push( { stuff:matchContent2, xPos:contentBarPicX, yPos:contentBarPicY + txtExplain.height + 20 + matchComp2.textHeight + 20 } );
			
			detailsArr.push( { stuff:matchInformation1, xPos:matchInformationX, yPos:matchInformationY } );
			detailsArr.push( { stuff:dottedLine1, xPos:matchInformationX, yPos:matchInformationY + matchInformation1.height + gap * 0.5  } );
			detailsArr.push( { stuff:matchInformation2, xPos:matchInformationX, yPos:matchInformationY + matchInformation1.textHeight + dottedLine1.height + gap * 2 } );
			detailsArr.push( { stuff:dottedLine2, xPos:matchInformationX, yPos:matchInformationY + matchInformation2.textHeight * 2 + dottedLine1.height + gap * 3 } );
			detailsArr.push( { stuff:matchInformation3, xPos:matchInformationX, yPos:matchInformationY + matchInformation2.textHeight * 2 + dottedLine1.height * 2 + gap * 4 } );
			detailsArr.push( { stuff:dottedLine3, xPos:matchInformationX, yPos:matchInformationY + matchInformation2.textHeight * 3 + dottedLine1.height * 2 + gap * 5 } );
			detailsArr.push( { stuff:matchInformation4, xPos:matchInformationX, yPos:matchInformationY + matchInformation2.textHeight * 3 + dottedLine1.height * 2 + gap * 6  } );
			detailsArr.push( { stuff:dottedLine4, xPos:matchInformationX, yPos:matchInformationY + matchInformation2.textHeight * 4 + dottedLine1.height * 3 + gap * 7  } );
			detailsArr.push( { stuff:matchInformation5, xPos:matchInformationX, yPos:matchInformationY + matchInformation2.textHeight * 4 + dottedLine1.height * 3 + gap * 8 } );
			
			Mr_Layouter.layouter(sprDetails, detailsArr);
			//trace(dottedLine1.y);
			
			
			var contentArr:Array = new Array();
			contentArr.push( { stuff:sprOverview, xPos:0, yPos:0 } );
			contentArr.push( { stuff:sprDetails, xPos:0, yPos:0 } );
			contentArr.push( { stuff:sprRelated, xPos:0, yPos:0 } );
			Mr_Layouter.layouter(this, contentArr);
		}
		
		public function setActivate(btnName:String) :void {
			TweenMax.to(this[btnName], 0.3, { alpha:1, blurFilter:{blurX:0, blurY:0, quality:0} } );
			//TweenMax.to(this[btnName], 0.3, { alpha:1, motionBlur:true } );
			if ( flag != btnName) {
				TweenLite.to((this[flag] as Sprite), 0.3, { alpha:0,blurFilter:{blurX:20, blurY:20, quality:3} } );
				//TweenLite.to((this[flag] as Sprite), 0.3, { alpha:0,motionBlur:true } );
			}
			flag = btnName;
		}
		
		
	
	}

}

			