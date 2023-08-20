extends Sprite2D


@export var camera: Camera2D


func _follow_camera():
	if not camera:
		push_warning("No Camera Attached to Background!")
		return
	if global_position != camera.global_position:
		global_position = camera.global_position


func _process(delta):
	_follow_camera()
