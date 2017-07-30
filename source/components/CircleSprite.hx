package components;

import flixel.util.FlxColor;
import ecs.SpriteComponent;

using flixel.util.FlxSpriteUtil;

class CircleSprite extends SpriteComponent {
    public function new(color:FlxColor) {
        super();
        makeGraphic(40, 40, 0x0);
        drawCircle(-1, -1, 19, FlxColor.WHITE, { color:FlxColor.BLACK, thickness:2 } );
        this.color = color;
    }
}