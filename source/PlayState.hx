package;

import openfl.display.BlendMode;
import flixel.*;
import ecs.*;
import components.*;
import systems.*;
import map.*;

class PlayState extends FlxState {
	var engine:Engine;

	override public function create() {
		bgColor = G.GRASS;

		G.engine = engine = new Engine();

		engine.addSystem(new PlayerPhysics());
		engine.addSystem(new BoxPhysics());
		engine.addSystem(new SpriteBound());
		engine.addSystem(new MusicSystem());
		add(engine);

		HouseCreator.createHouse();

		var darkness = new FlxSprite();
		darkness.makeGraphic(FlxG.width, FlxG.height, G.WHITE);
		#if html5
		darkness.color = G.DARK_BLUE;
		#else
		darkness.color = G.BLUE;
		darkness.blend = BlendMode.MULTIPLY;
		#end
		darkness.alpha = G.DARKNESS_ALPHA;
		darkness.scrollFactor.set(0, 0);
		darkness.solid = false;
		add(darkness);
	}

	function createPlayer():Entity {
		return engine.createEntity()
		.addComponent(new PlayerSprite())
		.addComponent(new PlayerMovement());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
