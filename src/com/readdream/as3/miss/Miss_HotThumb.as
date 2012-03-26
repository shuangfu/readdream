package com.readdream.as3.miss 
{
	import com.greensock.easing.Circ;
	import com.greensock.easing.Linear;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.VO.Vo_Match;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_HotThumb extends Sprite 
	{
		/**
		 * 定义常量
		 * 元素尺寸
		 * */
		private const hotThumbWidth:int = 960			//组件尺寸高度
		private const hotThumbHeight:int = 300			//组件尺寸宽度
		private const gap:int = 10;						//间隙尺寸
		private const flankImageWidth:int = 110;		//侧面可见图片宽
		private const imageWidth:int = 700;				//图片尺寸高度
		private const imageHeight:int = 280;			//图片尺寸宽度
		private const compHeight:int = 100;				//活动详情说明高度
		private const iconWidth:int = 30;				//活动图标高度
		private const iconHeight:int = 30;				//活动图标宽度
		
		/**
		 * 定义常量
		 * 元素坐标
		 * */
		private const leftFlankImageX:int = gap + flankImageWidth - imageWidth;			//左侧面图片X坐标
		private const centerImageX:int = gap + flankImageWidth + gap;					//中间图片X坐标
		private const rightFlankImageX:int = gap * 3 + flankImageWidth  + imageWidth;	//右侧面图片X坐标
		private const left2FlankImageX:int = leftFlankImageX - gap - imageWidth;		//左侧左边图片X坐标
		private const right2FlankImageX:int = rightFlankImageX + gap + imageWidth;		//右侧右边图片X坐标
		private const allImageY:int = gap ;												//所有图片Y坐标
		private const compX:int = centerImageX;											//活动详情说明X坐标
		private const compY:int = imageHeight;											//活动详情说明Y坐标
		private const activateCompY:int = imageHeight - compHeight;						//活动详情激活后Y坐标 
		private const iconX:int = 20;													//活动图标X坐标
		private const iconY:int = 15;													//活动图标Y坐标
		
		/**
		 * 图片滚动效果时间常量
		 */
		private const rollEffect:Number = 0.5;
		
		/**
		 * 
		 * 定义变量
		 * */
		private var loader:Vector.<Robot_PicLoader> = new Vector.<Robot_PicLoader>;		//用于存放图片显示对象的数组
		private var voMatch:Vector.<Vo_Match> = new Vector.<Vo_Match>;					//用于存放传过来的voMatch数组对象
		private var index:int = 0 ;														//当前图片下标
		private var temp:int = 0 ;														//临时变量
		private var btnArrow:Miss_Arrow;												//声明Arrow翻页按钮
		private var labelComp:Sprite;													//声明活动说明容器
		private var matchIcon:Robot_PicLoader;											//声明活动图标容器
		private var MatchTitle:TextField;												//声明活动标题文本域
		private var MatchComp:TextField;												//声明活动介绍文本域
		private var buttonArrow:Miss_Arrow;												//声明容器左右两边箭头
		
		
		
		/**
		 * 
		 * 热门活动缩略图
		 * 传入一个用Array封装的Vo_Match类型数组
		 * */		
		public function Miss_HotThumb(obj:Vector.<Vo_Match>) 
		{
			initData(obj);
			setMask();
			setupImage();
			setupLabelComp();
			setupArrow();
		}
		
		/**
		 * 初始化数据
		 * */
		private function initData(obj:Vector.<Vo_Match>):void 
		{
			voMatch = obj;
			
			for (; index < voMatch.length * 3; index++) //按照传入比赛活动个数复制三遍传入loader数组。
			{
				trace(obj[index % obj.length].picture[0]);
				loader.push(new Robot_PicLoader(obj[index % obj.length].picture[0], 0, 0, imageWidth, imageHeight));
				TweenMax.to(loader[index], 0.05, {colorTransform:{tint:0x000000, tintAmount:0.5}});
			}
			index = Math.floor(index / 2);//把图片下标移动到中间位置
			TweenMax.to(loader[index], 0.05, {colorTransform:{tint:0x000000, tintAmount:0}});
		}
		
		/**
		 * 制作遮罩
		 * */
		private function setMask():void 
		{
			
			var masker:Miss_Masker = new Miss_Masker(hotThumbWidth - (gap * 2), hotThumbHeight - (gap * 2) );
			this.mask = masker;
			masker.x = 10;
			masker.y = 10;
			addChild(masker);
		}
		
		/**
		 * 装载影像
		 * */		
		private function setupImage():void 
		{
			
			for (temp = -3 ; temp < 3; temp++) {
				addChildAt(loader[(index + temp + loader.length) % loader.length], 0);
			}
			
			TweenLite.to(loader[(index - 3 + loader.length) % loader.length], 0.01, { x: left2FlankImageX, y: allImageY, ease: Linear.easeNone } )
			TweenLite.to(loader[(index - 2 + loader.length) % loader.length], 0.01, { x: left2FlankImageX, y: allImageY, ease: Linear.easeNone } )
			TweenLite.to(loader[(index - 1 + loader.length) % loader.length], 0.01, { x: leftFlankImageX, y: allImageY, ease: Linear.easeNone } )
			TweenLite.to(loader[(index + loader.length) % loader.length], 0.01, { x: centerImageX, y: allImageY, ease: Linear.easeNone } )
			TweenLite.to(loader[(index + 1 + loader.length) % loader.length], 0.01, { x: rightFlankImageX, y: allImageY, ease: Linear.easeNone } )
			TweenLite.to(loader[(index + 2 + loader.length) % loader.length], 0.01, { x: right2FlankImageX, y: allImageY, ease: Linear.easeNone } )
		}
		
		/**
		 * 装载活动介绍信息
		 */
		private function setupLabelComp():void 
		{
			labelComp = new Sprite();
			labelComp.x = 0;
			labelComp.y = compY;
			labelComp.graphics.beginFill(0x000000,0.9);
			labelComp.graphics.drawRect(0,0,imageWidth,compHeight);
			labelComp.graphics.endFill();
			
			matchIcon = new Robot_PicLoader(voMatch[index % voMatch.length].matchIcon, 0, 0, iconWidth, iconHeight);
			matchIcon.x = iconX;
			matchIcon.y = iconY;
			
			MatchTitle = new TextField();
			MatchTitle.x = iconX + matchIcon.width +20;
			MatchTitle.y = 20;
			MatchTitle.border = false;
			MatchTitle.width = imageWidth -iconX -matchIcon.width - 20;
			MatchTitle.text = voMatch[index % voMatch.length].matchTitle;
			
			MatchComp = new TextField();
			MatchComp.text = "        "+ voMatch[index % voMatch.length].matchComp;
			MatchComp.x = 0;
			MatchComp.y = iconY + matchIcon.height + 5;
			MatchComp.border = false;
			MatchComp.width = imageWidth;
			MatchComp.wordWrap = true;
			
			var TitleFormat:TextFormat = new TextFormat();
			TitleFormat.size = 21;
			TitleFormat.bold = true;
			TitleFormat.color = 0xFFFFFF;
			
			var ContentFormat:TextFormat = new TextFormat();
			ContentFormat.size = 12;
			ContentFormat.color = 0x989898;

			MatchTitle.setTextFormat(TitleFormat);
			MatchComp.setTextFormat(ContentFormat);
			
			labelComp.addChild(matchIcon);
			labelComp.addChild(MatchTitle);
			labelComp.addChild(MatchComp);
			
			loader[index%loader.length].addChild(labelComp);
			
			loader[index%loader.length].addEventListener(MouseEvent.ROLL_OVER, LoaderMouseRollOverHandler);
			loader[index%loader.length].addEventListener(MouseEvent.ROLL_OUT, LoaderMouseRollOutHandler);
		}
		
		/**
		 * 中间图片鼠标移出事件
		 * 鼠标移出中间图片后活动说明容器下移消失
		 */
		private function LoaderMouseRollOutHandler(e:MouseEvent):void 
		{
			TweenMax.to(labelComp, 0.7, { x:0, y: compY, ease: Circ.easeInOut } );
		}
		
		/**
		 * 中间图片鼠标移入事件
		 * 鼠标移入中间图片后活动说明容器上移显示
		 */
		private function LoaderMouseRollOverHandler(e:MouseEvent):void 
		{
			TweenMax.to(labelComp, 0.7, { x:0, y: activateCompY, ease: Circ.easeInOut } );
		}
		
		/**
		 * 装载容器左右两边箭头按钮
		 */
		private function setupArrow():void 
		{
			buttonArrow = new Miss_Arrow(gap, hotThumbHeight / 2 - (Miss_Arrow.arrowHeight/2), hotThumbWidth - Miss_Arrow.arrowWidth - gap , hotThumbHeight / 2 - (Miss_Arrow.arrowHeight/2));
			addChild(buttonArrow);
			
			buttonArrow.LeftSelect.addEventListener(MouseEvent.CLICK, leftSelectClickHandler);
			buttonArrow.RightSelect.addEventListener(MouseEvent.CLICK, rightSelectClickHandler);
		}
		
		/**
		 * 点击左边箭头触发的事件
		 * @param	e
		 */
		private function leftSelectClickHandler(e:MouseEvent):void 
		{
			buttonArrow.LeftSelect.removeEventListener(MouseEvent.CLICK, leftSelectClickHandler);
			buttonArrow.RightSelect.removeEventListener(MouseEvent.CLICK, rightSelectClickHandler);	
			index--;
			if (index < 0) {
				index = loader.length - 1;
			}			
			if (loader[(index - 2 + loader.length) % loader.length].parent == null) {
				loader[(index - 2 + loader.length) % loader.length].x = left2FlankImageX;
				loader[(index - 2 + loader.length) % loader.length].y = allImageY;
				addChildAt(loader[(index - 2 + loader.length) % loader.length],0);
			}
			
			TweenLite.to(loader[(index - 1 + loader.length) % loader.length], rollEffect, { x: leftFlankImageX, y: allImageY, ease: Linear.easeNone,onComplete:onCompleteHandler } ); //最左边移动到左边
			TweenMax.to(loader[(index - 1 + loader.length) % loader.length], rollEffect, {colorTransform:{tint:0x000000, tintAmount:0.5}});//左边变黑
			TweenLite.to(loader[(index + loader.length) % loader.length], rollEffect, { x: centerImageX, y: allImageY,  ease: Linear.easeNone } );//左边移动到中间
			TweenMax.to(loader[(index + loader.length) % loader.length], rollEffect, {colorTransform:{tint:0x000000, tintAmount:0}});//中间变亮
			TweenLite.to(loader[(index + 1 + loader.length) % loader.length], rollEffect, { x: rightFlankImageX, y: allImageY, ease: Linear.easeNone } );//中间移动到右边
			TweenMax.to(loader[(index + 1 + loader.length) % loader.length], rollEffect, {colorTransform:{tint:0x000000, tintAmount:0.5}});//右边变黑
			TweenLite.to(loader[(index + 2 + loader.length) % loader.length], rollEffect, { x: right2FlankImageX, y: allImageY, ease: Linear.easeNone } );//右边移动到最右边
			
			loader[(index - 2 + loader.length) % loader.length].x = left2FlankImageX;
			loader[(index - 2 + loader.length) % loader.length].y = allImageY;
			setupLabelComp();
			if(loader[(index + 1 + loader.length) % loader.length].hasEventListener(MouseEvent.ROLL_OVER)){
				loader[	(index + 1 + loader.length) % loader.length].removeEventListener(MouseEvent.ROLL_OVER, LoaderMouseRollOverHandler);
				loader[	(index + 1 + loader.length) % loader.length].removeEventListener(MouseEvent.ROLL_OUT, LoaderMouseRollOutHandler);
			}
		}
		
		/**
		 * 点击右边箭头触发的事件
		 * @param	e
		 */
		private function rightSelectClickHandler(e:MouseEvent):void 
		{
			buttonArrow.LeftSelect.removeEventListener(MouseEvent.CLICK, leftSelectClickHandler);
			buttonArrow.RightSelect.removeEventListener(MouseEvent.CLICK, rightSelectClickHandler);	
			index++;
			if (loader[(index + 2 + loader.length) % loader.length].parent == null) {
				loader[(index + 2 + loader.length) % loader.length].x = right2FlankImageX;
				loader[(index + 2 + loader.length) % loader.length].y = allImageY;
				addChildAt(loader[(index + 2 + loader.length) % loader.length],0);
			}
			
			TweenLite.to(loader[(index - 2 + loader.length) % loader.length], rollEffect, { x: left2FlankImageX, y: allImageY, ease: Linear.easeNone,onComplete:onCompleteHandler } );//左边移动到最左边
			TweenLite.to(loader[(index - 1 + loader.length) % loader.length], rollEffect, { x: leftFlankImageX, y: allImageY, ease: Linear.easeNone } ); //中间移动到左边
			TweenMax.to(loader[(index - 1 + loader.length) % loader.length], rollEffect, {colorTransform:{tint:0x000000, tintAmount:0.5}});//左边变黑
			TweenLite.to(loader[(index + loader.length) % loader.length], rollEffect, { x: centerImageX, y: allImageY, ease: Linear.easeNone } );//右边移动到中间
			TweenMax.to(loader[(index + loader.length) % loader.length], rollEffect, {colorTransform:{tint:0x000000, tintAmount:0}});//中间变亮
			TweenLite.to(loader[(index + 1 + loader.length) % loader.length], rollEffect, { x: rightFlankImageX, y: allImageY, ease: Linear.easeNone } );//最右边移动到右边
			TweenMax.to(loader[(index + 1 + loader.length) % loader.length], rollEffect, {colorTransform:{tint:0x000000, tintAmount:0.5}});//右边变黑
			
			loader[(index + 2 + loader.length) % loader.length].x = right2FlankImageX;
			loader[(index + 2 + loader.length) % loader.length].y = allImageY;
			setupLabelComp();
			loader[(index - 1 + loader.length) % loader.length].removeEventListener(MouseEvent.ROLL_OVER, LoaderMouseRollOverHandler);
			loader[(index - 1 + loader.length) % loader.length].removeEventListener(MouseEvent.ROLL_OUT, LoaderMouseRollOutHandler);
			
			if(loader[(index - 1 + loader.length) % loader.length].hasEventListener(MouseEvent.ROLL_OVER)){
				loader[(index - 1 + loader.length) % loader.length].removeEventListener(MouseEvent.ROLL_OVER, LoaderMouseRollOverHandler);
				loader[(index - 1 + loader.length) % loader.length].removeEventListener(MouseEvent.ROLL_OUT, LoaderMouseRollOutHandler);
			}
		}
		
		/**
		 * 点击箭头触发事件结束后的事件
		 */
		private function onCompleteHandler():void
		{
			buttonArrow.LeftSelect.addEventListener(MouseEvent.CLICK, leftSelectClickHandler);
			buttonArrow.RightSelect.addEventListener(MouseEvent.CLICK, rightSelectClickHandler);
		}
	}

}