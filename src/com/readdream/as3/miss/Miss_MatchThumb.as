package com.readdream.as3.miss
{
	import com.readdream.as3.miss.contentbar.Miss_ContentBar;
	import com.readdream.as3.miss.matchthumb.Miss_MatchThumb_Big;
	import com.readdream.as3.miss.matchthumb.Miss_MatchThumb_Small;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
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
			var bmpData:BitmapData = new BitmapData(1, 1);
			if (vo.matchImportant == 1)
			{
				var tempThumb_big:Miss_MatchThumb_Big;
				tempThumb_big = new Miss_MatchThumb_Big(vo);
				tempThumb_big.scrollRect = new Rectangle(0, 0, 480, 400);
				
				bmpData.draw(tempThumb_big);
				addChild(tempThumb_big);
				trace(tempThumb_big.x, " ||| ", tempThumb_big.y);
				trace(tempThumb_big.width, "|||---|||", tempThumb_big.height);
			}
			else
			{
				var tempThumb_small:Miss_MatchThumb_Small;
				tempThumb_small = new Miss_MatchThumb_Small(vo);
				tempThumb_small.scrollRect = new Rectangle(0, 0, 241, 200);
				bmpData.draw(tempThumb_small);
				addChild(tempThumb_small);
				trace(tempThumb_small.x, " ||| ", tempThumb_small.y);
				trace(tempThumb_small.width, "|||---|||", tempThumb_small.height);
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