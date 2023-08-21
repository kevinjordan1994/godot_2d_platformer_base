extends CharacterGround


@export var friction: float = 8


func physics_update(_delta):
	super(_delta)
	
	if abs(character.velocity.x) >= 0:
		character.velocity.x = lerp(character.velocity.x, 0.0, friction * _delta)
		
	if character.is_wandering:
		state_machine.change_state("Wander")
