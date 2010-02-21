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
            
            velocity.x = Math.sin(ang) * (_player.x>X?400:-400);
            velocity.y = Math.cos(ang) * (_player.x>X?-400:400);

            addAnimation("normal", [0,1,2], 20);      
            _embers = FlxG.state.add(new FlxEmitter(X, Y, 0.1)) as FlxEmitter;
            _embers.createSprites(ImgEmber, 100, true, Layer);
            _embers.setXVelocity(1,-velocity.x*0.01);
            _embers.setYVelocity(-10,10);
            _embers.gravity = -5;

            angle = ang * (180/Math.PI);
        }
        
        private function getAngle(X:Number,Y:Number,X2:Number,Y2:Number):Number
        {
            var ret:Number = Math.atan((Y2-Y)/(X2-X));
            return ret + Math.PI/2;
        }
        
        public override function update():void {
            play("normal");
            _embers.emit();
            _embers.emit();
            _embers.emit();
            _embers.emit();
            _embers.emit();
            _embers.x = x + 8;
            _embers.y = y + 8;
            //Is there a normal collide?
            if(FlxG.collideArray(new Array(_player), this))
                FlxG.state = new Dead();
            super.update();
        }
        
    }
    
}
