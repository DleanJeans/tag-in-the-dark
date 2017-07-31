package components;

import ecs.BasicComponent;
import flixel.util.FlxTimer;

class ShortFreezing extends BasicComponent {
    var timer = new FlxTimer();

    override public function added() {
        timer.start(G.FROZEN_TIME, unfreeze);
        sprite.color = G.ICE;
    }

    override public function removed() {
        sprite.color = G.RED;
        timer.destroy();
    }

    function unfreeze(_) {
        entity.removeComponent(this);
    }

    override public function update(elapsed:Float) {
    	super.update(elapsed);
        
        sprite.velocity.set();
    }
}