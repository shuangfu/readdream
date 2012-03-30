package com.readdream.as3.mr 
{
	import com.readdream.as3.miss.contentbar.Miss_ContentBar;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.geom.Point;
	
	/**
	 * 美女化妆师
	 * @author evstar
	 */
	public class Mr_Dresser extends Sprite 
	{
		/**
		 * 美女化妆师
		 */
		public function Mr_Dresser() 
		{
			
		}
		
		/**
		 * 制作遮罩 以及 自定义矩形填充
		 * 矩形宽 | 矩形高 | 颜色
		 * 
		 * @param	sizeWidth
		 * @param	sizeHeight
		 * @param	colors
		 */
		public static function getMasker(sizeWidth:Number,sizeHeight:Number,color:uint = 0xff0000) :Sprite
		{
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(color);
			sp.graphics.drawRect(0, 0, sizeWidth, sizeHeight );
			sp.graphics.endFill();
			return sp;
		}
		
		/**
		 * 自定义背景
		 * 背景sprite | 颜色 | 背景大小 | 是否阴影 
		 * @param	spr
		 * @param	color
		 * @param	borderWidth
		 * @param	shadow
		 * @return
		 */
		public static function drawBorder(spr:Sprite, color:uint, borderWidth:Number = 2,shadow:Boolean = false ):Sprite {
			var background:Sprite = new Sprite();
			background.graphics.beginFill(color);
			background.graphics.drawRect(0, 0, spr.width + borderWidth*2, spr.height + borderWidth*2);
			background.graphics.endFill();
						
			spr.x = borderWidth;
			spr.y = borderWidth;
			
			background.addChild(spr);
			
			/////////////////////////
			//添加阴影
			if(shadow){
				addShadowFilter(background);
			}
			return background;
		}
		
		public static function addShadowFilter(spr:Sprite,color:Number = 0x000000,angle:Number = 90,alpha:Number = 0.65,blurX:Number = 4,blurY:Number = 8,distance:Number = 4,strength:Number = 0.65,inner:Boolean = false,knockout:Boolean = false,quality:Number = BitmapFilterQuality.HIGH):void
		{
			var filter:BitmapFilter = new DropShadowFilter(distance, angle, color, alpha, blurX, blurY, strength, quality, inner, knockout);
			var myFilters:Array = new Array();
			myFilters.push(filter);
			spr.filters = myFilters;
		}
		
		/**
		 * 自定义线条画边框
		 * 容器Sprite | 左上角坐标 | 右上角坐标 | 右下角坐标 | 左下角坐标 | 线条厚度 | 颜色 | 透明
		 * @param	_container
		 * @param	uLP
		 * @param	uRP
		 * @param	dRP
		 * @param	dLP
		 * @param	thickness
		 * @param	color
		 * @param	alpha
		 */
		public static function drawBorderByLine(container:Sprite, uLP:Point, uRP:Point, dRP:Point, dLP:Point, thickness1:Number = 0.5 , color1:uint = 0 , alpha1:Number = 1):void 
		{			
			container.graphics.lineStyle(thickness1, color1, alpha1, true);
			container.graphics.moveTo(uLP.x, uLP.y);
			container.graphics.lineTo(uRP.x, uRP.y);
			container.graphics.lineTo(dRP.x, dRP.y);
			container.graphics.lineTo(dLP.x, dLP.y);
			container.graphics.lineTo(uLP.x, uLP.y);
			container.graphics.lineStyle();
		}
		
		/**
		 * 画线工具
		 * 容器 | 起点x坐标 Number | 起点Y坐标 Number | 结尾x坐标 Number | 结尾Y坐标 Number | 粗细 Number | 颜色 uint | 透明 Number)
		 * @param	xPos1
		 * @param	yPos1
		 * @param	xPos2
		 * @param	yPos2
		 * @param	thickness
		 * @param	color
		 * @param	alpha
		 */
		public static function drawLine(container:Sprite, xPos1:Number, yPos1:Number, xPos2:Number, yPos2:Number, thickness:Number = NaN, color:uint = 0, alpha:Number = 1 ):void
		{
			container.graphics.lineStyle(thickness, color, alpha, false);
			container.graphics.moveTo(xPos1, yPos1);
			container.graphics.lineTo(xPos2, yPos2);
			container.graphics.lineStyle();
		}
		
		
		/**
		 * 画虚线
		 * 
		 * graphics对象 | 开始坐标 | 结束坐标 | 线粗 | 颜色 | 间隙
		 * @param	g
		 * @param	fp
		 * @param	tp
		 * @param	lineWidth
		 * @param	lineColor
		 * @param	gap
		 */
		public static function drawDottedLine(g:Graphics, fp:Point, tp:Point, lineWidth:uint = 1, lineColor:uint = 0, gap:uint = 5):void
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