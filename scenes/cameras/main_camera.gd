extends Camera2D


@export_range(0, 1) var drag


@onready var target = get_tree().get_first_node_in_group("player")


func _ready():
	_get_map_bounding_box()
	

func _physics_process(delta):
	_follow_target_position()
	
	
func _follow_target_position():
	if !target: return
	global_position = lerp(global_position, target.global_position, drag)


func _get_map_bounding_box():
	var tile_map = get_parent().get_node("TileMap") as TileMap
	if !tile_map: return
	var tile_map_rect = tile_map.get_used_rect() as Rect2i
	var tile_size = 32
	limit_left = tile_map_rect.position.x * tile_size
	limit_right = tile_map_rect.end.x * tile_size
	limit_bottom = tile_map_rect.end.y * tile_size
	limit_top = tile_map_rect.position.y * tile_size
