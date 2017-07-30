package ecs;

import flixel.FlxSprite;

class SpriteMap {
    var map = new Map<FlxSprite, Entity>();

    public function new() {}

    public function set(sprite:FlxSprite, entity:Entity) {
        map.set(sprite, entity);
    }

    public function get(sprite:FlxSprite) {
        var value = map.get(sprite);
        if (value == null)
            return Entity.NULL;
        else return value;
    }

    public function remove(sprite:FlxSprite) {
        map.remove(sprite);
    }
}