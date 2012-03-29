package com.readdream.as3.vo 
{
	/**
	 * Match实体类
	 * @author evstar
	 * 
	 */
	public class Vo_Match 
	{
		private var _picture:Array;						//活动图片数组
		private var _matchIcon:String;					//活动图标
		private var _matchTitle:String;					//活动标题
		private var _matchComp:String					//活动介绍
		private var _matchType:String;					//活动类型
		private var _matchFrom:String;					//活动来源
		private var _matchApplyUsers:int;				//活动参与人数
		private var _matchContent:String;				//活动详情
		private var _matchInformation1:String;			//活动元数据1
		private var _matchInformation2:String;			//活动元数据2
		private var _matchInformation3:String;			//活动元数据3
		private var _matchInformation4:String;			//活动元数据4
		private var _matchInformation5:String;			//活动元数据5
		private var _matchImportint:int;				//活动重要性
		
		
		public function Vo_Match() 
		{
			
		}
		
		/**
		 * 活动图片
		 * Type：Array
		 * 
		 * */
		public function get picture():Array 
		{
			return _picture;
		}
		
		public function set picture(value:Array):void 
		{
			_picture = value;
		}
		
		/**
		 * 活动图标地址
		 * Type: String
		 *	
		 * 
		 * */
		public function get matchIcon():String 
		{
			return _matchIcon;
		}
		
		public function set matchIcon(value:String):void 
		{
			_matchIcon = value;
		}
		
		/**
		 * 活动标题
		 * Type:String
		 * 
		 * */
		public function get matchTitle():String 
		{
			return _matchTitle;
		}
		
		public function set matchTitle(value:String):void 
		{
			_matchTitle = value;
		}
		
		/**
		 * 活动介绍
		 * Type:String
		 */
		public function get matchComp():String 
		{
			return _matchComp;
		}
		
		public function set matchComp(value:String):void 
		{
			_matchComp = value;
		}
		
		/**
		 * 活动类型
		 * Type:String
		 */
		public function get matchType():String 
		{
			return _matchType;
		}
		
		public function set matchType(value:String):void 
		{
			_matchType = value;
		}
		
		/**
		 * 活动来源
		 * Type:String
		 */
		public function get matchFrom():String 
		{
			return _matchFrom;
		}
		
		public function set matchFrom(value:String):void 
		{
			_matchFrom = value;
		}
		
		/**
		 * 活动参与人数
		 * Type:int
		 */
		public function get matchApplyUsers():int 
		{
			return _matchApplyUsers;
		}
		
		public function set matchApplyUsers(value:int):void 
		{
			_matchApplyUsers = value;
		}
		
		/**
		 * 活动内容
		 * Type:String
		 */
		public function get matchContent():String 
		{
			return _matchContent;
		}
		
		public function set matchContent(value:String):void 
		{
			_matchContent = value;
		}
		
		/**
		 * 活动元数据1
		 * Type:String
		 */
		public function get matchInformation1():String 
		{
			return _matchInformation1;
		}
		
		public function set matchInformation1(value:String):void 
		{
			_matchInformation1 = value;
		}
		
		/**
		 * 活动元数据2
		 * Type:String
		 */
		public function get matchInformation2():String 
		{
			return _matchInformation2;
		}
		
		public function set matchInformation2(value:String):void 
		{
			_matchInformation2 = value;
		}
		
		/**
		 * 活动元数据3
		 * Type:String
		 */
		public function get matchInformation3():String 
		{
			return _matchInformation3;
		}
		
		public function set matchInformation3(value:String):void 
		{
			_matchInformation3 = value;
		}
		
		/**
		 * 活动元数据4
		 * Type:String
		 */
		public function get matchInformation4():String 
		{
			return _matchInformation4;
		}
		
		public function set matchInformation4(value:String):void 
		{
			_matchInformation4 = value;
		}
		
		/**
		 * 活动元数据5
		 * Type:String
		 */
		public function get matchInformation5():String 
		{
			return _matchInformation5;
		}
		
		public function set matchInformation5(value:String):void 
		{
			_matchInformation5 = value;
		}
		
		/**
		 * 活动重要性
		 * 是否大图小图
		 */
		public function get matchImportint():int 
		{
			return _matchImportint;
		}
		
		public function set matchImportint(value:int):void 
		{
			_matchImportint = value;
		}
		
	}

}