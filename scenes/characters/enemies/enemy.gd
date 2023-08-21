class_name Enemy
extends Character


const MIN_WANDER_WAIT_TIME = 2
const MAX_WANDER_WAIT_TIME = 3


var is_wandering = false


@onready var wander_timer = $Timers/WanderTimer
@onready var right_ground_check = $RayCasts/RightGroundCheck
@onready var left_ground_check = $RayCasts/LeftGroundCheck
@onready var right_wall_check = $RayCasts/RightWallCheck
@onready var left_wall_check = $RayCasts/LeftWallCheck


func _ready():
	if wander_timer:
		reset_wander_timer()
		wander_timer.timeout.connect(on_wander_timer_timeout)


func reset_wander_timer():
	wander_timer.wait_time = randf_range(MIN_WANDER_WAIT_TIME, MAX_WANDER_WAIT_TIME)
	wander_timer.start()
	
	
func on_wander_timer_timeout():
	is_wandering = !is_wandering
	reset_wander_timer()

