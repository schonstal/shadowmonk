package
{
	import org.flixel.*;
    import flash.geom.Point;

	public class Trap extends FlxSprite
	{
        [Embed(source='../data/Trap_pitfall.png')] private var ImgPit:Class;

        private var _player:Player;
        private var _glow:Glow;
        private var _map:FlxTilemap;
        private var _trapped:Boolean = false;
        
		public function Trap(X:Number, Y:Number, Tiles:FlxTilemap, ThePlayer:Player, glow:Glow):void
		{
            super(X*16,Y*16);
            loadGraphic(ImgPit, true, true, 16, 16); 

            _player = ThePlayer;
            _glow = glow;
            _map = Tiles;
            
            width = 16;
            height = 16;
            offset.x = 0;
            offset.y = 0;

            addAnimation("normal", [0]);
            addAnimation("open", [1, 2, 3, 4, 5, 6], 12);
		}

        override public function update():void
        {
            if(collide(_player)) {
                _player.mobile = false;
                _trapped = true;
            }

            if(_trapped) {
                play("open");
                if(finished)
                    FlxG.state = new Dead();
            } 
            
            alert();
            super.update();
        }
        
        public function alert():void {
            var p:Point;

            if( _player.light.exists && (distance(x,y,_player.x,_player.y) < 30)) {
                _glow.exists = true;
            } else {
                _glow.exists = false;
            }
        }
        
        private function distance(X:Number,Y:Number,X0:Number,Y0:Number):Number {
            var dX:Number = X-X0;
            var dY:Number = Y-Y0;
            return Math.sqrt(dX*dX+dY*dY);
        }
	}
}
