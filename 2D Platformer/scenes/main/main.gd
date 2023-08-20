extends Node


func _input(event):
	if Input.is_physical_key_pressed(KEY_R): get_tree().reload_current_scene()
