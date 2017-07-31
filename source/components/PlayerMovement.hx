package components;

import flixel.math.FlxPoint;
import flixel.FlxObject;
import events.EventMove;
import ecs.BasicComponent;
import ecs.EventData;

class PlayerMovement extends BasicComponent {
    override public function update(elapsed:Float) {
        super.update(elapsed);
        resetVelocity();
    }

    override public function receive(event:EventData) {
        executeForEventType(event, EventMove, mapPlayerMovement);
    }

    function mapPlayerMovement(event:EventMove) {
        switch (event.direction) {
             case FlxObject.LEFT:
                moveLeft();
            case FlxObject.RIGHT:
                moveRight();
            case FlxObject.UP:
                moveUp();
            case FlxObject.DOWN:
                moveDown();
            default:
        }
        capSpeed();
    }

    function capSpeed() {
        sprite.velocity.scale(G.SPEED / sprite.velocity.distanceTo(FlxPoint.weak()));
    }

    public function resetVelocity() {
        sprite.velocity.set();
    }

    public function moveLeft() {
        sprite.velocity.x = -G.SPEED;
    }

    public function moveRight() {
        sprite.velocity.x = G.SPEED;
    }

    public function moveUp() {
        sprite.velocity.y = -G.SPEED;
    }

    public function moveDown() {
        sprite.velocity.y = G.SPEED;
    }
}
