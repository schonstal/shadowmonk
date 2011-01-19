package
{
  import org.flixel.*;

  public class Level12 extends PlayState
  {
    [Embed(source = '../data/Level12/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level12/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
    public static var title:String = "Fugget McGee";

    public function Level12()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();
    }

    public override function initialize():void {
      FlxG.level = 12;
      _player = new Player(2,8,1);
      addGuard(new Array(new FlxPoint(6, 6), new FlxPoint(6, 11), new FlxPoint(8, 11), new FlxPoint(8, 7), new FlxPoint (12, 7), new FlxPoint(12, 11), new FlxPoint(17, 11), new FlxPoint(17, 6)), 2);
	  addGuard(new Array(new FlxPoint(17,6), new FlxPoint(6,6), new FlxPoint(6,11), new FlxPoint(8,11), new FlxPoint(8, 7), new FlxPoint (12,7), new FlxPoint(12,11), new FlxPoint(17,11)), 2);
      addTrap(7,7);
      addTrap(7,8);
      addTrap(7,9);
      addTrap(7,10);
      addTrap(9,9);
      addTrap(9,10);
      addTrap(9,11);
      addTrap(8, 7);
	  addTrap(9, 7);
	  addTrap(10, 7);
	  addTrap(11, 7);
	  addTrap(12, 7);
	  addTrap(13, 7);
	  addTrap(14, 7);
	  addTrap(15, 7);
	  addTrap(16, 7);
	  addTrap(16, 8);
	  addTrap(16, 9);
	  addTrap(13, 8);
	  addTrap(13, 9);
	  
      addStairs(19, 8);
	  addStairs(19, 9);
    }
  }
}

