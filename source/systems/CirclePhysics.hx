package systems;

import components.CircleSprite;
import ecs.System;
import flixel.math.FlxMath;
import flixel.FlxG;
import flixel.FlxSprite;
import events.EventCollideEntity;
import ecs.Entity;

class CirclePhysics extends System {
    override function addEntityIfHasSpriteComponent(entity:Entity) {
        if (entity.hasComponent(CircleSprite))
            sprites.add(entity.sprite);
    }

    override public function update(elapsed:Float) {
    	super.update(elapsed);
        
        FlxG.overlap(sprites, sprites, notifyCollisionEvent, processCircleCollision);
    }

    function notifyCollisionEvent(sprite1:FlxSprite, sprite2:FlxSprite) {
		var entity1 = Entity.getEntityOfSprite(sprite1);
		var entity2 = Entity.getEntityOfSprite(sprite2);

        entity1.notify(new EventCollideEntity(entity2));
        entity2.notify(new EventCollideEntity(entity1));
	}

    function processCircleCollision(sprite1:FlxSprite, sprite2:FlxSprite) {
        var radius1 = sprite1.width / 2;
        var radius2 = sprite2.width / 2;

        var touched = FlxMath.distanceBetween(sprite1, sprite2) <= radius1 + radius2;
        return touched;
    }
}