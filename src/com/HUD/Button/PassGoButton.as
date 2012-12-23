package com.HUD.Button
{
	
	import com.jeff.data.PlayerData;
	
	import starling.display.Button;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	
	public class PassGoButton extends Button
	{
		private var _type:String;
		public function PassGoButton(upState:Texture, text:String="", downState:Texture=null)
		{
			_type=text;
			super(upState, text, downState);
			this.addEventListener(TouchEvent.TOUCH,onTouchButton);
		}
		
		private function onTouchButton(e:TouchEvent):void
		{
			if(e.getTouch(stage).phase=="ended")
			{
				
				//trace("go")
				trace(PlayerData._MyChoosedCards)
				//sort PlayerData._MyChoosedCards and judge type;
			}			
		}
		//end function
		public function get type():String
		{
			return _type;
		}
	}
}