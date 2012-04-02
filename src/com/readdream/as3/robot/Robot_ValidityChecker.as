package com.readdream.as3.robot 
{
	/**
	 * ...
	 * @author fs
	 */
	public class Robot_ValidityChecker 
	{
		//private static const USER_NAME_RE:RegExp = /^[a-zA-Z0-9_\u4e00-\u9fa5]{6,12}$/i;
		private static const PASS_WORD_RE:RegExp = /^[a-zA-Z0-9_]+$/i;
		private static const EMAIL_RE:RegExp = /^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/i;
                        
		public function Robot_ValidityChecker() 
		{
			
		}
		
	}

}



















package common
{
        /**
         * 检查注册登陆界面中的
         * 用户名、密码、邮箱格式是否合法
         * @author lzl
         */
        public class CheckInputInfo
        {
                //用户名、密码、邮箱格式
                private static const USER_NAME_RE:RegExp = /^[a-zA-Z0-9_\u4e00-\u9fa5]{6,12}$/i;
                private static const PASS_WORD_RE:RegExp = /^[a-zA-Z0-9_]+$/i;
                private static const EMAIL_RE:RegExp = /^[a-z0-9_\-]+(\.[_a-z0-9\-]+)*@([_a-z0-9\-]+\.)+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)$/i;
                        
                /*
                 * 检查用户名是否合法
                 * 允许汉字、英文、数字、下划线组合
                 * 6 <= 长度 <= 12  
                 */ 
                //public static function checkUserName(userName:String):Boolean
                //{
                        //if (USER_NAME_RE.test(userName) && userName.length <= 12)
                                //return true;
                        //return false;
                //}
                /*
                 * 检查密码是否合法
                 * 允许英文、数字、下划线组合
                 * 长度>=6
                 */ 
                public static function checkPasswd(passwd:String):Boolean
                {
                        if (PASS_WORD_RE.test(passwd) && passwd.length >= 6)
                                return true;
                        return false;
                }
                /*
                 * 检查邮箱是否合法
                 */ 
                public static function checkEmail(mail:String):Boolean
                {
                        if (EMAIL_RE.test(mail))
                                return true;
                        return false;
                }
                
                //输入注册信息的提示        
                //public static function getUserNameTip():String
                //{
                        //return "允许汉字、英文、数字、下划线组合,不超过12位!";
                //}
                
                public static function getPasswdTip():String
                {
                        return "密码必须大于等于6位,仅字母、数字和下划线!";
                }

                public static function getRepasswdTip():String
                {
                        return "两次输入密码必须一致!";
                }
                public static function getEmailTip():String
                {
                        return "邮件格式如:abc@qq.com!";
                }
                
                public static function getInputRightTip():String
                {
                        return "√";
                }
        }
}