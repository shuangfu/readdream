package com.readdream.as3.miss 
{
	import com.readdream.as3.miss.Miss_MatchThumb;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_Architect extends Sprite
	{
		public var stuffArr:Array;
		private var onlySmallFlag:Boolean = false;
		private var rectNum:int = 0;
		private var usedFlag:Array = new Array();
		private var noOfBigImg:int = 0;
		private var noOfSmallImg:int = 0;
		private var swapFlag:Boolean = true;
		private var swapFlagInt:int = 1;
		
		public function Miss_Architect(stuffArr:Array) 
		{
			this.stuffArr = stuffArr;
			//initConnect();
			build();
		}
		
		public function build() :void{
			for (var i:int = 0; i < stuffArr.length; i++){
				usedFlag.push(false);
				if ((stuffArr[i] as Miss_MatchThumb).vo.matchImportant == 1){
					noOfBigImg++;
				}else{
					noOfSmallImg++;
				}
			}
			trace("big: " + noOfBigImg);
			trace("small: " + noOfSmallImg);
			while (noOfBigImg > 0 || noOfSmallImg > 0){
				
				if (swapFlagInt == 2) {
						swapFlagInt = 0;
						swapFlag = !swapFlag;
				}
				if (swapFlag){
					placeBig();
				}else{
					placeSmall();
				}
			}
		}
		private function placeSmall():void
		{
			if (noOfSmallImg >= 4 || onlySmallFlag){
				
				//放小图
				var smallImgNum:int = 0;
				var xSpace:int;
				var ySpace:int;
				while (smallImgNum < 4 && noOfSmallImg > 0)	{
					xSpace = smallImgNum % 2;
					ySpace = Math.floor(smallImgNum / 2);
					//找一个可以放的小图
					var smallFlag:int = 0;
					while (((stuffArr[smallFlag] as Miss_MatchThumb).vo.matchImportant == 1) || usedFlag[smallFlag]){
						smallFlag++;
					}
					var tempBit:int;

					stuffArr[smallFlag].x = xSpace * 240 + rectNum % 2 * 480;
					stuffArr[smallFlag].y = ySpace * 200 + 400 * Math.floor(rectNum / 2);
					addChild(stuffArr[smallFlag]);
					usedFlag[smallFlag] = true;
					noOfSmallImg--;
					smallImgNum++;
				}
				rectNum++;
				swapFlagInt++
			}else{
				placeBig();
			}
		
		}
		
		private function placeBig():void
		{
			if (noOfBigImg > 0)
			{
				var bigFlag:int = 0;
				while ((stuffArr[bigFlag] as Miss_MatchThumb).vo.matchImportant == 0 || usedFlag[bigFlag]){
					bigFlag++;
				}
				//放大图
				stuffArr[bigFlag].x = (rectNum % 2) * 480;
				stuffArr[bigFlag].y = (Math.floor(rectNum / 2)) * 400;
				addChild(stuffArr[bigFlag]);
				usedFlag[bigFlag] = true;
				rectNum++;
				noOfBigImg--;
				swapFlagInt++;
			}else{
				onlySmallFlag = true;
				placeSmall();
			}
		}
		//private function initConnect():void
		//{
			//var loadTest:InfoLoader = new InfoLoader("http://192.168.1.112:404/appshop/matchindex.action", null, traceResult);
		//}
		//public function traceResult(obj:Object):void
		//{
			//{"matchlist":[
			//{"compendium":"超级女生内容超级女生内容超级女生内容超级女生内容超级女生内容", "important":1, "matchtype":"8", "mid":1, "picurl":"http://www.readream.com/pic/b1.jpg,http://www.readream.com/pic/b12.jpg,http://www.readream.com/pic/b13.jpg", "title":"超级女生" },
			//{"compendium":"快乐男声内容快乐男声内容快乐男声内容快乐男声内容快乐男声内容快乐男声内容快乐男声内容", "important":0, "matchtype":"8", "mid":2, "picurl":"http://www.readream.com/pic/s1.jpg", "title":"快乐男声" },
			//{"compendium":"非诚勿扰内容非诚勿扰内容非诚勿扰内容非诚勿扰内容非诚勿扰内容非诚勿扰内容", "important":0, "matchtype":"9", "mid":3, "picurl":"http://www.readream.com/pic/s2.jpg", "title":"非诚勿扰" },
			//{"compendium":"快乐大本营快乐大本营快乐大本营快乐大本营快乐大本营快乐大本营快乐大本营", "important":0, "matchtype":"10", "mid":4, "picurl":"http://www.readream.com/pic/s3.jpg", "title":"快乐大本营" },
			//{"compendium":"我们大家要表扬他", "important":0, "matchtype":"11", "mid":5, "picurl":"http://www.readream.com/pic/s4.jpg", "title":"付爽工作很努力" }
			//],"resultCode":1,"resultDesc":""}
			//var tempArr:Array = new Array();
			//for (var i:Object in obj.Navigation)
			//{
			//tempArr.push((obj.Navigation)[i].title);
			//trace((obj.Navigation)[i].title);
			//}
			//addToArr(obj["matchlist"]);
			//trace("00000000" + obj["matchlist"]);
		//
		//}
	}

}