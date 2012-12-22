package com.HUD.Button
{
	
	import starling.display.Button;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	
	public class PassGoButton extends Button
	{
		public function PassGoButton(upState:Texture, text:String="", downState:Texture=null)
		{
			super(upState, text, downState);
			this.addEventListener(TouchEvent.TOUCH,onTouchButton);
		}
		
		private function onTouchButton(e:TouchEvent):void
		{
			if(e.getTouch(stage).phase=="ended")
			{
				//GlobalValue._HUDContainer.dispatchEvent(new Events(Events.SET_MULTI,false,_multi));
				trace()
			}
			
		}
	}
}