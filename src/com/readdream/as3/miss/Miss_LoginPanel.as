package com.readdream.as3.miss 
{
	import com.readdream.as3.mr.Mr_Dresser;
	import com.readdream.as3.robot.Robot_PicLoader;
	import com.readdream.as3.robot.Robot_TextFormater;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author evstar
	 */
	public class Miss_LoginPanel extends Sprite 
	{
		
		public function Miss_LoginPanel() 
		{
			var sprLogin:Sprite = new Sprite();
			sprLogin.graphics.beginFill(0xF8F8F8);
			sprLogin.graphics.drawRect(0, 0, 325, 270);
			sprLogin.graphics.endFill();
			
			var sprTitle:Sprite = new Sprite();
			sprTitle.graphics.beginFill(0xECECEC);
			sprTitle.graphics.drawRect(0, 0, 325, 50);
			sprTitle.graphics.endFill();
			Mr_Dresser.drawLine(sprTitle, 0, 50, 325, 50, 1, 0XE7E7E7);
			Mr_Dresser.drawLine(sprTitle, 0, 51, 325, 51, 1, 0XE8E8E8);
	
			
			var txtLogin:TextField = new TextField();
			txtLogin.autoSize = TextFieldAutoSize.LEFT;
			txtLogin.text = "用户登录";
			txtLogin.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DIALOG_TITLE));
			txtLogin.x = (sprTitle.width / 2) - (txtLogin.width / 2);
			txtLogin.y = (sprTitle.height / 2) - (txtLogin.height / 2);
			
			var txtEmail:TextField = new TextField();
			txtEmail.autoSize = TextFieldAutoSize.LEFT;
			txtEmail.text = "电子邮件";
			txtEmail.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DIALOG_CONTENTTITLE));
			txtEmail.x = 25;
			txtEmail.y = sprTitle.height + 20;
			
			var inputEmail:Miss_TextInput = new Miss_TextInput(275, 30, "", "email");
			inputEmail.x = 25;
			inputEmail.y = txtEmail.y + txtEmail.height + 5;
			
			var txtPassword:TextField = new TextField();
			txtPassword.autoSize = TextFieldAutoSize.LEFT;
			txtPassword.text = "密码";
			txtPassword.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.DIALOG_CONTENTTITLE));
			txtPassword.x = 25;
			txtPassword.y = inputEmail.y + inputEmail.height + 20;
			
			var inputPassword:Miss_TextInput = new Miss_TextInput(275, 30, "", "password");
			inputPassword.x = 25;
			inputPassword.y = txtPassword.y + txtPassword.height + 5;
			
			var picLogin:Robot_PicLoader = new Robot_PicLoader("assets/login.jpg", 0, 0, 47, 33);
			picLogin.x = 25;
			picLogin.y = inputPassword.y + inputPassword.height + 20;
			Mr_Dresser.addShadowFilter(picLogin, 0, 90, 0.65, 2, 4, 2);
			
			var picRegist:Robot_PicLoader = new Robot_PicLoader("assets/regist.jpg", 0, 0, 64, 33);
			picRegist.x = 25 + picLogin.width + 20;
			picRegist.y = inputPassword.y + inputPassword.height + 20;
			Mr_Dresser.addShadowFilter(picRegist, 0, 90, 0.65, 2, 4, 2);
			
			
			
			
			
			var sta:Sprite = Mr_Dresser.drawBorder(sprLogin, 0xE5E5E5, 1, true);
			sprLogin.addChild(sprTitle);
			sprTitle.addChild(txtLogin);
			sprLogin.addChild(txtEmail);
			sprLogin.addChild(inputEmail);
			sprLogin.addChild(txtPassword);
			sprLogin.addChild(inputPassword);
			sprLogin.addChild(picLogin);
			sprLogin.addChild(picRegist);
			sta.x = 100;
			sta.y = 100;
			addChild(sta);
		}
		
	}

}