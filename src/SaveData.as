package
{
    import org.flixel.*;

    public class SaveData
    {
        protected static var _instance:SaveData;

        protected static var levels:int = 11;
        
        public var saveState:FlxSave;

        //was it loaded?
        public var loaded:Boolean = false;

        //volatile values if it fails to load.
        public var volStars:Array;
        public var volTimes:Array;
        public var volCompleted:int;

        private static function get instance():SaveData {
            if(_instance == null)
                _instance = new SaveData();
            return _instance;
        }

        public static function get completed():int {
            if(instance.loaded)
                return instance.saveState.data.completed;
            else
                return instance.volCompleted;
        }
        
        public static function set completed(value:int):void {
            if(instance.loaded)
                instance.saveState.data.completed = value;
            else
                instance.volCompleted = value;
        }
        
        public static function load():void {
            instance.saveState = new FlxSave();
            instance.loaded = instance.saveState.bind("shadowmonk");
            var i:int;
            if(instance.loaded) {
                if(instance.saveState.data.stars == null)
                    instance.saveState.data.stars = new Array();
                if(instance.saveState.data.times == null)
                    instance.saveState.data.times = new Array();
                if(instance.saveState.data.completed == null)
                    instance.saveState.data.completed = 0;
                for(i=0; i < levels; i++) {
                    if(instance.saveState.data.stars[i] == null)
                        instance.saveState.data.stars[i] = 0;
                    if(instance.saveState.data.times[i] == null)
                        instance.saveState.data.times[i] = 5999.99;
                }
            } else {
                instance.volStars = new Array();
                instance.volTimes = new Array();
                instance.volCompleted = 0;
                for(i=0; i < levels; i++) {
                    instance.volStars[i] = 0;
                    instance.volTimes[i] = 5999.99;
                }
            }
        }

    }
}

