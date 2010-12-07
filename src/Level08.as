package
{
    import org.flixel.*;

    public class Level08 extends PlayState
    {
        [Embed(source = '../data/Level08/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;        
        [Embed(source = '../data/Level08/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;

        public function Level08() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(1,7,3);

            addGuard(new Array(new FlxPoint(11,8), new FlxPoint(5,8)), 2);
            addGuard(new Array(new FlxPoint(9,12), new FlxPoint(9,6)), 0);
			addGuard(new Array(new FlxPoint(14,14), new FlxPoint(14, 7)), 2);
			addGuard(new Array(new FlxPoint(21,9), new FlxPoint(13, 9)), 2);
			addGuard(new Array(new FlxPoint(19,6), new FlxPoint(19, 12)), 0);
			addGuard(new Array(new FlxPoint(22,6), new FlxPoint(22, 12)), 0);

            addTrap(7,9);
            addTrap(21,9);
            addTrap(23,7);
            addTrap(23,10);
            addStairs(23,8);
            addStairs(23,9);
        }
    }
}  
