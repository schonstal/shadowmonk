package
{
    import org.flixel.*;

    public class KeyGroup extends FlxGroup
    {
        [Embed(source = "../data/key.png")] private var ImgKey:Class;

		protected var _state:PlayState;
        protected var _key:FlxSprite;
		protected var _locks:FlxGroup;
		protected var _player:Player;

        public var scale:Number;

        public function KeyGroup(ThePlayer:Player, KeyLayer:FlxGroup, LockLayer:FlxGroup, KeyLocation:FlxPoint, Locks:Array) {
            _state = FlxG.state as PlayState;
			_key = new FlxSprite(KeyLocation.x * 16, KeyLocation.y * 16);
			_key.loadGraphic(ImgKey, true, false, 16, 16);
			_key.width = 6;
			_key.height = 10;
			_key.offset.x = 5;
			_key.x += _key.offset.x;
			_key.offset.y = 3;
			_key.y += _key.offset.y;
			_key.fixed = true;
			KeyLayer.add(_key);
			
			_locks = new FlxGroup();
			
			var lock:Object;
			for each(lock in Locks) {
				if (lock is FlxPoint) {
					var newLock:Lock = new Lock(lock.x, lock.y);
					_locks.add(newLock);
				}
			}
			LockLayer.add(_locks);
			
			_player = ThePlayer;
        }

        override public function update():void {
            super.update();
			FlxU.collide(_locks, _player);
			if (FlxU.collide(_key, _player)) {
				_locks.exists = false;
				_key.exists = false;
				SoundBank.play("select");
			}
        }
        
    }
}

