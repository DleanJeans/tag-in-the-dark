package components;

import flixel.util.FlxColor;
import ecs.SpriteComponent;

class WallSprite extends SpriteComponent {
    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
        var width = G.WALL_THICKNESS;
        var height = 100;
        makeGraphic(width, height, FlxColor.WHITE);
        immovable = true;
    }
}