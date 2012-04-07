package com.readdream.as3.miss 
{
	import com.readdream.as3.miss.contentbar.Miss_ContentBar;
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.mr.Mr_Layouter;
	import com.readdream.as3.robot.Robot_TextFormater;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_UserCenter extends Sprite 
	{
		private const elementX:Number = 50;
		private const elementX2:Number = 510;
		private const elementWidth:Number = 300;
		private const elementHeight:Number = 30;
		
		private var sprTitle:Sprite = new Sprite();
		private var sprContent:Sprite = new Sprite();
		private var sprContainer:Sprite = new Sprite();
		
		
		private var txtTitle:TextField = new TextField();
		private var txtTitleComp:TextField = new TextField();
		
		private var txtName:TextField = new TextField();
		private var inputName:Miss_TextInput;
		
		private var txtSex:TextField = new TextField();
		private var selSex:Miss_SelectComponent;
		
		private var txtBirthday:TextField = new TextField();
		private var inputYear:Miss_TextInput;
		private var selMonth:Miss_SelectComponent;
		private var inputDay:Miss_TextInput;
		
		private var txtDistrict:TextField = new TextField();
		private var inputDistrict:Miss_TextInput;
		
		private var txtAddress:TextField = new TextField();
		private var inputAddress:Miss_TextInput;
		
		private var txtProfession:TextField = new TextField();
		private var inputProfession:Miss_TextInput;
		
		private var txtQQ:TextField = new TextField();
		private var inputQQ:Miss_TextInput;
		
		private var txtFavMovie:TextField = new TextField();
		private var selFavMovie:Miss_SelectComponent;
		
		private var txtFavMusic:TextField = new TextField();
		private var selFavMusic:Miss_SelectComponent;
		
		private var txtFavDomain:TextField = new TextField();
		private var selFavDomain:Miss_SelectComponent;
		
		private var txtFavIdol:TextField = new TextField();
		private var inputFavIdol:Miss_TextInput;
		private var btnSubmit:Miss_Button;
		
		private var openMutiChooseFlag:Miss_SelectComponent;
		
		public function Miss_UserCenter() 
		{
			initData();
			initStyle();
			setupImage();
		}
		
		
		private function initData():void 
		{
			txtTitle.text = "个人中心";
			txtTitle.autoSize = TextFieldAutoSize.LEFT;
			txtTitle.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.USERCENT_TITLE));
			
			txtTitleComp.text = "定制您的个人中心可以更方便我们发现你";
			txtTitleComp.autoSize = TextFieldAutoSize.LEFT;
			txtTitleComp.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.USERCENT_TITLECOMP));
			
			txtName.text = "真实姓名";
			txtName.autoSize = TextFieldAutoSize.LEFT;
			txtName.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			inputName = new Miss_TextInput(elementWidth, elementHeight, "姓名", "normal");
			
			txtSex.text = "性别";
			txtSex.autoSize = TextFieldAutoSize.LEFT;
			txtSex.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			var vrSex:Vector.<String> = new Vector.<String>;
			vrSex.push("男","女","其他");
			selSex = new Miss_SelectComponent(elementWidth, elementHeight, vrSex);
			selSex.prompt = "您的性别是...";
			
			txtBirthday.text = "出生日期";
			txtBirthday.autoSize = TextFieldAutoSize.LEFT;
			txtBirthday.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			inputYear = new Miss_TextInput(95, elementHeight, "年", "number");
			var vrMonth:Vector.<String> = new Vector.<String>;
			vrMonth.push("1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月");
			selMonth = new Miss_SelectComponent(130, elementHeight+1, vrMonth);
			selMonth.prompt = "月";
			inputDay = new Miss_TextInput(60, elementHeight, "日", "number");
			
			
			txtDistrict.text = "地区";
			txtDistrict.autoSize = TextFieldAutoSize.LEFT;
			txtDistrict.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			inputDistrict = new Miss_TextInput(elementWidth, elementHeight, "所在地区", "normal");
			
			txtAddress.text = "地址";
			txtAddress.autoSize = TextFieldAutoSize.LEFT;
			txtAddress.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			inputAddress = new Miss_TextInput(elementWidth, elementHeight, "联系地址", "normal");
			
			txtProfession.text = "职业";
			txtProfession.autoSize = TextFieldAutoSize.LEFT;
			txtProfession.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			inputProfession = new Miss_TextInput(elementWidth, elementHeight, "您从事的职业", "normal");
			
			txtQQ.text = "QQ号码";
			txtQQ.autoSize = TextFieldAutoSize.LEFT;
			txtQQ.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			inputQQ = new Miss_TextInput(elementWidth, elementHeight, "您的QQ号码", "number");
			
			txtFavIdol.text = "喜欢的偶像";
			txtFavIdol.autoSize = TextFieldAutoSize.LEFT;
			txtFavIdol.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			inputFavIdol = new Miss_TextInput(elementWidth, elementHeight, "您喜欢的偶像", "normal");
			
			txtFavMovie.text = "喜欢的电影";
			txtFavMovie.autoSize = TextFieldAutoSize.LEFT;
			txtFavMovie.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			var vrFavMovie:Vector.<String> = new Vector.<String>;
			vrFavMovie.push("动作片", "喜剧片", "爱情片", "科幻片", "恐怖片", "剧情片", "动画片", "连续剧");
			selFavMovie = new Miss_SelectComponent(elementWidth, elementHeight, vrFavMovie,true);
			selFavMovie.prompt = "您喜欢的电影";
			
			
			txtFavMusic.text = "喜欢的音乐";
			txtFavMusic.autoSize = TextFieldAutoSize.LEFT;
			txtFavMusic.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			var vrFavMusic:Vector.<String> = new Vector.<String>;
			vrFavMusic.push("流行", "摇滚", "民谣", "舞曲", "电子", "古典", "爵士", "乐器演奏", "民族音乐", "戏曲");
			selFavMusic = new Miss_SelectComponent(elementWidth, elementHeight+1, vrFavMusic,true);
			selFavMusic.prompt = "您喜欢的音乐";
			
			txtFavDomain.text = "感兴趣的领域";
			txtFavDomain.autoSize = TextFieldAutoSize.LEFT;
			txtFavDomain.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DETAILSBAR_MATCHCOMP));
			var vrFavDomain:Vector.<String> = new Vector.<String>;
			vrFavDomain.push("通俗歌曲", "民歌", "美声", "跳舞", "创意短片");
			selFavDomain = new Miss_SelectComponent(elementWidth, elementHeight + 1, vrFavDomain, true);
			selFavDomain.prompt = "您感兴趣的领域";
			
			btnSubmit = new Miss_Button("提交", 200, 30);
			
		}
		
		private function initStyle():void 
		{
			sprTitle.graphics.beginFill(0xECECEC);
			sprTitle.graphics.drawRect(0, 0, 860, 105);
			sprTitle.graphics.endFill();
			Mr_Dresser.drawLine(sprTitle, 0, 105, 860, 105, 0.5, 0XD8D8D8);
			
			sprContent.graphics.beginFill(0xF8F8F8);
			sprContent.graphics.drawRect(0, 0, 860, 595);
			sprContent.graphics.endFill();
			
			
		}
		
		private function setupImage():void 
		{
			var objTitle:Array = new Array();
			objTitle.push( { stuff:txtTitle, xPos: (sprTitle.width/2 - txtTitle.width/2), yPos: 30 } );
			objTitle.push( { stuff:txtTitleComp, xPos: (sprTitle.width / 2 - txtTitleComp.width / 2), yPos: 30 + txtTitle.height + 10 } );
			Mr_Layouter.layouter(sprTitle, objTitle);
			
			var objContent:Array = new Array();
			objContent.push( { stuff:btnSubmit, xPos:(sprContent.width-btnSubmit.width)/2, yPos:525 } );
			objContent.push( { stuff:txtName, xPos:elementX, yPos:40 } );
			objContent.push( { stuff:inputName, xPos:elementX, yPos:40 + txtName.height } );
			objContent.push( { stuff:txtSex, xPos:elementX, yPos:40 + txtName.height+inputName.height + 25 } );
			objContent.push( { stuff:txtBirthday, xPos:elementX, yPos:40 + txtName.height*2+inputName.height + 25*2 + 30 } );
			objContent.push( { stuff:inputYear, xPos:elementX, yPos:40 + txtName.height*3+inputName.height + 25*2 + 30 } );
			objContent.push( { stuff:inputDay, xPos:290, yPos:40 + txtName.height*3+inputName.height + 25*2 + 30 } );
			objContent.push( { stuff:txtDistrict, xPos:elementX, yPos:40 + txtName.height*3+inputName.height*2 + 25*3 + 30 } );
			objContent.push( { stuff:inputDistrict, xPos:elementX, yPos:40 + txtName.height*4+inputName.height*2 + 25*3 + 30 } );
			objContent.push( { stuff:txtAddress, xPos:elementX, yPos:40 + txtName.height*4+inputName.height*3 + 25*4 + 30 } );
			objContent.push( { stuff:inputAddress, xPos:elementX, yPos:40 + txtName.height*5+inputName.height*3 + 25*4 + 30 } );
			objContent.push( { stuff:txtProfession, xPos:elementX, yPos:40 + txtName.height*5+inputName.height*4 + 25*5 + 30 } );
			objContent.push( { stuff:inputProfession, xPos:elementX, yPos:40 + txtName.height*6+inputName.height*4 + 25*5 + 30 } );
			objContent.push( { stuff:txtQQ, xPos:elementX2, yPos:40 } );
			objContent.push( { stuff:inputQQ, xPos:elementX2, yPos:40 + txtName.height } );
			objContent.push( { stuff:txtFavIdol, xPos:elementX2, yPos:40 + txtName.height+inputName.height + 25 } );
			objContent.push( { stuff:inputFavIdol, xPos:elementX2, yPos:40 + txtName.height*2+inputName.height + 25 } );
			objContent.push( { stuff:txtFavMovie, xPos:elementX2, yPos:40 + txtName.height*2+inputName.height + 25*2 + 30 } );
			objContent.push( { stuff:txtFavMusic, xPos:elementX2, yPos:40 + txtName.height*3+inputName.height*2 + 25*3 + 30 } );
			objContent.push( { stuff:txtFavDomain, xPos:elementX2, yPos:40 + txtName.height*4+inputName.height*3 + 25*4 + 30  } );
			
			
			objContent.push( { stuff:selFavDomain, xPos:elementX2, yPos:40 + txtName.height*5+inputName.height*3 + 25*4 + 30  } );
			objContent.push( { stuff:selFavMusic, xPos:elementX2, yPos:40 + txtName.height*4+inputName.height*2 + 25*3 + 30  } );
			objContent.push( { stuff:selFavMovie, xPos:elementX2, yPos:40 + txtName.height*3+inputName.height + 25*2 + 30   } );
			
			objContent.push( { stuff:selMonth, xPos:153, yPos:40 + txtName.height*3+inputName.height + 25*2 + 30 } ); 
			objContent.push( { stuff:selSex, xPos:elementX, yPos:40 + txtName.height * 2 + inputName.height + 25 } );
			
			Mr_Layouter.layouter(sprContent, objContent);
			
			selFavDomain.name = "Domain";

			
			var objArr:Array = new Array();
			objArr.push( { stuff:sprTitle, xPos:0, yPos:0 } );
			objArr.push( { stuff:sprContent, xPos:0, yPos:106 } );
			Mr_Layouter.layouter(this, objArr);
			//sprContainer.opaqueBackground = 0xff0000;
			//addChild(sprContainer);
			//addChild(Mr_Dresser.drawBorder(sprContainer, 0xff0000, 1, true));
		}
		

		
	}

}