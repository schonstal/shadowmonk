package
{
  import org.flixel.*;

  public class Level13 extends PlayState
  {
    [Embed(source = '../data/Level13/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level13/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

    public function Level13()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();
    }

    public override function initialize():void {
      FlxG.level = 13;
      _player = new Player(3,12,1);
      addGuard(new Array(new FlxPoint(5,11), new FlxPoint(5,13), new FlxPoint(6,13), new FlxPoint(6, 16), new FlxPoint(7,16), new FlxPoint(7,18), new FlxPoint(11,18), new FlxPoint (11,14), new FlxPoint(8,14), new FlxPoint(8,9), new FlxPoint(11,9), new FlxPoint(11,12), new FlxPoint(13,12), new FlxPoint(13,7), new FlxPoint(6,7), new FlxPoint(6,10), new FlxPoint(5,10)), 2);
      addGuard(new Array(new FlxPoint(4, 10), new FlxPoint(6, 10)), 3);
	  addGuard(new Array(new FlxPoint(13, 14), new FlxPoint(13, 18)), 2);
	  addGuard(new Array(new FlxPoint(15, 8), new FlxPoint(15, 17), new FlxPoint(20, 17), new FlxPoint(20, 13), new FlxPoint(17, 13), new FlxPoint(17, 11), new FlxPoint(22, 11), new FlxPoint(22, 18), new FlxPoint(24, 18), new FlxPoint(7, 24), new FlxPoint(7, 15)), 2);
	  addGuard(new Array(new FlxPoint(18, 15), new FlxPoint(18, 18)), 2);
	  addGuard(new Array(new FlxPoint(20, 9), new FlxPoint(20, 13)), 2);
	  
	  addTrap(4,9);
      addTrap(4,11);
      addTrap(4,14);
      addTrap(5,10);
      addTrap(5,7);
      addTrap(5,8);
      addTrap(5, 14);
	  addTrap(5, 15);
	  addTrap(5, 17);
	  addTrap(5, 18);
	  addTrap(6, 11);
	  addTrap(6, 17);
	  addTrap(7, 8);
	  addTrap(7, 9);
	  addTrap(7, 10);
	  addTrap(7, 11);
	  addTrap(7, 12);
	  addTrap(7,13);
      addTrap(7,14);
      addTrap(7,15);
      addTrap(8,8);
      addTrap(8,15);
      addTrap(9,8);
      addTrap(9, 10);
	  addTrap(9, 15);
	  addTrap(9, 16);
	  addTrap(9, 17);
	  addTrap(10, 8);
	  addTrap(10, 10);
	  addTrap(10, 11);
	  addTrap(10, 12);
	  addTrap(10, 13);
	  addTrap(10, 17);
	  addTrap(11, 8);
	  addTrap(11,13);
      addTrap(12,8);
      addTrap(12,9);
      addTrap(12,10);
      addTrap(12, 13);
	  addTrap(12, 16);
	  addTrap(12, 17);
	  addTrap(12, 18);
	  addTrap(13, 13);
	  addTrap(14, 14);
	  addTrap(14, 15);
	  addTrap(15, 18);
	  addTrap(16, 8);
	  addTrap(16, 9);
	  addTrap(16, 10);
	  addTrap(16, 11);
	  addTrap(16, 12);
	  addTrap(16, 13);
	  addTrap(16, 14);
	  addTrap(16, 15);
	  addTrap(16, 16);
	  addTrap(16, 18);
	  addTrap(17,10);
      addTrap(17,14);
      addTrap(17,16);
      addTrap(17,18);
      addTrap(18,10);
      addTrap(18, 12);
	  addTrap(18, 14);
	  addTrap(19, 8);
	  addTrap(19, 9);
	  addTrap(19, 10);
	  addTrap(19, 12);
	  addTrap(19, 14);
	  addTrap(19, 15);
	  addTrap(19, 16);
	  addTrap(19, 18);
	  addTrap(20, 18);
	  addTrap(21, 10);
	  addTrap(21, 12);
	  addTrap(21, 13);
	  addTrap(21, 14);
	  addTrap(21, 15);
	  addTrap(21, 16);
	  addTrap(21, 17);
	  addTrap(21,18);
      addTrap(22,10);
      addTrap(22,8);
      addTrap(22,9);
      addTrap(22,10);
      addTrap(22, 11);
	  addTrap(22, 12);
	  addTrap(22, 13);
	  addTrap(22, 14);
	  addTrap(22, 15);
	  addTrap(22, 16);
	

	  
      addStairs(25, 12);
	  addStairs(25, 13);
    }
  }
}

