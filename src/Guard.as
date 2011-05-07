package
{
    import org.flixel.*;

    public class Guard extends FlxSprite
    {
        [Embed(source='../data/Guard.png')] private var ImgGuard:Class;

        private var _move_speed:int = 16;
        private var _heading:Array = new Array(270,90,0,180);
        private var _player:Player;
        private var _next:int = 1;
        private var _ang:Number;
        private var _state:Number;
        private var _map:FlxTilemap;
        
        //Shootin' arrows
        private var _sightLimit:Number = 0.5;
        private var _sightTimer:Number = _sightLimit;
        private var _lostLimit:Number = 1;
        private var _lostTimer:Number = _lostLimit;
		
		private var _waitTimer:Number = 0;

        //So many flags
        private var _firstTurn:Boolean = true;
        private var _secondTurn:Boolean = true;
        
        private var _currentState:PlayState;
        private var _playerOffset:FlxPoint;
        
        private var _sightSpread:Number = 45;

        public var direction:int = 0; //LEFT, RIGHT, UP, DOWN
        public var patrol:Array;

        public function Guard(Patrol:Array, ThePlayer:Player,Heading:int, map:FlxTilemap):void
        {
            _currentState = FlxG.state as PlayState;
            _state = GuardState.PATROL;
            patrol = Patrol;
            super(patrol[0].x*16,patrol[0].y*16);
            loadGraphic(ImgGuard, true, true, 16, 16); 
            _map = map;

            _sightSpread = _sightSpread/2;

            _player = ThePlayer;

            //Adjust how arrow flies
            _playerOffset = new FlxPoint(8,8);
            
            addAnimation("normal", [0, 2, 3, 4], 5);
            addAnimation("stopped", [0, 1], 8);
            addAnimation("shooting", [5, 6], 8);
      
            direction = Heading;
        }

        override public function update():void
        {
            if(_state == GuardState.SHOOTING)
                shoot();
            else if (_state == GuardState.AIM)
                aim();
            else if (_state == GuardState.LOST)
                lost();
            else if (_state == GuardState.CAPTURE)
                capture();
            else if (_state == GuardState.PATROL)
                advance();
            super.update();
        }

        public function checkCapture(Sound:Boolean = true):Boolean {
            var p:FlxPoint;
            if(!_player.dead && distance(x,y,_player.x,_player.y) < 26 && 
                !_map.ray(x, y, _player.x + _playerOffset.x, _player.y + _playerOffset.y, p, 16)) {
                if(Sound)
                    SoundBank.play("alert");
                _state = GuardState.CAPTURE;
                return true;
            }
            return false;
        }

        public function checkShoot(test:Boolean):void {
            velocity.x = 0;
            velocity.y = 0;
            angle = FlxU.getAngle(_player.x - x, _player.y - y) + 90;
            play("shooting");
            if(test) {
                _sightTimer -= FlxG.elapsed;
                if(_sightTimer <= 0) {
                    _player.mobile = false;
                    _currentState.createArrow(x, y, _player.x-4, _player.y-4);
//                    _currentState.createArrow(x,y,_player.x,_player.y);
                    _state = GuardState.SHOOTING;
                }
            } else {
                _lostTimer = _lostLimit;
                _firstTurn = true;
                _secondTurn = true;
                SoundBank.play("lost");
                _state = GuardState.LOST;
            }
        }

        public function aim():void {
            checkShoot(spot());
            checkCapture();
        }
        
        public function shoot():void {
            play("shooting");
        }

        public function lost():void {
            checkSpot();
            checkCapture();
            
            _lostTimer -= FlxG.elapsed;
            
            if(_lostTimer <= 0) {
                _state = GuardState.PATROL;
            } else if (_secondTurn && (_lostTimer/_lostLimit <= 0.33)) {
                _secondTurn = false;
                angle += 90;
            } else if (_firstTurn && (_lostTimer/_lostLimit <= 0.66)) {
                _firstTurn = false;
                angle -= 45;
            }
        }

        public function capture():void {
            checkShoot(checkCapture(false));
        }

        public function checkSpot():void {
            if(spot()) {
                SoundBank.play("alert");
                _state = GuardState.AIM;
            }
        }

        public function advance():void {
            angle = _heading[direction];
            var X:int = int(x / 16);
            var Y:int = int(y / 16);
			
			if (patrol[_next] is Number) {
				velocity.x = 0;
				velocity.y = 0;
				_waitTimer += FlxG.elapsed;
				if (_waitTimer >= patrol[_next]) {
					_waitTimer = 0;
					if (_next < patrol.length - 1) {
						_next++;
					} else {
						_next = 0;
					}
				}
			} else {
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
			}

            if (velocity.x == 0 && velocity.y == 0)
                play("stopped");
            else
                play("normal");
            
            checkSpot();
            checkCapture();
        }
        
        public function spot():Boolean {
            var p:FlxPoint;

            if(onScreen() && !_player.dead && 
                spotted() && _player.light.exists && 
                !_map.ray(x+8, y+8, _player.x + _playerOffset.x, 
                    _player.y + _playerOffset.y, p, 16)) {
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
            case Direction.LEFT:
                return _player.x < x && _sightAngle < -180 + _sightSpread || _sightAngle > 180 - _sightSpread;
            case Direction.RIGHT:
                return _player.x > x && _sightAngle > -_sightSpread && _sightAngle < _sightSpread;
            case Direction.UP:
                return _player.y < y && _sightAngle < -_sightSpread && _sightAngle > -180 + _sightSpread;
            case Direction.DOWN:
                return _player.y > y && _sightAngle < 180 - _sightSpread && _sightAngle > _sightSpread;
            }
            return false;
        }

        private function get _sightAngle():Number {
            return FlxU.getAngle(_player.x - x, _player.y - y);
        }
    }
}
