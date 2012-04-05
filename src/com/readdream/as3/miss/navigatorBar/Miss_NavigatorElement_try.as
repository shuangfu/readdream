package com.readdream.as3.miss.navigatorBar
{
	import com.greensock.easing.Circ;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Quart;
	import com.greensock.easing.Sine;
	import com.greensock.plugins.AutoAlphaPlugin;
	import com.greensock.plugins.MotionBlurPlugin;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.readdream.as3.event.NavigatorBarElementMoveEvent;
	import com.readdream.as3.event.NavigatorBarEvent;
	import com.readdream.as3.robot.Robot_TextFormater;
	import com.readdream.as3.vo.Vo_NavigatorElement;
	import de.polygonal.ds.TreeIterator;
	import de.polygonal.ds.TreeNode;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_NavigatorElement_try extends Sprite
	{
		private var _vo:Vo_NavigatorElement;
		private var textField:TextField;
		private var backgroundShape:Shape;
		private var _textSize:Number;
		private var _activedFlag:Boolean;
		private var _expanding:Boolean;
		private var _nodeObj:TreeNode;
		private var _childContainer:Sprite;
		public var moveDistance:Number = 0;
		public var memory:Number = 0;
		
		public function Miss_NavigatorElement_try(_vo:Vo_NavigatorElement)
		{
			TweenPlugin.activate([AutoAlphaPlugin]);
			TweenPlugin.activate([TintPlugin]);
			TweenPlugin.activate([MotionBlurPlugin]);
			_expanding = false;//默认每个节点都未展开
			_activedFlag = false;
			this._vo = _vo;
			drawBackground();
			addTextField();
			registerEvent();
			turnThisToNormal();
		}
		
		private function registerEvent():void 
		{
			this.addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
			this.addEventListener(MouseEvent.ROLL_OUT,rollOutHandler);
			this.addEventListener(MouseEvent.CLICK, clickHandler);
			this.addEventListener(Event.ADDED_TO_STAGE, addEvent);
		}
		private function addEvent(e:Event):void {
			memory =  this.y;
			parent.addEventListener(NavigatorBarEvent.NEW_KID_IN_TOWN, newKidHandler);
			parent.addEventListener(NavigatorBarEvent.WE_LOST_HIM, weLostHimHandler);
			parent.addEventListener(NavigatorBarEvent.NAVIGATOR_ELEMENT_CLICK, handleCilckEvent);
			parent.addEventListener(NavigatorBarElementMoveEvent.BEGIN_TO_MOVE,beginMoveHandler);
		}
		
		private function beginMoveHandler(e:NavigatorBarElementMoveEvent):void 
		{
			//TweenLite.to(this, 0.3, {y:moveDistance.toString } );
			memory = memory + moveDistance;
			if (moveDistance != 0) {
				moveDistance = 0;
				TweenLite.to(this, 0.25, { y: memory,motionBlur:true} );
				
			}
			//this.y = memory;
			
			//trace("|||||||||||||||移动完成||||||||||||||||||||||");
		}
		
		private function weLostHimHandler(e:NavigatorBarEvent):void 
		{
			if (this.stage != null && e.nodeSerial < this.vo.nid) {
				//trace(this.vo.nid + "已向上移动");
				moveDistance -= 30;
				//this.y -= 30;
			}
		}
		
		private function newKidHandler(e:NavigatorBarEvent):void 
		{
			//trace("我是" + this.vo.nid + "," + e.nodeSerial + "已加载完成");
			if (this.stage != null && e.nodeSerial < this.vo.nid) {
				//trace(this.vo.nid + "向下移动");
				moveDistance += 30;
				//this.y += 30;
			}
		}
		private function closeChildMenu() :void {
			var iterator : TreeIterator = new TreeIterator(this.nodeObj);
			//trace(this.vo.nid + ":我要被关闭....................");
			while (iterator.childValid()) {
				//透明度变成零
				if (iterator.childData.stage != null) {
					//var tempArr:Array = new Array();
					//tempArr.push(iterator.childData);
					//TweenLite.to(iterator.childData, 0.3, { alpha:0 ,onComplete:removeChildNote,onCompleteParams:tempArr} );
					//trace(iterator.childData.vo.nid + " goodbye everybody 再见");
					TweenLite.to(iterator.childData,0.25, { alpha:0 ,ease:Circ.easeIn,onComplete:removeChildHandler,onCompleteParams:[iterator.childData],overwrite:1});
					//iterator.childData.parent.removeChild(iterator.childData);
					//通知所有人，他走了             
					var tempN:int = iterator.data.vo.nid + iterator.node.numChildren;
					var navEvent:NavigatorBarEvent = new NavigatorBarEvent(NavigatorBarEvent.WE_LOST_HIM,tempN);
					parent.dispatchEvent(navEvent);
				}
				iterator.nextChild();
			}
			expanding = false;
			//trace(this.vo.nid + ":我已经被关闭");
		}
		
		private function removeChildHandler(target:Object):void 
		{
			target.parent.removeChild(target);
			//trace(target.vo.nid + "has been removed");
		}
		
		private function openChildMenu():void {
			var iterator : TreeIterator = new TreeIterator(this.nodeObj); 
			var tempXpos:int = 1;
			//trace("				" + this.vo.nid + "：我要被打开");
			while (iterator.childValid()) {
				//如果孩子不在舞台上，addchild
				iterator.childData.x = iterator.data.x;
				iterator.childData.y = iterator.data.memory + iterator.data.moveDistance + tempXpos * 30;
				
				//透明度从零变到100
				iterator.childData.alpha = 0;
				TweenLite.to(iterator.childData,0.25,{ease:Circ.easeIn,alpha:1,overwrite:1});
				if (iterator.childData.stage == null) {
					//trace("孩子"+tempXpos+"不在舞台上");
					if (this.stage != null) {//自己在舞台上
						this.parent.addChildAt(iterator.childData,0);
					}
				}
				
				
				
				//TweenLite.to(iterator.childData, 0.3, { alpha:1 } );
				//trace("已显示孩子"+tempXpos + "alpha:" + iterator.childData.alpha);
				//通知所有人，他来了
				var navEvent:NavigatorBarEvent = new NavigatorBarEvent(NavigatorBarEvent.NEW_KID_IN_TOWN,iterator.node.numChildren + this.vo.nid);
				parent.dispatchEvent(navEvent);
				iterator.nextChild();
				tempXpos++;
			}
			expanding = true;
			//trace(this.vo.nid + "：我已经完全被打开");
		}
		
		
		public function handleCilckEvent(e:NavigatorBarEvent):void {
			
			//_activedFlag = true;
			//_activedFlag = !_activedFlag;
			//if (_activedFlag) {
			//} else {
				//textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_NORMAL_REGULAR));
				//turnThisToNormal();
			//}
			//trace("========点击的是：",e.nodeSerial + "==========");
			//展开或关闭
			if (this._expanding) {//如果自己是展开的
				//关闭
				//trace("			" + this.vo.nid + "：自己是展开的");
				//trace("				" + this.vo.nid + "正准备关闭");
				//点击的不是我的child
				if ((e.nodeSerial <= this.vo.nid) || (e.nodeSerial > (this.vo.nid + this.nodeObj.numChildren))) 
				{
					//trace("^^" + e.nodeSerial);
					//trace("**" + this.vo.nid + "$$" + this.nodeObj.numChildren);
					
					closeChildMenu();
				} else {//点击的子菜单 父节点蓝色
					
				}
				//触发动画    仅当点击的节点比自己的序数小的时候，关闭自己才是最后触发的动作
				if (e.nodeSerial <= this.vo.nid) {
					var updateEvent:NavigatorBarElementMoveEvent = new NavigatorBarElementMoveEvent(NavigatorBarElementMoveEvent.BEGIN_TO_MOVE);
					parent.dispatchEvent(updateEvent);
				}
				
			} else { //自己是关闭的 
				//trace("			" + this.vo.nid + "：自己是关闭的");
				if (e.nodeSerial == this.vo.nid) {//是否点击的是我
					//展开
					//trace("			" + this.vo.nid + "：点击的是我");
					openChildMenu();
					//开始移动
					//var navEvent1:NavigatorBarElementMoveEvent = new NavigatorBarElementMoveEvent(NavigatorBarElementMoveEvent.BEGIN_TO_MOVE);
					//parent.dispatchEvent(navEvent1);
					//触发动画    仅当点击的节点比自己的序数小的时候，关闭自己才是最后触发的动作
					if (e.nodeSerial <= this.vo.nid) {
						var updateEvent1:NavigatorBarElementMoveEvent = new NavigatorBarElementMoveEvent(NavigatorBarElementMoveEvent.BEGIN_TO_MOVE);
						parent.dispatchEvent(updateEvent1);
					}
				} else { //不理会
					
				}
			}
			//设置激活或非激活状态
			if (e.nodeSerial == this.vo.nid) {//是否点击的是我 
				//我激活
				_activedFlag = true;
				//set text font style
				textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_ACTIVED_REGULAR));
				turnThisToActived();
			} else {
				//设我为不激活
				_activedFlag = false;
				if (this.expanding == true) {
					textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_ACTIVED_SPECIAL));
					turnThisToSpecial();
				} else {
					textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_NORMAL_REGULAR));
					turnThisToNormal();
				}
			}
			
		}
		
		
			
			
		private function rollOverHandler(e:MouseEvent):void 
		{
			//set text font style
			if (!_activedFlag) 
			{
				textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_MOUSEON_REGULAR));
			}
			
			//set background
		}
		
		private function rollOutHandler(e:MouseEvent):void 
		{
			//set text font style
			if (!_activedFlag) 
			{
				textField.setTextFormat(Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_NORMAL_REGULAR));
			}
			//set background
		}
		
		private function clickHandler(e:MouseEvent):void 
		{
			//trace("==========================================CLICK=================================================");
			var _navigatorCilckEvent:NavigatorBarEvent = new NavigatorBarEvent(NavigatorBarEvent.NAVIGATOR_ELEMENT_CLICK,this.vo.nid);
            parent.dispatchEvent(_navigatorCilckEvent);
		}
		
		private function turnThisToSpecial():void 
		{
			TweenLite.to(backgroundShape, 0, { tint:0xECECEC } );
			TweenMax.to(textField, 0, { dropShadowFilter: { color:0xf5f5f5, alpha:1, blurX:2, blurY:2, angle:90, distance:1 }} );
		}
		
		private function addTextField():void
		{
			//get the size of font
			var tempTextFormat:TextFormat = Robot_TextFormater.getTextFormat(Robot_TextFormater.NAVIGATOR_NORMAL_REGULAR);
			_textSize = tempTextFormat.size.toString();
			
			textField = new TextField();
			textField.type = TextFieldType.DYNAMIC;
			textField.autoSize = TextFieldAutoSize.NONE;
			textField.selectable = false;
			//textField.maxChars = Math.floor((_tiWidth - 40) / _textSize * 2);
			//trace(textField.maxChars);
			textField.multiline = false;
			textField.text = _vo.lable;
			textField.setTextFormat(tempTextFormat);
			//textField.border = true;
			textField.width = 215 - 40;
			textField.height = _textSize + 4;
			textField.y = (30 - textField.height) / 2;
			
			
			
			//place it
			if (_vo.fatherNid == 0) 
			{
				textField.x = 20;
					
			} else {
				textField.x = 40;
				textField.width = 215 - 40 - 20;
			}

			addChild(textField);
		}
		
		public function get activedFlag():Boolean 
		{
			return _activedFlag;
		}
		
		public function set activedFlag(value:Boolean):void 
		{
			_activedFlag = value;
		}
		
		public function get vo():Vo_NavigatorElement 
		{
			return _vo;
		}
		
		public function set vo(value:Vo_NavigatorElement):void 
		{
			_vo = value;
		}
		
		
		
		public function get nodeObj():TreeNode 
		{
			return _nodeObj;
		}
		
		public function set nodeObj(value:TreeNode):void 
		{
			_nodeObj = value;
		}
		
		public function get childContainer():Sprite 
		{
			return _childContainer;
		}
		
		public function set childContainer(value:Sprite):void 
		{
			_childContainer = value;
		}
		
		public function get expanding():Boolean 
		{
			return _expanding;
		}
		
		public function set expanding(value:Boolean):void 
		{
			_expanding = value;
		}
		private function drawBackground():void 
		{
			backgroundShape = new Shape();
			
			backgroundShape.graphics.beginFill(0xffffff);
			
			backgroundShape.graphics.drawRoundRect(0, 0, 215, 30, 5, 5);
			backgroundShape.graphics.endFill();
			addChild(backgroundShape);
		}
		
		private function turnThisToActived():void {
			TweenLite.to(backgroundShape, 0, { tint:0x5080D8 } );
			TweenMax.to(textField, 0, { dropShadowFilter: { color:0x000000, alpha:0.3, blurX:2, blurY:2, angle:270, distance:1 }} );
		}
		private function turnThisToNormal():void {
			TweenLite.to(backgroundShape, 0, { tint:0xECECEC } );
			TweenMax.to(textField, 0, { dropShadowFilter: { color:0xf5f5f5, alpha:1, blurX:2, blurY:2, angle:90, distance:1 }} );
		}
		//public function removeChildNote(arr:Miss_NavigatorElement):void {
			//if (arr.stage != null) 
			//{
				//arr.parent.removeChild(arr);
			//}
		//}
	}

}