package components;

import events.EventCollideEntity;
import ecs.EventData;
import ecs.PrimitiveComponent;

class YoureIt extends PrimitiveComponent {
    override public function added() {
        sprite.color = G.RED;
    }

    override public function removed() {
        sprite.color = G.GREEN;
    }

    override public function receive(event:EventData) {
        executeForEventType(event, EventCollideEntity, passThisComponent);
    }

    function passThisComponent(e:EventCollideEntity) {
        if (entity.hasComponent(ShortFreezing)) return;

        entity.removeComponent(this);

        e.entity.addComponent(this);
        e.entity.addComponent(new ShortFreezing());
    }
}