class_name State
extends Node


@export var animation_ref: String = "idle"


var character
var state_machine = null


func enter(_state_data: Dictionary = {}):
	character = state_machine.character as Character
	character.animation_player.play(animation_ref)
	pass
	
	
func _handle_input(_event):
	pass
	
	
func update(_delta):
	pass
	
	
func physics_update(_delta):
	pass
	
	
func exit():
	pass
