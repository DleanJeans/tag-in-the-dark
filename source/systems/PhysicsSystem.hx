package systems;

import flixel.FlxG;
import flixel.FlxSprite;
import ecs.Entity;
import events.EventCollision;
import ecs.System;

class PhysicsSystem extends System {
    public static function isSpriteType(sprite:FlxSprite, type:Class<FlxSprite>) {
        return Std.is(sprite, type);
    }

    public static function isNotSpriteType(sprite:FlxSprite, type:Class<FlxSprite>) {
        return !isSpriteType(sprite, type);
    }

    var entity1:Entity;
    var entity2:Entity;

    var sprite1:FlxSprite;
    var sprite2:FlxSprite;

    override public function update(elapsed:Float) {
    	super.update(elapsed);
        
        FlxG.overlap(sprites, sprites, notify, preprocess);
    }

    function notify(sprite1:FlxSprite, sprite2:FlxSprite) {
        setupSprites(sprite1, sprite2);
        notifyCollisionEvent();
    }

    function preprocess(sprite1:FlxSprite, sprite2:FlxSprite) {
        setupSprites(sprite1, sprite2);
        return true;
    }

    function setupSprites(sprite1:FlxSprite, sprite2:FlxSprite) {
        this.sprite1 = sprite1;
        this.sprite2 = sprite2;

        entity1 = Entity.getEntityOfSprite(sprite1);
        entity2 = Entity.getEntityOfSprite(sprite2);
    }

    function notifyCollisionEvent() {
        entity1.notify(new EventCollision(entity2, sprite2));
        entity2.notify(new EventCollision(entity1, sprite1));
	}
    
    function bothSpriteAreType(type:Class<FlxSprite>) {
        return isSpriteType(sprite1, type) && isSpriteType(sprite2, type);
    }

    function oneIsNotSpriteType(type:Class<FlxSprite>) {
        return isNotSpriteType(sprite1, type) || isNotSpriteType(sprite2, type);
    }

    function twoAreNotSpriteTypes(type1:Class<FlxSprite>, type2:Class<FlxSprite>) {
        return !twoAreSpriteTypes(type1, type2);
    }

    function twoAreSpriteTypes(type1:Class<FlxSprite>, type2:Class<FlxSprite>) {
        return isSpriteType(sprite1, type1) && isSpriteType(sprite2, type2)
        || isSpriteType(sprite1, type2) && isSpriteType(sprite2, type1);
    }
}