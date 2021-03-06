package levels
{
	import org.flixel.*;

	public class Squared extends PlayState
	{
        [Embed(source = '../../data/Levels/Squared/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Squared/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Upright";

        public function Squared() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 9, Direction.RIGHT);
			
			barActive = false;
			
			addArrow(10, 4, 10, 10, 1.5, 0.8);
			
			addForceField(11, 9, false, false);
			addForceField(10, 8);
			addForceField(11, 7, false, false);
			addForceField(9, 5, false, false);
			
            addStairs(12, 9);
		}
	}
}

