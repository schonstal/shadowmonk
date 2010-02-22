package
{
  import org.flixel.*;

  public class Level04 extends PlayState
  {
    [Embed(source = '../data/Level04/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level04/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

    public function Level04()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();
    }

    public override function initialize():void {
      _player = new Player(2,6,2);
      addGuard(new Array(new FlxPoint(10,10), new FlxPoint(13,10), new FlxPoint(13, 5), new FlxPoint(7, 5), new FlxPoint(7,10)), 1);
    }
  }
}

