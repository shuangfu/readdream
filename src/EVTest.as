package  
{
	import com.readdream.as3.miss.Miss_Arrow;
	import com.readdream.as3.miss.Miss_HotThumb;
	import com.readdream.as3.miss.Miss_MatchReveal;
	import com.readdream.as3.miss.contentbar.Miss_TabButton;
	import com.readdream.as3.miss.Miss_MatchThumb;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.vo.Vo_Match;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.CapsStyle;
    import flash.display.LineScaleMode;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author evstar
	 */
	[SWF(width="1440",height="900",frameRate="90",backgroundColor="#ffffff")]
	public class EVTest extends Sprite 
	{
		
		public function EVTest() 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			//helloMissMatchThumb();
			
			
			
			
			//test();		
			
			//drawDottedLine();
			//helloMissHotThumb();
			//helloMissTabButton();
			helloMissMatchReveal();

		}
		
		private function helloMissMatchThumb():void 
		{
			var match:Vo_Match = new Vo_Match();
			match.matchApplyUsers = 12345;
			match.matchTitle = "二十二度观察";
			match.matchComp = "《22度观察》是深圳卫视2009年初重磅推出的新锐话题栏目。节目汇聚国内外政治、《22度观察》LOGO经济、文化等各领域精英翘楚，以新锐独到的全球化视角，对新闻热点和重大社会思潮展开深入、理性和建设性的探讨。《22度观察》从北纬22度的深圳出发，聚合全球知识力量，观天下风云，察中国变迁；在纷繁世界，寻找独立理性声音；用新锐视角，挖掘前沿价值判断。";
			match.matchIcon = "assets/focus1icon.jpg"
			match.matchContent = "节目特点:\n\n1、内容定位：对当前经济政策、社会事件或思潮提供新锐的思想、观点和评论\n2、功能定位：提供有价值的思想智慧及独到见地。\n3、形态定位：演播室谈话，外采，评论\n4、嘉宾定位：政府有关部门领导/国内外权威专家/社会名流/重大事件及话题的当事人/资深媒体人或评论员 \n\n节目亮点:\n\n1、具有独立灵魂并能促进中国社会进步的新锐话题节目\n2、官员、学者、媒体及业界的重量级嘉宾，对中国问题有深远的思考能力及良好的表达\n3、深入浅出、亦庄亦谐；逻辑严谨、表达率性；权威声音、多元视角\n4、演播室时尚新颖，给观众带来崭新时尚的视觉体验，追求收视与影响力的双丰收"
			match.matchFrom = "深圳卫视";
			match.matchType = "新锐话题栏目";
			match.matchInformation1 = "活动元数据1";
			match.matchInformation2 = "活动元数据2";
			match.matchInformation3 = "活动元数据3";
			match.matchInformation4 = "活动元数据4";
			match.matchInformation5 = "活动元数据5";
			match.matchImportint = 1;
			match.picture = new Array("assets/focus1.jpg", "assets/observe1.jpg", "assets/observe2.jpg", "assets/observe3.jpg", "assets/observe4.jpg", "assets/observe5.jpg");
			var demo:Miss_MatchThumb = new Miss_MatchThumb(match);
			//var demo2:Miss_MatchThumb = new Miss_MatchThumb(match);
			//var demo3:Miss_MatchThumb = new Miss_MatchThumb(match);
			//var demo4:Miss_MatchThumb = new Miss_MatchThumb(match);
			//var demo5:Miss_MatchThumb = new Miss_MatchThumb(match);
			demo.x = 100;
			demo.y = 100;
			addChild(demo);
			//demo2.x = 340;
			//demo2.y = 100;
			//addChild(demo2);
			//demo3.x = 100;
			//demo3.y = 300
			//addChild(demo3);
			//demo4.x = 340;
			//demo4.y = 300;
			//addChild(demo4);
			//demo5.x = 700;
			//demo5.y = 300;
			//addChild(demo5);
		}
		
		private function test():void 
		{

		}
				
		
		/**
		 * 画虚线
		 */
		private function drawDottedLine():void 
		{
			Mr_Dresser.drawDottedLine(graphics, new Point(50, 50), new Point(50, 65), 1, 0x000000, 1);
		}
		
		private function helloMissMatchReveal():void 
		{
			var match:Vo_Match = new Vo_Match();
			match.matchApplyUsers = 12345;
			match.matchTitle = "22度观察";
			match.matchComp = "《22度观察》是深圳卫视2009年初重磅推出的新锐话题栏目。节目汇聚国内外政治、《22度观察》LOGO经济、文化等各领域精英翘楚，以新锐独到的全球化视角，对新闻热点和重大社会思潮展开深入、理性和建设性的探讨。《22度观察》从北纬22度的深圳出发，聚合全球知识力量，观天下风云，察中国变迁；在纷繁世界，寻找独立理性声音；用新锐视角，挖掘前沿价值判断。";
			match.matchIcon = "assets/focus1icon.jpg"
			match.matchContent = "节目特点:\n\n1、内容定位：对当前经济政策、社会事件或思潮提供新锐的思想、观点和评论\n2、功能定位：提供有价值的思想智慧及独到见地。\n3、形态定位：演播室谈话，外采，评论\n4、嘉宾定位：政府有关部门领导/国内外权威专家/社会名流/重大事件及话题的当事人/资深媒体人或评论员 \n\n节目亮点:\n\n1、具有独立灵魂并能促进中国社会进步的新锐话题节目\n2、官员、学者、媒体及业界的重量级嘉宾，对中国问题有深远的思考能力及良好的表达\n3、深入浅出、亦庄亦谐；逻辑严谨、表达率性；权威声音、多元视角\n4、演播室时尚新颖，给观众带来崭新时尚的视觉体验，追求收视与影响力的双丰收"
			match.matchFrom = "深圳卫视";
			match.matchType = "新锐话题栏目";
			match.matchInformation1 = "活动元数据1";
			match.matchInformation2 = "活动元数据2";
			match.matchInformation3 = "活动元数据3";
			match.matchInformation4 = "活动元数据4";
			match.matchInformation5 = "活动元数据5";
			match.picture = new Array("assets/focus1.jpg", "assets/observe1.jpg", "assets/observe2.jpg", "assets/observe3.jpg", "assets/observe4.jpg", "assets/observe5.jpg");
			var miss:Miss_MatchReveal = new Miss_MatchReveal(match);
			miss.x = 100;
			miss.y = 100;
			addChild(miss);
		}
		
		
		
		private function helloMissTabButton():void 
		{
			var miss:Miss_TabButton = new Miss_TabButton("概况");
			addChild(miss);
		}
		
		private function helloMissHotThumb() :void {
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
			addChild(demo);
		}
		
	}

}