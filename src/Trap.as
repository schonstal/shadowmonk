package
{
	import org.flixel.*;

	public class Trap extends FlxSprite
	{
        [Embed(source='../data/Trap_pitfall.png')] private var ImgPit:Class;

        private var _player:Player;
        private var _glow:Glow;
        private var _map:FlxTilemap;
        private var _trapped:Boolean = false;
        private var _state:PlayState;
        
		public function Trap(X:Number, Y:Number, Tiles:FlxTilemap, ThePlayer:Player, glow:Glow):void
		{
            super(X*16,Y*16);
            _state = FlxG.state as PlayState;
            loadGraphic(ImgPit, true, true, 16, 16); 

            _player = ThePlayer;
            _glow = glow;
            _map = Tiles;
            
            width = 16;
            height = 16;
            offset.x = 0;
            offset.y = 0;

            fixed = true;

            addAnimation("normal", [0]);
            addAnimation("open", [1, 2, 3, 4, 5, 6], 12, false);
            addAnimation("black", [6]);
		}

        override public function update():void
        {
            if(collide(_player)) {
                SoundBank.play("trap");
                _player.mobile = false;
                _trapped = true;
                _state.dead("trap");
            }

            if( _player.light.exists && (distance(x,y,_player.x,_player.y) < 30) || _trapped) {
                _glow.exists = true;
            } else {
                _glow.exists = false;
            }
            
            super.update();
        }
        
        private function distance(X:Number,Y:Number,X0:Number,Y0:Number):Number {
            var dX:Number = X-X0;
            var dY:Number = Y-Y0;
            return Math.sqrt(dX*dX+dY*dY);
        }
	}
}
