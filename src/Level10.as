package
{
    import org.flixel.*;

    public class Level10 extends PlayState
    {
        [Embed(source = '../data/Level10/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;        
        [Embed(source = '../data/Level10/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "Inglourious";

        public function Level10() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(1,11,3);

            addGuard(new Array(new FlxPoint(5,13), new FlxPoint(9,13), new FlxPoint(9,8), new FlxPoint(5,8)),  2);
            addGuard(new Array(new FlxPoint(9,13), new FlxPoint(5,13), new FlxPoint(5,8), new FlxPoint(9,8)), 2);
			addGuard(new Array(new FlxPoint(8,11), new FlxPoint(13, 11), new FlxPoint(13,8), new FlxPoint(8,8)), 3);
			addGuard(new Array(new FlxPoint(18,18), new FlxPoint(12, 18)), 0);
			addGuard(new Array(new FlxPoint(25, 8), new FlxPoint(25, 11), new FlxPoint(21, 11), new FlxPoint(25, 8)), 0);
			addGuard(new Array(new FlxPoint(25, 14), new FlxPoint(20, 14), new FlxPoint(20, 11), new FlxPoint(25, 11)), 0);

            addTrap(7,13);
            addTrap(7,14);
            addTrap(11,13);
            addTrap(13, 16);
			addTrap(13, 17);
			addTrap(17, 17);
			addTrap(18, 17);
			addTrap(15, 17);
			addTrap(19, 12);
			addTrap(19, 11);
			addTrap(22, 14);
			addTrap(22, 11);
			addTrap(24, 12);
			addTrap(26, 10);
            addStairs(29,12);
            addStairs(29,13);
        }
    }
}  
