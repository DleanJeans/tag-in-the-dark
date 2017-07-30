package components;

import flixel.math.FlxRect;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import ecs.SpriteComponent;

class WallSprite extends SpriteComponent {
    public function new(point1:FlxPoint, point2:FlxPoint) {
        var rect = FlxRect.get().fromTwoPoints(point1, point2); 
        rect.x -= G.HALF_WALL_THICKNESS;
        rect.y -= G.HALF_WALL_THICKNESS;
        rect.width += G.WALL_THICKNESS;
        rect.height += G.WALL_THICKNESS;

        super(rect.x, rect.y);
        makeGraphic(cast rect.width, cast rect.height, FlxColor.WHITE);
        immovable = true;
        color = G.WALL;
    }
}