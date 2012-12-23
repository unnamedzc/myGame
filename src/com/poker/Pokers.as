package com.poker
{
	//import starling.display.Image;
	
	import com.jeff.data.PlayerData;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	import starling.textures.Texture;

	public class Pokers extends Sprite
	{
		public var _Style:String;
		[Embed(source = "/assets/back.jpg")]
		private const _Back:Class;		
		//[Embed(source="/media/fonts/embedded/BADABB__.TTF",fontFamily="MyFontName",embedAsCFF="false")]
		//public static var MyFont:Class;
		private var _text:TextField;
		private var _showNum:Boolean=false;
		//private var _back:Quad;
		public var _myNum:String;
		public var _myCol:uint;
		private var blockTexture:Texture;
		private var greenBlock:Image;
		public var _id:uint;
		private var _selected:Boolean=false;
		public function Pokers()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
			this.removeEventListeners(Event.ENTER_FRAME);
		}	
		private function init():void
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			blockTexture=Texture.fromBitmap(new _Back());
			greenBlock=new Image(blockTexture);			
			this.addChild(greenBlock);
			
			greenBlock.dispose();
			
			greenBlock.scaleX=2;
			greenBlock.scaleY=3;
			
			/*_back=new Quad(80,100);
			addChild(_back);
			_back.setVertexColor(0,0x110000) 
			_back.setVertexColor(3,0x001100)
			_back.dispose();*/			
			_text=new TextField(26,50,_myNum,"Aria",16,_myCol,true);
			this.addChild(_text);
			if(_text.text.length==9)
				_text.height=95;
			
			_text.dispose();
			
		}
		//end function
		private function onTouchPoker(e:TouchEvent):void
		{
			// TODO Auto Generated method stub
			if(e.getTouch(stage).phase=="ended")
			{
				//DeBug.LOG(Pokers(e.currentTarget)._myNum)
				if(GlobalValue._GameStarted){
					_selected=!_selected;
					
					var _tempNum:uint=GlobalValue._getPokerNum(Pokers(e.currentTarget)._myNum);
					
					if(!_selected)
					{
						greenBlock.color=0xffffff;
						PlayerData._popFromCard(_id);
					}else{
						greenBlock.color=0x0000ff;
						PlayerData._pushToCard(_id);
					}
						//trace(_id,GlobalValue._idToNum(_id));	
					if(_selected==true)
					{
						GlobalValue._HUDContainer.showHUDButtonGo();
					}			
				}
			}			
		}
		//end touch
		private function getNum():void
		{
			
		}
		public function set showNum($bol:Boolean):void
		{
			if($bol){
				_showNum=_text.visible=true;
				addEventListener(TouchEvent.TOUCH,onTouchPoker);
				
			}else{
				if(GlobalValue._deBug==false){
					_showNum=_text.visible=false;
					this.flatten();
				}
				removeEventListener(TouchEvent.TOUCH,onTouchPoker);				
			}
			
		}
		//end function 
		
		public function get showNum():Boolean
		{
			return _showNum;
		}
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function set selected($value:Boolean):void
		{
			$value?greenBlock.color=0xffffff:greenBlock.color=0x0000ff;
			_selected =$value;
		}

	}
}