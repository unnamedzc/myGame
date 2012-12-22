package com.jeff.manager
{
	import com.poker.Pokers;
	public class PokerPool
	{
		private static var MAX_VALUE:uint; 
		private static var GROWTH_VALUE:uint;
		private static var PokerPool:Vector.<Pokers>;
		private static var counter:uint; 
		private static var currentPoker:Pokers;
		public function PokerPool()
		{
			
		}
		public static function initialize( maxPoolSize:uint, growthValue:uint ):void 
		{ 
			MAX_VALUE = maxPoolSize; 
			GROWTH_VALUE = growthValue; 
			counter = maxPoolSize; 
			var i:uint = maxPoolSize; 
			
			PokerPool = new Vector.<Pokers>(MAX_VALUE); 
			while( --i > -1 ) 
			{
				PokerPool[i] = new Pokers(); 
				PokerPool[i]._id=i;				
			}
		} 
		public static function getSprite():Pokers 
		{ 
			if ( counter > 0 ) 
				return currentPoker = PokerPool[--counter]; 
			
			var i:uint = GROWTH_VALUE; 
			while( --i > -1 ) 
				PokerPool.unshift ( new Pokers() ); 
			counter = GROWTH_VALUE; 
			return getSprite(); 
			
		} 
		
		public static function disposeSprite(disposedSprite:Pokers):void 
		{ 
			PokerPool[counter++] = disposedSprite; 
		}
		public static function getPokerObject($num:uint):Pokers{
			return PokerPool[$num];
		}
	}
}