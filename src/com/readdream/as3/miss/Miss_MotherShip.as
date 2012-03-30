package com.readdream.as3.miss 
{
	import com.readdream.as3.miss.navigatorBar.Miss_NavigatorBar;
	import com.readdream.as3.robot.Robot_MissMatchThumbFactory;
	import com.readdream.as3.vo.Vo_NavigatorElement;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_MotherShip extends Sprite
	{
		private var navBar : Miss_NavigatorBar;
		private var architect: Miss_ScrollBarMagician;
		public function Miss_MotherShip() 
		{
			var dataArr:Array = new Array();
			var voElement1:Vo_NavigatorElement = new Vo_NavigatorElement(1, "首页", "", 0);
			var voElement8:Vo_NavigatorElement = new Vo_NavigatorElement(2,"电视","",1);
			var voElement9:Vo_NavigatorElement = new Vo_NavigatorElement(3,"影视","",1);
			var voElement10:Vo_NavigatorElement = new Vo_NavigatorElement(4, "演唱会", "", 1);
			var voElement11:Vo_NavigatorElement = new Vo_NavigatorElement(5, "文艺团体", "", 1);
			var voElement2:Vo_NavigatorElement = new Vo_NavigatorElement(6, "活动", "", 0);
			var voElement12:Vo_NavigatorElement = new Vo_NavigatorElement(7,"将上线的活动","",6);
			var voElement13:Vo_NavigatorElement = new Vo_NavigatorElement(8,"接受报名的活动","",6);
			var voElement14:Vo_NavigatorElement = new Vo_NavigatorElement(9,"进行中的活动","",6);
			var voElement15:Vo_NavigatorElement = new Vo_NavigatorElement(10, "结束的活动", "", 6);
			var voElement19:Vo_NavigatorElement = new Vo_NavigatorElement(11, "结束的活动", "", 6);
			
			var voElement3:Vo_NavigatorElement = new Vo_NavigatorElement(12,"地域","",0);
			var voElement4:Vo_NavigatorElement = new Vo_NavigatorElement(13,"line","",0);
			var voElement5:Vo_NavigatorElement = new Vo_NavigatorElement(14,"圆梦之星","",0);
			var voElement6:Vo_NavigatorElement = new Vo_NavigatorElement(15,"收听圆梦微博","",0);
			var voElement7:Vo_NavigatorElement = new Vo_NavigatorElement(16,"帮助中心","",0);
			var voElement16:Vo_NavigatorElement = new Vo_NavigatorElement(17,"报名流程","",16);
			var voElement17:Vo_NavigatorElement = new Vo_NavigatorElement(18,"常见问题","",16);
			var voElement18:Vo_NavigatorElement = new Vo_NavigatorElement(19,"意见反馈","",16);
			
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
			
			navBar = new Miss_NavigatorBar(dataArr);
			addChild(navBar);
			
			var tempDataArr:Array = 
[{"picture":"assets/focus1.jpg,assets/observe1.jpg,assets/observe2.jpg,assets/observe3.jpg,assets/observe4.jpg,assets/observe5.jpg","matchIcon": "assets/focus1icon.jpg","matchTitle":"二十二度观察","matchComp":"《22度观察》是深圳卫视2009年初重磅推出的新锐话题栏目。节目汇聚国内外政治、《22度观察》LOGO经济、文化等各领域精英翘楚，以新锐独到的全球化视角，对新闻热点和重大社会思潮展开深入、理性和建设性的探讨。《22度观察》从北纬22度的深圳出发，聚合全球知识力量，观天下风云，察中国变迁；在纷繁世界，寻找独立理性声音；用新锐视角，挖掘前沿价值判断。","matchType":"电视栏目","matchFrom":"深圳卫视","matchApplyUsers":10250,"matchContent":"节目特点:\n\n1、内容定位：对当前经济政策、社会事件或思潮提供新锐的思想、观点和评论\n2、功能定位：提供有价值的思想智慧及独到见地。\n3、形态定位：演播室谈话，外采，评论\n4、嘉宾定位：政府有关部门领导/国内外权威专家/社会名流/重大事件及话题的当事人/资深媒体人或评论员 \n\n节目亮点:\n\n1、具有独立灵魂并能促进中国社会进步的新锐话题节目\n2、官员、学者、媒体及业界的重量级嘉宾，对中国问题有深远的思考能力及良好的表达\n3、深入浅出、亦庄亦谐；逻辑严谨、表达率性；权威声音、多元视角\n4、演播室时尚新颖，给观众带来崭新时尚的视觉体验，追求收视与影响力的双丰收","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":1},
{"picture":"assets/focus1.jpg,assets/observe1.jpg,assets/observe2.jpg,assets/observe3.jpg,assets/observe4.jpg,assets/observe5.jpg","matchIcon": "assets/focus1icon.jpg","matchTitle":"焦点访谈","matchComp":"《焦点访谈》栏目，创办于1994年4月1日。开办后，它迅速成长为一个在中国家喻户晓的电视栏目，也是中央电视台收视率最高的栏目之一。焦点访谈节目开播以来，受到了党和国家领导人以及老百姓们的广泛关注和重视。平均每天栏目能收到2300条来自观众通过电话、写信、传真、电子邮件、手机短信、QQ等方式提供的收视意见和报道线索。","matchType":"电视栏目","matchFrom":"CCTV1","matchApplyUsers":1050100,"matchContent":"《焦点访谈》这个舆论监督节目多年来为人们所关注和喜爱，选择“政府重视、群众关心、普遍存在”的选题，坚持“用事实说话”的方针，反映和推动解决了大量社会进步与发展过程中存在的问题。许多《焦点访谈》的报道成为有关方面工作的决策依据和参考。\n\n《焦点访谈》所进行的舆论监督推动了中国的改革开放和民主法治的进程。在节目形态上，《焦点访谈》采用演播室主持和现场采访相结合的结构方式，使报道有着落、评论有依据，述与评相互支持、相得益彰。几年来，《焦点访谈》推出的一批较为观众认可的记者和主持人，如方宏进，敬一丹、水均益、方静、翟树杰、张羽等。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/focus1.jpg,assets/observe1.jpg,assets/observe2.jpg,assets/observe3.jpg,assets/observe4.jpg,assets/observe5.jpg","matchIcon": "assets/focus1icon.jpg","matchTitle":"影视同期声","matchComp":"《影视同期声》于1999年5月3日晚与中央电视台电视剧频道同步诞生，是中国第一档依托中国电视剧专业频道的强势资源、深入报道和关注中国电视剧行业动态、传播电视剧行业权威的声音、彰显和成就中央电视台电视剧频道的专业品位与特色、进一步促进和推动电视剧频道的综合建设的日播专业影视资讯、专题类栏目。","matchType":"电视栏目","matchFrom":"CCTV6","matchApplyUsers":1010,"matchContent":"《影视同期声》于1999年5月3日开播，是中国内地最早一档兼具影视资讯与专题报道的电视栏目。《影视同期声》日常节目立足中国电视剧报道，透过专业视角，洞察影视热点，把握潮流走向。\n\n《影视同期声》每期节目力求做到与时下热播、正在拍摄的影视剧同步，全面覆盖，全力渗透。\n\n与同类栏目相比，《影视同期声》更加注重对影视现场的全景呈现，对台前幕后的深度挖掘，对各种细节的巧妙捕捉，对人物角色的精彩解读。节目报道面广，可看性强，影响力大，潜心打造影视娱乐的制高点，曾三度荣获中国电视栏目最高奖项——星光奖。\n\n","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/focus1.jpg,assets/observe1.jpg,assets/observe2.jpg,assets/observe3.jpg,assets/observe4.jpg,assets/observe5.jpg","matchIcon": "assets/focus1icon.jpg","matchTitle":"动物世界","matchComp":"中央电视台的《动物世界》栏目从1981年12月31日开播。主旨在于向电视观众介绍大自然中的种种动植物，使观众足不出户就可以了解和认识地球上生存的各种生命，认识自然对人类的影响。1994年，中央电视台的编委会提议，在《动物世界》的基础上，衍生出一个更符合世界环境与发展理念的杂志性专题的栏目——《人与自然》。","matchType":"电视栏目","matchFrom":"CCTV1","matchApplyUsers":918336121,"matchContent":"动物界是生物的一界，该界成员均属真核生物，包括一般能自由运动、以（复杂有机物质合成的）碳水化合物和蛋白质为食的所有生物。动物界作为动物分类中最高级的阶元，已发现的共35门70余纲约 350目，150 多万种。分布于地球上所有海洋、陆地，包括山地、草原、沙漠、森林、农田、水域以及两极在内的各种生境，成为自然环境不可分割的组成部分。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/focus1.jpg,assets/observe1.jpg,assets/observe2.jpg,assets/observe3.jpg,assets/observe4.jpg,assets/observe5.jpg", "matchIcon": "assets/focus1icon.jpg", "matchTitle":"百家讲坛", "matchComp":"“百家讲坛”是中央电视台第十套（CCTV-10）2001年7月9日开播的讲座式栏目，栏目宗旨为建构时代常识，享受智慧人生。选择观众最感兴趣、最前沿、最吸引人的选题。追求学术创新，鼓励思想个性，强调雅俗共赏，重视传播互动。栏目选材广泛，曾涉及文化、生物、医学、经济等各个方面，现多以文化题材为主，并较多涉及中国历史、中国文化。", "matchType":"电视栏目", "matchFrom":"CCTV10", "matchApplyUsers":1024768, "matchContent":"《百家讲坛》已经成为CCTV-10科教频道的品牌栏目。其演播风格与学术性的理论研究相比较为平易，同时亦追求内容的学理性与权威性，力求雅俗共赏。该栏目自2001年7月9日开播以来，截至2011年11月，已播出2000余期，许多学术界著名人士由幕后推出，以通俗易懂的形式将许多晦涩知识传播于民众之中，个别议题亦受到专家及大众质疑。栏目收视率逐年提高，成为中国中央电视台科学教育频道的一款品牌栏目  。“百家讲坛”是一个开放的大学。节目内容涉及人文科学、自然科学、哲学等。形式多样，学理性与实用性并存，权威性与前卫性并重，追求学术创新，鼓励思想个性。适合具有中学以上文化程度，具有求知欲的观众。\n\n栏目制片人：聂丛丛，2001年任《百家讲坛》主编，2001年至2004年任《百家讲坛》制片人，2004年至2009年任《法律讲堂》制片人，2009年后续任《百家讲坛》制片人。前任万卫，汉族，祖籍河北涿州，1983年毕业于北京师范大学，1994年8月调入中央电视台，2004年9月至2009年8月担任《百家讲坛》栏目制片人。\n\n《百家讲坛》的栏目宗旨：汇集百家学养，追慕大师风范，平和开放的胸襟，通向大众的桥梁。", "matchInformation1":"活动元数据1", "matchInformation2":"活动元数据2", "matchInformation3":"活动元数据3", "matchInformation4":"活动元数据4", "matchInformation5":"活动元数据5", "matchImportant":0 } ];
			
			
			architect = new Miss_ScrollBarMagician(new Miss_Architect(Robot_MissMatchThumbFactory.getMissMatchThumbs(tempDataArr)), 800);
			architect.x = 240;
			addChild(architect);
			
		}
		
	}

}