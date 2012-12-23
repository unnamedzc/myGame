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
		public static const TRIPLE_PAIR:String="triplepair";
		public static const BAD_STYLE:String='bad style;';
		public static var _choosedCards:Vector.<uint>=new Vector.<uint>;
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
					//_STRAIGHT
					break;
				case 6:
					//JET
					//3TRIPLE_PAIR
					break;
				case 10:
					//JET_CANON
					break;
				default:
					//JET
					//JET_CANON
					//STRAIGHT
					//FOUR_OF_KIND
					break;
			}
			
			return BAD_STYLE
		}
		public static function _testCards():void
		{
			_choosedCards=Vector.<uint>([1,1,1,2,2,2,3,3,4,4]);
		}
		public static function JudgeIfStraight(_choosedCards:Vector):Boolean
		{
			var _len:uint=_choosedCards.length;
			var _tempUint:uint=_choosedCards[0];			
			for(var i:uint=1;i<_len;++i)
			{
				if(_choosedCards[i-1]!=_choosedCards[i]+1)
				{
					return false;
				}
			}
			
			return true;
		}
		public static function JudgeIfFullHouse():Boolean
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
		public static function JudgeIfSame():uint
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
		public static function JudgeIfJet():Boolean
		{
			DeBug.LOG("Judge jet")
			var _len:uint=_choosedCards.length;
			if(_len%3!=0){
				DeBug.LOG("is not 3 cards")
				return false;
			}
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
		public static function JudgeIfJetCanon():Boolean
		{
			DeBug.LOG("Judge jet canon")
			var _len:uint=_choosedCards.length;
			if(_len%5!=0){
				return false;
			}
			var _len1:uint=_len/5*3;
			for(var i:uint=0;i<_len1;i+=3)
			{
				if(_choosedCards[i]!=_choosedCards[i+1]||_choosedCards[i]!=_choosedCards[i+2])
				{
					//112
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
	}
}