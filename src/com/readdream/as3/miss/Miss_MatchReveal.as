package com.readdream.as3.miss 
{
	import com.greensock.TweenMax;
	import com.readdream.as3.event.MatchReveal_TabbarEvent;
	import com.readdream.as3.miss.contentbar.Miss_ContentBar;
	import com.readdream.as3.miss.contentbar.Miss_TabBar;
	import com.readdream.as3.miss.contentbar.Miss_TitleBar;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * 活动详情界面
	 * @author evstar
	 */
	public class Miss_MatchReveal extends Sprite 
	{
		private const titleBarX:Number = 0;
		private const titleBarY:Number = 0;
		private const tabBarX:Number = 0;
		private const tabbarY:Number = 100;
		private const contentBarX:Number = 0;
		private const contentBarY:Number = 140;
		
		private var border:Sprite;
		private var titleBar:Miss_TitleBar;
		private var tabBar:Miss_TabBar;
		private var contentBar:Miss_ContentBar;
		/**
		 * 活动详情界面
		 * @param	vr
		 */
		public function Miss_MatchReveal(vo:Vo_Match) 
		{
			initData(vo);
			drawBorder();
			setupBar();
		}
		
		private function drawBorder():void 
		{
			border = new Sprite();
			Mr_Dresser.drawBorderByLine(border, new Point(0, 0), new Point(980, 0), new Point(980, 700), new Point(0, 700), 1, 0x000000, 0.30);
			
		}
		
		private function initData(vo:Vo_Match):void 
		{
			titleBar = new Miss_TitleBar(vo);
			tabBar = new Miss_TabBar();
			tabBar.addEventListener(MatchReveal_TabbarEvent.TABBAR_CHANGE, tabBarChangeHandler);
			contentBar = new Miss_ContentBar(vo);		
			

		}
		
		private function tabBarChangeHandler(e:MatchReveal_TabbarEvent):void 
		{
			contentBar.setActivate(e.btnName);
			
		}
		
		private function setupBar():void 
		{
			var objArr:Array = new Array();
			objArr[0] = { stuff:titleBar, xPos:titleBarX, yPos:titleBarY };
			objArr[1] = { stuff:tabBar, xPos: tabBarX, yPos:tabbarY };
			objArr[2] = { stuff:contentBar, xPos:contentBarX, yPos:contentBarY };
			objArr[3] = { stuff:border, xPos:0, yPos:0 };
			Mr_Layouter.layouter(this, objArr);
			Mr_Dresser.addShadowFilter(this);
			
		}		
	}

}