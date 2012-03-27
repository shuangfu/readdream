package com.readdream.as3.miss 
{
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	
	/**
	 * 活动详情内标题栏
	 * @author evstar
	 */
	public class Miss_MatchReveal_TitleBar extends Sprite 
	{
		private const matchIconX:Number = 45;
		private const matchIconY:Number = 25;
		private const matchIconWidth:Number = 60;
		private const matchIconHeight:Number = 60;
		
		private var picIcon:Robot_PicLoader;
		private var txtTitle:TextField;
		private var txtType:TextField;
		private var txtApplyUsers:TextField;
		private var txtFrom:TextField;
		private var dottedLine:Sprite;
		/**
		 * 活动详情内标题栏
		 * @param	vr
		 */
		public function Miss_MatchReveal_TitleBar(vo:Vo_Match) 
		{
			graphics.beginFill(0xEEEEEE);
			graphics.drawRect(0, 0, 980, 100);
			graphics.endFill();
			
			initData(vo);
			setupImage();
		}
		
		private function initData(vo:Vo_Match):void 
		{
			picIcon = new Robot_PicLoader(vo.matchIcon, matchIconX, matchIconY, matchIconWidth, matchIconHeight);
			
			txtTitle = new TextField();
			txtTitle.text = vo.matchTitle;
			
			txtType = new TextField();
			txtType.text = vo.matchType;
			
			txtApplyUsers = new TextField();
			txtApplyUsers.text = ""+vo.matchApplyUsers;
			
			txtFrom = new TextField();
			txtFrom.text = vo.matchFrom;
			
			dottedLine = new Sprite();
			Miss_BrokenLine.drawLine(dottedLine.graphics, new Point(0, 0), new Point(0, 15), 1, 0x000000, 1);
		}
		
		private function setupImage():void 
		{
			
		}
		
	}

}