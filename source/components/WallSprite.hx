package components;

import flixel.util.FlxColor;
import ecs.SpriteComponent;

class WallSprite extends SpriteComponent {
    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
        var width = 2;
        var height = 20;
        makeGraphic(width, height, FlxColor.WHITE);
    }
}