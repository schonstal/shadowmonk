package levels
{
	import org.flixel.*;

	public class Welcome extends PlayState
	{
        [Embed(source = '../../data/Levels/Welcome/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Welcome/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Quick Learner";

        public function Welcome() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 7, Direction.RIGHT);
			
			barActive = false;
			
			addArrow(10, 6, 10, 10, 1.2, 0.5);
			
			addForceField(11, 7, false, false);
			addForceField(10, 8);
			addForceField(10, 6);
			addForceField(10, 10);
			
            addStairs(12, 7);
		}
	}
}

