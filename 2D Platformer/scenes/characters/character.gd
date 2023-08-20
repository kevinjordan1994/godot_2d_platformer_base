class_name Character
extends CharacterBody2D


@onready var animation_player = $AnimationPlayer
@onready var visuals = $Visuals


func _process(_delta):
	if velocity.x != 0:
		visuals.scale.x = sign(velocity.x)


func _physics_process(delta):
	move_and_slide()
