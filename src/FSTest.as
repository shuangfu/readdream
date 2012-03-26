package  
{
	import com.readdream.as3.miss.Miss_TextInput;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
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
			var ti:Miss_TextInput = new Miss_TextInput(230,30,13,"hi","email");
			//ti.width = 150;
			//ti.height = 35;
			addChild(ti);
		}
		
	}

}