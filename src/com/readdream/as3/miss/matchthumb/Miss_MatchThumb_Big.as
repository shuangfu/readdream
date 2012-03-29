package com.readdream.as3.miss.matchthumb 
{
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_MatchThumb_Big extends Sprite 
	{
		private const defaultBackground:uint = 0xF8F8F8; 		//默认背景颜色
		private const activateBackground:uint = 0xECECEC;		//激活背景颜色
		private const SprCompHeight:int = 100;
		public const compPicWidth:int = 460; 					//大图片 宽度
		public const compPicHeight:int = 340; 					//小图片 高度	
		public const sizeWidth:int = 480;
		public const sizeHeight:int = 400;
		
		private var matchTitle:TextField;
		private var matchComp:TextField;
		private var matchFrom:TextField;
		
		
		public function Miss_MatchThumb_Big(vo:Vo_Match) 
		{
			//opaqueBackground = defaultBackground;
			addChild(Mr_Dresser.getMasker(sizeWidth, sizeHeight, defaultBackground));
			
			
			initData(vo);
		}
		
		
		private function initData(vo:Vo_Match):void 
		{
			
		}
		
	}

}