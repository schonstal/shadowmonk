package
{
    import org.flixel.*;

    public class SoundBank
    {
        //Sounds
        [Embed(source="../data/Sound_package.swf", symbol="Arrow_fire.wav")] public var ArrowFire:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Guard_alert.wav")] public var GuardAlert:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Guard_lost.wav")] public var GuardLost:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Level_select_down.wav")] public var LevelSelectDown:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Level_select_up.wav")] public var LevelSelectUp:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Level_start.wav")] public var LevelStart:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Level_win.wav")] public var LevelWin:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Monk_explode.wav")] public var MonkExplode:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Level_select.wav")] public var LevelSelect:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Monk_fall.wav")] public var MonkFall:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Nope.wav")] public var Nope:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Amulet_on.wav")] public var AmuletOn:Class;
        [Embed(source="../data/Sound_package.swf", symbol="Amulet_off.wav")] public var AmuletOff:Class;
        
        //Music
        [Embed(source="../data/Music_package.swf", symbol="shadow_menu.wav")] public var CreditsMusic:Class;
        [Embed(source="../data/Music_package.swf", symbol="shadow_gameplay.wav")] public var GameMusic:Class;
        [Embed(source="../data/Music_package.swf", symbol="shadow_menu.wav")] public var MenuMusic:Class;
        [Embed(source="../data/Music_package.swf", symbol="shadow_menu.wav")] public var LevelSelectMusic:Class;

        protected static var _instance:SoundBank;
        
        public var sounds:Object;
        public var classes:Object;
        public var fader:Number = 1;
        public var music:Object;

        public var musicVol:Number = 1.0;
        public var sfxVol:Number = 0.3;

        public var musicVolOrig:Number = 1.0;
        public var sfxVolOrig:Number = 0.3;

        public static function get instance():SoundBank {
            if(_instance == null)
                _instance = new SoundBank();
            return _instance;
        }

        public static function play(Id:String, Multi:Boolean = true, volume:Number = 1.0):FlxSound {
            if(!Multi && !instance.sounds[Id].playing) {
                instance.sounds[Id].destroy();
                instance.sounds[Id] = FlxG.play(instance.classes[Id], volume * instance.sfxVol);
            } else if (Multi) {
                //If this becomes a problem, this should be saved somewhere...
                return FlxG.play(instance.classes[Id], volume * instance.sfxVol);
            }
            return instance.sounds[Id];
        }

        public function SoundBank() {
            sounds = new Object();
            classes = new Object();
            music = new Object();
        }

        public static function set musicVolume(value:Number):void {
            instance.musicVolOrig = value;
            instance.musicVol = value;
        }
        
        public static function set sfxVolume(value:Number):void {
            instance.sfxVolOrig = value;
            instance.sfxVol = value;
        }
        
        public static function get musicVolume():Number {
            return instance.musicVol;
        }
        
        public static function get sfxVolume():Number {
            return instance.sfxVol;
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
            loadSound("nope", instance.Nope);
            loadSound("on", instance.AmuletOn);
            loadSound("off", instance.AmuletOff);

            loadMusic("credits", instance.CreditsMusic);
            loadMusic("game", instance.GameMusic);
            loadMusic("menu", instance.MenuMusic);
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

        public static function music(Id:String, volume:Number = 1.0):void {
            FlxG.playMusic(instance.music[Id], volume * instance.musicVol);
        }

        //Setting the volume of a sound breaks it...
        public static function fadeOut(Seconds:Number):void {
            instance.sfxVol -= (FlxG.elapsed / Seconds) * instance.sfxVolOrig;
            FlxG.music.volume -= (FlxG.elapsed / Seconds) * musicVolume;
            /*
            for (var key:String in instance.sounds) {
                instance.sounds[key].volume = 0.5;
            }*/
        }

        public static function reset():void {
            instance.sfxVol = instance.sfxVolOrig;
            FlxG.music.volume = musicVolume;
            for (var key:String in instance.sounds) {
                instance.sounds[key].volume = instance.fader;
            }
        }
    }
}

