package ecs;

import flixel.FlxBasic;

class System extends FlxBasic {
    var engine:Engine = Engine.NULL;

    public function new() {
        super();
        visible = false;
    }

    public function entityAdded(entity:Entity) {}

    public function entityRemoved(entity:Entity) {}
}