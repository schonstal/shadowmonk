package
{
    import org.flixel.*;

    public class LevelText extends FlxGroup
    {
        private var _num:FlxText;
        private var _title:FlxText;

        public function LevelText(X:Number, Y:Number, level:Number) {
            x = X;
            y = Y;
            _num = new FlxText(X,Y,22,level + ".");
            _num.alignment = "right";
            _num.setFormat("SNES");
            add(_num);

            _title = new FlxText(X+20,Y,182,
                (SaveData.completed + 1 < level ? "------------------" : Starter.levelName(level))
            );
            _title.alignment = "left";
            _title.setFormat("SNES");
            add(_title);
        }
        
        public function set color(value:Number):void {
            _num.color = value;
            _title.color = value;
        }

        override public function update():void {
            _num.x = x;
            _title.x = x + 20;
            _num.y = _title.y = y;
            
            _num.visible = visible;
            _title.visible = visible;
        }
        
    }
}

