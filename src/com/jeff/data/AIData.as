package com.jeff.data
{
	
	import com.jeff.manager.PokerPool;
	
	import myEvents.Events;
	
	public class AIData
	{
		public var _AIPokerVector:Vector.<uint>;
		public static var _AIChoosedCards:Vector.<uint>;
		public var _AIRole:uint;
		public var _canUsedBomb:uint;
		//take owner Number;
		private const OWNER_BOMB_NUM:uint=2;
		private const OWNER_TRIPLE_NUM:uint=4;
		private const OWNER_JOKER_NUM:uint=3;
		public function AIData():void{
			
		}
		/*sort poke*/
		public function _sequenceAIPoke():void{
			GlobalValue.sortVector(_AIPokerVector);
		}
		//judge if AI want to be the landowner
		public function _judgeToBeMaster():void{
			var _bombNum:uint=0;
			var _JokerNum:uint=0;
			var _TripleNum:uint=0;
			var _vecLen:uint=_AIPokerVector.length;
			//trace(_AIPokerVector)
			var _addNum:uint=1;
			var _tempString:String;
			for(var i:uint=0;i<_vecLen;i++)
			{
				
				if(_tempString==_getPokerNum(PokerPool.getPokerObject(_AIPokerVector[i])._myNum))
				{
					//trace(_tempString)
					if(_tempString=="JOKER"){
						_JokerNum++;
					}else{
						
						_addNum++;		
					}
				}else{
					//trace(_addNum)
					if(_addNum==3){
						_TripleNum++;
					}else if(_addNum>=4){
						_bombNum++;
					}
					if(_tempString=="JOKER"){
						_JokerNum++;
					}
					_addNum=1;
					_tempString=_getPokerNum(PokerPool.getPokerObject(_AIPokerVector[i])._myNum);
				}
				
			}
			//trace(_bombNum,_TripleNum,_JokerNum)
			if(_bombNum==OWNER_BOMB_NUM||_TripleNum==OWNER_TRIPLE_NUM||_JokerNum==OWNER_JOKER_NUM)
			{
				DeBug.LOG("Player",GlobalValue._currentAnimatedPlayer,":I am the owner");
				GlobalValue._mutil=3;
				//textField
				//GlobalValue._HUDContainer.resetMultiNum();
				GlobalValue._mutilVec[GlobalValue._currentAnimatedPlayer]=GlobalValue._mutil;
				GlobalValue._PokerContainer.dispatchEvent(new Events(Events.AI_SET_MULTI,false,3));
			}else if(_bombNum==OWNER_BOMB_NUM/2||_TripleNum==OWNER_TRIPLE_NUM/2||_JokerNum==OWNER_JOKER_NUM/2)
			{
				if(GlobalValue._mutil<2)
				{
					GlobalValue._mutil++;
					GlobalValue._mutilVec[GlobalValue._currentAnimatedPlayer]=GlobalValue._mutil;
					//textField
					//GlobalValue._HUDContainer.resetMultiNum();
					DeBug.LOG("Player",GlobalValue._currentAnimatedPlayer,":I wanna to add mutil of the owner")
				}else
				{
					//textField
					//GlobalValue._HUDContainer.resetMultiNum();
					GlobalValue._mutilVec[GlobalValue._currentAnimatedPlayer]=1;
					DeBug.LOG("Player",GlobalValue._currentAnimatedPlayer,":I pass");
				}
				GlobalValue._PokerContainer.dispatchEvent(new Events(Events.AI_SET_MULTI,false,GlobalValue._mutil));
			}else
			{
				//textField
				//GlobalValue._HUDContainer.resetMultiNum();
				GlobalValue._mutilVec[GlobalValue._currentAnimatedPlayer]=1;
				DeBug.LOG("Player",GlobalValue._currentAnimatedPlayer,":I pass");
				GlobalValue._PokerContainer.dispatchEvent(new Events(Events.AI_SET_MULTI,false,GlobalValue._mutil));
			}
			GlobalValue._HUDContainer.resetMultiNum();
			
			
		}
		private function _getPokerNum($num:String):String{
			
			switch($num.charAt(2))
			{
				case "O":
					return "JOKER"
					break;
				case "1":
					return "10"
					break;
				default:
					return String($num.charAt(2));
					break;
			}
			
		}
		//end function
		public function _choosePoker():void
		{
			
		}
	}
}