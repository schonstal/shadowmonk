package levels
{
	import org.flixel.*;

	public class Squared extends PlayState
	{
        [Embed(source = '../../data/Levels/Squared/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Squared/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Squared";

        public function Squared() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(8, 8, Direction.RIGHT);
			addArrow(10,3,10,9,0.8,0.8);
			addForceField(11,8);
			addForceField(10, 7);
			addForceField(11, 6);
			addForceField(9,4);
            addStairs(12,8);
		}
	}
}

