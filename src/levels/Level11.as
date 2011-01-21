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

            addArrow(3,16,3,3,0.75,1);
            addArrow(5,15,5,4,0.75,1);
            addArrow(7,14,7,5,0.75,1);
            addArrow(9,13,9,6,0.75,1);
            addArrow(11,12,11,7,0.75,1);
            addArrow(13,13,13,6,0.75,1);
            addArrow(15,14,15,5,0.75,1);
            addArrow(17,15,17,4,0.75,1);
            addArrow(19,16,19,3,0.75,1);
            
            addForceField(3,11);
            addForceField(5,11);
            addForceField(7,11);
            addForceField(9,11);
            addForceField(11,11);
            addForceField(13,11);
            addForceField(15,11);
            addForceField(17,11);
            addForceField(19,11);

            addArrow(3,3,3,16,0.75,1);
            addArrow(5,4,5,15,0.75,1);
            addArrow(7,5,7,14,0.75,1);
            addArrow(9,6,9,13,0.75,1);
            addArrow(11,7,11,12,0.75,1);
            addArrow(13,6,13,13,0.75,1);
            addArrow(15,5,15,14,0.75,1);
            addArrow(17,4,17,15,0.75,1);
            addArrow(19,3,19,16,0.75,1);
            
            addForceField(3,8);
            addForceField(5,8);
            addForceField(7,8);
            addForceField(9,8);
            addForceField(11,8);
            addForceField(13,8);
            addForceField(15,8);
            addForceField(17,8);
            addForceField(19,8);

            setGoals(7.5, 9, 15);
        }
    }
}  
