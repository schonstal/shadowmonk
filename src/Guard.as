package
{
    import org.flixel.*;

    public class Guard extends FlxSprite
    {
        [Embed(source='../data/Guard.png')] private var ImgGuard:Class;

        private var _move_speed:int = 25;
        private var _heading:Array = new Array(270,90,0,180);
        private var _player:Player;
        private var _next:int = 1;
        private var _ang:Number;
        private var _state:Number;
        private var _map:FlxTilemap;
        
        //Shootin' arrows
        private var _sightLimit:Number = 0.5;
        private var _sightTimer:Number = 0.5;
        private var _currentState:PlayState;

        public var direction:int = 0; //LEFT, RIGHT, UP, DOWN
        public var patrol:Array;

        public function Guard(Patrol:Array, ThePlayer:Player,Heading:int, map:FlxTilemap):void
        {
            _currentState = FlxG.state as PlayState;
            _state = GuardState.PATROL;
            patrol = Patrol;
            super(patrol[0].x*16+4,patrol[0].y*16+4);
            loadGraphic(ImgGuard, true, true, 16, 16); 
            _map = map;

            _player = ThePlayer;
            
            width = 8;
            height = 14;
            offset.x = 4;
            offset.y = 2;

            addAnimation("normal", [0, 2, 3, 4], 8);
            addAnimation("stopped", [0, 1], 8);
            addAnimation("shooting", [5, 6], 8);
      
            direction = Heading;
        }

        override public function update():void
        {
            if(_state == GuardState.PATROL)
                advance();
            else if (_state == GuardState.AIM)
                aim();
            else if (_state == GuardState.LOST)
                lost();
            else if (_state == GuardState.CAPTURE)
                capture();
            else if (_state == GuardState.SHOOTING)
                shoot();
            super.update();
        }

        public function aim():void {
            velocity.x = 0;
            velocity.y = 0;
            angle = FlxU.getAngle(_player.x - x, _player.y - y) + 90;
            play("shooting");
            if(spot()) {
                _sightTimer -= FlxG.elapsed;
                if(_sightTimer <= 0) {
                    _player.mobile = false;
                    _currentState.createArrow(x, y, _player.x+4, _player.y+4);
                    _state = GuardState.SHOOTING;
                }
            } else {
                _state = GuardState.PATROL;
            }
        }
        
        public function shoot():void {
            play("shooting");
        }

        public function lost():void {
        }
        
        public function capture():void {
            //Not sure if we'll use this one
        }

        public function advance():void {
            angle = _heading[direction];
            var X:int = int(x/16);
            var Y:int = int(y/16);
            //the fake snes-y angle
            if(X != patrol[_next].x || Y != patrol[_next].y) {

                if (patrol[_next].x == X) {
                    velocity.y = patrol[_next].y>Y?_move_speed:-_move_speed;
                    velocity.x = 0;
                } else {
                    velocity.x = patrol[_next].x>X?_move_speed:-_move_speed;
                    velocity.y = 0;
                }

                if(Math.abs(velocity.x) > Math.abs(velocity.y)) {
                    if (velocity.x < 0) {
                        direction = LEFT;
                    } else {
                        direction = RIGHT;
                    }
                } else {
                    if (velocity.y < 0) {
                        direction = UP;
                    } else {
                        direction = DOWN;
                    }
                }
            } else if (patrol.length > 1) {
                if (_next < patrol.length - 1) {
                    _next++;
                } else {
                    _next = 0;
                }
            } else {
                velocity.x = 0;
                velocity.y = 0;
            }

            if (velocity.x == 0 && velocity.y == 0)
                play("stopped");
            else
                play("normal");
            
            if(spot())
                _state = GuardState.AIM;

        }
        
        public function spot():Boolean {
            var p:FlxPoint;

            if(onScreen() && spotted() && ((!_map.ray(x+8, y+8, _player.x+8, _player.y+8, p, 1) && _player.light.exists) || (distance(x,y,_player.x,_player.y) < 30))) {
                return true;                
            } else {
                _sightTimer = _sightLimit;
            }
            return false;    
        }
        
        private function distance(X:Number,Y:Number,X0:Number,Y0:Number):Number {
            var dX:Number = X-X0;
            var dY:Number = Y-Y0;
            return Math.sqrt(dX*dX+dY*dY);
        }

        private function spotted():Boolean {
            switch (direction) {
            case 0:
                return _player.x < x;
            case 1:
                return _player.x > x;
            case 2:
                return _player.y < y;
            case 3:
                return _player.y > y;
            }
            return false;
        }
    }
}
