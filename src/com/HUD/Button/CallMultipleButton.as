package com.HUD.Button
{
	
	
	import myEvents.Events;
	
	import starling.display.Button;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	
	public class CallMultipleButton extends Button
	{
		public var _multi:uint;		
		
		public function CallMultipleButton(upState:Texture, text:String="", downState:Texture=null)
		{
			super(upState, text, downState);
			this.addEventListener(TouchEvent.TOUCH,onTouchButton);
			//this.dispose();
			this.scaleX=this.scaleY=2;
		}
		
		private function onTouchButton(e:TouchEvent):void
		{
			if(e.getTouch(stage).phase=="ended")
			{
				//GlobalValue._HUDContainer.dispatchEvent(new Events(Events.SET_MULTI,false,_multi));
				GlobalValue._mutil=_multi;
				//parent.visible=false;
				if(_multi==3){
					GlobalValue._PokerContainer.dispatchEvent(new Events(Events.MY_START_ROUND))
				}else{
					GlobalValue._PokerContainer.dispatchEvent(new Events(Events.MY_NEXT_PLAYER))
				}
				//trace("rest multi:",_multi);
			}
			
		}
	}
}