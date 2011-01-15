package
{
	import org.flixel.*;

	public class Starter
	{
        public static function startLevel():void {
            if(FlxG.level == 1)
                FlxG.state = new Level01();
            if(FlxG.level == 2)
                FlxG.state = new Level02();
            if(FlxG.level == 3)
                FlxG.state = new Level03();
            if(FlxG.level == 4)
                FlxG.state = new Level04();
            if(FlxG.level == 5)
                FlxG.state = new Level05();
            if(FlxG.level == 6)
                FlxG.state = new Level06();
            if(FlxG.level == 7)
                FlxG.state = new Level07();
            if(FlxG.level == 8)
                FlxG.state = new Level08();
            if (FlxG.level == 9)
                FlxG.state = new Level09();
			if (FlxG.level == 10)
				FlxG.state = new Level10();
			if (FlxG.level == 11)
				FlxG.state = new Level11();
        }

        public static function levelSelect():void {
            FlxG.fade.start(0xff000000, 0.5, function():void { FlxG.state = new LevelSelect(); });
        }
    }
}
