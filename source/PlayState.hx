package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import ecs.*;
import components.*;
import events.*;

class PlayState extends FlxState {
	var engine:Engine;
	var player1:Entity;
	var player2:Entity;
	var wall:Entity;

	var physics:CirclePhysics;

	override public function create() {
		bgColor = G.WOOD;

		engine = new Engine();
		engine.addSystem(new CirclePhysics());
		add(engine);

		player1 = createPlayer();
		player1
		.addComponent(new WASDInput())
		.addComponent(new YoureIt());

		player2 = createPlayer();
		player2.addComponent(new ArrowsInput());
		player2.sprite.screenCenter();
	}

	function createPlayer():Entity {
		return engine.createEntity()
		.addComponent(new CircleSprite(G.GREEN))
		.addComponent(new Movement());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
		
	}
}
