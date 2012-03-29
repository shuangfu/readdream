package com.readdream.as3.miss.contentbar 
{
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.robot.Robot_TextFormater;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * 活动详情内标题栏
	 * @author evstar
	 */
	public class Miss_TitleBar extends Sprite 
	{
		private const barWidth:Number = 980;
		private const barHeight:Number = 100;
		private const matchIconX:Number = 50;
		private const matchIconY:Number = 30;
		private const matchIconWidth:Number = 40;
		private const matchIconHeight:Number = 40;
		private const matchTitleX:Number = matchIconX + matchIconWidth + 30;
		private const matchTitleY:Number = 25;
		
		private var picIcon:Robot_PicLoader;
		private var txtTitle:TextField;
		private var txtType:TextField;
		private var txtApplyUsers:TextField;
		private var txtFrom:TextField;
		private var txtUsersNum:TextField;
		private var dottedLine:Sprite;
		private var dottedLine2:Sprite;
		private var border:Sprite;
		/**
		 * 活动详情内标题栏
		 * @param	vr
		 */
		public function Miss_TitleBar(vo:Vo_Match) 
		{
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, barWidth, barHeight);
			graphics.endFill();
			
			initData(vo);
			setupImage();
		}
		
		private function initData(vo:Vo_Match):void 
		{

			picIcon = new Robot_PicLoader(vo.matchIcon, 0, 0, matchIconWidth, matchIconHeight);
			Mr_Dresser.addShadowFilter(picIcon,0,90,0.65,4,8, 2);
 
			
			txtTitle = new TextField();
			txtTitle.text = vo.matchTitle;
			txtTitle.autoSize = TextFieldAutoSize.LEFT;
			txtTitle.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.TABBAR_TITLE));
			
			
			txtType = new TextField();
			txtType.text = vo.matchType;
			txtType.autoSize = TextFieldAutoSize.LEFT;
			txtType.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.TABBAR_TEXT));
			
			txtUsersNum = new TextField();
			txtUsersNum.text = vo.matchApplyUsers.toString();
			txtUsersNum.autoSize = TextFieldAutoSize.LEFT;
			//txtUsersNum.border = true;
			txtUsersNum.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.TABBAR_APPLYUSER_NUM));
			
			txtApplyUsers = new TextField();
			txtApplyUsers.text = "人参与";
			txtApplyUsers.autoSize = TextFieldAutoSize.LEFT;
			txtApplyUsers.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.TABBAR_APPLYUSER));
			
			txtFrom = new TextField();
			txtFrom.text = "来自"+vo.matchFrom;
			txtFrom.autoSize = TextFieldAutoSize.LEFT;
			txtFrom.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.TABBAR_TEXT));
			
			dottedLine = new Sprite();
			Mr_Dresser.drawDottedLine(dottedLine.graphics, new Point(0, 0), new Point(0, 15), 1, 0x000000, 1);
			
			dottedLine2 = new Sprite();
			Mr_Dresser.drawDottedLine(dottedLine2.graphics, new Point(0, 0), new Point(0, 15), 1, 0x000000, 1);
			
			border = new Sprite(); 
			Mr_Dresser.drawLine(border, 0, 100, 980, 100, 1, 0xCCCCCC, 1);
		}
		
		private function setupImage():void 
		{
			var objArr:Array = new Array();
			objArr[0] = { stuff:picIcon, xPos:matchIconX, yPos:matchIconY };
			objArr[1] = { stuff:txtTitle, xPos:matchTitleX, yPos:matchTitleY };
			objArr[2] = { stuff:txtType, xPos:matchTitleX, yPos:(matchTitleY + txtTitle.height + 5) };
			objArr[3] = { stuff:dottedLine, xPos:(matchTitleX + txtType.width + 5), yPos:(matchTitleY + txtTitle.height + 5) };
			objArr[4] = { stuff:txtFrom, xPos:(matchTitleX + txtType.width + 5 + 7), yPos:(matchTitleY + txtTitle.height + 5) };
			objArr[5] =	{ stuff:dottedLine2, xPos:(matchTitleX + txtType.width + 5 + 7 + txtFrom.width + 5), yPos:(matchTitleY + txtTitle.height + 5) };
			objArr[6] = { stuff:txtUsersNum, xPos:(matchTitleX + txtType.width + 5 + 7 + txtFrom.width + 5 + 7), yPos:(matchTitleY + txtTitle.height + 5 - 2.5) };
			objArr[7] = { stuff:txtApplyUsers, xPos:(matchTitleX + txtType.width + 5 + 7 + txtFrom.width + 5 + 7+ txtUsersNum.width - 2), yPos:(matchTitleY + txtTitle.height + 5 - 0.5) };
			objArr[8] = { stuff:border, xPos:0, yPos:0 };
			Mr_Layouter.layouter(this, objArr);
		}
		
	}

}