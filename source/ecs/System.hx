package ecs;

import flixel.FlxBasic;
import flixel.group.FlxSpriteGroup;

class System extends FlxBasic {
    var engine:Engine = Engine.NULL;
    var sprites = new FlxSpriteGroup();

    public function new() {
        super();
        visible = false;
    }

    public function entityAdded(entity:Entity) {
        addEntityIfHasSpriteComponent(entity);
    }

    function addEntityIfHasSpriteComponent(entity:Entity) {
        if (entity.hasComponent(SpriteComponent))
            sprites.add(entity.sprite);
    }

    public function entityComponentsUpdated(entity:Entity) {
        addEntityIfHasSpriteComponent(entity);
    }

    public function entityRemoved(entity:Entity) {}
}