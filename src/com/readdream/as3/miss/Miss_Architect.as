package com.readdream.as3.miss 
{
	import com.readdream.as3.miss.Miss_MatchThumb;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
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
			this.opaqueBackground = 0x00ff00;
			this.stuffArr = stuffArr;
			//initConnect();
			var vr:Vector.<Vo_Match> = new Vector.<Vo_Match>;
			vr[0] = new Vo_Match();
			vr[1] = new Vo_Match();
			vr[2] = new Vo_Match();
			vr[3] = new Vo_Match();
			
			vr[0].picture = new Array("assets/focus1.jpg");
			vr[0].matchTitle = "22度观察";
			vr[0].matchComp = "《22度观察》是深圳卫视2009年初重磅推出的新锐话题栏目。节目汇聚国内外政治、《22度观察》LOGO经济、文化等各领域精英翘楚，以新锐独到的全球化视角，对新闻热点和重大社会思潮展开深入、理性和建设性的探讨。《22度观察》从北纬22度的深圳出发，聚合全球知识力量，观天下风云，察中国变迁；在纷繁世界，寻找独立理性声音；用新锐视角，挖掘前沿价值判断。";
			vr[0].matchIcon = "assets/focus1icon.jpg";
			vr[1].picture = new Array("assets/focus2.jpg");
			vr[1].matchTitle = "年代秀";
			vr[1].matchComp = "《年代秀》是一档由深圳广播电影电视集团深圳卫视制作的全明星代际互动综艺秀，引进国外大热综艺节目《Generation show》的模式，由10位明星嘉宾领衔五个年代小组通过年代答题、游戏竞技等环节进行同场PK，并且结合影像、实物、音乐表演、时尚秀等元素寻找浓浓的当年情。2011年8月19日，《年代秀》迎来了大运专场，邀请了世界冠军乐靖宜、刘璇、杨威及神秘嘉宾郎平和体育节目主持人韩乔生作客。";
			vr[1].matchIcon = "assets/focus2icon.jpg";
			vr[2].picture = new Array("assets/focus3.jpg");
			vr[2].matchTitle = "今晚报道";
			vr[2].matchComp = "《今晚报道》围绕以栏目风格规定新闻节目、用新闻节目塑造栏目风格，具有独特表现形式和话语方式的改革目标，不断创新提高，具备了对政治、经济、文化重大事件的报道理念、报道方式的创新把握。栏目不断优化节目结构，体现深与量的结合，首创的电视新闻评论样式：“今日点击”与动态报道、新闻现场相呼应，以短见长，一事一议，表达出栏目自己的声音；“今日盘点”、“今晚备忘”、“明日预告”地加入让节目更加完整 ，服务性、可视性进一步增强，实现了新闻性与服务性的结合，新闻的思想性、艺术性与观赏性的结合，电视新闻的收视率与满意度、欣赏指数的“三赢”。";
			vr[2].matchIcon = "assets/focus3icon.jpg";
			vr[3].picture = new Array("assets/focus4.jpg");
			vr[3].matchTitle = "欢乐一家亲";
			vr[3].matchComp = "《欢乐一家亲》是中央电视台综艺频道（CCTV-3）的一档家庭才艺展示类节目，节目以全家齐动员一起走上央视大舞台，展示家庭才艺，体现家庭和睦为目的，通过一个个普通家庭的生活经历，淋漓尽致地表现出一个个温馨和睦小家庭的真情实感。";
			vr[3].matchIcon = "assets/focus4icon.jpg";
			
			var demo:Miss_HotThumb = new Miss_HotThumb(vr);
			var bmpData:BitmapData = new BitmapData(1, 1);
			demo.scrollRect = new Rectangle(0, 0, 960, 300);
			bmpData.draw(demo);
			addChild(demo);
			build();
			//trace("一手高度： ",this.height);
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
			//trace("big: " + noOfBigImg);
			//trace("small: " + noOfSmallImg);
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
			//trace("come " + this.height + this.scaleY);
		}
		private function placeSmall():void
		{
			if (noOfSmallImg >= 4 || onlySmallFlag){
				
				//放小图
				var smallImgNum:int = 0;
				var xSpace:int;
				var ySpace:int;
				while (smallImgNum < 4 && noOfSmallImg > 0){
					xSpace = smallImgNum % 2;
					ySpace = Math.floor(smallImgNum / 2);
					//找一个可以放的小图
					var smallFlag:int = 0;
					while (((stuffArr[smallFlag] as Miss_MatchThumb).vo.matchImportant == 1) || usedFlag[smallFlag]){
						smallFlag++;
					}
					var tempBit:int;

					stuffArr[smallFlag].x = xSpace * 240 + (rectNum % 2) * 480;
					stuffArr[smallFlag].y = ySpace * 200 + 400 * Math.floor(rectNum / 2) + 300;
					addChild(stuffArr[smallFlag]);
					stuffArr[smallFlag].addEventListener(MouseEvent.CLICK,clickThumbHandler);
					//trace("一手高度： ",this.height);
					//trace("x: " + stuffArr[smallFlag].x);
					//trace("width: " + stuffArr[smallFlag].width);
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
				stuffArr[bigFlag].x = Math.floor(rectNum % 2) * 480;
				stuffArr[bigFlag].y = (Math.floor(rectNum / 2)) * 400 + 300;
				addChild(stuffArr[bigFlag]);
				stuffArr[bigFlag].addEventListener(MouseEvent.CLICK,clickThumbHandler);
				//trace("一手高度： ",this.height);
				//trace("x: " + stuffArr[bigFlag].x);
				//trace("width: " + stuffArr[bigFlag].width);
				usedFlag[bigFlag] = true;
				rectNum++;
				noOfBigImg--;
				swapFlagInt++;
			}else{
				onlySmallFlag = true;
				placeSmall();
			}
		}
		
		private function clickThumbHandler(e:MouseEvent):void 
		{
			trace("ni dian le ");
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