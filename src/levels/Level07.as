package levels
{
  import org.flixel.*;

  public class Level07 extends PlayState
  {
    [Embed(source = '../../data/Level07/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../../data/Level07/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
    public static var title:String = "Outrageous";

    public function Level07()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();
    }

    public override function initialize():void {
        _player = new Player(1,8,1);
        addGuard(new Array(new FlxPoint(16,9), new FlxPoint(16,6), new FlxPoint(12,6), new FlxPoint(12,10), new FlxPoint(16,10)), 2);
        addGuard(new Array(new FlxPoint(22,10), new FlxPoint(25,10), new FlxPoint(25,6), new FlxPoint(20,6), new FlxPoint(20,9)), 1);
        addTrap(8,10);
        addTrap(8,11);
        addTrap(9,9);
        addTrap(13,9);
        addTrap(12,8);
        addTrap(12, 7);
		addTrap(12, 11);
		addArrow(11, 6, 11, 11);
        addTrap(19, 11);
		addTrap(24, 10);
		addTrap(24, 11);
        addTrap(27,8);
        addTrap(27,9);
        addStairs(30, 8);
		addStairs(39, 9);
    }
  }
}

