package com.readdream.as3.miss 
{
	import com.readdream.as3.miss.navigatorBar.Miss_NavigatorBar;
	import com.readdream.as3.robot.Robot_MissMatchThumbFactory;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.vo.Vo_Match;
	import com.readdream.as3.vo.Vo_NavigatorElement;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_MotherShip extends Sprite
	{
		private var scaleWidth:Number;
		private var thisWidth:Number;
		private var magician: Miss_ScrollBarUpfitter;
		private var magician2: Miss_ScrollBarUpfitter;
		
		private var navBar : Miss_NavigatorBar;
		private var statusBar : Miss_StatusBar;
		private var architect:Miss_Architect
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
			
			
			var tempDataArr:Array = 
[
{"picture":"assets/focus1.jpg,assets/observe1.jpg,assets/observe2.jpg,assets/observe3.jpg,assets/observe4.jpg,assets/observe5.jpg","matchIcon": "assets/focus1icon.jpg","matchTitle":"二十二度观察","matchComp":"《22度观察》是深圳卫视2009年初重磅推出的新锐话题栏目。节目汇聚国内外政治、《22度观察》LOGO经济、文化等各领域精英翘楚，以新锐独到的全球化视角，对新闻热点和重大社会思潮展开深入、理性和建设性的探讨。《22度观察》从北纬22度的深圳出发，聚合全球知识力量，观天下风云，察中国变迁；在纷繁世界，寻找独立理性声音；用新锐视角，挖掘前沿价值判断。","matchType":"电视栏目","matchFrom":"深圳卫视","matchApplyUsers":10250,"matchContent":"节目特点:\n\n1、内容定位：对当前经济政策、社会事件或思潮提供新锐的思想、观点和评论\n2、功能定位：提供有价值的思想智慧及独到见地。\n3、形态定位：演播室谈话，外采，评论\n4、嘉宾定位：政府有关部门领导/国内外权威专家/社会名流/重大事件及话题的当事人/资深媒体人或评论员 \n\n节目亮点:\n\n1、具有独立灵魂并能促进中国社会进步的新锐话题节目\n2、官员、学者、媒体及业界的重量级嘉宾，对中国问题有深远的思考能力及良好的表达\n3、深入浅出、亦庄亦谐；逻辑严谨、表达率性；权威声音、多元视角\n4、演播室时尚新颖，给观众带来崭新时尚的视觉体验，追求收视与影响力的双丰收","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/topicsinfocus1.jpg,assets/topicsinfocus2.jpg,assets/topicsinfocus3.jpg,assets/topicsinfocus4.jpg","matchIcon": "assets/topicsinfocusicon.jpg","matchTitle":"焦点访谈","matchComp":"《焦点访谈》栏目，创办于1994年4月1日。开办后，它迅速成长为一个在中国家喻户晓的电视栏目，也是中央电视台收视率最高的栏目之一。焦点访谈节目开播以来，受到了党和国家领导人以及老百姓们的广泛关注和重视。平均每天栏目能收到2300条来自观众通过电话、写信、传真、电子邮件、手机短信、QQ等方式提供的收视意见和报道线索。","matchType":"电视栏目","matchFrom":"CCTV1","matchApplyUsers":1050100,"matchContent":"《焦点访谈》这个舆论监督节目多年来为人们所关注和喜爱，选择“政府重视、群众关心、普遍存在”的选题，坚持“用事实说话”的方针，反映和推动解决了大量社会进步与发展过程中存在的问题。许多《焦点访谈》的报道成为有关方面工作的决策依据和参考。\n\n《焦点访谈》所进行的舆论监督推动了中国的改革开放和民主法治的进程。在节目形态上，《焦点访谈》采用演播室主持和现场采访相结合的结构方式，使报道有着落、评论有依据，述与评相互支持、相得益彰。几年来，《焦点访谈》推出的一批较为观众认可的记者和主持人，如方宏进，敬一丹、水均益、方静、翟树杰、张羽等。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/movietv1.jpg,assets/movietv2.jpg,assets/movietv3.jpg,assets/movietv4.jpg,assets/movietv5.jpg","matchIcon": "assets/movietvicon.jpg","matchTitle":"影视同期声","matchComp":"《影视同期声》于1999年5月3日晚与中央电视台电视剧频道同步诞生，是中国第一档依托中国电视剧专业频道的强势资源、深入报道和关注中国电视剧行业动态、传播电视剧行业权威的声音、彰显和成就中央电视台电视剧频道的专业品位与特色、进一步促进和推动电视剧频道的综合建设的日播专业影视资讯、专题类栏目。","matchType":"电视栏目","matchFrom":"CCTV6","matchApplyUsers":1010,"matchContent":"《影视同期声》于1999年5月3日开播，是中国内地最早一档兼具影视资讯与专题报道的电视栏目。《影视同期声》日常节目立足中国电视剧报道，透过专业视角，洞察影视热点，把握潮流走向。\n\n《影视同期声》每期节目力求做到与时下热播、正在拍摄的影视剧同步，全面覆盖，全力渗透。\n\n与同类栏目相比，《影视同期声》更加注重对影视现场的全景呈现，对台前幕后的深度挖掘，对各种细节的巧妙捕捉，对人物角色的精彩解读。节目报道面广，可看性强，影响力大，潜心打造影视娱乐的制高点，曾三度荣获中国电视栏目最高奖项——星光奖。\n\n","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/animal1.jpg,assets/animal2.jpg,assets/animal3.jpg,assets/animal4.jpg","matchIcon": "assets/animalicon.jpg","matchTitle":"动物世界","matchComp":"中央电视台的《动物世界》栏目从1981年12月31日开播。主旨在于向电视观众介绍大自然中的种种动植物，使观众足不出户就可以了解和认识地球上生存的各种生命，认识自然对人类的影响。1994年，中央电视台的编委会提议，在《动物世界》的基础上，衍生出一个更符合世界环境与发展理念的杂志性专题的栏目——《人与自然》。","matchType":"电视栏目","matchFrom":"CCTV1","matchApplyUsers":918336121,"matchContent":"动物界是生物的一界，该界成员均属真核生物，包括一般能自由运动、以（复杂有机物质合成的）碳水化合物和蛋白质为食的所有生物。动物界作为动物分类中最高级的阶元，已发现的共35门70余纲约 350目，150 多万种。分布于地球上所有海洋、陆地，包括山地、草原、沙漠、森林、农田、水域以及两极在内的各种生境，成为自然环境不可分割的组成部分。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/baijia1.jpg,assets/baijia2.jpg,assets/baijia3.jpg,assets/baijia4.jpg,assets/baijia5.jpg,assets/baijia6.jpg","matchIcon": "assets/baijiaicon.jpg","matchTitle":"百家讲坛","matchComp":"“百家讲坛”是中央电视台第十套（CCTV-10）2001年7月9日开播的讲座式栏目，栏目宗旨为建构时代常识，享受智慧人生。选择观众最感兴趣、最前沿、最吸引人的选题。追求学术创新，鼓励思想个性，强调雅俗共赏，重视传播互动。栏目选材广泛，曾涉及文化、生物、医学、经济等各个方面，现多以文化题材为主，并较多涉及中国历史、中国文化。","matchType":"电视栏目","matchFrom":"CCTV10","matchApplyUsers":1024768,"matchContent":"《百家讲坛》已经成为CCTV-10科教频道的品牌栏目。其演播风格与学术性的理论研究相比较为平易，同时亦追求内容的学理性与权威性，力求雅俗共赏。该栏目自2001年7月9日开播以来，截至2011年11月，已播出2000余期，许多学术界著名人士由幕后推出，以通俗易懂的形式将许多晦涩知识传播于民众之中，个别议题亦受到专家及大众质疑。栏目收视率逐年提高，成为中国中央电视台科学教育频道的一款品牌栏目  。“百家讲坛”是一个开放的大学。节目内容涉及人文科学、自然科学、哲学等。形式多样，学理性与实用性并存，权威性与前卫性并重，追求学术创新，鼓励思想个性。适合具有中学以上文化程度，具有求知欲的观众。\n\n栏目制片人：聂丛丛，2001年任《百家讲坛》主编，2001年至2004年任《百家讲坛》制片人，2004年至2009年任《法律讲堂》制片人，2009年后续任《百家讲坛》制片人。前任万卫，汉族，祖籍河北涿州，1983年毕业于北京师范大学，1994年8月调入中央电视台，2004年9月至2009年8月担任《百家讲坛》栏目制片人。\n\n《百家讲坛》的栏目宗旨：汇集百家学养，追慕大师风范，平和开放的胸襟，通向大众的桥梁。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/happy1.jpg,assets/happy2.jpg,assets/happy3.jpg,assets/happy4.jpg","matchIcon": "assets/happyicon.jpg","matchTitle":"快乐大本营","matchComp":"《快乐大本营》是湖南电视台于1997年7月11日开办的一档综艺性娱乐节目，是湖南卫视上星以来一直保持的品牌节目之一。节目开始采用全民娱乐的类型，经常邀请一些有特殊才能的人物，一些可爱的孩子来表演，后有转为选秀节目，来选举其主持人；现在多以嘉宾访谈游戏型的综艺节目，经常邀请一些中国大陆、香港、台湾的知名艺人来访谈，游戏等。是湖南卫视的品牌节目之一。观众最喜欢的综艺节目，该节目获得1998年度金鹰奖。","matchType":"电视栏目","matchFrom":"湖南卫视","matchApplyUsers":16801050,"matchContent":"《快乐大本营》由何炅、维嘉、谢娜、杜海涛、吴昕五人组成的“快乐家族”搭档主持。《快乐大本营》栏目开办播出三、四期后，即在观众中引起反响，迅速占据全国电视市场的周末黄金时段，《快乐大本营》现象在当时被专家、媒体称之为“快乐旋风”，同时引发了全国电视界的一场“综艺变革”，不久全国各地电视台出现了近百档类似栏目。\n\n《快乐大本营》栏目开办以来以新鲜的题材，多样的形式，清新的风格，新奇的内容，注重知识性、趣味性和参与性,引领观众走向一个崭新的视听空间，既有搞笑不断的“快乐传真”、惊险刺激的“火线冲击”等形式新颖、观众喜闻乐见的经典游戏环节；也有让人捧腹大笑的“快乐小精灵”、“开心一刻”等老少皆宜、内容丰富多彩的外拍片；同时还有挑战智慧的“IQ无限”、积极向上的“太阳计划”和帮助观众实现心愿的“快乐行动”等观众互动性、参与感强的节目板块。\n\n《快乐大本营》不仅是湖南卫视上星以来一直保持的品牌节目，同时也成为全国最有影响力的娱乐节目之一。九年中有不少光芒万丈的闪耀明星作客《快乐大本营》。林俊杰、刘德华、林依晨、罗志祥、吴克群、唐禹哲、黄晓明、小沈阳、范冰冰、孙俪、曾志伟、周星驰、潘玮柏、蔡依林、萧亚轩、周杰伦、贝克汉姆、李宇春、林志玲、林志颖、韩庚、古天乐、成龙、巴蒂尔、张杰、房祖名、周渝民、李敏镐、杜淳、何晟铭、袁姗姗、舒畅、张嘉倪、SJM、五月天、冯绍峰、杨幂、刘谦、郑爽、张翰、魏晨、朱梓骁、俞灏明、刘诗诗、吴奇隆、张睿、李晟、韩红、文章姚笛等知名的艺人都曾经登上《快乐大本营》的舞台，留下属于他们的璀璨。\n\n女性观众比例在频道节目中居第1位，已达到60%!2006年全新改版倡导“全民娱乐”的《快乐大本营》在全台自办栏目的CSM14收视份额排名中稳居第1位，收视持续强劲。从1997年令全国观众刮目相看的“快乐旋风”开始到目前全国综艺节目在荧屏上遍地开花、异彩纷呈，十五年来，《快乐大本营》不仅是中国电视界综艺娱乐节目的领头羊，已经当之无愧成为中国亿万观众娱乐生活的一部分。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/daydayup1.jpg,assets/daydayup2.jpg,assets/daydayup3.jpg,assets/daydayup4.jpg,assets/daydayup5.jpg,assets/daydayup6.jpg","matchIcon": "assets/daydayupicon.jpg","matchTitle":"天天向上","matchComp":"《天天向上》是由湖南卫视推出的一档大型礼仪脱口秀节目。该节目以礼仪、公德为主题，分为歌舞、访谈、情景戏三段式，氛围欢快轻松幽默。该节目于2008年8月4日首播《天天向上前传》，8月7日正式播出，节目以传承中华礼仪，公德为主，也经常邀请一些明星、企业知名人士，来讨论礼仪，并有专门环节用搞笑的方式诠释古代礼仪。主持人由汪涵、欧弟（欧汉声）、田源、钱枫、俞灏明、矢野浩二、小五（金恩圣）七位男性主持人组成。","matchType":"电视栏目","matchFrom":"湖南卫视","matchApplyUsers":640480,"matchContent":"作为2008年湖南卫视的重点主推节目，在上档之前，湖南卫视做了一系列的宣传计划，为加强宣传效果，首次打造三期宣传预热节目——《天天向上前传》，从2008年8月4日开始，以日播的形式播出。之所以有前传，是为了让观众更好的了解《天天向上》的节目形式，让观众更加有兴趣的了解节目内容，为即将播出的周播节目造势。\n\n在《天天向上前传》中，对于《天天向上》进行了相关的背景介绍：“天天向上”一班来自于1500多年前的一家古老的书院。因为坐落在半山的位置，人们叫它半山学园。名门望族或黎民百姓家的少年，都以来这里求学为荣。半山学园里有一个“天天向上一班”，班里有一群学生，男生才高八斗、英俊潇洒；女生貌美多姿、知书达礼。他们的老师博学多才，带着他们一起在半山学园里学习中华礼仪、汉语成语，寓教于乐。\n\n半山学园历史久远，创始人是一个传奇的人物，曾经身兼宫廷首席乐师与国学师，努力让儒雅学风与翩翩礼仪跨越门庭与家世的阻隔，在每位学子身上闪光。 1500年以来，他一直就在这里，从来没有离开过。穿越时空的他，永远守护着他的学子们，愿美好文字、音乐、礼仪与阅历，陪伴着他们慢慢地成。半山学园的天天向上一班一直传承至今，今天的天天向上一班的同学们，依然在健康茁壮的成长。\n\n《天天向上前传》中，每一期都会有一场开场秀，接着是6堂课，最后是大师开讲，总结一期节目。当中的6堂课精彩纷呈、妙趣横生，以搞笑趣味的方式教授语文、英语、历史、地理等等传统课程，也设有游戏环节，输的人必须受罚，而惩罚方式也是出人意料，比如将好端端的人贴在墙上等等以七堂暑假公开课的形式进行，包含了开场秀、公开课、成语故事、电视购物、游戏环节、大师讲礼仪等多种节目元素。以上课的形式充分表达娱乐和礼仪的节目主题。两位老师以上课的名义并模仿电视购物的元素，在上课的过程中推销2008年8月7日正式播出的《天天向上》节目，告诉大家《天天向上》一班2008年8月7日正式开班，在《天天向上》这个班级中可以与这么多明星们一起上课，一起学习礼仪知识","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":1},
{"picture":"assets/Explore1.jpg,assets/Explore2.jpg,assets/Explore3.jpg,assets/Explore4.jpg,assets/Explore5.jpg,assets/Explore6.jpg","matchIcon": "assets/exploreicon.jpg","matchTitle":"探索·发现","matchComp":"《探索·发现》是中国电视史上一个大型人文历史与自然地理类的纪录片栏目，于2001年7月9日开播。《探索·发现》栏目以纪录片的手法，讲述以中国为主的历史、地理、文化的故事，探寻自然界的神奇奥秘，挖掘历史事件背后鲜为人知的细节和人物命运。","matchType":"电视栏目","matchFrom":"CCTV10","matchApplyUsers":1024768,"matchContent":"《探索·发现》是中国电视史上第一个大型人文历史与自然地理类的纪录片栏目，于2001年7月9日开播。《探索·发现》栏目以纪录片的手法，讲述以中国为主的历史、地理、文化的故事，探寻自然界的神奇奥秘，挖掘历史事件背后鲜为人知的细节和人物命运，展示中华文明的博大恢弘，是“中国的地理探索，中国的历史发现，中国的文化大观”。\n\n探索·发现》倡导“娱乐化”纪录片的理念，采用讲述精彩故事，设置引人入胜的悬念，运用生动的电视声画手段，向观众呈现出一部部既有较高文化品位、知识内涵，又有很强观赏性和娱乐性的电视节目。\n\n“在未知领域努力探索，在已知领域重新发现”，是《探索·发现》的栏目宗旨和始终如一的追求。\n\n\《探索·发现》开播四年多以来，制作和播出了1000多集的节目，其中有一大批节目，受到了观众的喜爱。\n\n如大型系列节目《考古中国》（45集）、《世界遗产之中国档案》（30集）、《秘境追踪》（38集）、《极地跨越》（148集）、《走进非洲》（102集）、《丧钟为谁而鸣》（7集）、《历史不容忘却》（53集）等；","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":1},
{"picture":"assets/law1.jpg,assets/law2.jpg,assets/law3.jpg,assets/law4.jpg,assets/law5.jpg","matchIcon": "assets/lawicon.jpg","matchTitle":"今日说法","matchComp":"1999年1月2日中央电视台推出一个全新的法制栏目—《今日说法》，每天中午12：40在央视一套节目播出，每期15分钟。周一至周五13：45在中央电视台一套重播。《说法》采取以案说法、大众参与、专家评说的节目样式。 栏目宗旨：重在普法，监督执法，推动立法，为百姓办实事。","matchType":"电视栏目","matchFrom":"CCTV1","matchApplyUsers":286435,"matchContent":"2001年起，栏目陆续出版了《今日说法》丛书、《法治的力量》、《见证中国法制进程》、《聚焦婚姻》几部书籍. 2001年12月4日，是我国第一个法制宣传日，为了迎接宣传日的到来，全国普法办与中央电视台《今日说法》栏目联合举办一台九十分钟的专题晚会——法制的力量。晚会上来自全国各地的观众与政府部门的一些官员做了一次心与心的交流，面对面的沟通，观众们率直的提问，官员们真诚的回答赢得了现场观众热烈的掌声。\n\n2002年4月，为配合新《婚姻法》颁布一周年，《今日说法》制作的《婚姻法一周年特别节目》，通过对一系列社会关注的热点问题来诠释婚姻家庭中的法律问题，引起多方关注，获得较高的收视率。\n\n2002年5月，为配合6·26国际禁毒日的到来，和公安部禁毒局、云南省公安厅合作制作的60分钟特别节目《聚焦金三角》是国内媒体首次对其作全景式的独家报道，极具新闻价值和研究价值。\n\n　2002年5月13日，在中国国际电视总公司为《今日说法》举行了热烈而隆重的“全国青年文明号”揭牌仪式。团中央书记赵勇、中直机关工委党委副书记伍绍祖和国家广电总局副局长赵实、中央电视台等单位的部分领导参加了这一仪式。“全国青年文明号”是由江泽民总书记亲笔题写的，它是全国青年集体的最高荣誉。\n\n2002年5月30日播出的《公民道德知识竞赛》因其巧妙地将知识性、趣味性、教育性及娱乐性融为一体，不仅得到了中宣部领导的表扬和肯定，也得到了社会各界的好评。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/happydict1.jpg,assets/happydict2.jpg,assets/happydict3.jpg,assets/happydict4.jpg","matchIcon": "assets/happydicticon.jpg","matchTitle":"开心辞典","matchComp":"《开心辞典》是中央电视台倾力奉献的名牌栏目；面向大众的益智节目；提供广泛的参与空间和机制；搭建刺激的智慧擂台。一个集齐趣味、益智、知识、紧张、惊险、幽默于一身的有奖问答节目；一个引进国外先进电视形态、由高科技网络、声讯手段支撑的游戏节目；一个现场气氛空前紧张激烈、引人入胜、扣人心弦的全新大型娱乐节目；一个从参与到收视完全面向普通百姓，参赛人数无限多，选手选拔机制更科学、更公平，决赛选手水平更高的平民化节目。","matchType":"电视栏目","matchFrom":"CCTV3","matchApplyUsers":89729981,"matchContent":"《开心辞典》——一个中央电视台经济频道倾力奉献的名牌栏目；一个由高科技网络、声讯手段支撑、完全面向普通大众的大型益智节目；提供最广泛的参与空间和公平的参与机制；搭建最刺激的智慧擂台。\n\n《开心辞典》是中央电视台经济频道2000年全面改版时为响应党中央“科教兴国”号召，结合本频道特点，于7月7日推出的新型益智类节目。《开心辞典》在央视各级领导的关心和指导下，节目组全体人员共同努力，使节目开播伊始便以强劲势头迅速切入益智节目市场。仅用6个月时间，收视率就跃居央视二套第一，最高时达3.79%；此后收视率稳居央视二套前两位，成为每周五22：05中央电视台所有频道同一时间档固定节目中观众最多的节目。作为一档新型的益智类娱乐节目，不仅在开播之初给人耳目一新的感觉，经过四年的锻造，《开心辞典》更加完善和成熟，逐步成长为央视二套的品牌节目之一。\n\n《开心辞典》准确锁定以“家庭”为基础的收视群体，围绕着中国传统亲情观念，成功引进国外益智节目的全新理念，利用“家庭梦想”和“平民智力英雄”等核心概念，满足了观众日益旺盛的娱乐消费需要，取得了非同凡响的市场效果。节目开播到现在，共播出190余期，收视率稳居央视二套前茅，并于2003年6月以央视二套的精品节目之一率先闯进央视一套播出，拓展了节目的收视平台。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},{"picture":"assets/focus1.jpg,assets/observe1.jpg,assets/observe2.jpg,assets/observe3.jpg,assets/observe4.jpg,assets/observe5.jpg","matchIcon": "assets/focus1icon.jpg","matchTitle":"二十二度观察","matchComp":"《22度观察》是深圳卫视2009年初重磅推出的新锐话题栏目。节目汇聚国内外政治、《22度观察》LOGO经济、文化等各领域精英翘楚，以新锐独到的全球化视角，对新闻热点和重大社会思潮展开深入、理性和建设性的探讨。《22度观察》从北纬22度的深圳出发，聚合全球知识力量，观天下风云，察中国变迁；在纷繁世界，寻找独立理性声音；用新锐视角，挖掘前沿价值判断。","matchType":"电视栏目","matchFrom":"深圳卫视","matchApplyUsers":10250,"matchContent":"节目特点:\n\n1、内容定位：对当前经济政策、社会事件或思潮提供新锐的思想、观点和评论\n2、功能定位：提供有价值的思想智慧及独到见地。\n3、形态定位：演播室谈话，外采，评论\n4、嘉宾定位：政府有关部门领导/国内外权威专家/社会名流/重大事件及话题的当事人/资深媒体人或评论员 \n\n节目亮点:\n\n1、具有独立灵魂并能促进中国社会进步的新锐话题节目\n2、官员、学者、媒体及业界的重量级嘉宾，对中国问题有深远的思考能力及良好的表达\n3、深入浅出、亦庄亦谐；逻辑严谨、表达率性；权威声音、多元视角\n4、演播室时尚新颖，给观众带来崭新时尚的视觉体验，追求收视与影响力的双丰收","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/topicsinfocus1.jpg,assets/topicsinfocus2.jpg,assets/topicsinfocus3.jpg,assets/topicsinfocus4.jpg","matchIcon": "assets/topicsinfocusicon.jpg","matchTitle":"焦点访谈","matchComp":"《焦点访谈》栏目，创办于1994年4月1日。开办后，它迅速成长为一个在中国家喻户晓的电视栏目，也是中央电视台收视率最高的栏目之一。焦点访谈节目开播以来，受到了党和国家领导人以及老百姓们的广泛关注和重视。平均每天栏目能收到2300条来自观众通过电话、写信、传真、电子邮件、手机短信、QQ等方式提供的收视意见和报道线索。","matchType":"电视栏目","matchFrom":"CCTV1","matchApplyUsers":1050100,"matchContent":"《焦点访谈》这个舆论监督节目多年来为人们所关注和喜爱，选择“政府重视、群众关心、普遍存在”的选题，坚持“用事实说话”的方针，反映和推动解决了大量社会进步与发展过程中存在的问题。许多《焦点访谈》的报道成为有关方面工作的决策依据和参考。\n\n《焦点访谈》所进行的舆论监督推动了中国的改革开放和民主法治的进程。在节目形态上，《焦点访谈》采用演播室主持和现场采访相结合的结构方式，使报道有着落、评论有依据，述与评相互支持、相得益彰。几年来，《焦点访谈》推出的一批较为观众认可的记者和主持人，如方宏进，敬一丹、水均益、方静、翟树杰、张羽等。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/movietv1.jpg,assets/movietv2.jpg,assets/movietv3.jpg,assets/movietv4.jpg,assets/movietv5.jpg","matchIcon": "assets/movietvicon.jpg","matchTitle":"影视同期声","matchComp":"《影视同期声》于1999年5月3日晚与中央电视台电视剧频道同步诞生，是中国第一档依托中国电视剧专业频道的强势资源、深入报道和关注中国电视剧行业动态、传播电视剧行业权威的声音、彰显和成就中央电视台电视剧频道的专业品位与特色、进一步促进和推动电视剧频道的综合建设的日播专业影视资讯、专题类栏目。","matchType":"电视栏目","matchFrom":"CCTV6","matchApplyUsers":1010,"matchContent":"《影视同期声》于1999年5月3日开播，是中国内地最早一档兼具影视资讯与专题报道的电视栏目。《影视同期声》日常节目立足中国电视剧报道，透过专业视角，洞察影视热点，把握潮流走向。\n\n《影视同期声》每期节目力求做到与时下热播、正在拍摄的影视剧同步，全面覆盖，全力渗透。\n\n与同类栏目相比，《影视同期声》更加注重对影视现场的全景呈现，对台前幕后的深度挖掘，对各种细节的巧妙捕捉，对人物角色的精彩解读。节目报道面广，可看性强，影响力大，潜心打造影视娱乐的制高点，曾三度荣获中国电视栏目最高奖项——星光奖。\n\n","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/animal1.jpg,assets/animal2.jpg,assets/animal3.jpg,assets/animal4.jpg","matchIcon": "assets/animalicon.jpg","matchTitle":"动物世界","matchComp":"中央电视台的《动物世界》栏目从1981年12月31日开播。主旨在于向电视观众介绍大自然中的种种动植物，使观众足不出户就可以了解和认识地球上生存的各种生命，认识自然对人类的影响。1994年，中央电视台的编委会提议，在《动物世界》的基础上，衍生出一个更符合世界环境与发展理念的杂志性专题的栏目——《人与自然》。","matchType":"电视栏目","matchFrom":"CCTV1","matchApplyUsers":918336121,"matchContent":"动物界是生物的一界，该界成员均属真核生物，包括一般能自由运动、以（复杂有机物质合成的）碳水化合物和蛋白质为食的所有生物。动物界作为动物分类中最高级的阶元，已发现的共35门70余纲约 350目，150 多万种。分布于地球上所有海洋、陆地，包括山地、草原、沙漠、森林、农田、水域以及两极在内的各种生境，成为自然环境不可分割的组成部分。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/baijia1.jpg,assets/baijia2.jpg,assets/baijia3.jpg,assets/baijia4.jpg,assets/baijia5.jpg,assets/baijia6.jpg","matchIcon": "assets/baijiaicon.jpg","matchTitle":"百家讲坛","matchComp":"“百家讲坛”是中央电视台第十套（CCTV-10）2001年7月9日开播的讲座式栏目，栏目宗旨为建构时代常识，享受智慧人生。选择观众最感兴趣、最前沿、最吸引人的选题。追求学术创新，鼓励思想个性，强调雅俗共赏，重视传播互动。栏目选材广泛，曾涉及文化、生物、医学、经济等各个方面，现多以文化题材为主，并较多涉及中国历史、中国文化。","matchType":"电视栏目","matchFrom":"CCTV10","matchApplyUsers":1024768,"matchContent":"《百家讲坛》已经成为CCTV-10科教频道的品牌栏目。其演播风格与学术性的理论研究相比较为平易，同时亦追求内容的学理性与权威性，力求雅俗共赏。该栏目自2001年7月9日开播以来，截至2011年11月，已播出2000余期，许多学术界著名人士由幕后推出，以通俗易懂的形式将许多晦涩知识传播于民众之中，个别议题亦受到专家及大众质疑。栏目收视率逐年提高，成为中国中央电视台科学教育频道的一款品牌栏目  。“百家讲坛”是一个开放的大学。节目内容涉及人文科学、自然科学、哲学等。形式多样，学理性与实用性并存，权威性与前卫性并重，追求学术创新，鼓励思想个性。适合具有中学以上文化程度，具有求知欲的观众。\n\n栏目制片人：聂丛丛，2001年任《百家讲坛》主编，2001年至2004年任《百家讲坛》制片人，2004年至2009年任《法律讲堂》制片人，2009年后续任《百家讲坛》制片人。前任万卫，汉族，祖籍河北涿州，1983年毕业于北京师范大学，1994年8月调入中央电视台，2004年9月至2009年8月担任《百家讲坛》栏目制片人。\n\n《百家讲坛》的栏目宗旨：汇集百家学养，追慕大师风范，平和开放的胸襟，通向大众的桥梁。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/happy1.jpg,assets/happy2.jpg,assets/happy3.jpg,assets/happy4.jpg","matchIcon": "assets/happyicon.jpg","matchTitle":"快乐大本营","matchComp":"《快乐大本营》是湖南电视台于1997年7月11日开办的一档综艺性娱乐节目，是湖南卫视上星以来一直保持的品牌节目之一。节目开始采用全民娱乐的类型，经常邀请一些有特殊才能的人物，一些可爱的孩子来表演，后有转为选秀节目，来选举其主持人；现在多以嘉宾访谈游戏型的综艺节目，经常邀请一些中国大陆、香港、台湾的知名艺人来访谈，游戏等。是湖南卫视的品牌节目之一。观众最喜欢的综艺节目，该节目获得1998年度金鹰奖。","matchType":"电视栏目","matchFrom":"湖南卫视","matchApplyUsers":16801050,"matchContent":"《快乐大本营》由何炅、维嘉、谢娜、杜海涛、吴昕五人组成的“快乐家族”搭档主持。《快乐大本营》栏目开办播出三、四期后，即在观众中引起反响，迅速占据全国电视市场的周末黄金时段，《快乐大本营》现象在当时被专家、媒体称之为“快乐旋风”，同时引发了全国电视界的一场“综艺变革”，不久全国各地电视台出现了近百档类似栏目。\n\n《快乐大本营》栏目开办以来以新鲜的题材，多样的形式，清新的风格，新奇的内容，注重知识性、趣味性和参与性,引领观众走向一个崭新的视听空间，既有搞笑不断的“快乐传真”、惊险刺激的“火线冲击”等形式新颖、观众喜闻乐见的经典游戏环节；也有让人捧腹大笑的“快乐小精灵”、“开心一刻”等老少皆宜、内容丰富多彩的外拍片；同时还有挑战智慧的“IQ无限”、积极向上的“太阳计划”和帮助观众实现心愿的“快乐行动”等观众互动性、参与感强的节目板块。\n\n《快乐大本营》不仅是湖南卫视上星以来一直保持的品牌节目，同时也成为全国最有影响力的娱乐节目之一。九年中有不少光芒万丈的闪耀明星作客《快乐大本营》。林俊杰、刘德华、林依晨、罗志祥、吴克群、唐禹哲、黄晓明、小沈阳、范冰冰、孙俪、曾志伟、周星驰、潘玮柏、蔡依林、萧亚轩、周杰伦、贝克汉姆、李宇春、林志玲、林志颖、韩庚、古天乐、成龙、巴蒂尔、张杰、房祖名、周渝民、李敏镐、杜淳、何晟铭、袁姗姗、舒畅、张嘉倪、SJM、五月天、冯绍峰、杨幂、刘谦、郑爽、张翰、魏晨、朱梓骁、俞灏明、刘诗诗、吴奇隆、张睿、李晟、韩红、文章姚笛等知名的艺人都曾经登上《快乐大本营》的舞台，留下属于他们的璀璨。\n\n女性观众比例在频道节目中居第1位，已达到60%!2006年全新改版倡导“全民娱乐”的《快乐大本营》在全台自办栏目的CSM14收视份额排名中稳居第1位，收视持续强劲。从1997年令全国观众刮目相看的“快乐旋风”开始到目前全国综艺节目在荧屏上遍地开花、异彩纷呈，十五年来，《快乐大本营》不仅是中国电视界综艺娱乐节目的领头羊，已经当之无愧成为中国亿万观众娱乐生活的一部分。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/daydayup1.jpg,assets/daydayup2.jpg,assets/daydayup3.jpg,assets/daydayup4.jpg,assets/daydayup5.jpg,assets/daydayup6.jpg","matchIcon": "assets/daydayupicon.jpg","matchTitle":"天天向上","matchComp":"《天天向上》是由湖南卫视推出的一档大型礼仪脱口秀节目。该节目以礼仪、公德为主题，分为歌舞、访谈、情景戏三段式，氛围欢快轻松幽默。该节目于2008年8月4日首播《天天向上前传》，8月7日正式播出，节目以传承中华礼仪，公德为主，也经常邀请一些明星、企业知名人士，来讨论礼仪，并有专门环节用搞笑的方式诠释古代礼仪。主持人由汪涵、欧弟（欧汉声）、田源、钱枫、俞灏明、矢野浩二、小五（金恩圣）七位男性主持人组成。","matchType":"电视栏目","matchFrom":"湖南卫视","matchApplyUsers":640480,"matchContent":"作为2008年湖南卫视的重点主推节目，在上档之前，湖南卫视做了一系列的宣传计划，为加强宣传效果，首次打造三期宣传预热节目——《天天向上前传》，从2008年8月4日开始，以日播的形式播出。之所以有前传，是为了让观众更好的了解《天天向上》的节目形式，让观众更加有兴趣的了解节目内容，为即将播出的周播节目造势。\n\n在《天天向上前传》中，对于《天天向上》进行了相关的背景介绍：“天天向上”一班来自于1500多年前的一家古老的书院。因为坐落在半山的位置，人们叫它半山学园。名门望族或黎民百姓家的少年，都以来这里求学为荣。半山学园里有一个“天天向上一班”，班里有一群学生，男生才高八斗、英俊潇洒；女生貌美多姿、知书达礼。他们的老师博学多才，带着他们一起在半山学园里学习中华礼仪、汉语成语，寓教于乐。\n\n半山学园历史久远，创始人是一个传奇的人物，曾经身兼宫廷首席乐师与国学师，努力让儒雅学风与翩翩礼仪跨越门庭与家世的阻隔，在每位学子身上闪光。 1500年以来，他一直就在这里，从来没有离开过。穿越时空的他，永远守护着他的学子们，愿美好文字、音乐、礼仪与阅历，陪伴着他们慢慢地成。半山学园的天天向上一班一直传承至今，今天的天天向上一班的同学们，依然在健康茁壮的成长。\n\n《天天向上前传》中，每一期都会有一场开场秀，接着是6堂课，最后是大师开讲，总结一期节目。当中的6堂课精彩纷呈、妙趣横生，以搞笑趣味的方式教授语文、英语、历史、地理等等传统课程，也设有游戏环节，输的人必须受罚，而惩罚方式也是出人意料，比如将好端端的人贴在墙上等等以七堂暑假公开课的形式进行，包含了开场秀、公开课、成语故事、电视购物、游戏环节、大师讲礼仪等多种节目元素。以上课的形式充分表达娱乐和礼仪的节目主题。两位老师以上课的名义并模仿电视购物的元素，在上课的过程中推销2008年8月7日正式播出的《天天向上》节目，告诉大家《天天向上》一班2008年8月7日正式开班，在《天天向上》这个班级中可以与这么多明星们一起上课，一起学习礼仪知识","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":1},
{"picture":"assets/Explore1.jpg,assets/Explore2.jpg,assets/Explore3.jpg,assets/Explore4.jpg,assets/Explore5.jpg,assets/Explore6.jpg","matchIcon": "assets/exploreicon.jpg","matchTitle":"探索·发现","matchComp":"《探索·发现》是中国电视史上一个大型人文历史与自然地理类的纪录片栏目，于2001年7月9日开播。《探索·发现》栏目以纪录片的手法，讲述以中国为主的历史、地理、文化的故事，探寻自然界的神奇奥秘，挖掘历史事件背后鲜为人知的细节和人物命运。","matchType":"电视栏目","matchFrom":"CCTV10","matchApplyUsers":1024768,"matchContent":"《探索·发现》是中国电视史上第一个大型人文历史与自然地理类的纪录片栏目，于2001年7月9日开播。《探索·发现》栏目以纪录片的手法，讲述以中国为主的历史、地理、文化的故事，探寻自然界的神奇奥秘，挖掘历史事件背后鲜为人知的细节和人物命运，展示中华文明的博大恢弘，是“中国的地理探索，中国的历史发现，中国的文化大观”。\n\n探索·发现》倡导“娱乐化”纪录片的理念，采用讲述精彩故事，设置引人入胜的悬念，运用生动的电视声画手段，向观众呈现出一部部既有较高文化品位、知识内涵，又有很强观赏性和娱乐性的电视节目。\n\n“在未知领域努力探索，在已知领域重新发现”，是《探索·发现》的栏目宗旨和始终如一的追求。\n\n\《探索·发现》开播四年多以来，制作和播出了1000多集的节目，其中有一大批节目，受到了观众的喜爱。\n\n如大型系列节目《考古中国》（45集）、《世界遗产之中国档案》（30集）、《秘境追踪》（38集）、《极地跨越》（148集）、《走进非洲》（102集）、《丧钟为谁而鸣》（7集）、《历史不容忘却》（53集）等；","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":1},
{"picture":"assets/law1.jpg,assets/law2.jpg,assets/law3.jpg,assets/law4.jpg,assets/law5.jpg","matchIcon": "assets/lawicon.jpg","matchTitle":"今日说法","matchComp":"1999年1月2日中央电视台推出一个全新的法制栏目—《今日说法》，每天中午12：40在央视一套节目播出，每期15分钟。周一至周五13：45在中央电视台一套重播。《说法》采取以案说法、大众参与、专家评说的节目样式。 栏目宗旨：重在普法，监督执法，推动立法，为百姓办实事。","matchType":"电视栏目","matchFrom":"CCTV1","matchApplyUsers":286435,"matchContent":"2001年起，栏目陆续出版了《今日说法》丛书、《法治的力量》、《见证中国法制进程》、《聚焦婚姻》几部书籍. 2001年12月4日，是我国第一个法制宣传日，为了迎接宣传日的到来，全国普法办与中央电视台《今日说法》栏目联合举办一台九十分钟的专题晚会——法制的力量。晚会上来自全国各地的观众与政府部门的一些官员做了一次心与心的交流，面对面的沟通，观众们率直的提问，官员们真诚的回答赢得了现场观众热烈的掌声。\n\n2002年4月，为配合新《婚姻法》颁布一周年，《今日说法》制作的《婚姻法一周年特别节目》，通过对一系列社会关注的热点问题来诠释婚姻家庭中的法律问题，引起多方关注，获得较高的收视率。\n\n2002年5月，为配合6·26国际禁毒日的到来，和公安部禁毒局、云南省公安厅合作制作的60分钟特别节目《聚焦金三角》是国内媒体首次对其作全景式的独家报道，极具新闻价值和研究价值。\n\n　2002年5月13日，在中国国际电视总公司为《今日说法》举行了热烈而隆重的“全国青年文明号”揭牌仪式。团中央书记赵勇、中直机关工委党委副书记伍绍祖和国家广电总局副局长赵实、中央电视台等单位的部分领导参加了这一仪式。“全国青年文明号”是由江泽民总书记亲笔题写的，它是全国青年集体的最高荣誉。\n\n2002年5月30日播出的《公民道德知识竞赛》因其巧妙地将知识性、趣味性、教育性及娱乐性融为一体，不仅得到了中宣部领导的表扬和肯定，也得到了社会各界的好评。","matchInformation1":"活动元数据1","matchInformation2":"活动元数据2","matchInformation3":"活动元数据3","matchInformation4":"活动元数据4","matchInformation5":"活动元数据5","matchImportant":0},
{"picture":"assets/happydict1.jpg,assets/happydict2.jpg,assets/happydict3.jpg,assets/happydict4.jpg", "matchIcon": "assets/happydicticon.jpg", "matchTitle":"开心辞典", "matchComp":"《开心辞典》是中央电视台倾力奉献的名牌栏目；面向大众的益智节目；提供广泛的参与空间和机制；搭建刺激的智慧擂台。一个集齐趣味、益智、知识、紧张、惊险、幽默于一身的有奖问答节目；一个引进国外先进电视形态、由高科技网络、声讯手段支撑的游戏节目；一个现场气氛空前紧张激烈、引人入胜、扣人心弦的全新大型娱乐节目；一个从参与到收视完全面向普通百姓，参赛人数无限多，选手选拔机制更科学、更公平，决赛选手水平更高的平民化节目。", "matchType":"电视栏目", "matchFrom":"CCTV3", "matchApplyUsers":89729981, "matchContent":"《开心辞典》——一个中央电视台经济频道倾力奉献的名牌栏目；一个由高科技网络、声讯手段支撑、完全面向普通大众的大型益智节目；提供最广泛的参与空间和公平的参与机制；搭建最刺激的智慧擂台。\n\n《开心辞典》是中央电视台经济频道2000年全面改版时为响应党中央“科教兴国”号召，结合本频道特点，于7月7日推出的新型益智类节目。《开心辞典》在央视各级领导的关心和指导下，节目组全体人员共同努力，使节目开播伊始便以强劲势头迅速切入益智节目市场。仅用6个月时间，收视率就跃居央视二套第一，最高时达3.79%；此后收视率稳居央视二套前两位，成为每周五22：05中央电视台所有频道同一时间档固定节目中观众最多的节目。作为一档新型的益智类娱乐节目，不仅在开播之初给人耳目一新的感觉，经过四年的锻造，《开心辞典》更加完善和成熟，逐步成长为央视二套的品牌节目之一。\n\n《开心辞典》准确锁定以“家庭”为基础的收视群体，围绕着中国传统亲情观念，成功引进国外益智节目的全新理念，利用“家庭梦想”和“平民智力英雄”等核心概念，满足了观众日益旺盛的娱乐消费需要，取得了非同凡响的市场效果。节目开播到现在，共播出190余期，收视率稳居央视二套前茅，并于2003年6月以央视二套的精品节目之一率先闯进央视一套播出，拓展了节目的收视平台。", "matchInformation1":"活动元数据1", "matchInformation2":"活动元数据2", "matchInformation3":"活动元数据3", "matchInformation4":"活动元数据4", "matchInformation5":"活动元数据5", "matchImportant":0 }
];
			
			var missMatchThumbs :Array =  Robot_MissMatchThumbFactory.getMissMatchThumbs(tempDataArr)
			architect = new Miss_Architect(missMatchThumbs);
			statusBar = new Miss_StatusBar();
			navBar = new Miss_NavigatorBar(dataArr);
			
			magician = new Miss_ScrollBarUpfitter(architect, 40);
			magician2 = new Miss_ScrollBarUpfitter(navBar, 0);
			
			magician.x = 240;
			magician.y = 39;
			
			statusBar.x = 240;
			statusBar.y = -1;
			architect.x = 240;
			architect.y = 40;
			addChild(architect);
			addChild(statusBar);
			addChild(navBar);
			this.addEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
		}
		
		private function addToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addToStageHandler);
			scaleWidth = this.stage.stageWidth;
			trace(scaleWidth);
			if (scaleWidth >= 1200) 
			{
				statusBar.x = (scaleWidth - 1200) / 2 + 240 -9;
				magician.x = (scaleWidth - 1200) / 2 + 240 -9;
				architect.x = (scaleWidth - 1200) / 2 + 240 -9;
				navBar.x = (scaleWidth - 1200) / 2 -9;
				magician2.x = (scaleWidth - 1200) / 2 -9
			} else {
				statusBar.x = 240;
				magician.x = 240;
				architect.x = 240;
				navBar.x = 0;
				magician2.x = 0;
			}
			this.stage.addEventListener(Event.RESIZE,resizeHandler);
		}
		
		private function resizeHandler(e:Event):void 
		{
			scaleWidth = this.stage.stageWidth;
			//trace("\\\111"+architect.width);
			trace(scaleWidth);
			if (scaleWidth >= 1200) 
			{
				architect.x = (scaleWidth - 1200) / 2 + 240 -9;
				statusBar.x = (scaleWidth - 1200) / 2 + 240 -9;
				magician.x = (scaleWidth - 1200) / 2 + 240 -9;
				navBar.x = (scaleWidth - 1200) / 2 -9;
				magician2.x = (scaleWidth - 1200) / 2 -9;
			} else {
				statusBar.x = 240;
				magician.x = 240;
				architect.x = (scaleWidth - 1200) / 2 + 240 -9;
				navBar.x = 0;
				magician2.x = 0;
			}
		}
	}
}