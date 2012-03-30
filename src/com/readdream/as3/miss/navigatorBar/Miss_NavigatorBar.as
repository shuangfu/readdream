package com.readdream.as3.miss.navigatorBar
{
	import com.greensock.TweenLite;
	import com.readdream.as3.vo.Vo_NavigatorElement;
	import de.polygonal.ds.TreeIterator;
	import de.polygonal.ds.TreeNode;
	import flash.display.GraphicsGradientFill;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	import com.greensock.plugins.*;
	
	/**
	 * ...
	 * @author fs
	 */
	public class Miss_NavigatorBar extends Sprite
	{
		private var _dataArr:Array;
		private var rootNode:TreeNode;
		private var tempX :int = 0;
		private var tempCount:int = 0;
		private var activeNoteData:Miss_NavigatorElement;
		private var tempNoteForCount:TreeNode;
		private var tempNoteForCountResult:int;
		
		
		
		public function Miss_NavigatorBar(_dataArr:Array)
		{
			TweenPlugin.activate([AutoAlphaPlugin]);
			this._dataArr = _dataArr;
			drawBackground();
			setupTree();
			//setupNavigatorBar();
			
			//将根节点的第几个孩子节点的data设为默认激活的节点
			//activeNoteData = (rootNode.getTreeIterator() as TreeIterator).childData;
			//activeNoteData.expanding = true;
			
			showChildList(rootNode);
		}
		
		private function drawBackground():void 
		{
			var scaleHeight:Number;
			scaleHeight = Capabilities.screenResolutionY;
			//trace(scaleHeight);
			this.graphics.beginFill(0xECECEC);
			//this.graphics.beginFill(0x00ff00);
			this.graphics.drawRect(0, 0, 240, scaleHeight);
			//this.graphics.drawRect(0, 0, 240, 100);
			this.graphics.endFill();
		}

		private function setupTree():void
		{
			var rootElement:Miss_NavigatorElement = new Miss_NavigatorElement(new Vo_NavigatorElement(0, "", ""));
			rootNode = new TreeNode(rootElement);
			
			for (var j:int = 0; j < _dataArr.length; j++)
			{
				if ((_dataArr[j] as Vo_NavigatorElement).fatherNid == 0)
				{
					//为_dataArr[j]新建node并设为_dataArr[i]的儿子
					var tempObj:Miss_NavigatorElement = new Miss_NavigatorElement(_dataArr[j]);
					//tempObj.addEventListener(MouseEvent.CLICK,elementClickHandler);
					var node:TreeNode = new TreeNode(tempObj, rootNode);
					tempObj.nodeObj = node;
				}
			}
			
			var treeIterator:TreeIterator = new TreeIterator(rootNode);
			
			
			while(treeIterator.childValid())
			{
				var i:int = 0;
				for (; i < _dataArr.length; i++)
				{
					if ((_dataArr[i] as Vo_NavigatorElement).fatherNid == (treeIterator.childData as Miss_NavigatorElement).vo.nid)
					{
						//为_dataArr[i]新建node并设为treeIterator.node的儿子
						var tempObj1:Miss_NavigatorElement = new Miss_NavigatorElement(_dataArr[i]);
						var node1:TreeNode = new TreeNode(tempObj1, treeIterator.childNode);
						tempObj1.nodeObj = node1;
					}
				}
				treeIterator.nextChild();
			}
		}
		
		private function elementClickHandler(e:MouseEvent):void 
		{
			var clickedNodeData:Miss_NavigatorElement = (e.currentTarget as Miss_NavigatorElement);
			expandMenu(clickedNodeData);
			//if (activeNoteData.expanding) {
				//收起原激活节点的子菜单
				//if(activeNoteData != clickedNodeData) {
					//展开原激活节点的子菜单
				//}
			//} else {
				//展开原激活节点的子菜单
			//}
		}
		
		private function expandMenu(nodeData:Miss_NavigatorElement) :void{
			var node:TreeNode = nodeData.nodeObj;
			var nodeIterator:TreeIterator = node.getTreeIterator();
			
			if (node.isLeaf()) {
				//叶子节点，无需展开子菜单，返回
				return;
			}
			//需要展开
			//新建子菜单容器
			var childContainer:Sprite = new Sprite();
			//向容器中加入孩子
			var tempYpos:Number = 0;
			while (nodeIterator.childValid()) {
				(nodeIterator.childData as Miss_NavigatorElement).y = tempYpos * 30;
				(nodeIterator.childData as Miss_NavigatorElement).x = 12.5;
				
				childContainer.addChild(nodeIterator.childData);
				nodeIterator.nextChild();
				tempYpos++;
				//trace("-- "+tempYpos);
			}
			//在菜单最底层显示，以方便关闭时被遮罩
			childContainer.y = nodeData.y + 30;//子菜单容器初始所在Y坐标+30
			//addChildAt(childContainer, 0);
			addChild(childContainer);
			
			//加入透明度动画
			//TweenLite.from(childContainer, 0.3, { autoAlpha:0 } );
			//加入位移动画，需计算停止后实际所在位置
			//其终止位置的Y坐标为父节点在父层中的序数 * 30像素  （向上递推每一层并累加）
			//var tempIterator:TreeIterator = node.getTreeIterator();
			//var tempCounter:int = 0;
			//tempIterator.up();
			//while (tempIterator.node != rootNode) {
				//tempCounter++;
				//if (tempIterator.prevChild) {
					//
				//}
			//}
			
			counter(node);
			var tempTy:Number = counter(node) * 30 + 30;
			TweenLite.to(childContainer, 3, { y: tempTy } );
			
			//还原计数器
			tempCount = 0;
			//改状态位
			nodeData.expanding = true;
		}
		
		private function counter(node:TreeNode):int 
		{
			var tempIt:TreeIterator = node.getTreeIterator();
			var tempCountNum : int = 0;
			tempIt.up();
			tempIt.childStart();
			while (tempIt.childValid()) {
				if (tempIt.childNode == node) {
					return tempCountNum;
				}
				tempIt.nextChild();
				tempCountNum++;
			}
			return 0;
		}
		
		private function setupNavigatorBar():void
		{
			//showChildList();
		}
		
		private function showChildList(node:TreeNode):void
		{
			var nodeIterator:TreeIterator = new TreeIterator(node);
			
			//nodeIterator.down();
			//
			//nodeIterator.childStart();
			//while (nodeIterator.childValid()) {
				//trace(tempX + (nodeIterator.data as Miss_NavigatorElement).vo.lable);
				//addChild(nodeIterator.childData);
				//(nodeIterator.childData as Miss_NavigatorElement).y = tempX * 30 + 200;
				//nodeIterator.next();
				//nodeIterator.nextChild();
				//
				//tempX++;
			//}
			TreeIterator.preorder(nodeIterator.node,addElement);
		}
		
		private function addElement(node1:TreeNode):void 
		{
			if (node1.data.vo.nid > 0 && node1.data.vo.fatherNid == 0) {
				addChild(node1.data);
				node1.data.x = 12.5;
				node1.data.y = tempX * 30;
				tempX++;
			}
		}
		
		private function hideChildList():void
		{
		
		}
		
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