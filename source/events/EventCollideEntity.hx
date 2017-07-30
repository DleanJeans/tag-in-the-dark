package events;

import ecs.EventData;
import ecs.Entity;

class EventCollideEntity implements EventData {
    public var entity:Entity;

    public function new(entity:Entity) {
        this.entity = entity;
    }
}