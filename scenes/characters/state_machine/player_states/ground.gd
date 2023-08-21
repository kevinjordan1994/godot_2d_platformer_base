class_name Ground
extends State


func enter(data = {}):
	super(data)
	character.super_jump_timer.start()


func physics_update(_delta):
	if not character.is_on_floor():
		state_machine.change_state("Fall")
		
	if Input.is_action_just_pressed("jump") || character.stored_jump_input:
		if character.can_super_jump:
			state_machine.change_state("SuperJump")
		else:
			state_machine.change_state("Jump")
