extends Character


@export var head_textures: Array[Texture2D]


var can_super_jump = false
var stored_jump_input = false


@onready var state_debug_label = $StateDebugLabel
@onready var super_jump_timer = $Timers/SuperJumpTimer
@onready var stored_jump_input_timer = $Timers/StoredJumpInputTimer
@onready var blink_timer = $Timers/BlinkTimer
@onready var head_sprite = $Visuals/Head


func _ready():
		super_jump_timer.timeout.connect(func(): can_super_jump = false)
		stored_jump_input_timer.timeout.connect(func(): stored_jump_input = false)
		blink_timer.timeout.connect(_blink)
		blink_timer.wait_time = randf_range(5, 10)


## Adds random eye blink to the character head sprite
func _blink():
	if head_textures.size() < 2:
		return
	if head_sprite.texture == head_textures[1]:
		head_sprite.texture = head_textures[0]
		blink_timer.wait_time = randf_range(5, 10)
	else:
		head_sprite.texture = head_textures[1]
		blink_timer.wait_time = 0.1
	blink_timer.start()
	
	
