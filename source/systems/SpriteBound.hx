package systems;

import ecs.Entity;
import components.PlayerSprite;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;
import ecs.System;

class SpriteBound extends System {
    override function entityIsQualified(entity:Entity) {
        return entity.hasComponent(PlayerSprite);
    }

    override public function update(elapsed:Float) {
    	super.update(elapsed);
        boundSprites();
    }

    function boundSprites() {
        sprites.forEach(s -> boundSprite(s));
    }

    function boundSprite(sprite:FlxSprite) {
        var wb = FlxG.worldBounds;
        FlxSpriteUtil.bound(sprite, wb.x, wb.right, wb.y, wb.bottom);
    }
}