package com.jeff.data
{

	public class PlayerData
	{
		public static var _MyPokerVector:Vector.<uint>;
	//	public static var _MyPokerNumVec:Vector.<uint>;
		public static var _MyRole:uint;//0,1,2
		
		public static var _MyChoosedCards:Vector.<uint>=new Vector.<uint>;//store choosed Poker ID
		public static function _sequencePoke():void{
			GlobalValue.sortVector(_MyPokerVector);
			
		}
		//end function
		public static function _popFromCard($card:uint):void
		{
			var _len:uint=_MyChoosedCards.length;
			for (var i:uint=0;i<_len;i++)
			{
				if(_MyChoosedCards[i]==$card)
				{
					_MyChoosedCards.splice(i,1);
					break;
				}
			}
		}
		//end function
		public static function _pushToCard($card:uint):void
		{
			_MyChoosedCards.push($card);
		}
		//end function
		public static function _sortChoosedPoker():void
		{
			
		}
		//end function 
	}
}