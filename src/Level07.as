package
{
  import org.flixel.*;

  public class Level07 extends PlayState
  {
    [Embed(source = '../data/Level07/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level07/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

    public function Level07()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();
    }

    public override function initialize():void {
        FlxG.level = 7;
        _player = new Player(1,8,1);
        addGuard(new Array(new FlxPoint(16,9), new FlxPoint(16,6), new FlxPoint(12,6), new FlxPoint(12,10), new FlxPoint(16,10)), 2);
        addGuard(new Array(new FlxPoint(22,10), new FlxPoint(25,10), new FlxPoint(25,6), new FlxPoint(20,6), new FlxPoint(20,9)), 1);
        addTrap(8,6);
        addTrap(8,7);
        addTrap(9,8);
        addTrap(10,8);
        addTrap(11,8);
        addTrap(12,10);
        addTrap(12,11);
        addTrap(19,7);
        addTrap(19,8);
        addTrap(19,10);
        addTrap(19,11);
        addTrap(27,8);
        addTrap(27,9);
        addTrap(27,10);
        addTrap(27,11);
        addStairs(29,8);
    }
  }
}

