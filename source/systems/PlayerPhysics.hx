package systems;

import components.PlayerSprite;
import flixel.math.FlxMath;
import flixel.FlxSprite;
import ecs.Entity;

class PlayerPhysics extends PhysicsSystem {
    override function entityIsQualified(entity:Entity) {
        return entity.hasComponent(PlayerSprite);
    }

    override function preprocess(sprite1:FlxSprite, sprite2:FlxSprite) {
        super.preprocess(sprite1, sprite2);
        return bothSpriteAreType(PlayerSprite) && twoPlayerTouched();
    }

    function twoPlayerTouched() {
        var radius1 = sprite1.width / 2;
        var radius2 = sprite2.width / 2;

        var touched = FlxMath.distanceBetween(sprite1, sprite2) <= radius1 + radius2;
        return touched;
    }
}