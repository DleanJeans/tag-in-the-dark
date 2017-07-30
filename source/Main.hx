package;

import flixel.FlxG;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		setupConsoleWhenReady();
		addChild(new FlxGame(0, 0, PlayState));
	}

	static function setupConsoleWhenReady() {
        FlxG.signals.gameStarted.addOnce(() -> {
            FlxG.console.registerClass(G);
        });
    }
}
