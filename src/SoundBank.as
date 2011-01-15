package
{
    import org.flixel.*;

    public class SoundBank
    {
        [Embed(source="../data/Sounds/Arrow_fire.mp3")] public var ArrowFire:Class;
        [Embed(source="../data/Sounds/Guard_alert.mp3")] public var GuardAlert:Class;
        [Embed(source="../data/Sounds/Guard_lost.mp3")] public var GuardLost:Class;
        [Embed(source="../data/Sounds/Level_select_down.mp3")] public var LevelSelectDown:Class;
        [Embed(source="../data/Sounds/Level_select_up.mp3")] public var LevelSelectUp:Class;
        [Embed(source="../data/Sounds/Level_start.mp3")] public var LevelStart:Class;
        [Embed(source="../data/Sounds/Level_win.mp3")] public var LevelWin:Class;
        [Embed(source="../data/Sounds/Monk_explode.mp3")] public var MonkExplode:Class;
        [Embed(source="../data/Sounds/Level_select.mp3")] public var LevelSelect:Class;
        //[Embed(source="../data/Sounds/Monk_fall.mp3")] public var MonkFall:Class;

        protected static var _instance:SoundBank;
        
        public var sounds:Object;
        public var fader:Number;

        public static function get instance():SoundBank {
            if(_instance == null)
                _instance = new SoundBank();
            return _instance;
        }

        public static function play(Id:String, Stop:Boolean = true):FlxSound {
            if(Stop)
                instance.sounds[Id].stop();
            instance.sounds[Id].play();
            return instance.sounds[Id];
        }

        public function SoundBank() {
            sounds = new Object();
        }

        //Load all the sounds into the bank
        public static function load():void {
            loadSound("arrow", instance.ArrowFire);
            loadSound("alert", instance.GuardAlert);
            loadSound("lost", instance.GuardLost);
            loadSound("down", instance.LevelSelectDown);
            loadSound("up", instance.LevelSelectUp);
            loadSound("start", instance.LevelStart);
            loadSound("win", instance.LevelWin);
            loadSound("explode", instance.MonkExplode);
            loadSound("select", instance.LevelSelect);
        }
        
        private static function loadSound(Id:String, EmbeddedSound:Class):void {
            instance.sounds[Id] = new FlxSound();
            instance.sounds[Id].loadEmbedded(EmbeddedSound);
        }

        public static function fadeOut(Seconds:Number):void {
            instance.fader -= FlxG.elapsed / Seconds;
            for each (var sound:FlxSound in instance.sounds) {
                sound.volume = fader;
            }
        }
    }
}

