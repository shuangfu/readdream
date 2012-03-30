package com.readdream.as3.robot 
{
	import com.readdream.as3.miss.Miss_MatchThumb;
	import com.readdream.as3.vo.Vo_Match;
	/**
	 * ...
	 * @author fs
	 */
	public class Robot_MissMatchThumbFactory 
	{
		
		public function Robot_MissMatchThumbFactory() 
		{
			
		}
		public static function getMissMatchThumbs(dataArr:Array):Array {
			trace("there has " + dataArr.length +" Miss_MatchThumbs");
			var miss_MatchThumbArr:Array = new Array();
			for (var temp:int = 0; temp < dataArr.length; temp++)
			{
				var imgURLArr:Array;
				var tempObj:Object = dataArr[temp];
				imgURLArr = tempObj.picture.split(",");
				var vo:Vo_Match = new Vo_Match();
				vo.picture = imgURLArr;
				vo.matchIcon = tempObj.matchIcon;
				vo.matchTitle = tempObj.matchTitle;
				vo.matchComp = tempObj.matchComp;
				vo.matchType = tempObj.matchType;
				vo.matchFrom = tempObj.matchFrom;
				vo.matchApplyUsers = tempObj.matchApplyUsers;
				vo.matchContent = tempObj.matchContent;
				vo.matchInformation1 = tempObj.matchInformation1;
				vo.matchInformation2 = tempObj.matchInformation2;
				vo.matchInformation3 = tempObj.matchInformation3;
				vo.matchInformation4 = tempObj.matchInformation4;
				vo.matchInformation5 = tempObj.matchInformation5;
				vo.matchImportant = tempObj.matchImportant;
				var tempMatchComp:Miss_MatchThumb = new Miss_MatchThumb(vo);
				
				miss_MatchThumbArr.push(tempMatchComp);
			}
			return miss_MatchThumbArr;
		}
		
	}

}