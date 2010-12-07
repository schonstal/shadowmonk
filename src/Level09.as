package
{
    import org.flixel.*;

    public class Level09 extends PlayState
    {
        [Embed(source = '../data/Level09/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;        
        [Embed(source = '../data/Level09/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

        public function Level09() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(1,11,3);

            addGuard(new Array(new FlxPoint(12,10), new FlxPoint(3,10)), 2);
            addGuard(new Array(new FlxPoint(12,11), new FlxPoint(3,11)), 2);
			addGuard(new Array(new FlxPoint(4,7), new FlxPoint(4, 14)), 3);
			addGuard(new Array(new FlxPoint(7,14), new FlxPoint(7, 7)), 2);
			addGuard(new Array(new FlxPoint(10,7), new FlxPoint(10, 14)), 0);
			addGuard(new Array(new FlxPoint(12, 7), new FlxPoint(13, 11), new FlxPoint(17, 11), new FlxPoint(16, 6), new FlxPoint (12, 6)), 0);
			addGuard(new Array(new FlxPoint(12, 14), new FlxPoint(13, 10), new FlxPoint(16, 10), new FlxPoint(16, 15), new FlxPoint (12, 15)), 0);

            addTrap(3,9);
            addTrap(4,9);
            addTrap(6,10);
            addTrap(8, 11);
			addTrap(8, 15);
			addTrap(11, 15);
			addTrap(12, 12);
			addTrap(13, 13);
			addTrap(15, 13);
			addTrap(15, 10);
			addTrap(15, 11);
			addTrap(15, 6);
			addTrap(17, 12);
            addStairs(18,10);
            addStairs(18,11);
        }
    }
}  
