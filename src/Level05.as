package
{
  import org.flixel.*;

  public class Level05 extends PlayState
  {
    [Embed(source = '../data/Level05/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level05/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
    public static var title:String = "Groovy";

    public function Level05()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();
    }

    public override function initialize():void {
      FlxG.level = 5;
      _player = new Player(4,14,1);
      addGuard(new Array(new FlxPoint(8,16), new FlxPoint(8,22)), 3);
      addGuard(new Array(new FlxPoint(16, 18), new FlxPoint(16, 18)), 2);
      addTrap(12,14);
      addTrap(12,15);
      addTrap(15,12);
      addStairs(18, 14);
	  addStairs(18, 15);
    }
  }
}

