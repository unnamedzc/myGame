package com.containers
{
	import com.jeff.manager.PokerPool;
	
	import starling.display.Sprite;
	
	public class OtherPokerContainer extends Sprite
	{
		private var _layOut:uint;//0=horizontal,1=v
		private var _showNum:Boolean;
		private const _gapH:uint=100;
		private const _gapV:uint=100;
		public function OtherPokerContainer($layout:uint=0,$showNum:Boolean=true)
		{
			_layOut=$layout;
			_showNum=$showNum;
			super();
		}
		public function setPokers($vec:Vector.<uint>):void
		{
			this.unflatten();
			var _len:uint=$vec.length;
			for(var i:uint=0;i<_len;++i)
			{
				var _index:uint=$vec[i];
				
				addChild(PokerPool.getPokerObject(_index));
				PokerPool.getPokerObject(_index).showNum=_showNum;
						//v layout
					PokerPool.getPokerObject(_index).x=(i%4)*_gapH;
					PokerPool.getPokerObject(_index).y=uint(i/4)*_gapV;
				
			}
		}		
		//end function
		public function removeAllPoker():void{
			this.removeChildren();
			this.flatten();
		}
	}
}