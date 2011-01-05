package
{
    import org.flixel.*;
    
    public class Arrow extends FlxSprite
    {
        [Embed(source = "../data/Arrow_flaming.png")] private var ImgArrow:Class;
        [Embed(source = "../data/Ember.png")] private var ImgEmber:Class;
        
        private var _embers:FlxEmitter;
        private var _player:Player;

        public function Arrow(X:Number, Y:Number, ThePlayer:Player, Layer:FlxGroup):void
        {
            super(X-8, Y-8);
            loadGraphic(ImgArrow, true, true, 16, 16);
            
            _player = ThePlayer;
            
            var dX:Number = X - ThePlayer.x;
            var dY:Number = Y - ThePlayer.y;
            var dist:Number = Math.sqrt(dX*dX+dY*dY);
            var ang:Number = getAngle(X,Y,ThePlayer.x,ThePlayer.y);
           
            //This angle is in RADIANS! 
            var emberSpread:Number = 0.17;
            //% of arrow velocity
            var emberSpeed:Number = 0.05;
            var emberMin:FlxPoint = new FlxPoint();
            var emberMax:FlxPoint = new FlxPoint();
            
            velocity.x = Math.sin(ang) * (_player.x>X?400:-400);
            velocity.y = Math.cos(ang) * (_player.x>X?-400:400);
            
            emberMax.x = Math.sin(ang+emberSpread) * (_player.x>X?400:-400) * emberSpeed;
            emberMax.y = Math.cos(ang+emberSpread) * (_player.x>X?-400:400) * emberSpeed;
            
            emberMin.x = Math.sin(ang-emberSpread) * (_player.x>X?400:-400) * emberSpeed;
            emberMin.y = Math.cos(ang-emberSpread) * (_player.x>X?-400:400) * emberSpeed;

            addAnimation("normal", [0,1,2], 20);      
            _embers = FlxG.state.add(new FlxEmitter(X, Y)) as FlxEmitter;
            _embers.createSprites(ImgEmber, 100, 0, true, 0);
            _embers.setXSpeed(emberMin.x,emberMax.x);
            _embers.setYSpeed(emberMin.y,emberMax.y);
            _embers.gravity = 0;
            _embers.delay = 0.1;
            _embers.start(false);

            angle = ang * (180/Math.PI);
        }
        
        private function getAngle(X:Number,Y:Number,X2:Number,Y2:Number):Number
        {
            var ret:Number = Math.atan((Y2-Y)/(X2-X));
            return ret + Math.PI/2;
        }
        
        private function distance(X:Number,Y:Number,X0:Number,Y0:Number):Number {
            var dX:Number = X-X0;
            var dY:Number = Y-Y0;
            return Math.sqrt(dX*dX+dY*dY);
        }
        
        public override function update():void {
            play("normal");
            //Randomize frequency :)
            _embers.delay = 0.15 * Math.random() + 0.02;
            _embers.update();
            _embers.x = x + 8;
            _embers.y = y + 8;
            //Is there a normal collide?
            if(distance(_player.x, _player.y, x, y) < 16)
                FlxG.state = new Dead(Level07, "SHOT BY AN ARROW");
            super.update();
        }
        
    }
    
}
