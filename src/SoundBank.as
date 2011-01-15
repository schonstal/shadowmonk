package
{
    import org.flixel.*;

    public class SoundBank
    {
        //Sounds
        [Embed(source="../data/Sounds/Arrow_fire.mp3")] public var ArrowFire:Class;
        [Embed(source="../data/Sounds/Guard_alert.mp3")] public var GuardAlert:Class;
        [Embed(source="../data/Sounds/Guard_lost.mp3")] public var GuardLost:Class;
        [Embed(source="../data/Sounds/Level_select_down.mp3")] public var LevelSelectDown:Class;
        [Embed(source="../data/Sounds/Level_select_up.mp3")] public var LevelSelectUp:Class;
        [Embed(source="../data/Sounds/Level_start.mp3")] public var LevelStart:Class;
        [Embed(source="../data/Sounds/Level_win.mp3")] public var LevelWin:Class;
        [Embed(source="../data/Sounds/Monk_explode.mp3")] public var MonkExplode:Class;
        [Embed(source="../data/Sounds/Level_select.mp3")] public var LevelSelect:Class;
        [Embed(source="../data/Sounds/Monk_fall.mp3")] public var MonkFall:Class;
        
        //Music
        [Embed(source="../data/Music/credits.mp3")] public var CreditsMusic:Class;
        [Embed(source="../data/Music/game.mp3")] public var GameMusic:Class;
        [Embed(source="../data/Music/intro.mp3")] public var IntroMusic:Class;
        [Embed(source="../data/Music/level_select.mp3")] public var LevelSelectMusic:Class;

        protected static var _instance:SoundBank;
        
        public var sounds:Object;
        public var classes:Object;
        public var fader:Number = 1;
        public var music:Object;

        public static function get instance():SoundBank {
            if(_instance == null)
                _instance = new SoundBank();
            return _instance;
        }

        public static function play(Id:String, Stop:Boolean = true):FlxSound {
            if(Stop)
                instance.sounds[Id].stop();
            if(!instance.sounds[Id].playing) {
                instance.sounds[Id].destroy();
                instance.sounds[Id] = FlxG.play(instance.classes[Id]);
            }
            return instance.sounds[Id];
        }

        public function SoundBank() {
            sounds = new Object();
            classes = new Object();
            music = new Object();
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
            loadSound("trap", instance.MonkFall);

            loadMusic("credits", instance.CreditsMusic);
            loadMusic("game", instance.GameMusic);
            loadMusic("intro", instance.IntroMusic);
            loadMusic("level_select", instance.LevelSelectMusic);
        }
        
        private static function loadSound(Id:String, EmbeddedSound:Class):void {
            instance.classes[Id] = EmbeddedSound;
            instance.sounds[Id] = new FlxSound();
            instance.sounds[Id].loadEmbedded(EmbeddedSound);
        }
        
        private static function loadMusic(Id:String, EmbeddedSound:Class):void {
            instance.music[Id] = EmbeddedSound;
        }

        public static function music(Id:String):void {
            FlxG.playMusic(instance.music[Id]);
        }

        //Setting the volume of a sound breaks it...
        public static function fadeOut(Seconds:Number):void {
            instance.fader -= 0.01;//FlxG.elapsed / Seconds;
            /*
            for (var key:String in instance.sounds) {
                instance.sounds[key].volume = 0.5;
            }*/
        }

        public static function reset():void {
            instance.fader = 1;
            for (var key:String in instance.sounds) {
                instance.sounds[key].volume = instance.fader;
            }
        }
    }
}

