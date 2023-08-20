class_name StateMachine
extends Node


@export var character: Character
@export var current_state: State


func _ready():
	await character.ready
	print(character.super_jump_timer)
	for child in get_children():
		if child is State:
			child.state_machine = self
	current_state.enter()
	
	
func _unhandled_input(event):
	current_state._handle_input(event)
	

func _process(delta):
	current_state.update(delta)
	
	
func _physics_process(delta):
	current_state.physics_update(delta)
	
	
func change_state(state_name: String, state_data: Dictionary = {}):
	if not has_node(state_name): return
	current_state.exit()
	current_state = get_node(state_name)
	current_state.enter(state_data)
	if character.state_debug_label != null:
		character.state_debug_label.text = state_name
