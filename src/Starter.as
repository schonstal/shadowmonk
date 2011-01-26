package
{
	import org.flixel.*;
    import levels.*;

	public class Starter
	{
        private static var levelClasses:Array = [
			Look,
			Welcome,
			ZigZag,
			Intersection,
			Serpentine,
			DiodeOne,
			WispTest,
			Traps,
			Level01, 
            Level02,
            Level03,
            Level04,
            Level05,
            Level06,
            Level07,
            Level08,
            Level09,
            Level10,
            Level11,
            Level12,
            Level13
        ];

        public static function get levels():Number {
            return levelClasses.length;
        }

        public static function levelName(Level:Number):String {
            var levelClass:Class = levelClasses[Level-1];
            return levelClass.title;
        }

        public static function startLevel():void {
			if(levelClasses.length >= FlxG.level) {
				var levelClass:Class = levelClasses[FlxG.level - 1];
				FlxG.state = new levelClass();
			} else {
				FlxG.level--;
				FlxG.state = new LevelSelect();
			}
        }

        public static function levelSelect():void {
            FlxG.fade.start(0xff000000, 0.5, function():void { FlxG.state = new LevelSelect(); });
        }
    }
}
