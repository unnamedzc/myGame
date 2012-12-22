package com.containers
{
	import com.HUD.Button.CallMultipleButton;
	import com.HUD.Button.PassGoButton;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	public class HUDContainer extends Sprite
	{
		//textfield
		private var _myMulti:TextField=new TextField(100,50,"0亩farmer","Verdana",15,0xffffff);
		private var _playerMulti1:TextField=new TextField(100,50,"1亩farmer","Verdana",15,0xffffff);
		private var _playerMulti2:TextField=new TextField(100,50,"2亩farmer","Verdana",15,0xffffff);
		private var _playerMulti3:TextField=new TextField(100,50,"3亩farmer","Verdana",15,0xffffff);
		//button
		[Embed(source = "/assets/BT1.jpg")]
		private const _Back:Class;
		[Embed(source = "/assets/BT2.jpg")]
		private const _Back2:Class;
		[Embed(source = "/assets/BT3.jpg")]
		private const _Back3:Class;
		//button2
		[Embed(source = "/assets/pass.jpg")]
		private const _Pass:Class;
		[Embed(source = "/assets/Go.jpg")]
		private const _Go:Class;
		private var _buttonTexture:Texture=Texture.fromBitmap(new _Back());
		private var _buttonTexture2:Texture=Texture.fromBitmap(new _Back2());
		private var _buttonTexture3:Texture=Texture.fromBitmap(new _Back3());
		//inGameBt
		private var _buttonTexturePass:Texture=Texture.fromBitmap(new _Pass());
		private var _buttonTextureGo:Texture=Texture.fromBitmap(new _Go());
		
		private var _multiBut1:CallMultipleButton=new CallMultipleButton(_buttonTexture);
		private var _multiBut2:CallMultipleButton=new CallMultipleButton(_buttonTexture2);
		private var _multiBut3:CallMultipleButton=new CallMultipleButton(_buttonTexture3);
		
		private var _multiButPass:PassGoButton=new PassGoButton(_buttonTexturePass);
		private var _multiButGo:PassGoButton=new PassGoButton(_buttonTextureGo);
		public function HUDContainer()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, initHUD);	
		}
		private function initHUD(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, initHUD);
			addChild(_myMulti);
			_myMulti.x=stage.stageWidth/2-350;
			_myMulti.y=stage.stageHeight/2+130;
			_myMulti.dispose();
			addChild(_playerMulti1);
			_playerMulti1.x=stage.stageWidth/2+250;
			_playerMulti1.y=stage.stageHeight/2-50;
			_playerMulti1.dispose();
			addChild(_playerMulti2);			
			_playerMulti2.x=stage.stageWidth/2+200;
			_playerMulti2.y=stage.stageHeight/2-300;
			_playerMulti2.dispose();
			addChild(_playerMulti3);
			_playerMulti3.x=stage.stageWidth/2-350;
			_playerMulti3.y=stage.stageHeight/2-50;
			_playerMulti3.dispose();
			//============
			addChild(_multiBut1);
			_multiBut1.x=300;_multiBut1.y=500;
			_multiBut1._multi=1;
			
			addChild(_multiBut2);
			_multiBut2.x=400;_multiBut2.y=500;
			_multiBut2._multi=2;
			
			addChild(_multiBut3);
			_multiBut3.x=_multiBut3.y=500;
			_multiBut3._multi=3;
			//============
			addChild(_multiButPass);
			addChild(_multiButGo);
			_multiButPass.x=stage.stageWidth/2-50;_multiButPass.y=500;
			_multiButGo.x=stage.stageWidth/2+50;_multiButGo.y=500;
			_multiButPass.visible=_multiButGo.visible=false;
		}
		
		public function resetMultiNum():void
		{
			
			_myMulti.text=GlobalValue._mutilVec[0];
			_playerMulti1.text=GlobalValue._mutilVec[1];
			_playerMulti2.text=GlobalValue._mutilVec[2];
			_playerMulti3.text=GlobalValue._mutilVec[3];
		}
		//end function
		public function showButton():void
		{
			_multiBut1.visible=_multiBut2.visible=_multiBut3.visible=true;
			if(GlobalValue._mutil==2)
			{
				_multiBut2.visible=false;
					
			}
		}
		//end function
		public function hideButton():void
		{
			_multiBut1.visible=_multiBut2.visible=_multiBut3.visible=false;
		}
		//end function
		public function showHUDButtonPass():void
		{
			
			_multiButPass.visible=true;
			
		}
		public function hideHUDButtonPass():void
		{
			_multiButPass.visible=false;
		}
		public function showHUDButtonGo():void
		{
			_multiButGo.visible=true;
		}
		public function hideHUDButtonGo():void
		{
			_multiButGo.visible=false;
		}
	}
}