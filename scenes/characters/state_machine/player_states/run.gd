extends Ground


@export var max_move_speed: float = 100
@export var acceleration: float = 4


var direction = 0
var last_dir = 0


func physics_update(delta):
	super(delta)
	_set_player_move_direction()
	character.velocity.x = lerp(character.velocity.x, max_move_speed * direction, acceleration * delta)
	_check_for_idle_transition(direction)
	
	
func _check_for_idle_transition(input: float):
	if input == 0:
		state_machine.change_state("Idle")


func _set_player_move_direction():
	if Input.is_action_pressed("left") && !Input.is_action_pressed("right"): 
		direction = -1
		last_dir = direction
	elif Input.is_action_pressed("right") && !Input.is_action_pressed("left"):
		direction = 1
		last_dir = direction
	elif Input.is_action_pressed("left") && Input.is_action_pressed("right"):
		direction = -last_dir
	elif !Input.is_action_pressed("left") && !Input.is_action_pressed("right"):
		direction = 0
