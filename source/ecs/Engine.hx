package ecs;

import flixel.FlxBasic;
import flixel.group.FlxGroup;

@:access(ecs.System)
@:access(ecs.Entity)
class Engine extends FlxGroup {
    public static var NULL = new Engine();

    var entities = new FlxTypedGroup<Entity>();
    var systems = new FlxTypedGroup<System>();

    public function new() {
        super();
        add(entities);
        add(systems);
    }

    public function createEntity():Entity {
        var entity = new Entity();
        entity.engine = this;
        entities.add(entity);
        forEachSystem(s -> s.entityAdded(entity));
        return entity;
    }

    public function removeEntity(entity:Entity):Entity {
        entity.engine = Engine.NULL;
        forEachSystem(s -> s.entityRemoved(entity));
        return entities.remove(entity);
    }

    public function entityComponentsUpdated(entity:Entity) {
        forEachSystem(s -> s.entityComponentsUpdated(entity));
    }

    function forEachSystem(method:System->Void) {
        systems.forEach(method);
    }

    public function addSystem(system:System):System {
        system.engine = this;
        forEachEntity(e -> system.entityAdded(e));
        return systems.add(system);
    }

    function forEachEntity(method:Entity->Void) {
        entities.forEach(method);
    }

    public function removeSystem(system:System):System {
        system.engine = Engine.NULL;
        return systems.remove(system);
    } 

    override public function add(basic:FlxBasic) {
        if (twoGroupAdded())
            throw "You mean addSystem?";
    	return super.add(basic);
    }

    inline function twoGroupAdded() {
        return length >= 2;
    }
}