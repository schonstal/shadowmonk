package levels
{
    import org.flixel.*;

    public class Level11 extends PlayState
    {
        [Embed(source = '../../data/Level11/layer_0.txt', mimeType = "application/octet-stream")] private var Ground:Class;        
        [Embed(source = '../../data/Level11/layer_1.txt', mimeType = "application/octet-stream")] private var Wall:Class;
        public static var title:String = "MY GIRLFRIEND";

        public function Level11() {
            GroundMap = Ground;
            WallMap = Wall;
            super();
        }

        public override function initialize():void {
            _player = new Player(1, 9, 3);
			
			addStairs(22, 9);
			addStairs(22, 10);

            addArrow(3,16,3,3);
            addArrow(5,15,5,4);
            addArrow(7,14,7,5);
            addArrow(9,13,9,6);
            addArrow(11,12,11,7);
            addArrow(13,13,13,6);
            addArrow(15,14,15,5);
            addArrow(17,15,17,4);
            addArrow(19,16,19,3);

            addArrow(3,3,3,16);
            addArrow(5,4,5,15);
            addArrow(7,5,7,14);
            addArrow(9,6,9,13);
            addArrow(11,7,11,12);
            addArrow(13,6,13,13);
            addArrow(15,5,15,14);
            addArrow(17,4,17,15);
            addArrow(19,3,19,16);

            setGoals(7.5, 9, 15);
        }
    }
}  
