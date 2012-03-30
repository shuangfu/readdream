package com.readdream.as3.miss 
{
	import com.readdream.as3.miss.matchthumb.Miss_MatchThumb_Big;
	import com.readdream.as3.miss.matchthumb.Miss_MatchThumb_Big_temp;
	import com.readdream.as3.miss.matchthumb.Miss_MatchThumb_Small;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;
	import flash.sampler.NewObjectSample;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_MatchThumb extends Sprite 
	{
		private var _vo:Vo_Match;
				
		public function Miss_MatchThumb(vo:Vo_Match) 
		{
			this.vo = vo;
			
			if (vo.matchImportant == 1) {
				addChild(new Miss_MatchThumb_Big(vo));
			}else {
				addChild(new Miss_MatchThumb_Small(vo));
			}
			
			initData(vo);
		}
		
		private function initData(vo:Vo_Match):void 
		{
		
		}
		
		public function get vo():Vo_Match 
		{
			return _vo;
		}
		
		public function set vo(value:Vo_Match):void 
		{
			_vo = value;
		}
		
	}

}