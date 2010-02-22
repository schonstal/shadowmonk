package
{
  import org.flixel.*;

  public class LevelD extends PlayState
  {
    [Embed(source = '../data/Level07/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level07/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

    public function LevelD()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();

      _player = new Player(1,1,3);

      addGuard(new Array(new FlxPoint(2,2), new FlxPoint(2,8), new FlxPoint(8, 8), new FlxPoint(8,2)),1);
      addGuard(new Array(new FlxPoint(6,6), new FlxPoint(6,14), new FlxPoint(6, 4), new FlxPoint(3,9)),1);
      addTrap(5,5);
      addStairs(10,10);

      postInit();
    }
  }
}

