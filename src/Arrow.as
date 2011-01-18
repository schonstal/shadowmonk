package
{
    import org.flixel.*;
    
    public class Arrow extends FlxSprite
    {
        [Embed(source = "../data/Arrow_flaming.png")] private var ImgArrow:Class;
        [Embed(source = "../data/Ember.png")] private var ImgEmber:Class;
        
        private var _embers:FlxEmitter;
        private var _dest:FlxPoint;
        private var _start:FlxPoint;
        private var _state:PlayState;
        private var _penetrating:Boolean = true;
        private var _player:Player;
        private var _big:Boolean;
        
        public var light:Light;

        public function Arrow(X:Number, Y:Number, X2:Number, Y2:Number, ThePlayer:Player, Big:Boolean):void
        {
            super(X + 6.5, Y);
            loadGraphic(ImgArrow, true, true, 16, 16);
           
            _start = new FlxPoint(x, y);
            _dest = new FlxPoint(X2 + 6.5, Y2);
            _state = FlxG.state as PlayState;
            _player = ThePlayer;
            _big = Big;

            width = 3;
            height = 16;
            
            offset.x = 6.5;

            fixed = true;
            
            var dX:Number = x - _dest.x;
            var dY:Number = y - _dest.y;
            var dist:Number = Math.sqrt(dX*dX+dY*dY);
            
            angle = getAngle(x,y,_dest.x,_dest.y);
            var ang:Number = angle * (Math.PI/180);
            angle -= 90;
           
            //This angle is in RADIANS! 
            var emberSpread:Number = 0.17;
            //% of arrow velocity
            var emberSpeed:Number = 0.05;
            var arrowSpeed:Number = 400;
            var emberMin:FlxPoint = new FlxPoint();
            var emberMax:FlxPoint = new FlxPoint();
            
            velocity.y = Math.sin(ang) * arrowSpeed;
            velocity.x = Math.cos(ang) * arrowSpeed;
            
            emberMax.y = Math.sin(ang+emberSpread) * arrowSpeed * emberSpeed;// * (_dest.x>X?400:-400) * emberSpeed;
            emberMax.x = Math.cos(ang+emberSpread) * arrowSpeed * emberSpeed;
            
            emberMin.y = Math.sin(ang-emberSpread) * arrowSpeed * emberSpeed;
            emberMin.x = Math.cos(ang-emberSpread) * arrowSpeed * emberSpeed;

            addAnimation("normal", [0,1,2], 20);      
            _embers = new FlxEmitter(x-offset.x, y);
            _state.addEmitter(_embers);
            _embers.createSprites(ImgEmber, 10, 0, true, 0);
            _embers.setXSpeed(emberMin.x,emberMax.x);
            _embers.setYSpeed(emberMin.y,emberMax.y);
            _embers.gravity = 0;
            _embers.delay = 0.1;
            _embers.particleDrag = new FlxPoint(5,5);
            _embers.start(false);

            refire();
        }
        
        private function getAngle(X:Number,Y:Number,X2:Number,Y2:Number):Number
        {
            if(X == X2)
                X += 0.00001;
         /*   var ret:Number = Math.atan((Y2-Y)/(X2-X));
            return ret + Math.PI/2;*/
            return FlxU.getAngle(X2-X,Y2-Y);
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
            _embers.x = x + 8 - offset.x;
            _embers.y = y + 8;
            //Is there a normal collide?
            if(!dead && !_player.dead && (collide(_player) || _big && distance(x,y,_player.x,_player.y) < 20)) {
                _state.dead("SHOT BY AN ARROW");
                _player.mobile = false;
                die();
            } else if(!(_player.x == _dest.x && _player.y == _dest.y) &&
                    distance(_dest.x, _dest.y, x, y) < 8) {
                die();
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
        
        public function die():void {
            visible = false;
            light.exists = false;
            dead = true;
        }
        
        public function refire():void {
            SoundBank.play("arrow", false);
            x = _start.x;
            y = _start.y;
            visible = true;
            if(light)
                light.exists = true;
            dead = false;
        }
        
    }
    
}
