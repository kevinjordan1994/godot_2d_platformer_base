extends CharacterGround


@export var max_move_speed: float = 100
@export var acceleration: float = 4


var direction = 1


func enter(_data = {}):
	super(_data)
	_set_move_direction()
	

func physics_update(delta):
	super(delta)
	if not character.is_wandering:
		state_machine.change_state("Idle")
	character.velocity.x = lerp(character.velocity.x, max_move_speed * direction, acceleration * delta)
	if not character.right_ground_check.is_colliding():
		direction = -1
	elif not character.left_ground_check.is_colliding():
		direction = 1
	if character.right_wall_check.is_colliding():
		direction = -1
	elif character.left_wall_check.is_colliding():
		direction = 1
		
	
func _set_move_direction():
	var directions = [-1, 1]
	direction = directions.pick_random()
	
