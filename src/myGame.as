package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	[SWF(width="1024", height="768", frameRate="60", backgroundColor="#222222")]
	public class myGame extends Sprite
	{
		private var _myStarling:Starling;
		
		public function myGame()
		{
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//trace(stage.fullScreenHeight,stage.fullScreenWidth)
			this._myStarling = new Starling(GameMain,stage,null,null,"auto","baseline");  
			_myStarling.showStats=true;
			
			this._myStarling.start(); 
			

		}
	}
}