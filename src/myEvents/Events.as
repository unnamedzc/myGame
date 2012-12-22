package myEvents
{
	import starling.events.Event;
	
	public class Events extends Event
	{
		public var _data:Object;
		public static const AI_SET_MULTI:String="aisetmulti";
		public static const MY_START_ROUND:String="mystartround";
		public static const MY_NEXT_PLAYER:String="mynextplayer";
		//public static const START_ROUND:String="startround";
		public function Events(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
			_data=data;
		}
	}
}