extends Sprite2D

var mouse_offset_x = 0
var mouse_offset_y = 0


func _ready() -> void:
	pass


func _process(_delta):
	mouse_offset_x = get_global_mouse_position().x
	
func _rotate():
	rotation_degrees += (mouse_offset_x - get_global_mouse_position().x) / 2
	if rotation_degrees < 0:
		rotation_degrees = 0
	if rotation_degrees > 360:
		rotation_degrees = 0
	
