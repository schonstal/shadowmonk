package
{
	import org.flixel.*;

	public class ForceField extends FlxSprite
	{
        [Embed(source='../data/Trap_wall.png')] private var ImgGlow:Class;

        private var _player:Player;
        private var _map:FlxTilemap;

        private var _trapped:Boolean = false;
        private var _wasTrapped:Boolean = false;
		private var _outerBox:FlxObject;

        private var _state:PlayState;
        
		public function ForceField(X:Number, Y:Number, Tiles:FlxTilemap, ThePlayer:Player):void
		{
            super(X*16,Y*16);
            _state = FlxG.state as PlayState;
			
            blend = "add";

            loadGraphic(ImgGlow, true, true, 16, 16); 

            addAnimation("normal", [0]);
            addAnimation("glow", [1,2,3,4,5,6,7,8,9,10], 15);
            addAnimation("pulse", [1,1,1,1,1,1,1,1,1,1], 15);
            addAnimation("fade", [2,2,2,2,2,2,2,2,2,2], 15);

            _player = ThePlayer;
            _map = Tiles;
            
            width = 16;
            height = 16;
			
			_outerBox = new FlxObject(x - 1, y - 1, 18, 18);

            fixed = true;
		}

        override public function update():void
        {
			var show:Boolean = false;
			FlxU.overlap(_player, _outerBox, function():void { show = true; } );
            if(show || (_player.light.exists && (distance(x,y,_player.x,_player.y) < 30))) {
                play("glow");
            } else {
                play("normal");
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
