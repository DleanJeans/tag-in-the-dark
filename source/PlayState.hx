package;

import flixel.FlxState;
import ecs.*;
import components.*;
import systems.*;

class PlayState extends FlxState {
	var engine:Engine;
	var player1:Entity;
	var player2:Entity;
	var wall:Entity;

	override public function create() {
		bgColor = G.WOOD;

		engine = new Engine();
		engine.addSystem(new CirclePhysics());
		engine.addSystem(new BoxPhysics());
		add(engine);

		player1 = createPlayer();
		player1
		.addComponent(new WASDInput())
		.addComponent(new YoureIt());

		player2 = createPlayer();
		player2.addComponent(new ArrowsInput());
		player2.sprite.screenCenter();

		var wall = engine.createEntity();
		wall.addComponent(new WallSprite(100, 100));
		wall.sprite.immovable = true;
	}

	function createPlayer():Entity {
		return engine.createEntity()
		.addComponent(new CircleSprite())
		.addComponent(new Movement());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		
	}
}
