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
        keepEntityIfQualified(entity);
    }

    function keepEntityIfQualified(entity:Entity) {
        if (entityIsQualified(entity))
            sprites.add(entity.sprite);
        else sprites.remove(entity.sprite);
    }

    function entityIsQualified(entity:Entity) {
        return entity.hasComponent(SpriteComponent);
    }

    public function entityComponentsUpdated(entity:Entity) {
        keepEntityIfQualified(entity);
    }

    public function entityRemoved(entity:Entity) {}

    public function preUpdate() {}
}