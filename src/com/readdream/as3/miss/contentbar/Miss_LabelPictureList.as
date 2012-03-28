package com.readdream.as3.miss.contentbar 
{
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.CapsStyle;
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.JointStyle;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_LabelPictureList extends Sprite 
	{
		private var thumbLoader:Vector.<DisplayObject> = new Vector.<DisplayObject>;
		private var lblList:Sprite;
		private var lblSelect:Sprite = new Sprite();
		
		public function Miss_LabelPictureList(vo:Vo_Match) 
		{
			initData(vo);
			setupPicture(vo);
		}
		
		
		
		private function initData(vo:Vo_Match):void 
		{
			//////////////////////////////////
			//图片选择框区域加载数据并添加阴影
			var tempLabel:int = 0;
			var tempobj:DisplayObject;
			for each (var str:String in vo.picture)
			{
				tempobj = Mr_Dresser.drawBorder(new Robot_PicLoader(str, 0, 0, 92, 58, tempLabel), 0xFFFFFF, 3, true);
				
				thumbLoader.push(tempobj);
				
				tempLabel++;
			}		
		}
		
		private function setupPicture(vo:Vo_Match):void 
		{
			//////////////////////
			//图片选择框区域初始化
			lblList = new Sprite();
			lblList.graphics.beginFill(0xff0000, 0);
			lblList.graphics.drawRect(0, 0, 640, 80);
			lblList.graphics.endFill();
						
			var temp:Number = lblList.width / (vo.picture.length + 1);
			for (var index:int = 0; index < vo.picture.length; index++)
			{
				thumbLoader[index].x = temp * (index + 1) - (thumbLoader[index].width / 2);
				thumbLoader[index].y = 0;
				lblList.addChild(thumbLoader[index]);
				//thumbLoader[index].addEventListener(MouseEvent.ROLL_OVER, ldrMouseRollOverHandler);
			}
			addChild(lblList);
			
			lblSelect.graphics.lineStyle(5, 0x828282, 1, true, "normal", CapsStyle.ROUND, JointStyle.ROUND);
			//lblSelect.graphics.lineGradientStyle(GradientType.LINEAR,[0x939393,0xB5B5B5],[1,1],[0,255],null,SpreadMethod.REFLECT,"rgb",1)
			lblSelect.graphics.drawRect(0, 0, thumbLoader[0].width + 3, thumbLoader[0].height + 3);
			lblSelect.x = thumbLoader[2].x -2;
			lblSelect.y = thumbLoader[2].y -2;
			addChild(lblSelect);
		}
		
		//private function ldrMouseRollOverHandler(e:Event):void 
		//{
			//
		//}
	}

}