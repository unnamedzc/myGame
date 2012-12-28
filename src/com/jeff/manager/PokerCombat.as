package com.jeff.manager
{
	public class PokerCombat
	{
		public static const _PokerCompare:Vector.<String>=Vector.<String>(["1","11","111","1111","11111","111111","1111111","11111111"]);
		public static const _STRAIGHT:String="straight";//12345
		public static const FULL_HOUSE:String="fullhouse";//11122
		
		public static const FOUR_OF_KIND:String="Four of a kind";//1111
		public static const TRIPLE:String="triple";//111
		public static const PAIR:String="pair"//11
		public static const JET:String="jet"//111222
		public static const JET_CANON:String="jetcannon"//1112223344
		public static const _CANON:String="cannon"//11223344
		public static const TRIPLE_PAIR:String="triplepair";
		public static const BAD_STYLE:String='bad style;';
		public static var _choosedCards:Vector.<uint>=new Vector.<uint>;
		//About A
		private static var _aboutA:String;
		//
		public static function _popFromCard($card:uint):void
		{
			var _len:uint=_choosedCards.length;
			for (var i:uint=0;i<_len;i++)
			{
				if(_choosedCards[i]==$card)
				{
					_choosedCards.splice(i,1);
					break;
				}
			}
		}
		//end function
		public static function _pushToCard($card:uint):void
		{
			_choosedCards.push($card);
		}
		//judges
		public static function PokerStyleJudge():String
		{
			
			var _len:uint=_choosedCards.length;
			var _tempUint:uint=_choosedCards[0];
			var _styleNUm:uint=1;
			var i:uint=1;
			switch(_len)
			{
				case 2:
					if(_choosedCards[0]==_choosedCards[1])
						return PAIR;
					break;
				case 3:
					if(_choosedCards[0]==_choosedCards[1]&&_choosedCards[2]==_choosedCards[1])
						return TRIPLE;
					break;
				case 4:
					if(_choosedCards[0]==_choosedCards[1]&&_choosedCards[2]==_choosedCards[1]&&_choosedCards[2]==_choosedCards[3])
						return FOUR_OF_KIND;
					//FOUR_OF_KIND
					break;
				case 5:
					
					//_STRAIGHT not judge here
					if(JudgeIfLongStraight())
					{
						return _STRAIGHT;
					}else if(_choosedCards[0]==_choosedCards[1]&&_choosedCards[1]==_choosedCards[2]&&_choosedCards[0]!=_choosedCards[3]&&_choosedCards[4]==_choosedCards[3]||_choosedCards[0]==_choosedCards[1]&&_choosedCards[1]!=_choosedCards[2]&&_choosedCards[2]==_choosedCards[3]&&_choosedCards[4]==_choosedCards[3])
					{
						return FULL_HOUSE;
					}
					
					//fullhouse
					break;
				case 6:
					if(JudgeIfLongJet())					
						return JET;
					else if(judgeIfLongCanon())
						return _CANON;
					else if(JudgeIfLongStraight())
						return _STRAIGHT;
					//JET
					//3TRIPLE_PAIR
					break;
				/*case 10:
					if(_choosedCards[0]==_choosedCards[1]&&_choosedCards[1]==_choosedCards[2])
						return JET_CANON;
					//JET_CANON
					break;*/
				default:
					
					//JET
					//JET_CANON
					//STRAIGHT
					//FOUR_OF_KIND
					if(JudgeIfLongStraight())
					{
						return _STRAIGHT;
					}else if(JudgeIfLongSame())
					{
						return FOUR_OF_KIND;
					}else if(JudgeIfLongJet())
					{
						return JET;
					}else if(JudgeIfLongJetCanon())
					{
						return JET_CANON;
					}else if(judgeIfLongCanon())
					{
						return _CANON;
					}
					break;
			}
			
			return BAD_STYLE
		}		
		public static function _testCards():void
		{
			_choosedCards=Vector.<uint>([1,1,1,2,2,2,3,3,4,4]);
		}
		private static function JudgeIfLongStraight():Boolean
		{
			var _len:uint=_choosedCards.length;
			var i:uint;
			if(_choosedCards[_len-2]==14&&_choosedCards[_len-1]==2&&_choosedCards[0]==3)	
			{
				for(i=1;i<_len-2;++i)
				{
					if(_choosedCards[i-1]!=_choosedCards[i]-1)
					{
						return false;
					}
				}
			}
			else
			{
				for(i=1;i<_len;++i)
				{
					if(_choosedCards[i-1]!=_choosedCards[i]-1)
					{
						return false;
					}
				}
			}
			
			return true;
		}
		private static function JudgeIfFullHouse():Boolean
		{
			var _len:uint=_choosedCards.length;
			//11122;
			if(_len==5&&_choosedCards[0]==_choosedCards[1]&&_choosedCards[2]==_choosedCards[1]&&_choosedCards[3]==_choosedCards[4]&&_choosedCards[3]!=_choosedCards[0])
			{
				return true;
			}else
			{
				return false;
			}
		}
		private static function JudgeIfLongSame():uint
		{
			var _len:uint=_choosedCards.length;
			if(_len==1){
				return 1;
			}else
			{
				var _tempUint:uint=_choosedCards[0];
				for(var i:uint=1;i<_len;++i)
				{
					if(_choosedCards[i-1]!=_choosedCards[i])
					{
						return 0;
					}
				}
			}
			return _len;
		}
		private static function JudgeIfLongJet():Boolean
		{
			DeBug.LOG("Judge jet")
			var _len:uint=_choosedCards.length;
			if(_len%3!=0){
				DeBug.LOG("is not 3 cards")
				return false;
			}
			dealWithA(3,_len-1);
			for(var i:uint=0;i<_len;i+=3)
			{
				if(_choosedCards[i]!=_choosedCards[i+1]||_choosedCards[i]!=_choosedCards[i+2])
				{
					//112
					DeBug.LOG("3 cards is not same")
					return false;
				}else if(i+3<_len)
				{
					if(_choosedCards[i]+1!=_choosedCards[i+3])
					{
						//111333
						DeBug.LOG("2 pairs is not same")
						return false;
					}
				}
			}
			return true;			
		}
		private static function judgeIfLongCanon():Boolean
		{
			DeBug.LOG("Judge canon")
			var _len:uint=_choosedCards.length;
			if(_len%2!=0||_len<4){
				return false;
			}			
			for(var i:uint=0;i<_len;i+=2)
			{
				if(_choosedCards[i]!=_choosedCards[i+1])
				{
					return false;
					break;
				}else if(i+2<_len)
				{
					if(_choosedCards[i+1]+1!=_choosedCards[i+2])
					{
						return false;
						break;
					}
				}
			}
			return true;
		}
		private static function JudgeIfLongJetCanon():Boolean
		{
			DeBug.LOG("Judge jet canon")
			var _len:uint=_choosedCards.length;
			if(_len%5!=0){
				return false;
			}
			//jet first then cannon
			var _len1:uint=_len/5*3;
			for(var i:uint=0;i<_len1;i+=3)
			{
				if(_choosedCards[i]!=_choosedCards[i+1]||_choosedCards[i]!=_choosedCards[i+2])
				{
					//112
					return false;
					break;
				}else if(i+3<_len)
				{
					if(_choosedCards[i]+1!=_choosedCards[i+3])
					{
						//111333
						DeBug.LOG("2 pairs is not same")
						return false;
						break;
					}
				}
			}
			for(i=_len1;i<_len;i+=2)
			{
				if(_choosedCards[i]!=_choosedCards[i+1])
				{
					//112
					return false;
				}
			}
			return true;
		}
		public static function PokerCombatJudge():void{
			
		}
		//deal with A
		private static function dealWithA($num:uint,$len:uint):void
		{
			/*if(_choosedCards[0]==1&&_choosedCards[$len]==13)
			{
				for(var i:uint=0;i<$num;++i)
				{
					_choosedCards[i]=14;
				}
				GlobalValue.sortVector(_choosedCards);
			}*/
			if(_choosedCards[0]==1&&_choosedCards[$len]==13)
			{
				trace("13A")
			}
			else if(_choosedCards[0]==1&&_choosedCards[$num]==2)
			{
				trace("A2")
			}
			trace(_choosedCards);
			//return true
		}
	}
}