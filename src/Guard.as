package
{
  import org.flixel.*;

  public class Guard extends FlxSprite
  {
    [Embed(source='../data/Guard_B.png')] private var ImgGuard:Class;

    private var _move_speed:int = 25;
    private var _heading:Array = new Array(270,90,0,180);
    private var _player:Player;
    private var _next:int = 1;
    private var _ang:Number;
        
    //Shootin' arrows
    private var _sightLimit:Number = 0.5;
    private var _sightTimer:Number = 0.5;
    private var _shot:Boolean = false;

    public var direction:int = 0; //LEFT, RIGHT, UP, DOWN
    public var patrol:Array;

    public function Guard(Patrol:Array, ThePlayer:Player,Heading:int):void
    {
      patrol = Patrol;
      super(patrol[0].x*16+4,patrol[0].y*16+4);
      loadGraphic(ImgGuard, true, true, 16, 16); 

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
      else if (_shot)
        play("shooting");
      else
        play("normal");

      super.update();
    }
        
    public function spot(map:FlxTilemap):Boolean {
      var p:FlxPoint;

      if(spotted() && ((!map.ray(x, y, _player.x, _player.y, p, 0.2) && _player.light.exists) || (distance(x,y,_player.x,_player.y) < 30))) {
                
        _sightTimer -= FlxG.elapsed;
        if(_sightTimer <= 0) {
          _player.mobile = false;
          if(!_shot) {
            _shot = true;
            return true;
          }
        }
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
