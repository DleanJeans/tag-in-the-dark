package components;

import flixel.FlxG;
import flixel.FlxObject;
import ecs.BasicComponent;
import events.EventMove;

class WASDInput extends BasicComponent {
    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.pressed.A)
            notifyEntity(new EventMove(FlxObject.LEFT));
        else if (FlxG.keys.pressed.D)
            notifyEntity(new EventMove(FlxObject.RIGHT));
        if (FlxG.keys.pressed.W)
            notifyEntity(new EventMove(FlxObject.UP));
        else if (FlxG.keys.pressed.S)
            notifyEntity(new EventMove(FlxObject.DOWN));
    }
}