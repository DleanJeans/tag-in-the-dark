package events;

import flixel.FlxSprite;
import ecs.EventData;
import ecs.Entity;

class EventCollision implements EventData {
    public var entity(default, null):Entity;
    public var sprite(default, null):FlxSprite;

    public function new(entity:Entity, sprite:FlxSprite) {
        this.entity = entity;
        this.sprite = sprite;
    }
}