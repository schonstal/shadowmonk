package
{
  import org.flixel.*;

  public class Level04 extends PlayState
  {
    [Embed(source = '../data/Level04/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level04/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
    public static var title:String = "Awesome";

    public function Level04()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();
    }

    public override function initialize():void {
      FlxG.level = 4;
      _player = new Player(2,6,2);
      addGuard(new Array(new FlxPoint(10,10), new FlxPoint(14,10), new FlxPoint(14, 4), new FlxPoint(6, 4), new FlxPoint(6,10)), 1);
      addTrap(9,4);
      addTrap(9,5);
      addTrap(9,9);
      addTrap(10,11);
      addStairs(16,4);
    }
  }
}

