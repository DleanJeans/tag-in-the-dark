package components;

import flixel.util.FlxColor;
import ecs.SpriteComponent;

using flixel.util.FlxSpriteUtil;

class PlayerSprite extends SpriteComponent {
    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
        makeGraphic(G.CIRCLE_DIAMETER, G.CIRCLE_DIAMETER, 0x0);
        drawCircle(-1, -1, G.CIRCLE_RADIUS - 1, FlxColor.WHITE, { color:FlxColor.BLACK, thickness:G.OUTLINE_THICKNESS } );
        this.color = G.GREEN;
    }
}