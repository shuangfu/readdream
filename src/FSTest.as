package  
{
	import com.readdream.as3.event.TextInputEvent;
	import com.readdream.as3.miss.Miss_NavigatorElement;
	import com.readdream.as3.miss.Miss_TextInput;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.VO.Vo_NavigatorElement;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.filters.*;
	
	/**
	 * ...
	 * @author fs
	 */
	public class FSTest extends Sprite 
	{
		[SWF(width="1200",height="1600",frameRate="60",backgroundColor="#ffffff")]
		public function FSTest() 
		{
			stage.align = StageAlign.TOP_LEFT; 
			stage.scaleMode = StageScaleMode.NO_SCALE;
			var ti1:Miss_TextInput = new Miss_TextInput(230, 30);
			var ti2:Miss_TextInput = new Miss_TextInput(230,30);
			var ti3:Miss_TextInput = new Miss_TextInput(230,30);
			//ti.width = 150;
			//ti.height = 35;
			ti1.addEventListener(TextInputEvent.INPUT_COMPLETE, inputCompleteHandler);
			var objArr:Array = new Array();
			objArr.push( { stuff:ti1, xPos:10, yPos:10 } );
			objArr.push( { stuff:ti2, xPos:20, yPos:50 } );
			objArr.push( { stuff:ti3, xPos:30, yPos:90 } );
			//var layOuter:Mr_Layouter = new Mr_Layouter(this, objArr);
			Mr_Layouter.layouter(this, objArr);
			
			var ne:Miss_NavigatorElement = new Miss_NavigatorElement(new Vo_NavigatorElement(1, "我是一个兵", 0, "hhh"));
			addChild(ne);
			ne.x = 50;
			ne.y = 150;
			
			var ne1:Miss_NavigatorElement = new Miss_NavigatorElement(new Vo_NavigatorElement(2, "我是一个兵", 1, "hhh"));
			addChild(ne1);
			ne1.x = 50;
			ne1.y = 190;
			
			
		}
		
		private function inputCompleteHandler(e:TextInputEvent):void 
		{
			trace(e.text);
		}

		
	}

}