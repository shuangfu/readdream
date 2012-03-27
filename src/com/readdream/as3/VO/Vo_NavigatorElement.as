package com.readdream.as3.VO 
{
	/**
	 * ...
	 * @author fs
	 */
	public class Vo_NavigatorElement 
	{
		private var _nid:uint;
		private var _lable:String;
		private var _fatherNid:uint;
		private var _url:String;
		
		public function Vo_NavigatorElement(_nid:uint,_lable:String,_fatherNid:uint,_url:String) 
		{
			this._fatherNid = _fatherNid;
			this._nid = _nid;
			this._url = _url;
			this._lable = _lable;
		}
		
		public function get nid():uint 
		{
			return _nid;
		}
		
		public function set nid(value:uint):void 
		{
			_nid = value;
		}
		
		public function get lable():String 
		{
			return _lable;
		}
		
		public function set lable(value:String):void 
		{
			_lable = value;
		}
		
		public function get fatherNid():uint 
		{
			return _fatherNid;
		}
		
		public function set fatherNid(value:uint):void 
		{
			_fatherNid = value;
		}
		
		public function get url():String 
		{
			return _url;
		}
		
		public function set url(value:String):void 
		{
			_url = value;
		}
		
	}

}