package
{
	
	
	
	import com.containers.HUDContainer;
	import com.containers.OtherPokerContainer;
	import com.containers.PlayerPokerContainer;
	import com.jeff.data.AIData;
	import com.jeff.data.OtherData;
	import com.jeff.data.PlayerData;
	
	import com.jeff.manager.PokerPool;
	import com.poker.PokerFactory;
	
	import myEvents.Events;
	
	import starling.display.Sprite;
	import starling.events.Event;

	//import com.poker.PokerStyle;
	public class GameMain extends Sprite
	{
		
		//private var PokerContainer:Sprite;
		//private var HUDContainer:Sprite;
		//hard code
		private var _topPositionX:uint//=50;
		private var _bottonPositionY:uint//=stage.stageHeight-50;
		private var _leftPositionY:uint//=100;
		private var _rightPositionX:uint//=stage.stageWidth-50;		
		//AI
		private var _AI1:AIData=new AIData();
		private var _AI2:AIData=new AIData();
		private var _AI3:AIData=new AIData();
		//button
		/*[Embed(source = "/assets/BT1.jpg")]
		private const _Back:Class;
		[Embed(source = "/assets/BT2.jpg")]
		private const _Back2:Class;
		[Embed(source = "/assets/BT3.jpg")]
		private const _Back3:Class;
		private var _buttonTexture:Texture=Texture.fromBitmap(new _Back());
		private var _buttonTexture2:Texture=Texture.fromBitmap(new _Back2());
		private var _buttonTexture3:Texture=Texture.fromBitmap(new _Back3());
		
		private var _multiBut1:CallMultipleButton=new CallMultipleButton(_buttonTexture);
		private var _multiBut2:CallMultipleButton=new CallMultipleButton(_buttonTexture2);
		private var _multiBut3:CallMultipleButton=new CallMultipleButton(_buttonTexture3);*/
		
		//playerPokerContainer
		private var _playerPokerContainer1:PlayerPokerContainer=new PlayerPokerContainer(1);
		private var _playerPokerContainer2:PlayerPokerContainer=new PlayerPokerContainer();
		private var _playerPokerContainer3:PlayerPokerContainer=new PlayerPokerContainer(1);
		private var _myPokerContainer:PlayerPokerContainer=new PlayerPokerContainer();
		//otherPoker
		private var _otherPokerContainer:OtherPokerContainer=new OtherPokerContainer();
		
		
		
		public function GameMain()
		{
			super();			
			addEventListener(Event.ADDED_TO_STAGE, init);			
		}
		protected function init(e:Event):void
		{
			//trace("initGame")
			GlobalValue._stageWidth=stage.stageWidth;
			GlobalValue._stageHeight=stage.stageHeight;
			//debugNUM
			_bottonPositionY=stage.stageHeight-220;
			_rightPositionX=stage.stageWidth-180;
			_leftPositionY=stage.stageHeight/2-220;
			_topPositionX=stage.stageWidth/2-380;
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//pookpool here
			createField();			
			PokerFactory.InitPoker();
			initLevel();
		}
		private function createField():void
		{
			if(GlobalValue._PokerContainer==null)
			{
				GlobalValue._PokerContainer=new Sprite();
				addChild(GlobalValue._PokerContainer);
				//
				GlobalValue._PokerContainer.addEventListener(Events.MY_START_ROUND,startRound);
				GlobalValue._PokerContainer.addEventListener(Events.MY_NEXT_PLAYER,nextPlayerJudge);
			}
			if(GlobalValue._HUDContainer==null)
			{
				GlobalValue._HUDContainer=new HUDContainer();
				addChild(GlobalValue._HUDContainer);
			}
			
			//add all container
			GlobalValue._PokerContainer.addChild(_myPokerContainer);
			GlobalValue._PokerContainer.addChild(_playerPokerContainer1);
			GlobalValue._PokerContainer.addChild(_playerPokerContainer2);
			GlobalValue._PokerContainer.addChild(_playerPokerContainer3);
			//8 pokers
			GlobalValue._PokerContainer.addChild(_otherPokerContainer);
			
			//============================================botton
			_myPokerContainer.x=_topPositionX;
			_myPokerContainer.y=_bottonPositionY;
			//============================================right
			_playerPokerContainer1.x=_rightPositionX;
			_playerPokerContainer1.y=_leftPositionY;
			//============================================top
			_playerPokerContainer2.x=_topPositionX;			
			//============================================left			
			_playerPokerContainer3.y=_leftPositionY;
			//============================================other
			_otherPokerContainer.x=stage.stageWidth/2-200;
			_otherPokerContainer.y=stage.stageHeight/2-150;
			//HUD=============================================
			
		}		
		
		//start level
		private function initLevel():void{
			//random
			PokerFactory._RandomPoker();
			//init Vector
			PlayerData._MyPokerVector=new Vector.<uint>;
			_AI1._AIPokerVector=new Vector.<uint>;
			_AI2._AIPokerVector=new Vector.<uint>;
			_AI3._AIPokerVector=new Vector.<uint>;
			//
			OtherData._OtherPokerVector=new Vector.<uint>;
			//arrangePoker
			var _PokerLen:uint=PokerFactory._pokerVector.length;			
			var _index:uint
			for(var i:uint=0;i<_PokerLen;++i)
			{
				//trace(PokerFactory._pokerVector[i])
				_index=PokerFactory._pokerVector[i];				
				
				if(i<(_PokerLen-8)/4){
					//my Poker					
					PlayerData._MyPokerVector.push(_index);					
				}
				else if(i<(_PokerLen-8)/2){
					_AI1._AIPokerVector.push(_index);
				}
				else if(i<(_PokerLen-8)*3/4){
					_AI2._AIPokerVector.push(_index);
				}
				else if(i<_PokerLen-8){	
					_AI3._AIPokerVector.push(_index);					
				}
				else
				{
					//8 left pokers					
					OtherData._OtherPokerVector.push(_index);
				}				
			}	
			//end for
			//repositionPoker
			//botton
			PlayerData._sequencePoke();			
			_myPokerContainer.setPokers(PlayerData._MyPokerVector);
			
			//AI's Poke
			//right
			_AI1._sequenceAIPoke();
			_playerPokerContainer1.setPokers(_AI1._AIPokerVector);
			
			//top
			_AI2._sequenceAIPoke();
			_playerPokerContainer2.setPokers(_AI2._AIPokerVector);
			//left
			_AI3._sequenceAIPoke();
			_playerPokerContainer3.setPokers(_AI3._AIPokerVector);
			//other
			_otherPokerContainer.setPokers(OtherData._OtherPokerVector);
			//			random			
			chooseLandowner();		
		}
		
		private function startRound(e:Events=null):void
		{
			//_multiBut1.visible=_multiBut2.visible=_multiBut3.visible=false;
			GlobalValue._PokerContainer.removeEventListener(Events.AI_SET_MULTI,aiChoose);
			GlobalValue._HUDContainer.hideButton();
			DeBug.LOG("startRound")
			GlobalValue._GameStarted=true;
			addOtherPokerToOwner();
		}
		
		private function addOtherPokerToOwner():void
		{
			DeBug.LOG("Player",GlobalValue._currentAnimatedPlayer,":is the landOwner");
			var _len:uint=OtherData._OtherPokerVector.length;
			var i:uint;
			switch(GlobalValue._currentAnimatedPlayer)
			{
				case 0:
					for(i=0;i<_len;++i)
					{
						PlayerData._MyPokerVector.push(OtherData._OtherPokerVector[i]);
						_otherPokerContainer.removeChild(PokerPool.getPokerObject(OtherData._OtherPokerVector[i]));
						
					}
					_myPokerContainer.removeAllPoker();
					PlayerData._sequencePoke();
					_myPokerContainer.setPokers(PlayerData._MyPokerVector);
					break;
				case 1:
					for(i=0;i<_len;++i)
					{
						_AI1._AIPokerVector.push(OtherData._OtherPokerVector[i]);
						_otherPokerContainer.removeChild(PokerPool.getPokerObject(OtherData._OtherPokerVector[i]));
						
					}
					_playerPokerContainer1.removeAllPoker();
					_AI1._sequenceAIPoke();
					_playerPokerContainer1.setPokers(_AI1._AIPokerVector);
					break;
				case 2:
					for(i=0;i<_len;++i)
					{
						_AI2._AIPokerVector.push(OtherData._OtherPokerVector[i]);
						_otherPokerContainer.removeChild(PokerPool.getPokerObject(OtherData._OtherPokerVector[i]));
						
					}
					_playerPokerContainer2.removeAllPoker();
					_AI2._sequenceAIPoke();
					_playerPokerContainer2.setPokers(_AI2._AIPokerVector);
					
					break;
				case 3:
					for(i=0;i<_len;++i)
					{
						_AI3._AIPokerVector.push(OtherData._OtherPokerVector[i]);
						_otherPokerContainer.removeChild(PokerPool.getPokerObject(OtherData._OtherPokerVector[i]));
						
					}
					_playerPokerContainer3.removeAllPoker();
					_AI3._sequenceAIPoke();
					_playerPokerContainer3.setPokers(_AI3._AIPokerVector);
					break;
			}
		}
		/*
		 * 
		start to choose who is the owner
		
		*/
		private function chooseLandowner():void
		{
			GlobalValue._deBug==true?
				GlobalValue._RandomStart=2:GlobalValue._RandomStart=Math.random()*4;
			GlobalValue._startPlayer=GlobalValue._currentAnimatedPlayer=GlobalValue._RandomStart;
			GlobalValue._PokerContainer.addEventListener(Events.AI_SET_MULTI,aiChoose);
			switch(GlobalValue._RandomStart)
			{
				case 0:
					GlobalValue._HUDContainer.showButton();
					break;
				case 1:
					_AI1._judgeToBeMaster()
					break;
				case 2:
					_AI2._judgeToBeMaster()
					break;
				case 3:
					_AI3._judgeToBeMaster()
					break;
			}
		}	
		private function aiChoose(e:Events):void
		{
				if(e._data==3){
					//3 multi already
					
					startRound();
					return;
				}
				switch(e._data)
				{
					case 1:
					case 2:
						nextPlayerJudge();
						break;
					case 3:
						//start round
						startRound();
						break;
				}				
		}
		
		private function nextPlayerJudge(e:Events=null):void
		{
			GlobalValue._currentAnimatedPlayer==3?GlobalValue._currentAnimatedPlayer=0:GlobalValue._currentAnimatedPlayer++;
			//if the currentPlayer is the startPlayer start game;
			if(GlobalValue._currentAnimatedPlayer==GlobalValue._RandomStart)
			{
				//start round
				startRound();
				return;
			}
			switch(GlobalValue._currentAnimatedPlayer)
			{
				case 0:
					GlobalValue._HUDContainer.showButton();
					break;
				case 1:
					_AI1._judgeToBeMaster();
					
					break;
				case 2:
					_AI2._judgeToBeMaster();
					
					break;
				case 3:
					_AI3._judgeToBeMaster();
				
					break;
			}
			//test//
			//PokerCombat._testCards();
			//trace(PokerCombat.JudgeIfJetCanon());
		}		
		//end function
		
		private function restartGame():void{
			
		}
		//end function		
	}
}