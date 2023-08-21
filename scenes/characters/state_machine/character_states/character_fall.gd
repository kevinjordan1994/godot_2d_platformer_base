extends State


@export var gravity: float = 1000


func physics_update(delta):
	character.velocity.y += gravity * delta
	
	if character.is_on_floor():
			state_machine.change_state("Idle")
