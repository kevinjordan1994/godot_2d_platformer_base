class_name Jump
extends Air


@export var jump_force: float = 300


func enter(data = {}):
	super()
	character.can_super_jump = true
	character.velocity.y = -jump_force


func physics_update(delta):
	super(delta)
	if character.velocity.y > 0:
		state_machine.change_state("Fall")
