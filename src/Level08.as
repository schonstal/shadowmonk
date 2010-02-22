package
{
  import org.flixel.*;

  public class Level08 extends PlayState
  {
    [Embed(source = '../data/Level08/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level08/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

    public function Level08()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();

      _player = new Player(1,1,2);

      postInit();
    }
  }
}

