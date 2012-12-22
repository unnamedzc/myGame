package com.poker
{
	import com.jeff.manager.PokerPool;

	public class PokerFactory
	{
		private static const POKE_STYLE:uint=4;
		private static const POKE_STYLE_NUM:uint=13;
		private static const JOKER_NUM:uint=4;
		private static const POKE_COUPLE:uint=2;
		private static const POKE_WHOLE_NUM:uint=POKE_STYLE*POKE_STYLE_NUM*POKE_COUPLE+JOKER_NUM
		private static const GROWTH_VALUE:uint = POKE_WHOLE_NUM >> 1;
		//random poker
		public static var _pokerVector:Vector.<uint>=new Vector.<uint>;
		public static function InitPoker():void{
			PokerPool.initialize(POKE_WHOLE_NUM,GROWTH_VALUE);
			var currentPoker:Pokers;
			for(var i:uint=0;i<POKE_STYLE_NUM;++i)
				for(var j:uint=0;j<POKE_STYLE*POKE_COUPLE;++j)
				{
					currentPoker=PokerPool.getSprite();
					//createPokes
					switch(j){
						case 0:
						case 1:
							currentPoker._myNum="♠"
							currentPoker._myCol=0x000000
							break;
						case 2:
						case 3:
							currentPoker._myNum="♣"
							currentPoker._myCol=0x000000
							break;
						case 4:
						case 5:
							currentPoker._myNum="♥"
							currentPoker._myCol=0xff0000
							break;
						case 6:
						case 7:
							currentPoker._myNum="♦"
							currentPoker._myCol=0xff0000
							break;
					}					
					
					currentPoker._myNum+=("\n"+PokerStyle.POKER_NUM[i%13]);				
					
				}
			//joker
			for(i=0;i<JOKER_NUM;++i)
			{
				currentPoker=PokerPool.getSprite();
				currentPoker._myNum=PokerStyle.POKER_NUM[13];
				if(i<2){
					currentPoker._myCol=0x000000;
				}else{
					currentPoker._myCol=0xff0000;
				}				
			}
		}
		//end function
		public static function _RandomPoker():void{
			var _tempVector:Vector.<uint>=new Vector.<uint>(POKE_WHOLE_NUM);
			for(var i:uint=0;i<POKE_WHOLE_NUM;++i)
			{
				_tempVector[i]=i;
			}
			var _index:uint;	
			
			while(_tempVector.length>0){
				var _tempLen:uint=_tempVector.length-1;
				_index=Math.random()*_tempLen;
				_pokerVector.push(_tempVector[_index]);
				_tempVector.splice(_index,1);
			}
			
			_tempVector=new Vector.<uint>;
			_tempVector=null;
			
		}
	}
}