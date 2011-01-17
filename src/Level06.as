package
{
  import org.flixel.*;

  public class Level06 extends PlayState
  {
    [Embed(source = '../data/Level06/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level06/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
    public static var title:String = "Mondo";

    public function Level06()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();
    }

    public override function initialize():void {
      FlxG.level = 6;
      _player = new Player(2,8,1);
      addGuard(new Array(new FlxPoint(15,9), new FlxPoint(15,6), new FlxPoint(12,6), new FlxPoint(12, 10), new FlxPoint(15,10)), 2);
      addTrap(8,6);
      addTrap(8,7);
      addTrap(8,9);
      addTrap(8,10);
      addTrap(8,11);
      addTrap(11,6);
      addTrap(11,7);
      addTrap(11,8);
      addTrap(11,9);
      addStairs(19, 8);
	  addStairs(19, 9);
    }
  }
}

