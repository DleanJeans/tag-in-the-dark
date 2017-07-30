package components;

import events.EventCollision;
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
        executeForEventType(event, EventCollision, passThisComponent);
    }

    function passThisComponent(e:EventCollision) {
        if (e.entity.hasNoComponent(PlayerSprite) || entity.hasComponent(ShortFreezing)) return;

        entity.removeComponent(this);

        e.entity.addComponent(this);
        e.entity.addComponent(new ShortFreezing());
    }
}