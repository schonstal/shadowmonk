package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
        private var f:Boolean = true;
        
        private var items:Array;
        private var _current:Number = 1;
        private var _t:FlxText;
        private var _selected:Boolean = false;

        private var _light:Number = 0xfff6e5fa;
        private var _dark:Number = 0xff682777;

		public function MenuState()
		{
            items = new Array();

            var m:Title;
            m = new Title();
            add(m);
            FlxG.level = 1;

            addItem(1, "Start Game");
            addItem(2, "Credits");
            SoundBank.music("menu");
		}

        override public function update():void
		{
			super.update();

            if(!_selected) {
                if(FlxG.keys.justPressed("UP")) {
                    SoundBank.play("up");
                    if(_current > 1) {
                        moveCursor(_current - 1);
                    } else {
                        moveCursor(items.length);
                    }
                } else if(FlxG.keys.justPressed("DOWN")) {
                    SoundBank.play("down");
                    if(_current < items.length) {
                        moveCursor(_current + 1);
                    } else {
                        moveCursor(1);
                    }
                } else if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("ENTER")) {
                    _selected = true;
                    SoundBank.play("select");

                    if(_current == 1)
                        Starter.levelSelect();
                    else if(_current == 2)
                        Starter.levelSelect();
                    else if(_current == 3)
                        FlxG.fade.start(0xff000000,0.5,function():void { FlxG.state = new Credits() });
                }
            }
            
		}
        
        private function addItem(item:Number, title:String):void {
			var t:FlxText;
			t = new FlxText(92,80+(item*12),200, title);
			t.alignment = "right";
            t.setFormat("SNES");
            t.color = (_current==item?_light:_dark);
            items[item-1] = t;
			add(t);
        }
        
        private function moveCursor(newItem:int):void {
            var selected:FlxText = items[_current-1] as FlxText;
            selected.color = _dark;
            
            _current = newItem;

            selected = items[_current-1] as FlxText;
            selected.color = _light;
        }
	}
}
