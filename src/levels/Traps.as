package levels
{
	import org.flixel.*;

	public class Traps extends PlayState
	{
        [Embed(source = '../../data/Levels/Traps/Ground.txt', mimeType = "application/octet-stream")] private var Ground:Class;
        [Embed(source = '../../data/Levels/Traps/Wall.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Traps";

        public function Traps() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(4, 9, Direction.RIGHT);
			
			barActive = true;
			
			addForceField(6, 8);
			addForceField(7, 8);
			addForceField(8, 8);
			addForceField(9, 8);
			addForceField(10, 8);
			addForceField(11, 8);
			addForceField(12, 8);
			addForceField(13, 8);
			addForceField(14, 8);
			addForceField(15, 8);
			addForceField(16, 8);
			addForceField(17, 8);
			addForceField(6, 10);
			addForceField(7, 10);
			addForceField(8, 10);
			addForceField(9, 10);
			addForceField(10, 10);
			addForceField(11, 10);
			addForceField(12, 10);
			addForceField(13, 10);
			addForceField(14, 10);
			addForceField(15, 10);
			addForceField(16, 10);
			addForceField(17, 10);
			
			addTrap(6, 16);
			addTrap(7, 16);
			addTrap(8, 16);
			addTrap(9, 16);
			addTrap(10, 16);
			addTrap(11, 16);
			addTrap(12, 16);
			addTrap(13, 16);
			addTrap(14, 16);
			addTrap(15, 16);
			addTrap(16, 16);
			addTrap(17, 16);
			addTrap(6, 18);
			addTrap(7, 18);
			addTrap(8, 18);
			addTrap(9, 18);
			addTrap(10, 18);
			addTrap(11, 18);
			addTrap(12, 18);
			addTrap(13, 18);
			addTrap(14, 18);
			addTrap(15, 18);
			addTrap(16, 18);
			addTrap(17, 18);
			
            addStairs(19, 17);
		}
	}
}

