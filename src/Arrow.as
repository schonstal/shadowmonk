package
{
    import org.flixel.*;
    
    public class Arrow extends FlxSprite
    {
        [Embed(source = "../data/Arrow_flaming.png")] private var ImgArrow:Class;
        [Embed(source = "../data/Ember.png")] private var ImgEmber:Class;
        
        private var _embers:FlxEmitter;
        private var _dest:FlxPoint;
        private var _state:PlayState;
        private var _penetrating:Boolean = true;
        
        public var light:Light;

        public function Arrow(X:Number, Y:Number, X2:Number, Y2:Number, Layer:FlxGroup):void
        {
            super(X-8, Y-8);
            loadGraphic(ImgArrow, true, true, 16, 16);
            
            _dest = new FlxPoint(X2, Y2);
            _state = FlxG.state as PlayState;
            
            var dX:Number = X - _dest.x;
            var dY:Number = Y - _dest.y;
            var dist:Number = Math.sqrt(dX*dX+dY*dY);
            var ang:Number = getAngle(X,Y,_dest.x,_dest.y);
           
            //This angle is in RADIANS! 
            var emberSpread:Number = 0.17;
            //% of arrow velocity
            var emberSpeed:Number = 0.05;
            var emberMin:FlxPoint = new FlxPoint();
            var emberMax:FlxPoint = new FlxPoint();
            
            velocity.x = Math.sin(ang) * (_dest.x>X?400:-400);
            velocity.y = Math.cos(ang) * (_dest.x>X?-400:400);
            
            emberMax.x = Math.sin(ang+emberSpread) * (_dest.x>X?400:-400) * emberSpeed;
            emberMax.y = Math.cos(ang+emberSpread) * (_dest.x>X?-400:400) * emberSpeed;
            
            emberMin.x = Math.sin(ang-emberSpread) * (_dest.x>X?400:-400) * emberSpeed;
            emberMin.y = Math.cos(ang-emberSpread) * (_dest.x>X?-400:400) * emberSpeed;

            addAnimation("normal", [0,1,2], 20);      
            _embers = FlxG.state.add(new FlxEmitter(X, Y)) as FlxEmitter;
            _embers.createSprites(ImgEmber, 20, 0, true, 0);
            _embers.setXSpeed(emberMin.x,emberMax.x);
            _embers.setYSpeed(emberMin.y,emberMax.y);
            _embers.gravity = 0;
            _embers.delay = 0.1;
            _embers.particleDrag = new FlxPoint(5,5);
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
            _embers.update();
            _embers.x = x + 8;
            _embers.y = y + 8;
            //Is there a normal collide?
            if(distance(_dest.x, _dest.y, x, y) < 16) {
                _state.dead("SHOT BY AN ARROW");
                visible = false;
                light.exists = false;
                dead = true;
            } else {
                if(!dead) {
                    _embers.delay = 0.15 * Math.random() + 0.02;
                } else {
                    if(onScreen())
                        _embers.delay = 1;
                    else
                        _embers.delay = 0.1;
                }
            }
            super.update();
        }
        
    }
    
}
