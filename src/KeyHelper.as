package
{
    import org.flixel.*;

    /* 
     * When Flixel switches states, it resets FlxG.keys
     * This is a problem because it sets the pressed flags for the
     * keys by listening for a key down event, but that never happens
     * until you lift the key, then press the key back down
     */
    public class KeyHelper
    {
        private static var _instance:KeyHelper;
        
        public var oldKeys:Object;

        private static function get instance():KeyHelper {
            if(_instance == null) {
                _instance = new KeyHelper();
                _instance.oldKeys = new Object;
            }
            return _instance;
        }

        public static function get oldKeys():Object {
            return _instance.oldKeys;
        }

        //Call this as you end the state!
        public static function save(... Keys):void {
            var value:Object;
            for each (value in Keys) {
                if(value is String) {
                    var key:String = value as String;
                    instance.oldKeys[key] = FlxG.keys.pressed(key);
                }
            }
        }
        
        public static function reset(... Keys):void {
            var value:Object
            for each (value in Keys) {
                if(value is String) {
                    var key:String = value as String;
                    if(instance.oldKeys[key])
                        FlxG.keys.setKeyDown(key);
                }
            }
        }
            
    }
}

