package components;

import flixel.FlxObject;
import flixel.FlxG;
import ecs.BasicComponent;
import events.EventMove;

class ArrowsInput extends BasicComponent {
    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.pressed.LEFT)
            notifyEntity(new EventMove(FlxObject.LEFT));
        else if (FlxG.keys.pressed.RIGHT)
            notifyEntity(new EventMove(FlxObject.RIGHT));
        if (FlxG.keys.pressed.UP)
            notifyEntity(new EventMove(FlxObject.UP));
        else if (FlxG.keys.pressed.DOWN)
            notifyEntity(new EventMove(FlxObject.DOWN));
    }
}