package
{
	import org.flixel.*;

	public class ForceField extends FlxSprite
	{
        [Embed(source='../data/ForceField.png')] private var ImgGlow:Class;

        private var _player:Player;
        private var _map:FlxTilemap;

        private var _trapped:Boolean = false;
        private var _wasTrapped:Boolean = false;
		private var _outerBox:FlxObject;
		private var _pulsed:Boolean = true;

        private var _state:PlayState;
        
		public function ForceField(X:Number, Y:Number, Tiles:FlxTilemap, ThePlayer:Player):void
		{
            super(X*16,Y*16);
            _state = FlxG.state as PlayState;
			
            blend = "add";

            loadGraphic(ImgGlow, true, true, 16, 16); 

            addAnimation("glow", [8,9,10,11,12,13,14,15], 15);
            addAnimation("pulse", [0,1,2,3,4,5,6,7], 15, false);
            addAnimation("fade", [16,17,18,19,20,21,22,23], 15, false);

            _player = ThePlayer;
            _map = Tiles;
            
            width = 16;
            height = 16;
			visible = false;
			
			_outerBox = new FlxObject(x - 1, y - 1, 18, 18);

            fixed = true;
		}

        override public function update():void
        {
			var show:Boolean = false;

				
			FlxU.overlap(_player, _outerBox, function():void { show = true; if(visible == false) _pulsed = true;  } );
			
            if(show || (_player.light.exists && (distance(x,y,_player.x,_player.y) < 30))) {
                visible = true;
				if(!_pulsed) {
					play("glow");
				} else {
					play("pulse");
				}
				if (finished)
					_pulsed = false;
            } else {
                play("fade");
				if (finished) {
					visible = false;
					_pulsed = true;
				}
            }
			
			collide(_player);
            
            super.update();
        }
        
        private function distance(X:Number,Y:Number,X0:Number,Y0:Number):Number {
            var dX:Number = X-X0;
            var dY:Number = Y-Y0;
            return Math.sqrt(dX*dX+dY*dY);
        }
	}
}
