package
{
    import org.flixel.*;

    public class Level11 extends PlayState
    {
        [Embed(source = '../data/Level10/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;        
        [Embed(source = '../data/Level10/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

        public function Level10() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(1, 9, 3);
			
			addStairs(22, 9);
			addStairs(22, 10);

          
          
        }
    }
}  
