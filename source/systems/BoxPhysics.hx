package systems;

import ecs.Entity;
import ecs.Component;
import components.WallSprite;
import flixel.FlxObject;
import components.PlayerSprite;
import flixel.FlxSprite;

class BoxPhysics extends PhysicsSystem {
    override function notify(sprite1:FlxSprite, sprite2:FlxSprite) {
        super.notify(sprite1, sprite2);
        FlxObject.separate(sprite1, sprite2);
    }

    override function preprocess(sprite1:FlxSprite, sprite2:FlxSprite) {
        super.preprocess(sprite1, sprite2);

        return oneIsNotSpriteType(PlayerSprite);
    }

    function oneEntityHasComponent(component:Class<Component>) {
        return entity1.hasComponent(component) || entity2.hasComponent(component);
    }
}