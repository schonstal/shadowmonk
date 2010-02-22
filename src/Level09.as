package
{
  import org.flixel.*;

  public class Level09 extends PlayState
  {
    [Embed(source = '../data/Level09/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;
    [Embed(source = '../data/Level09/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

    public function Level09()
    {
      GroundMap = Ground;
      WallMap = Wall;
      super();

      _player = new Player(1,1,2);

      postInit();
    }
  }
}

