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
      _player = new Player(1,1,2);
    }
  }
}

