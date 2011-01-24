package
{
    import org.flixel.*;
    
    public class Wisp extends FlxSprite
    {
		protected var _player:Player;
		protected var _state:PlayState;
        
        protected var _maxSpeed:Number = 35;
		protected var _accel:Number = 35;
		protected var _fearAccel:Number = 7.5;
		protected var _fearRange:Number = 10;
		protected var _currentSpeed:Number = 0;
		protected var _drag:Number = 1;
		protected var _tmpVelocity:FlxPoint;
        
        public var light:Light;

        public function Wisp(X:Number, Y:Number, ThePlayer:Player):void
        {			
            super(X * 16, Y * 16);
			_player = ThePlayer;
            fixed = true;
			addAnimation("normal", [0]);
			_tmpVelocity = new FlxPoint();
			
			fixed = true;
			
			_state = FlxG.state as PlayState;
            
			width = 12;
			height = 12;
			offset.x = 2;
			offset.y = 2;
			x += offset.x;
			Y += offset.y;
        }
        
        public override function update():void {
            play("normal");
			
			var dragAmt:Number = FlxG.elapsed * _drag;
			velocity.x -= velocity.x * dragAmt;
			velocity.y -= velocity.y * dragAmt;
			
			if(onScreen() && !_player.dead && playerVisible()) {
				moveTowards(_player);
			}
			
			if (FlxU.overlap(_player, this)) {
				_state.dead("ghost");
			}
			
			var wisp:Object;
			for each (wisp in _state.lyrWisps.members) {
				if (wisp is WispDark && this is WispDark || wisp is WispLight && this is WispLight) {
					var flxWisp:Wisp = wisp as Wisp;
					var dX = x - flxWisp.x;
					var dY = x - flxWisp.y;
					if(Math.sqrt((dX*dX)+(dY*dY)) < _fearRange) {
						moveAway(flxWisp);
					}
				}
			}
			
            super.update();
        }
		
		protected function moveTowards(target:FlxObject):void {
			var dX:Number = x - target.x;
            var dY:Number = y - target.y;
            
			var ang:Number = FlxU.getAngle(dX, dY) * (Math.PI / 180);
			var amt:Number = FlxG.elapsed * _accel;
			_tmpVelocity.y = velocity.y;
			_tmpVelocity.x = velocity.x;
			_tmpVelocity.y -= Math.sin(ang) * amt;
			_tmpVelocity.x -= Math.cos(ang) * amt;
			
			if (Math.sqrt((_tmpVelocity.x * _tmpVelocity.x) + (_tmpVelocity.y * _tmpVelocity.y)) < _maxSpeed) {
				velocity.x = _tmpVelocity.x;
				velocity.y = _tmpVelocity.y;
			}
		}
		
		protected function moveAway(target:FlxObject):void {
			var dX:Number = x - target.x;
            var dY:Number = y - target.y;
            
			var ang:Number = FlxU.getAngle(dX, dY) * (Math.PI / 180);
			var amt:Number = FlxG.elapsed * _fearAccel;
			_tmpVelocity.y = velocity.y;
			_tmpVelocity.x = velocity.x;
			_tmpVelocity.y += Math.sin(ang) * amt;
			_tmpVelocity.x += Math.cos(ang) * amt;
			
			if (Math.sqrt((_tmpVelocity.x * _tmpVelocity.x) + (_tmpVelocity.y * _tmpVelocity.y)) < _maxSpeed) {
				velocity.x = _tmpVelocity.x;
				velocity.y = _tmpVelocity.y;
			}
		}
		
		protected function playerVisible():Boolean {
			return true;
		}
        
    }
    
}
