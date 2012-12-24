package
{
	import com.containers.HUDContainer;
	
	import starling.display.Sprite;

	public class GlobalValue
	{
		public static var _stageWidth:uint;
		public static var _stageHeight:uint;
		
		public static const _deBug:Boolean=true;
		public static var _mutil:uint=1;
		//multiVect
		public static var _mutilVec:Vector.<uint>=new Vector.<uint>(4);
		//alone
		public static var _HUDContainer:HUDContainer;
		public static var _PokerContainer:Sprite;
		//startPlayer
		public static var _RandomStart:uint;
		public static var _GameStarted:Boolean=false;
		//player
		public static var _startPlayer:uint;
		public static var _currentAnimatedPlayer:uint;
		//role
		public static const LAND_OWNER:uint=2;
		public static const FARMER:uint=1;
		public static const DOOR:uint=0;
		//vector sort
		public static function sortVector(Vec:Vector.<uint>):void{
			Vec.sort(sortNumbers);			
			function sortNumbers(x:uint, y:uint):Number
			{
				if (x < y)
				{
					return -1;
				}
				else if (x > y)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			}
		}
		//end function
		public static function _idToNum($id:uint):uint
		{
			var _tempNum:uint;
			if($id>=0&&$id<=1){
				_tempNum=16
			}else if($id>=2&&$id<=3){
				_tempNum=15
			}else if($id>=4&&$id<=11){
				_tempNum=2
			}else if($id>=12&&$id<=19){
				//A
				_tempNum=14
			}else if($id>=20&&$id<=27){
				_tempNum=13
			}else if($id>=28&&$id<=35){
				_tempNum=12
			}else if($id>=36&&$id<=43){
				_tempNum=11
			}else if($id>=44&&$id<=51){
				_tempNum=10
			}else if($id>=52&&$id<=59){
				_tempNum=9
			}else if($id>=60&&$id<=67){
				_tempNum=8
			}else if($id>=68&&$id<=75){
				_tempNum=7
			}else if($id>=76&&$id<=83){
				_tempNum=6
			}else if($id>=84&&$id<=91){
				_tempNum=5
			}else if($id>=92&&$id<=99){
				_tempNum=4
			}else if($id>=100&&$id<=107){
				_tempNum=3
			}
			return _tempNum
		}
		//end function
		public static function _getPokerNum($num:String):uint{
			//trace($num.charAt(2))
			switch($num.charAt(2))
			{
				case "J":
					return 11
					break;
				case "Q":
					return 12
					break;
				case "K":
					return 13
					break;
				case "A":
					return 1
					break;
				//joker
				case "O":
					return 14
					break;
				case "1":
					return 10
					break;
				default:
					return uint($num.charAt(2));
					break;
			}
			
		}
		//end function
	}
}