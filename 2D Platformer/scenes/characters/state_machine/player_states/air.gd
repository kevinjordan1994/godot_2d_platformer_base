class_name Air
extends State


@export var gravity: float = 1000
@export var air_move_speed: float = 200
@export var air_acceleration: float = 4


var direction = 0
var last_dir = 0


func physics_update(delta):
	var is_move_key_pressed = Input.is_action_pressed("left") || Input.is_action_pressed("right")
	character.velocity.y += gravity * delta
	
	_set_player_move_direction()
	character.velocity.x = lerp(character.velocity.x, air_move_speed * direction, air_acceleration * delta)
	
	if character.is_on_floor():
		if is_move_key_pressed:
			state_machine.change_state("Run")
		else:
			state_machine.change_state("Idle")
			
	if Input.is_action_just_pressed("jump"):
		character.stored_jump_input_timer.start()
		character.stored_jump_input = true
	

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
