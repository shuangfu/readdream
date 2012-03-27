package com.readdream.as3.miss 
{
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;
	
	/**
	 * 活动详情界面
	 * @author evstar
	 */
	public class Miss_MatchReveal extends Sprite 
	{
		
		private var titleBar:Miss_MatchReveal_TitleBar;
		/**
		 * 活动详情界面
		 * @param	vr
		 */
		public function Miss_MatchReveal(vo:Vo_Match) 
		{
			titleBar = new Miss_MatchReveal_TitleBar(vo);
			addChild(titleBar);
		}
		
	}

}