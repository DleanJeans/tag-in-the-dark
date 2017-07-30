package components;

import flixel.util.FlxColor;
import ecs.SpriteComponent;

using flixel.util.FlxSpriteUtil;

class PlayerSprite extends SpriteComponent {
    public function new(color:FlxColor = G.GREEN) {
        super();
        makeGraphic(G.CIRCLE_DIAMETER, G.CIRCLE_DIAMETER, 0x0);
        drawCircle(-1, -1, G.CIRCLE_RADIUS - 1, FlxColor.WHITE, { color:FlxColor.BLACK, thickness:G.OUTLINE_THICKNESS } );
        this.color = color;
    }
}