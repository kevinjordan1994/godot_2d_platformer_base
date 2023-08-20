extends Ground


@export var friction: float = 8


func physics_update(_delta):
	super(_delta)
	if Input.is_action_just_pressed("right") || Input.is_action_just_pressed("left"):
		state_machine.change_state("Run")
		
	if abs(character.velocity.x) >= 0:
		character.velocity.x = lerp(character.velocity.x, 0.0, friction * _delta)
	
