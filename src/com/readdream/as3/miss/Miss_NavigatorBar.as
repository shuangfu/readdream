package com.readdream.as3.miss 
{
	import com.readdream.as3.VO.Vo_NavigatorElement;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_NavigatorBar extends Sprite 
	{
		private var _dataArr:Array;
		public function Miss_NavigatorBar(_dataArr:Array) 
		{
			this._dataArr = _dataArr;
			setupNavigatorBar();
		}
		
		private function setupNavigatorBar():void 
		{
			showChildList();
		}
		
		private function showChildList(node:Miss_NavigatorElement):void 
		{
			var nodeId:int = node.vo.nid;
			var tempXpos:Number = node.x;
			for (var i:int = 0; i < _dataArr.length; i++) 
			{
				if ((_dataArr[i] as Vo_NavigatorElement).fatherNid == nodeId) {
					//show him
					
				}
			}
		}
		private
		
		
		
		
		
		public function get dataArr():Array 
		{
			return _dataArr;
		}
		
		public function set dataArr(value:Array):void 
		{
			_dataArr = value;
		}
		
	}

}