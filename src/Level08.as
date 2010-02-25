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
            _player = new Player(7,3,3);

            addGuard(new Array(new FlxPoint(8,10), new FlxPoint(8,5)), 2);
            addGuard(new Array(new FlxPoint(10,7), new FlxPoint(5,7)), 0);

            addTrap(7,5);
            addTrap(10,7);
            addTrap(5,8);
            addTrap(7,8);
            addTrap(8,10);
            addStairs(12,7);
            addStairs(12,8);
        }
    }
}  
