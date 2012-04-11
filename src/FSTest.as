package
{
	import com.readdream.as3.event.TextInputEvent;
	import com.readdream.as3.miss.Miss_MotherShip;
	import com.readdream.as3.miss.Miss_ScrollBarMagician;
	import com.readdream.as3.miss.Miss_TextInput;
	import com.readdream.as3.miss.navigatorBar.Miss_NavigatorBar;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.vo.Vo_Match;
	import com.readdream.as3.vo.Vo_NavigatorElement;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TextEvent;
	import flash.filters.*;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author fs
	 */
	[SWF(width = "1200", height = "1600",frameRate="40",backgroundColor="#ffffff")]
	
	public class FSTest extends Sprite
	{
		private var str:String;
		
		public function FSTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//var ti1:Miss_TextInput = new Miss_TextInput(230, 30);
			//var ti2:Miss_TextInput = new Miss_TextInput(230,30);
			//var ti3:Miss_TextInput = new Miss_TextInput(230,30);
			//ti1.width = 150;
			//ti1.height = 35;
			//ti1.addEventListener(TextInputEvent.INPUT_COMPLETE, inputCompleteHandler);
			//var objArr:Array = new Array();
			//objArr.push( { stuff:ti1, xPos:10, yPos:10 } );
			//objArr.push( { stuff:ti2, xPos:10, yPos:50 } );
			//objArr.push( { stuff:ti3, xPos:10, yPos:90 } );
			//var layOuter:Mr_Layouter = new Mr_Layouter(this, objArr);
			//Mr_Layouter.layouter(this, objArr);
			//addChild(ti1);
			
			//var ne:Miss_NavigatorElement = new Miss_NavigatorElement(new Vo_NavigatorElement(1, "我是一个兵", "hhh",0));
			//addChild(ne);
			//ne.x = 50;
			//ne.y = 150;
			//
			//var ne1:Miss_NavigatorElement = new Miss_NavigatorElement(new Vo_NavigatorElement(2, "我是一个兵", "hhh",1));
			//addChild(ne1);
			//ne1.x = 50;
			//ne1.y = 190;
			var dataArr:Array = new Array();
			var voElement1:Vo_NavigatorElement = new Vo_NavigatorElement(1, "首页", "", 0);
			var voElement8:Vo_NavigatorElement = new Vo_NavigatorElement(2, "电视", "", 1);
			var voElement9:Vo_NavigatorElement = new Vo_NavigatorElement(3, "影视", "", 1);
			var voElement10:Vo_NavigatorElement = new Vo_NavigatorElement(4, "演唱会", "", 1);
			var voElement11:Vo_NavigatorElement = new Vo_NavigatorElement(5, "文艺团体", "", 1);
			var voElement2:Vo_NavigatorElement = new Vo_NavigatorElement(6, "活动", "", 0);
			var voElement12:Vo_NavigatorElement = new Vo_NavigatorElement(7, "将上线的活动", "", 6);
			var voElement13:Vo_NavigatorElement = new Vo_NavigatorElement(8, "接受报名的活动", "", 6);
			var voElement14:Vo_NavigatorElement = new Vo_NavigatorElement(9, "进行中的活动", "", 6);
			var voElement15:Vo_NavigatorElement = new Vo_NavigatorElement(10, "结束的活动", "", 6);
			var voElement19:Vo_NavigatorElement = new Vo_NavigatorElement(11, "结束的活动", "", 6);
			
			var voElement3:Vo_NavigatorElement = new Vo_NavigatorElement(12, "地域", "", 0);
			var voElement4:Vo_NavigatorElement = new Vo_NavigatorElement(13, "line", "", 0);
			var voElement5:Vo_NavigatorElement = new Vo_NavigatorElement(14, "圆梦之星", "", 0);
			var voElement6:Vo_NavigatorElement = new Vo_NavigatorElement(15, "收听圆梦微博", "", 0);
			var voElement7:Vo_NavigatorElement = new Vo_NavigatorElement(16, "帮助中心", "", 0);
			var voElement16:Vo_NavigatorElement = new Vo_NavigatorElement(17, "报名流程", "", 16);
			var voElement17:Vo_NavigatorElement = new Vo_NavigatorElement(18, "常见问题", "", 16);
			var voElement18:Vo_NavigatorElement = new Vo_NavigatorElement(19, "意见反馈", "", 16);
			
			dataArr.push(voElement1);
			dataArr.push(voElement2);
			dataArr.push(voElement3);
			dataArr.push(voElement4);
			dataArr.push(voElement5);
			dataArr.push(voElement6);
			dataArr.push(voElement7);
			dataArr.push(voElement8);
			dataArr.push(voElement9);
			dataArr.push(voElement10);
			dataArr.push(voElement11);
			dataArr.push(voElement12);
			dataArr.push(voElement13);
			dataArr.push(voElement14);
			dataArr.push(voElement15);
			dataArr.push(voElement16);
			dataArr.push(voElement17);
			dataArr.push(voElement18);
			dataArr.push(voElement19);
			//var missNavElements :Miss_NavigatorBar = new Miss_NavigatorBar(dataArr);
			//missNavElements.x = 50;
			//missNavElements.y = 50;
			//addChild(missNavElements);
			//var scollbar:Miss_ScrollBarMagician = new Miss_ScrollBarMagician(missNavElements,288);
			
			//addChild(missNavElements);
			var ms:Miss_MotherShip = new Miss_MotherShip();
			addChild(ms);
			//var urlAddress:String = "http://dict.cn/good";
			//var urlVars:URLVariables = new URLVariables();
			//var urlRequest:URLRequest = new URLRequest(urlAddress);
			//var urlLoader:URLLoader = new URLLoader();
			//
			//configureListeners(urlLoader);
			//try
			//{
				//urlLoader.load(urlRequest);
			//}
			//catch (error:Error)
			//{
				//trace("Unable to load requested document.");
			//}
		}
		
		private function configureListeners(dispatcher:IEventDispatcher):void
		{
			dispatcher.addEventListener(Event.COMPLETE, completeHandler);
			dispatcher.addEventListener(Event.OPEN, openHandler);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}
		
		private function completeHandler(event:Event):void
		{
			var loader:URLLoader = URLLoader(event.target);
			trace("completeHandler: " + loader.data);
			str = loader.data;
			fileReferenceExample2();
			//var vars:URLVariables = new URLVariables(loader.data);
			//trace("The answer is " + vars.answer);
		}
		
		private function openHandler(event:Event):void
		{
			trace("openHandler: " + event);
		}
		
		private function progressHandler(event:ProgressEvent):void
		{
			trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
		}
		
		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
			trace("securityErrorHandler: " + event);
		}
		
		private function httpStatusHandler(event:HTTPStatusEvent):void
		{
			trace("httpStatusHandler: " + event);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void
		{
			trace("ioErrorHandler: " + event);
		}
		private var fileRef:FileReference;
		
		public function fileReferenceExample2():void
		{
			fileRef = new FileReference();
			fileRef.addEventListener(Event.SELECT, onFileSelected);
			fileRef.addEventListener(Event.CANCEL, onCancel);
			fileRef.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			fileRef.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			var textTypeFilter:FileFilter = new FileFilter("Text Files (*.txt, *.rtf)", "*.txt;*.rtf");
			fileRef.browse([textTypeFilter]);
		}
		
		public function onFileSelected(evt:Event):void
		{
			fileRef.addEventListener(ProgressEvent.PROGRESS, onProgress);
			fileRef.addEventListener(Event.COMPLETE, onComplete);
			fileRef.load();
		}
		
		public function onProgress(evt:ProgressEvent):void
		{
			trace("Loaded " + evt.bytesLoaded + " of " + evt.bytesTotal + " bytes.");
		}
		
		public function onCancel(evt:Event):void
		{
			trace("The browse request was canceled by the user.");
		}
		
		public function onComplete(evt:Event):void
		{
			trace("File was successfully loaded.");
			fileRef.removeEventListener(Event.SELECT, onFileSelected);
			fileRef.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			fileRef.removeEventListener(Event.COMPLETE, onComplete);
			fileRef.removeEventListener(Event.CANCEL, onCancel);
			saveFile();
		}
		
		public function saveFile():void
		{
			fileRef.addEventListener(Event.SELECT, onSaveFileSelected);
			fileRef.save(str, "NewFileName.txt");
		}
		
		public function onSaveFileSelected(evt:Event):void
		{
			fileRef.addEventListener(ProgressEvent.PROGRESS, onSaveProgress);
			fileRef.addEventListener(Event.COMPLETE, onSaveComplete);
			fileRef.addEventListener(Event.CANCEL, onSaveCancel);
		}
		
		public function onSaveProgress(evt:ProgressEvent):void
		
		{
			trace("Saved " + evt.bytesLoaded + " of " + evt.bytesTotal + " bytes.");
		}
		
		public function onSaveComplete(evt:Event):void
		{
			trace("File saved.");
			fileRef.removeEventListener(Event.SELECT, onSaveFileSelected);
			fileRef.removeEventListener(ProgressEvent.PROGRESS, onSaveProgress);
			fileRef.removeEventListener(Event.COMPLETE, onSaveComplete);
			fileRef.removeEventListener(Event.CANCEL, onSaveCancel);
		}
		
		public function onSaveCancel(evt:Event):void
		{
			trace("The save request was canceled by the user.");
		}
		
		public function onIOError(evt:IOErrorEvent):void
		{
			trace("There was an IO Error.");
		}
		
		public function onSecurityError(evt:Event):void
		{
			trace("There was a security error.");
		}
	
	}

}