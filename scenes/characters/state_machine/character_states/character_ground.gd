class_name CharacterGround
extends State


func enter(data = {}):
	super(data)


func physics_update(_delta):
	if not character.is_on_floor():
		state_machine.change_state("Fall")
