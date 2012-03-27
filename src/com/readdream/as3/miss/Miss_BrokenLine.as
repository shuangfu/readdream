package com.readdream.as3.miss
{
	
	import flash.display.Graphics;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_BrokenLine
	{
		
		public function Miss_BrokenLine()
		{
		
		}
		
		public static function drawLine(g:Graphics, fp:Point, tp:Point, lineWidth:uint = 1, lineColor:uint = 0, gap:uint = 5):void
		{
			var angle:Number = Math.atan2(tp.y - fp.y, tp.x - fp.x);
			var xGap:Number = gap * Math.cos(angle);
			var yGap:Number = gap * Math.sin(angle);
			var nextP:Point = fp;
			g.lineStyle(lineWidth, lineColor);
			if (angle > -Math.PI / 4 && angle <= Math.PI / 4)
			{
				do
				{
					g.moveTo(nextP.x, nextP.y);
					g.lineTo(nextP.x + xGap, nextP.y + yGap);
					nextP = new Point(nextP.x + 2 * xGap, nextP.y + 2 * yGap);
					g.endFill();
				} while (nextP.x <= tp.x)
			}
			else if (angle > Math.PI / 4 && angle <= Math.PI * 3 / 4)
			{
				do
				{
					g.moveTo(nextP.x, nextP.y);
					g.lineTo(nextP.x + xGap, nextP.y + yGap);
					nextP = new Point(nextP.x + 2 * xGap, nextP.y + 2 * yGap);
					g.endFill();
				} while (nextP.y <= tp.y)
			}
			else if (angle > Math.PI * 3 / 4 && angle <= Math.PI)
			{
				do
				{
					g.moveTo(nextP.x, nextP.y);
					g.lineTo(nextP.x + xGap, nextP.y + yGap);
					nextP = new Point(nextP.x + 2 * xGap, nextP.y + 2 * yGap);
					g.endFill();
				} while (nextP.x >= tp.x)
			}
			else if (angle <= -Math.PI * 3 / 4 && angle >= -Math.PI)
			{
				do
				{
					g.moveTo(nextP.x, nextP.y);
					g.lineTo(nextP.x + xGap, nextP.y + yGap);
					nextP = new Point(nextP.x + 2 * xGap, nextP.y + 2 * yGap);
					g.endFill();
				} while (nextP.x >= tp.x)
			}
			else if (angle > -Math.PI * 3 / 4 && angle <= -Math.PI / 4)
			{
				do
				{
					g.moveTo(nextP.x, nextP.y);
					g.lineTo(nextP.x + xGap, nextP.y + yGap);
					nextP = new Point(nextP.x + 2 * xGap, nextP.y + 2 * yGap);
					g.endFill();
				} while (nextP.y >= tp.y)
			}
		
		}
	
	}

}