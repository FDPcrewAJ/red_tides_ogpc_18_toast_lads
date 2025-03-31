extends Sprite2D

var mouse_offset_x = 0
var mouse_offset_y = 0


func _ready() -> void:
	if name == "Sprite2D1":
		rotation = Global.dial_1_rotation
	elif name == "Sprite2D2":
		rotation = Global.dial_2_rotation
	else:
		rotation = Global.dial_3_rotation


func _process(_delta):
	mouse_offset_x = get_global_mouse_position().x
	if name == "Sprite2D1":
		Global.dial_1_rotation = rotation
	elif name == "Sprite2D2":
		Global.dial_2_rotation = rotation
	else:
		Global.dial_3_rotation = rotation
	
func _rotate():
	rotation_degrees += (mouse_offset_x - get_global_mouse_position().x) / 2
	
