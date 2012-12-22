package com.containers
{
	import com.jeff.manager.PokerPool;
	
	import starling.display.Sprite;
	
	public class PlayerPokerContainer extends Sprite
	{
		private var _layOut:uint;//0=horizontal,1=v
		private var _showNum:Boolean;
		private const _gapH:uint=28;
		private const _gapV:uint=45;
		private const _vertNum:uint=5;
		public function PlayerPokerContainer($layout:uint=0,$showNum:Boolean=true)
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
				if(_layOut==0)
				{
					//h layout
					PokerPool.getPokerObject(_index).x=i%25*_gapH;
					PokerPool.getPokerObject(_index).y=uint(i/25)*_gapV;
				}else
				{
					//v layout
					PokerPool.getPokerObject(_index).x=(i%_vertNum)*_gapH;
					PokerPool.getPokerObject(_index).y=uint(i/_vertNum)*_gapV;
				}
			}			
		}
		//end function
		public function removeAllPoker():void{
			this.removeChildren();
			this.flatten();
		}
	}
}