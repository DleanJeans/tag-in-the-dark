package events;

class EventMove implements ecs.EventData {
    public var direction:Int = 0;

    public function new(direction:Int) {
        this.direction = direction;
    }
}