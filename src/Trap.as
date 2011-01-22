package
{
	import org.flixel.*;

	public class Trap extends FlxSprite
	{
        [Embed(source='../data/Trap_kill.png')] private var ImgGlow:Class;

        private var _player:Player;
        private var _map:FlxTilemap;
        private var _trapped:Boolean = false;
        private var _state:PlayState;
        
		public function Trap(X:Number, Y:Number, Tiles:FlxTilemap, ThePlayer:Player):void
		{
            super(X*16,Y*16);
            _state = FlxG.state as PlayState;
			
            blend = "add";

            loadGraphic(ImgGlow, true, true, 16, 16); 

            addAnimation("normal", [0]);
            addAnimation("glow", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 15);

            _player = ThePlayer;
            _map = Tiles;
            
            width = 16;
            height = 16;

            fixed = true;
		}

        override public function update():void
        {
            if(collide(_player)) {
                _player.mobile = false;
                _trapped = true;
                _state.dead("trap");
            }

            if( _player.light.exists && (distance(x,y,_player.x,_player.y) < 30) || _trapped) {
                play("glow");
            } else {
                play("normal");
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
