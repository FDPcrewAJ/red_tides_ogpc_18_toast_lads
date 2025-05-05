extends Sprite2D

var mouse_offset_x = 0
var mouse_offset_y = 0
var selected = false
var real_rotation = 0
	
func _ready() -> void:
	match name:
		"Dial1Sprite":
			rotation_degrees = Global.dial_1_rotation
		"Dial2Sprite":
			rotation_degrees = Global.dial_2_rotation
		"Dial3Sprite":
			rotation_degrees = Global.dial_3_rotation

func _process(_delta):
	match name:
		"Dial1Sprite":
			Global.dial_1_rotation = rotation_degrees
		"Dial2Sprite":
			Global.dial_2_rotation = rotation_degrees
		"Dial3Sprite":
			Global.dial_3_rotation = rotation_degrees
	if selected == false:
		real_rotation = rotation_degrees

func _rotate():
	rotate(get_angle_to(get_global_mouse_position()))
	
	if rotation_degrees < 0:
		rotation_degrees = 0
	if rotation_degrees > 360:
		rotation_degrees = 0
	
